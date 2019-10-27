PLUGIN.name = "Visual FX"
PLUGIN.author = "Angelsaur"
PLUGIN.desc = "Adds some commands that allow staff to activate certain visual effects on players."

NUT_CVAR_POSTPROCESS = CreateClientConVar("nut_postprocess", 0, true, false)
NUT_CVAR_POSTPROCESS2 = CreateClientConVar("nut_postprocess2", 0, true, false)
NUT_CVAR_LETTERBOX = CreateClientConVar("nut_letterbox", 0, true, false)
NUT_CVAR_LETTERBOX_SCALE = CreateClientConVar( "nut_letterbox_scale", "0.25", true, false )

function DrawNoGapRect( x, y, w, h )
	surface.DrawRect( x - 1, y - 1, w + 2, h + 2 )
end

function DrawBars( scale )
	local size = scale * ScrH() / 2
	DrawNoGapRect( 0, 0, ScrW(), size )
	DrawNoGapRect( 0, ScrH() - size, ScrW(), size )
end				

function PLUGIN:RenderScreenspaceEffects()

	if ( nut.gui.character and nut.gui.character:IsVisible() ) then

		local blurry = Material("pp/blurscreen")

		local scrW, scrH = ScrW(), ScrH()
		local amount = 10

			for i = 1, 3 do
			blurry:SetFloat("$blur", (i / 2) * (amount or 3))
			blurry:Recompute()

			render.UpdateScreenEffectTexture()
			render.SetMaterial(blurry)
			render.DrawScreenQuad()
		end

		local x, y = nut.gui.character:LocalToScreen(0, 0)
		local w, h = nut.gui.character:GetWide(), ScrH()
		render.SetStencilEnable(true)
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
		render.SetStencilReferenceValue(1)
		render.ClearStencilBufferRectangle(x, y, x + w, h, 1)
		render.SetStencilEnable(1)
		render.SetStencilEnable(false)

		menu = {}
		menu["$pp_colour_addr"] = -15/255
		menu["$pp_colour_addg"] = -15/255
		menu["$pp_colour_addb"] = -10/255
		menu["$pp_colour_brightness"] = -0.05
		menu["$pp_colour_contrast"] = 1.25
		menu["$pp_colour_colour"] = 0.30
		menu["$pp_colour_mulr"] = 0
		menu["$pp_colour_mulg"] = 0
		menu["$pp_colour_mulb"] = 0

		DrawColorModify( menu ) 
		
	end

	if ( nut.gui.character and not nut.gui.character:IsVisible() ) then

		if NUT_CVAR_POSTPROCESS:GetBool() then

			if NUT_CVAR_POSTPROCESS2:GetBool() then return end

			local colorMod = {}
			colorMod["$pp_colour_addr"]           = 0
			colorMod["$pp_colour_addg"]           = 0
			colorMod["$pp_colour_addb"]           = 0.025
			colorMod["$pp_colour_brightness"]     = 0
			colorMod["$pp_colour_contrast"]       = 1.05
			colorMod["$pp_colour_colour"]         = 0.65
			colorMod["$pp_colour_mulr"]           = 0.9
			colorMod["$pp_colour_mulg"]           = 0
			colorMod["$pp_colour_mulb"]           = 1

			DrawColorModify(colorMod) 
		end

		if NUT_CVAR_POSTPROCESS2:GetBool() then

			if NUT_CVAR_POSTPROCESS:GetBool() then return end

			local colorMod = {}
			colorMod["$pp_colour_addr"]           = -0.05
			colorMod["$pp_colour_addg"]           = -0.03
			colorMod["$pp_colour_addb"]           = 0
			colorMod["$pp_colour_brightness"]     = -0.06
			colorMod["$pp_colour_contrast"]       = 1.45
			colorMod["$pp_colour_colour"]         = 0.30
			colorMod["$pp_colour_mulr"]           = 0
			colorMod["$pp_colour_mulg"]           = 0
			colorMod["$pp_colour_mulb"]           = 0

			DrawColorModify(colorMod) 
		end

		if NUT_CVAR_LETTERBOX:GetBool() then
			local amount = GetConVar( "nut_letterbox_scale" )
			local scale = amount:GetFloat()
			if scale > 0 then
			surface.SetDrawColor( 0, 0, 0 )
			DrawBars( scale )
			end
		end

	end

end

