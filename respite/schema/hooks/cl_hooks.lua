local NUT_CVAR_LOWER2 = CreateClientConVar("nut_usealtlower", "1", true)

function SCHEMA:LoadFonts(font)
	surface.CreateFont("nutAmmoFont", {
		font = "Roboto Cn",
		size = 28,
		weight = 100
	})
	
	surface.CreateFont("nutItalic", {
		font = "Segoe UI",
		size = 22,
		weight = 1000,
		shadow = true,
		italic = true
	})
	
	surface.CreateFont("nutChat", {
		font = "Segoe UI",
		size = math.max(ScreenScale(7), 17),
		weight = 200
	})
	
	surface.CreateFont("nutYell", {
	    font = "Roboto Cn",
		size = 24,
		weight = 1000,
		shadow = true
	})

	surface.CreateFont("nutWhisper", {
	    font = "Segoe UI",
		size = 17,
		weight = 1000,
		shadow = true
	})
	
	surface.CreateFont("nutObjDescFont", {
		font = "Roboto",
		size = 22,
		weight = 1000,
		shadow = true
	})
	
	surface.CreateFont("nutESPFont", {
		font = "Segoe UI",
		size = 17,
		weight = 1000,
		extended = true
	})
   

	surface.CreateFont("nut3D2DFont", {
		font = "Type-Ra",
		size = 2048,
		weight = 1000
	})

	surface.CreateFont("nutTitleFont", {
		font = "Type-Ra",
		size = ScreenScale(30),
		weight = 1000
	})

	surface.CreateFont("nutSubTitleFont", {
		font = "Roboto Cn",
		size = ScreenScale(10),
		weight = 500
	})

	surface.CreateFont("nutMenuButtonFont", {
		font = "Type-Ra",
		size = ScreenScale(10),
		weight = 400
	})
	
	surface.CreateFont("nutMenuButtonFontNew", {
		font = "Type-Ra",
		size = ScreenScale(10),
		weight = 400
	})

	surface.CreateFont("nutMenuButtonLightFont", {
		font = font,
		size = ScreenScale(10),
		weight = 200
	})

	surface.CreateFont("nutToolTipText", {
		font = font,
		size = 20,
		weight = 500
	})

	surface.CreateFont("nutDynFontSmall", {
		font = font,
		size = ScreenScale(22),
		weight = 1000
	})

	surface.CreateFont("nutDynFontMedium", {
		font = font,
		size = ScreenScale(28),
		weight = 1000
	})

	surface.CreateFont("nutDynFontBig", {
		font = font,
		size = ScreenScale(48),
		weight = 1000
	})

	-- The more readable font.
	font = "Roboto Cn"

	surface.CreateFont("nutCleanTitleFont", {
		font = font,
		size = 200,
		weight = 1000
	})

	surface.CreateFont("nutHugeFont", {
		font = "Roboto Cn",
		size = 72,
		weight = 1000
	})

	surface.CreateFont("nutBigFont", {
		font = "Roboto Cn",
		size = 36,
		weight = 1000
	})

	surface.CreateFont("nutMediumFont", {
		font = "Roboto Cn",
		size = 25,
		weight = 1000
	})

	surface.CreateFont("nutMediumLightFont", {
		font = "Roboto Cn",
		size = 25,
		weight = 200
	})

	surface.CreateFont("nutGenericFont", {
		font = "Roboto Cn",
		size = 20,
		weight = 1000
	})

	-- surface.CreateFont("nutChatFont", {
		-- font = font,
		-- size = math.max(ScreenScale(7), 17),
		-- weight = 200
	-- })

	-- surface.CreateFont("nutChatFontItalics", {
		-- font = font,
		-- size = math.max(ScreenScale(7), 17),
		-- weight = 200,
		-- italic = true
	-- })
	
	   
	surface.CreateFont("nutChatFont", {
	    font = "Roboto",
		size = 17,
		weight = 1000,
		shadow = true
	})
	
	surface.CreateFont("nutChatFontItalics", {
		font = "Roboto",
		size = 17,
		weight = 1000,
		italic = true,
		shadow = true
	})

	surface.CreateFont("nutSmallFont", {
		font = font,
		size = math.max(ScreenScale(6), 17),
		weight = 500
	})

	surface.CreateFont("nutSmallBoldFont", {
		font = font,
		size = math.max(ScreenScale(8), 20),
		weight = 800
	})

	-- Introduction fancy font.
	font = "Roboto Cn"

	surface.CreateFont("nutIntroTitleFont", {
		font = font,
		size = 200,
		weight = 1000
	})

	surface.CreateFont("nutIntroBigFont", {
		font = font,
		size = 48,
		weight = 1000
	})

	surface.CreateFont("nutIntroMediumFont", {
		font = font,
		size = 28,
		weight = 1000
	})

	surface.CreateFont("nutIntroSmallFont", {
		font = font,
		size = 22,
		weight = 1000
	})

	surface.CreateFont("nutIconsSmall", {
		font = "fontello",
		size = 22,
		weight = 500
	})

	surface.CreateFont("nutIconsMedium", {
		font = "fontello",
		size = 28,
		weight = 500
	})

	surface.CreateFont("nutIconsBig", {
		font = "fontello",
		size = 48,
		weight = 500
	})
