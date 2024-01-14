local NUT_CVAR_LOWER2 = CreateClientConVar("nut_usealtlower", "1", true)

function SCHEMA:LoadFonts(font)
	surface.CreateFont("nutAmmoFont", {
		font = "Roboto Cn",
		size = 28,
		weight = 100
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
	
	surface.CreateFont("nutMenuButtonLightFont", {
		font = "Type-Ra",
		size = ScreenScale(14),
		extended = true,
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
	
	surface.CreateFont("nutChatFont", {
		font = "Verdana",
		size = math.max(ScreenScale(6), 23),
		extended = true,
		weight = 250
	})

	surface.CreateFont("nutChatFontItalics", {
		font = "Verdana",
		size = math.max(ScreenScale(6), 23),
		extended = true,
		weight = 200,
		italic = true
	})

	surface.CreateFont("nutChatFontBold", {
		font = "Verdana Bold",
		size = math.max(ScreenScale(6), 23),
		extended = true,
		weight = 300,
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

	local button = menu:addButton("Clear Icon Cache", function(panel, state)
		RunConsoleCommand("nut_flushicon", "1")
	end)
				
	menu:addSpacer()
	
	local button = menu:addCheck("Multi-Core Rendering", function(panel, state)
		if (state) then
			RunConsoleCommand("gmod_mcore_test", "1")
		else
			RunConsoleCommand("gmod_mcore_test", "0")
		end
	end, GetConVar("gmod_mcore_test"):GetBool())

end

function SCHEMA:CanCreateCharInfo(panel)
	local suppress = {}
	suppress.time = true
	
	return suppress
end

local GM = gmod.GetGamemode()

--this is here to improve ragdoll calview
--previously you would see into the ground sometimes, adding a znear to it improved it a bit
function SCHEMA:CalcView(client, origin, angles, fov)
	local view = GM.BaseClass:CalcView(client, origin, angles, fov)
	local entity = Entity(client:getLocalVar("ragdoll", 0))
	local ragdoll = client:GetRagdollEntity()

	if (client:GetViewEntity() == client) then
		if (
			-- First person if the player has fallen over.
			(
				not client:ShouldDrawLocalPlayer()
				and IsValid(entity)
				and entity:IsRagdoll()
			)
			or
			-- Also first person if the player is dead.
			(not LocalPlayer():Alive() and IsValid(ragdoll))
		) then
			local ent = LocalPlayer():Alive() and entity or ragdoll
			local index = ent:LookupAttachment("eyes")

			if (index) then
				local data = ent:GetAttachment(index)

				if (data) then
					view = view or {}
					view.origin = data.Pos
					view.angles = data.Ang
					view.znear = 1
				end

				return view
			end
		end
	end
end