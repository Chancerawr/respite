PLUGIN.name = "Crosshair"
PLUGIN.author = "Black Tea"
PLUGIN.desc = "A Crosshair."

if (SERVER) then return end

nut.xhair = nut.xhair or {}

local function drawdot( pos, size, col )
	local color = col[2]
	surface.SetDrawColor(color.r, color.g, color.b, color.a)
	surface.DrawRect(pos[1] - size/2, pos[2] - size/2, size, size)

	local color = col[1]
	surface.SetDrawColor(color.r, color.g, color.b, color.a)
	surface.DrawOutlinedRect(pos[1] - size/2, pos[2] - size/2 , size, size)
end

surface.CreateFont("nutCrossIcons", {
	font = "nsicons",
	size = ScreenScale(11),
	extended = true,
})

local w, h, aimVector, punchAngle, ft, screen, scaleFraction, distance, entity
local math_round = math.Round
local curGap = 0
local curAlpha = 0
local curIconAlpha = 0
local maxDistance = 1000 ^ 2
local crossSize = 4
local crossGap = 0
local colors = {color_black}
local filter = {}
local sw, sh = ScrW(), ScrH()
local lastIcon = ""

local curGap2 = 0
local curAlpha2 = 0
local maxDistance2 = 1000 ^ 2
local crossSize2 = 4
local crossGap2 = 0
local colors2 = {color_black}
local filter2 = {}

nut.xhair.entIcon = {}
--[[
nut.xhair.entIgnore = {
	func_physbox = true,
	prop_dynamic = true,
	prop_physics = true,
	nut_talker = true,
	nut_vendor = true,
	nut_storage = true,
}
--]]

nut.xhair.ents = {
	nut_item = true,
	prop_door_rotating = true,
	prop_dynamic = true,
}

NUT_CVAR_CROSS = CreateClientConVar("nut_crosshair", 1, true, true)
NUT_CVAR_CROSS2 = CreateClientConVar("nut_crosshair2", 1, true, true)

function PLUGIN:SetupQuickMenu(menu)
	local button = menu:addCheck("Crosshair Icons", function(panel, state)
		if (state) then
			RunConsoleCommand("nut_crosshair2", "1")
		else
			RunConsoleCommand("nut_crosshair2", "0")
		end
	end, NUT_CVAR_CROSS2:GetBool())
	
	menu:addSpacer()
	
	local button = menu:addCheck("Crosshair", function(panel, state)
		if (state) then
			RunConsoleCommand("nut_crosshair", "1")
		else
			RunConsoleCommand("nut_crosshair", "0")
		end
	end, NUT_CVAR_CROSS:GetBool())
	
	menu:addSpacer()
end

function PLUGIN:ShouldDrawCrosshairIcons()
	if(NUT_CVAR_CROSS2) then
		return NUT_CVAR_CROSS2:GetBool()
	end
end