end

function SCHEMA:RenderScreenspaceEffects()
if ( nut.gui.char and nut.gui.char:IsVisible() ) then
	    local mat_Overlay = Material("pp/blurscreen")

		local scrW, scrH = ScrW(), ScrH()		
			for i = 1, 3 do
			mat_Overlay:SetFloat("$blur", (i / 2) * (amount or 5))
			mat_Overlay:Recompute()

			render.UpdateScreenEffectTexture()
			render.SetMaterial( mat_Overlay )
			render.DrawScreenQuad()
		end
		local x, y = nut.gui.char:LocalToScreen(0, 0)
		local w, h = nut.gui.char:GetWide(), ScrH()
		render.SetStencilEnable(true)
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
		render.SetStencilReferenceValue(1)
		render.ClearStencilBufferRectangle(x, y, x + w, h, 1)
		render.SetStencilEnable(1)
		render.SetStencilEnable(false)

menu = {}
menu["$pp_colour_addr"] = -23/255
menu["$pp_colour_addg"] = -16/255
menu["$pp_colour_addb"] = 5/255
menu["$pp_colour_brightness"] = -0.07
menu["$pp_colour_contrast"] = 0.8
menu["$pp_colour_colour"] = 0.2
menu["$pp_colour_mulr"] = 0
menu["$pp_colour_mulg"] = 0
menu["$pp_colour_mulb"] = 0
DrawColorModify( menu ) 

 end

if ( nut.gui.char and !nut.gui.char:IsVisible() ) then
if NUT_CVAR_POSTPROCESS:GetBool() then

ingame = {}
ingame["$pp_colour_addr"] = -10/255
ingame["$pp_colour_addg"] = -5/255
ingame["$pp_colour_addb"] = 15/255
ingame["$pp_colour_brightness"] = -0.03
ingame["$pp_colour_contrast"] = 1.2
ingame["$pp_colour_colour"] = 0.40
ingame["$pp_colour_mulr"] = 0
ingame["$pp_colour_mulg"] = 0
ingame["$pp_colour_mulb"] = 0
-- DrawSunbeams( 2, 2, 2, 2, 2 )
DrawColorModify( ingame ) 
DrawBloom( .75, 1, 9, 9, 1, .65, 2, 2, 2 )
DrawToyTown( 1, ScrH()/2 )
end
end
end

function SCHEMA:HUDPaint()
if NUT_CVAR_LETTERBOX:GetBool() or IsValid(nut.char.gui) then
 
		local w,h = ScrW(),ScrH()
		surface.SetDrawColor ( 0, 0, 0, 255 )
		surface.DrawRect ( 0, 0, w, h / 6 )
		
		local w,h = ScrW(),ScrH()
		surface.SetDrawColor ( 0, 0, 0, 255 )
		surface.DrawRect ( 0, 930, w, h / 6 )
		
		end 
end

NUT_CVAR_POSTPROCESS = CreateClientConVar("nut_postprocess", 0, true, true)
NUT_CVAR_LETTERBOX = CreateClientConVar("nut_letterbox", 0, true, true)

