local PLUGIN = PLUGIN
PLUGIN.name = "Ghosts"
PLUGIN.author = ""
PLUGIN.desc = "Adds a system where players (non admin) are forced into noclip and can do things."

-- do not let them drop
function PLUGIN:nut_onDropCheck(client, item)
	if(client:getNetVar("isSpirit")) then
		return true 
	end
end

-- do not let them take
function PLUGIN:nut_onTakeCheck(client, item)
	if(client:getNetVar("isSpirit")) then
		return true 
	end
end

if(SERVER) then
	function PLUGIN:Think()
		if((self.nextPoints or 0) < CurTime()) then
			self.nextPoints = CurTime() + 10

			for k, client in ipairs(player.GetAll()) do
				if(client:HasWeapon("nut_ghostswep")) then
					local points = client:GetNW2Int("ghostPoints", 0)
					client:SetNW2Int("ghostPoints", points + 10)
				end
			end
		end
	end

	function PLUGIN:ghostEnable(client)
		--client.isSpirit = true
		client:setNetVar("isSpirit", true)
		
		-- Store their old position and looking	at angle.
		client.nutObsData = {client:GetPos(), client:EyeAngles()}
		
		-- Hide them so they are not visible.
		client:SetNoDraw(true)
		client:SetNotSolid(true)
		client:DrawWorldModel(false)
		client:DrawShadow(false)
		-- Don't allow the player to get hurt.
		client:GodEnable()
		
		client:SetCollisionGroup(COLLISION_GROUP_WORLD)
		client:SetMoveType(MOVETYPE_NOCLIP)
		
		--save weapons (to give them back later)
		local weapons = {}
		for k, v in pairs(client:GetWeapons()) do
			weapons[#weapons+1] = v:GetClass()
		end
		client.preGhostWeapons = weapons
		
		--strip we apons
		client:StripWeapons()
		
		--give ghost swep
		client:Give("nut_ghostswep")
		client:Give("nut_ghostmover")
		
		client:notify("Entering ghost mode.")
	end

	function PLUGIN:ghostDisable(client)
		client:setNetVar("isSpirit", nil)

		if(client.nutObsData) then
			local position, angles = client.nutObsData[1], client.nutObsData[2]

			-- Do it the next frame since the player can not be moved right now.
			timer.Simple(0, function()
				client:SetPos(position)
				client:SetEyeAngles(angles)
				-- Make sure they stay still when they get back.
				client:SetVelocity(Vector(0, 0, 0))
			end)
		
			-- Store their old position and looking		 at angle.
			client.nutObsData = nil
		end

		client:SetMoveType(MOVETYPE_WALK)
		client:SetCollisionGroup(COLLISION_GROUP_PLAYER)
		
		--remove ghost swep
		client:StripWeapons()
		
		--give back stripped weapons from before entering ghost mode
		if(client.preGhostWeapons) then
			for k, v in pairs(client.preGhostWeapons) do
				client:Give(v)
			end
		end
		
		client:Spawn()
		client:notify("Exiting ghost mode.")
	end
	
	--if a ghost exits a vehicle, noclip them again
	function PLUGIN:PlayerLeaveVehicle(client, vehicle)
		if(client:getNetVar("isSpirit")) then
			client:SetNoDraw(true)
			client:SetNotSolid(true)
			client:DrawWorldModel(false)
			client:DrawShadow(false)
			
			client:SetCollisionGroup(COLLISION_GROUP_WORLD)
			client:SetMoveType(MOVETYPE_NOCLIP)
		end
	end
else
	local client, sx, sy, scrPos, marginx, marginy, x, y, teamColor, distance, factor, size, alpha
	local dimDistance = 4096
	function PLUGIN:HUDPaint()
		client = LocalPlayer()
		
		if (!client:IsAdmin() and client:getNetVar("isSpirit") and client:GetMoveType() == MOVETYPE_NOCLIP and !client:InVehicle()) then
			sx, sy = surface.ScreenWidth(), surface.ScreenHeight()
			
			for k, v in ipairs(player.GetAll()) do
				if (v == client) then continue end

				scrPos = v:GetPos():ToScreen()
				marginx, marginy = sy*.1, sy*.1
				x, y = math.Clamp(scrPos.x, marginx, sx - marginx), math.Clamp(scrPos.y, marginy, sy - marginy)
				teamColor = team.GetColor(v:Team())
				distance = client:GetPos():Distance(v:GetPos())
				factor = 1 - math.Clamp(distance/dimDistance, 0, 1)
				size = math.max(10, 32*factor)
				alpha = math.Clamp(255*factor, 80, 255)

				surface.SetDrawColor(teamColor.r, teamColor.g, teamColor.b, alpha)
				--surface.DrawLine(sx * 0.5, sy * 0.5, x, y)
				--surface.DrawRect(x - size/2, y - size/2, size, size)

				nut.util.drawText(v:Name() .. "(" .. v:Health() .. ")", x, y - size, ColorAlpha(teamColor, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha)
			end
		end
	end
end

nut.command.add("ghosttoggle", {
	adminOnly = true,
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			if(!target:getNetVar("isSpirit")) then
				if(!target:Alive()) then
					target:Spawn()
				end
			
				PLUGIN:ghostEnable(target)
				client:notify("Ghost mode enabled for " ..target:Name().. ".")
			else
				PLUGIN:ghostDisable(target)
				client:notify("Ghost mode disabled for " ..target:Name().. ".")
			end
		end
	end
})

--sets all existing ghosts to not ghosts
nut.command.add("ghostsremove", {
	adminOnly = true,
	onRun = function(client, arguments)
		for k, target in pairs(player.GetAll()) do
			if(target:getNetVar("isSpirit")) then
				PLUGIN:ghostDisable(target)
				client:notify("Ghost mode disabled for " ..target:Name().. ".")
			end
		end
	end
})

--sets all existing ghosts to not ghosts
nut.command.add("ghostpointadd", {
	adminOnly = true,
	onRun = function(client, arguments)
		local points = tonumber(arguments[2])
		if(!points) then 
			client:notify("Specify the point amount.")
			return false
		end
	
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			local weapon = target:GetWeapon("nut_ghostswep")
			if(!IsValid(weapon)) then
				client:notify("Invalid ghost swep.")
				return false
			end
			
			local curPoints = target:GetNW2Int("ghostPoints", 0)
			target:SetNW2Int("ghostPoints", curPoints + points)
		
			client:notify(points.. " points given to " ..target:Name())
		end
	end
})

nut.chat.register("ghost", { --ghost specific chat
	onChatAdd = function(speaker, text)
		chat.AddText(Color(100,100,255), "[GHOST] " ..speaker:Name().. ": " ..text)
	end,
	filter = "ooc",
	font = "nutChatFont",
	onCanHear = function(speaker, listener)
		if(listener:getNetVar("isSpirit")) then
			return true
		end

		return false
	end,
	onCanSay = function(speaker, text)
		if (!speaker:getNetVar("isSpirit")) then
			return false
		end

		return true
	end,
	deadCanChat = true,
	prefix = {"/ghost"},
})