function PLUGIN:PostDrawHUD()
	local client = LocalPlayer()
	if (!client:getChar() or !client:Alive()) then
		return
	end

	local entity = Entity(client:getLocalVar("ragdoll", 0))
	if (entity:IsValid()) then
		return
	end

	local wep = client:GetActiveWeapon()
	if (wep and wep:IsValid() and (wep.HUDPaint or wep.IsTFAWeapon)) then
		return
	end

	if (hook.Run("ShouldDrawCrosshair") == false or g_ContextMenu:IsVisible() or IsValid(nut.gui.character) and nut.gui.character:IsVisible()) then
		return
	end

	aimVector = client:EyeAngles()
	punchAngle = client:GetPunchAngle()
	w, h = ScrW(), ScrH()
	ft = FrameTime()
	filter = {client}

	local vehicle = client:GetVehicle()
	if (vehicle and IsValid(vehicle)) then
		aimVector = aimVector + vehicle:GetAngles()
		table.insert(filter, vehicle)
	end

	local data = {}
		data.start = client:GetShootPos()
		data.endpos = data.start + (aimVector + punchAngle):Forward()*65535
		data.filter = filter
	local trace = util.TraceLine(data)

	entity = trace.Entity
	distance = trace.StartPos:DistToSqr(trace.HitPos)
	scaleFraction = 1 - math.Clamp(distance / maxDistance, 0, .75)
	screen = trace.HitPos:ToScreen()
	crossSize = 4
	crossGap = 16

	curGap = Lerp(ft * 5, curGap, crossGap)
	
	local schemaColor = nut.config.get("color")
	
	colors[2] = Color(schemaColor.r, schemaColor.g, schemaColor.b, curAlpha, distance)

	local icon, adx, ady = hook.Run("GetCrosshairIcon", curAlpha, entity, wep, distance)
	local cx, cy = sw/2, sh/2

	if (client:ShouldDrawLocalPlayer()) then
		cx, cy = screen.x, screen.y
	end

	if (icon) then
		if (icon != lastIcon) then
			lastIcon = icon
		end

		curIconAlpha = Lerp(ft * 10, curIconAlpha, 255)
		curAlpha = Lerp(ft * 30, curAlpha, 0)
	else
		local showCross = not client.isWepRaised or client:isWepRaised()
		curIconAlpha = Lerp(ft * 30, curIconAlpha, 0)
		curAlpha = Lerp(ft * 10, curAlpha, (showCross and 150 or 0))
	end

	curAlpha = hook.Run("GetCrosshairAlpha", curAlpha, entity) or curAlpha

	if(NUT_CVAR_CROSS and NUT_CVAR_CROSS:GetBool()) then
		if(hook.Run("ShouldDrawCrosshairIcons") == false) then
			curAlpha = 2
		end
	
		if (curAlpha > 1) then
			filter2 = {client}

			crossSize2 = 4
			crossGap2 = 24 * (scaleFraction - (client:isWepRaised() and 0 or .1))
			
			if (IsValid(entity) and entity:GetClass() == "nut_item" and 
				entity:GetPos():DistToSqr(data.start) <= 16384) then
				crossGap2 = 0
				crossSize2 = 5
			end

			curGap2 = Lerp(ft * 2, curGap2, crossGap2)
			curAlpha2 = Lerp(ft * 2, curAlpha2, (!client:isWepRaised() and 255 or 150))
			
			colors2[2] = Color(schemaColor.r, schemaColor.g, schemaColor.b, 255)

			drawdot({math_round(cx), math_round(cy)}, crossSize2, colors2)
			drawdot({math_round(cx + curGap2), math_round(cy)}, crossSize2, colors2)
			drawdot({math_round(cx - curGap2), math_round(cy)}, crossSize2, colors2)
			drawdot({math_round(cx), math_round(cy + curGap2 * .8)}, crossSize2, colors2)
			drawdot({math_round(cx), math_round(cy - curGap2 * .8)}, crossSize2, colors2)
		end
	
		--[[
		drawdot( {math_round(cx), math_round(cy)}, crossSize, colors)
		drawdot( {math_round(cx + curGap), math_round(cy)}, crossSize, colors)
		drawdot( {math_round(cx - curGap), math_round(cy)}, crossSize, colors) 
		drawdot( {math_round(cx), math_round(cy + curGap * .8)}, crossSize, colors)
		drawdot( {math_round(cx), math_round(cy - curGap * .8)}, crossSize, colors)
		--]]
	end
	
	if (lastIcon) then
		nut.util.drawText(lastIcon or "", cx + (adx or 0), cy + (ady or 0), ColorAlpha(schemaColor, curIconAlpha), 1, 1, "nutCrossIcons")
	end
end

function PLUGIN:GetCrosshairIcon(curAlpha, entity, wep, distance)
	if(hook.Run("ShouldDrawCrosshairIcons") == false) then
		return
	end

	--[[
	if (table.Count(nut.menu.list) > 0) then
		return "", 0, ScreenScale(5)
	end

	if (IsValid(wep)) then
		if (wep:GetNW2Bool("holdingObject", false)) then
			return ""
		end
	end

	if (IsValid(entity) and distance < 16384) then
		if (!entity:IsPlayer() and !entity:IsNPC()) then
			local class = entity:GetClass()

			if (nut.xhair.ents[class]) then 
				if (class == "class C_BaseEntity") then
					return ""
				end

				if (nut.xhair.entIcon[class]) then
					return nut.xhair.entIcon[class]
				end

				if (IsValid(wep)) then
					local class = wep:GetClass()

					if (entity.isDoor and entity:isDoor()) then
						if (class == "nut_keys") then
								local owner = entity.GetDTEntity(entity, 0)
								local hey = entity:checkDoorAccess(wep.Owner)

								if (owner == LocalPlayer() or hey) then
									return ""
								end
							end

						return ""
					end

					if (class == "nut_hands") then
						return ""
					end
				end
			end
		end
	end
	--]]
end

function PLUGIN:HUDShouldDraw(element)
	if (element == "CHudCrosshair") then
		return false
	end
end