--disables kill feed
function SCHEMA:DrawDeathNotice() 
	return false
end

--disables ammo pickup notifications
function SCHEMA:HUDAmmoPickedUp() 
	return false
end

--disables weapon pickup notifications
function SCHEMA:HUDDrawPickupHistory()
	return false
end

--disables target identification (name percent health)
function SCHEMA:HUDDrawTargetID()
	return false
end

function SCHEMA:SetupQuickMenu(menu)	 
	
		 local button = menu:addCheck("Color Modification", function(panel, state)
				if (state) then
					RunConsoleCommand("nut_postprocess", "1")
				else
					RunConsoleCommand("nut_postprocess", "0")
				end
			end, NUT_CVAR_POSTPROCESS:GetBool())
			
	  menu:addSpacer()
	  
	  	  local button = menu:addCheck("Letterbox", function(panel, state)
				if (state) then
					RunConsoleCommand("nut_letterbox", "1")
				else
					RunConsoleCommand("nut_letterbox", "0")
				end
			end, NUT_CVAR_LETTERBOX:GetBool())
			
	  menu:addSpacer()	  
end

function SCHEMA:ShowPlayerCard( client, me )
	self.F3 = vgui.Create( "DFrame" );
	self.F3:SetSize( 500, 700 );
	self.F3:Center();
	if( me ) then
		self.F3:SetTitle( "Player Menu" );
	else
		self.F3:SetTitle( client:Name() );
	end
	self.F3:MakePopup();
	
	self.F3.P = vgui.Create( "ICharPanel", self.F3 );
	self.F3.P:SetPos( 10, 34 );
	self.F3.P:SetSize( 128, 128 );
	self.F3.P:SetModel( client:GetModel() );
	
	for i = 0, #client:GetMaterials() - 1 do
		
		self.F3.P:SetSubMaterial( i, client:GetSubMaterial( i ) );
		
	end
	
	self.F3.P:SetCamPos( Vector( 50, 20, 63 ) );
	self.F3.P:SetLookAtEyes();
	self.F3.P:SetFOV( 15 );
	
	self.F3.P.NoMouseWheel = true;
	
	self.F3.N = vgui.Create( "DLabel", self.F3 );
	self.F3.N:SetPos( 148, 34 );
	self.F3.N:SetFont( "nutMediumLightFont" );
	self.F3.N:SetText( client:Name() );
	self.F3.N:SizeToContents();
	self.F3.N:SetTextColor( Color( 255, 255, 255, 255 ) );
	
	self.F3.DS = vgui.Create( "DScrollPanel", self.F3 );
	self.F3.DS:SetPos( 148, 64 );
	self.F3.DS:SetSize( 500 - 148 - 10, 700 - 64 - 10 );
	function self.F3.DS:Paint( w, h ) end
	
	self.F3.B = vgui.Create( "DLabel", self.F3.DS );
	self.F3.B:SetPos( 0, 40 );
	self.F3.B:SetFont( "nutMediumLightFont" );
	self.F3.B:SetText( client:getChar():getDesc() );
	self.F3.B:SetAutoStretchVertical( true );
	self.F3.B:SetWrap( true );
	self.F3.B:SetSize( 500 - 148 - 10 - 16, 10 );
	self.F3.B:SetTextColor( Color( 255, 255, 255, 255 ) );
	self.F3.B:PerformLayout();
end

function SCHEMA:PlayerBindPress(client, bind, pressed)
	bind = bind:lower()
	
	if ((bind:find("use") or bind:find("attack")) and pressed) then
		if (bind:find("use") and pressed) then
			local data = {}
				data.start = client:GetShootPos()
				data.endpos = data.start + client:GetAimVector()*96
				data.filter = client
			local trace = util.TraceLine(data)
			local entity = trace.Entity
			if (IsValid(client) and entity:IsPlayer()) then
				hook.Run("ShowPlayerCard", entity )
			end
		end
	end
end

function SCHEMA:SetupQuickMenu(menu)
	local button = menu:addButton("Clear Icon Cache", function(panel, state)
		RunConsoleCommand("nut_flushicon", "1")
	end)
				
	menu:addSpacer()
end