function PLUGIN:SetupQuickMenu(menu)
	local button = menu:addCheck("Color Mod (Subtle)", function(panel, state)
		if (state) then
			RunConsoleCommand("nut_postprocess", "1")
		else
			RunConsoleCommand("nut_postprocess", "0")
		end
	end, NUT_CVAR_POSTPROCESS:GetBool())
			

	local button = menu:addCheck("Color Mod (Dramatic)", function(panel, state)
		if (state) then
			RunConsoleCommand("nut_postprocess2", "1")
		else
			RunConsoleCommand("nut_postprocess2", "0")
		end
	end, NUT_CVAR_POSTPROCESS2:GetBool())
			
	  
	local button = menu:addCheck("Cinematic Letterbox", function(panel, state)
		if (state) then
			RunConsoleCommand("nut_letterbox", "1")
		else
			RunConsoleCommand("nut_letterbox", "0")
		end
	end, NUT_CVAR_LETTERBOX:GetBool())	  
	
	--[[
	local button = menu:addCheck("Headbob", function(panel, state)
		if (state) then
			RunConsoleCommand("nut_headbob", "1")
		else
			RunConsoleCommand("nut_headbob", "0")
		end
	end, NUT_CVAR_HEADBOB:GetBool())
	
	menu:addSpacer()
	--]]
end

if (SERVER) then
	util.AddNetworkString( "BWStart" )
	util.AddNetworkString( "BWEnd" )
	util.AddNetworkString( "FX2Start" )
	util.AddNetworkString( "FX2End" )
	util.AddNetworkString( "LightsOn2" )
	util.AddNetworkString( "LightsOff2" )
end

if (CLIENT) then

	local cache = { }
	timercache = { }
	soundcache = { }
	modelcache = { }
	
	local CreatePhysModel = function(mdl)
		local ent = ents.CreateClientProp()
		ent:SetModel(mdl)
		ent:PhysicsInit(SOLID_VPHYSICS)
		ent:SetMoveType(MOVETYPE_VPHYSICS)
		ent:SetSolid(SOLID_VPHYSICS)

		table.insert(modelcache, ent)

		return ent
	end
	
	local CreateModel = function(mdl, isragdoll)
		local ent

		if isragdoll then
			ent = ClientsideRagdoll(mdl)
		else
			ent = ClientsideModel(mdl, RENDERGROUP_OTHER)
		end
	  
		table.insert(modelcache, ent)
	  
		return ent
	end

	local AddSound = function(name)
		local snd = CreateSound(LocalPlayer(), name)
	  
		table.insert(soundcache, snd)
	  
		return snd
	end

	local NewHookAdd = function(str, name, func)
		--name = "dronesrewrite_hell_hooks" .. name
		hook.Add(str, name, func)
	  
		table.insert(cache, {
			str = str,
			name = name
		})
	end

	local NewTimerSimple = function(time, func)
		local name = "dronesrewrite_hell_timers" .. table.Count(timercache)
		timer.Create(name, time, 1, func)
	  
		table.insert(timercache, {
			name = name
		})
	end

	local StopTimers = function() for k, v in pairs(timercache) do timer.Destroy(v.name) end end
	local RemoveHooks = function() for k, v in pairs(cache) do hook.Remove(v.str, v.name) end end
	local StopSounds = function() for k, v in pairs(soundcache) do if v then v:Stop() end end end
	local RemoveModels = function() for k, v in pairs(modelcache) do SafeRemoveEntity(v) end end

	net.Receive( "FX2Start", function()
		local target = net.ReadEntity()
		StartFX2()
	end )

	net.Receive( "FX2End", function()
		local target = net.ReadEntity()
		EndFX2()
	end )

	net.Receive( "BWStart", function()
		local target = net.ReadEntity()
		StartBW()
	end )

	net.Receive( "BWEnd", function()
		local target = net.ReadEntity()
		EndBW()
	end )
	
	function StartBW()

	LocalPlayer():ScreenFade( SCREENFADE.IN, Color( 0, 0, 0, 255 ), 3, 1 )		

	sound.Play("ambient/atmosphere/hole_hit5.wav", LocalPlayer():GetPos(), 80, 80, 1) 

		local cfx = {
			["$pp_colour_addr"] = 0,
			["$pp_colour_addg"] = 0,
			["$pp_colour_addb"] = 0,
			["$pp_colour_brightness"] = -0.06,
			["$pp_colour_contrast"] = 1.5,
			["$pp_colour_colour"] = 0,
			["$pp_colour_mulr"] = 0,
			["$pp_colour_mulg"] = 0,
			["$pp_colour_mulb"] = 0
		}

		NewHookAdd("RenderScreenspaceEffects", "FX1Color", function()
			DrawColorModify( cfx ) 
			DrawBloom( 0.5, 1, 5, 5, 1, 0.5, 0.5, 0.5, 0.5 )
			--DrawMotionBlur(Const * 0.5, Const, Const * 0.01)
		end)

		NewHookAdd("RenderScreenspaceEffects", "FX1Letterbox", function()					
			local function DrawNoGapRect( x, y, w, h )
				surface.DrawRect( x - 1, y - 1, w + 2, h + 2 )
			end

			local function DrawBars( scale )
		    local size = scale * ScrH() / 2
			DrawNoGapRect( 0, 0, ScrW(), size )
			DrawNoGapRect( 0, ScrH() - size, ScrW(), size )
		    end				

			local scale = 0.25

			if scale > 0 then
			surface.SetDrawColor( 0, 0, 0 )
			DrawBars( scale )
			end
		end)
	end

	function EndBW()

		LocalPlayer():ScreenFade( SCREENFADE.IN, Color( 0, 0, 0, 255 ), 0.5, 0 )		
		sound.Play("ambient/atmosphere/hole_hit4.wav", LocalPlayer():GetPos(), 80, 80, 1) 
		hook.Remove("RenderScreenspaceEffects", "ScreenColor")
		RemoveHooks()
		StopTimers()
		StopSounds()
		RemoveModels()

	end	

	function StartFX2()

		LocalPlayer():ScreenFade( SCREENFADE.IN, Color( 0, 0, 0, 255 ), 3, 1 )		
	
		sound.Play("ambient/atmosphere/hole_hit5.wav", LocalPlayer():GetPos(), 80, 80, 1) 
	
			local cfx = {
				["$pp_colour_addr"] = -0.09,
				["$pp_colour_addg"] = -0.07,
				["$pp_colour_addb"] = -0.05,
				["$pp_colour_brightness"] = 0,
				["$pp_colour_contrast"] = 1.45,
				["$pp_colour_colour"] = 0.45,
				["$pp_colour_mulr"] = 0,
				["$pp_colour_mulg"] = 0,
				["$pp_colour_mulb"] = 0
			}
	
			NewHookAdd("RenderScreenspaceEffects", "FX2Color", function()
				DrawColorModify( cfx ) 
				DrawBloom( 0.5, 0.25 * 4, 22, 0, 1, 1, 0.8, 0.5, 0.2 )
				end)
	
			NewHookAdd("RenderScreenspaceEffects", "FX2Letterbox", function()
							
				local function DrawNoGapRect( x, y, w, h )
					surface.DrawRect( x - 1, y - 1, w + 2, h + 2 )
				end
	
				local function DrawBars( scale )
						local size = scale * ScrH() / 2
						DrawNoGapRect( 0, 0, ScrW(), size )
						DrawNoGapRect( 0, ScrH() - size, ScrW(), size )
				end					
				
				local scale = 0.25
	
				if scale > 0 then
					surface.SetDrawColor( 0, 0, 0 )
					DrawBars( scale )
				end
	
			end)
		end

    	function EndFX2()
		
				LocalPlayer():ScreenFade( SCREENFADE.IN, Color( 0, 0, 0, 255 ), 0.5, 0 )		
				sound.Play("ambient/atmosphere/hole_hit4.wav", LocalPlayer():GetPos(), 80, 80, 1) 
				--hook.Remove("RenderScreenspaceEffects", "ScreenColor")
				RemoveHooks()
				StopTimers()
				StopSounds()
				RemoveModels()
		
		end	

		net.Receive( "LightsOff2", function()
			local target = net.ReadEntity()
			TurnLightsOff2()
		end )
	
		net.Receive( "LightsOn2", function()
			local target = net.ReadEntity()
			TurnLightsOn2()
		end )

		function TurnLightsOn2()		

			local sndlevel = 80
			local sndpitch = math.random(100,115)
			
			timer.Simple(0, function() RemoveHooks() end)
			timer.Simple(0.2, function() DarkScreen() sound.Play("ambient/energy/spark2.wav", LocalPlayer():GetPos(), sndlevel, sndpitch, 1) end)
			timer.Simple(0.4, function() RemoveHooks()  end)
		
		end
	
		function DarkScreen()
		
				local cfx = {
					["$pp_colour_addr"] = -0.10,
					["$pp_colour_addg"] = -0.10,
					["$pp_colour_addb"] = -0.07,
					["$pp_colour_brightness"] = -0.05,
					["$pp_colour_contrast"] = 1,
					["$pp_colour_colour"] = 0.20,
					["$pp_colour_mulr"] = 0,
					["$pp_colour_mulg"] = 0,
					["$pp_colour_mulb"] = 0
				}
				
				NewHookAdd("RenderScreenspaceEffects", "ScreenColor2", function()
					DrawColorModify( cfx ) 
				end)
	
				NewHookAdd("HUDPaint", "LightsOut1", function()
						surface.SetDrawColor( 0, 0, 0, 200 )
						surface.DrawRect( 0, 0, ScrW(), ScrH() )
				end)
	
		end
	
		function TurnLightsOff2()
		
			local sndlevel = 80
			local sndpitch = math.random(90,110)
			
			timer.Simple(0, function() DarkScreen() sound.Play("ambient/energy/spark6.wav", LocalPlayer():GetPos(), sndlevel, sndpitch, 1) end)
			timer.Simple(0.2, function() RemoveHooks() end)
			timer.Simple(0.4, function() DarkScreen() sound.Play("ambient/energy/spark4.wav", LocalPlayer():GetPos(), sndlevel, sndpitch, 1) end)
			timer.Simple(0.6, function() RemoveHooks()  end)
			timer.Simple(0.8, function() DarkScreen() sound.Play("ambient/energy/spark3.wav", LocalPlayer():GetPos(), sndlevel, sndpitch, 1) end)
			timer.Simple(1.0, function() RemoveHooks() end)
			timer.Simple(1.1, function() DarkScreen() sound.Play("ambient/energy/spark1.wav", LocalPlayer():GetPos(), sndlevel, sndpitch, 1) end)
			timer.Simple(1.2, function() RemoveHooks() end)
			timer.Simple(1.8, function() DarkScreen() sound.Play("ambient/energy/spark5.wav", LocalPlayer():GetPos(), sndlevel, sndpitch, 1) end)
			
		end	
		
end

nut.command.add("fx1area", {
	adminOnly = true,
	syntax = "<number distance>",
	onRun = function(client, arguments)

		local dist = tonumber(arguments[1]) or 60

		local entsgetclose = ents.FindInSphere(client:GetPos(), dist)
        
		for _,target in pairs(entsgetclose) do	

		if target:IsPlayer() and target:Alive() then		
			if target:GetNWBool("FXOn", false) == false then
			net.Start( "BWStart" )
			net.WriteEntity( target )
			net.Send( target ) 
			target:SetNWBool( "FXOn", true )
			target:SetFOV(100, 3)
			elseif target:GetNWBool("FXOn", true) == true then
			net.Start( "BWEnd" )
			net.WriteEntity( target )
			net.Send( target ) 
			target:SetNWBool( "FXOn", false )
			target:SetFOV(0, 1)
			end		
		end
		
	end
end

})

nut.command.add("fx2area", {
	adminOnly = true,
	syntax = "<number distance>",
	onRun = function(client, arguments)

		local dist = tonumber(arguments[1]) or 60

		local entsgetclose = ents.FindInSphere(client:GetPos(), dist)
        
		for _,target in pairs(entsgetclose) do	
		if target:IsPlayer() and target:Alive() then		
			if target:GetNWBool("FXOn", false) == false then
			net.Start( "FX2Start" )
			net.WriteEntity( target )
			net.Send( target ) 
			target:SetNWBool( "FXOn", true )
			target:SetFOV(100, 3)
			elseif target:GetNWBool("FXOn", true) == true then
			net.Start( "FX2End" )
			net.WriteEntity( target )
			net.Send( target ) 
			target:SetNWBool( "FXOn", false )
			target:SetFOV(0, 1)
			end
		end
	  end

	end
})

nut.command.add("lightsarea", {
	adminOnly = true,
	syntax = "<number distance>",
	onRun = function(client, arguments)

		local dist = tonumber(arguments[1]) or 60

		local entsgetclose = ents.FindInSphere(client:GetPos(), dist)
        
		for _,target in pairs(entsgetclose) do	
			if target:IsPlayer() and target:Alive() then		
				if target:GetNWBool("LightsOff2", false) == false then
				net.Start( "LightsOff2" )
				net.WriteEntity( target )
				net.Send( target ) 
				target:SetNWBool( "LightsOff2", true )
				elseif target:GetNWBool("LightsOff2", true) == true then
				net.Start( "LightsOn2" )
				net.WriteEntity( target )
				net.Send( target ) 
				target:SetNWBool( "LightsOff2", false )
			  end
		  end
	   end

	end
})

nut.command.add("lightstarg", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)

	local target = nut.command.findPlayer(client, arguments[1])	

	if ( IsValid(target) ) then	

		if target:GetNWBool("LightsOff2", false) == false then
			net.Start( "LightsOff2" )
			net.WriteEntity( target )
			net.Send( target ) 
			target:SetNWBool( "LightsOff2", true )
		    elseif target:GetNWBool("LightsOff2", true) == true then
			net.Start( "LightsOn2" )
			net.WriteEntity( target )
			net.Send( target ) 
			target:SetNWBool( "LightsOff2", false )
			end
		end
	end
})

nut.command.add("lightsresetall", {
	adminOnly = true,
	onRun = function(client, arguments)
		local dist = 99999999
		local entsgetclose = ents.FindInSphere(client:GetPos(), dist)
		for _,target in pairs(entsgetclose) do	
			if target:IsPlayer() then						
				net.Start( "LightsOn2" )
				net.WriteEntity( target )
				net.Send( target ) 
				target:SetNWBool( "LightsOff2", false )
			end
		end
	end
})