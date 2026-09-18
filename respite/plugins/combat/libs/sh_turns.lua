local PLUGIN = PLUGIN

PLUGIN.turns = PLUGIN.turns or {
	{
		name = "Combat 1",
		entities = {

		},
		order = {
			[1] = "Drifter",
			[2] = "Enemy",
		},
		current = 1,
	},
	{
		name = "Combat 2",
		entities = {

		},
		order = {
			[1] = "Player",
			[2] = "Enemy",
		},
		current = 1,
	},
	{
		name = "Combat 3",
		entities = {

		},
		order = {
			[1] = "Drifter",
			[2] = "Enemy",
		},
		current = 1,
	},
	{
		name = "Combat 4",
		entities = {

		},
		order = {
			[1] = "Drifter",
			[2] = "Enemy",
		},
		current = 1,
	},
	{
		name = "Combat 5",
		entities = {

		},
		order = {
			[1] = "Drifter",
			[2] = "Enemy",
		},
		current = 1,
	},
	{
		name = "Combat 6",
		entities = {

		},
		order = {
			[1] = "Drifter",
			[2] = "Enemy",
		},
		current = 1,
	},
	{
		name = "Combat 7",
		entities = {

		},
		order = {
			[1] = "Drifter",
			[2] = "Enemy",
		},
		current = 1,
	},
	{
		name = "Combat 8",
		entities = {

		},
		order = {
			[1] = "Drifter",
			[2] = "Enemy",
		},
		current = 1,
	},
	{
		name = "Combat 9",
		entities = {

		},
		order = {
			[1] = "Drifter",
			[2] = "Enemy",
		},
		current = 1,
	},
	{
		name = "Combat 10",
		entities = {

		},
		order = {
			[1] = "Drifter",
			[2] = "Enemy",
		},
		current = 1,
	}
}

--gets turn ID of the turn system a player is in, if they are in one
PLUGIN.helperFuncs["getTurnID"] = function(self)
	--checks if the player is in a turn system
	--if they art, return the turn ID
	for k, v in pairs(PLUGIN.turns) do
		if(v.controllers and v.controllers[self]) then
			return k
		end
		
		if(v.entities and v.entities[self]) then
			self.turnOrder = k
			return k
		end
	end
end

--gets turn table of a turn order that a player is in, if they are in one.
PLUGIN.helperFuncs["getTurnData"] = function(self)
	local turnID = self:getTurnID()
	if(turnID) then
		return PLUGIN.turns[turnID]
	else
		return {}
	end
end

--gets the teamID of the team the player is on, if any
PLUGIN.helperFuncs["getTurnTeam"] = function(self)
	local turnData = self:getTurnData()
	if(turnData) then
		local entities = turnData.entities or {}
		
		return entities[self]
	end
	
	return -1
end

--determines if the player is a controller of the specified turn system
PLUGIN.helperFuncs["isTurnController"] = function(self, id)
	local controller = PLUGIN:turnGetController(id)
	if(controller[self]) then
		return true
	else
		return false
	end
end

--finds the turn table the player is a controller of, if they are in control of one
PLUGIN.helperFuncs["getTurnControlled"] = function(self, id)
	for k, v in pairs(PLUGIN.turns) do
		local controller = self:isTurnController(k)
		if(controller) then
			return k
		end
	end
end

--finds the turn table the player is a controller of, if they are in control of one
PLUGIN.helperFuncs["getTurnAI"] = function(self, id)
	return self:getNetVar("TurnAI")
end

--adds an entity to a turn table as a controller
function PLUGIN:turnControlAdd(id, entity, team)
	--only let people control one turn order at a time
	--remove them from all others when added
	for k, v in pairs(PLUGIN.turns) do
		if(v.controllers) then
			v.controllers[entity] = nil
		end
	end

	PLUGIN.turns[id] = PLUGIN.turns[id] or {}
	local controllers = PLUGIN.turns[id]["controllers"] or {}
	
	controllers[entity] = true
	
	--adds the entity to the table
	PLUGIN.turns[id]["controllers"] = controllers
end

--adds an entity to a turn table
function PLUGIN:turnAdd(id, entity, team)
	--remove from all other turn tables
	--just to keep things simple
	for k, v in pairs(PLUGIN.turns) do
		if(v.entities) then
			v.entities[entity] = nil
		end
	end

	PLUGIN.turns[id] = PLUGIN.turns[id] or {}

	local entities = PLUGIN.turns[id]["entities"] or {}
	
	entities[entity] = team
	
	--adds the entity to the table
	PLUGIN.turns[id]["entities"] = entities
end

--creates a new turn table
function PLUGIN:turnCreate(id, data)
	PLUGIN.turns[id] = data
end

--adds a team to a turn table
function PLUGIN:turnAddTeam(id, team)
	PLUGIN.turns[id] = PLUGIN.turns[id] or {}
	local order = PLUGIN.turns[id]["order"] or {}
	
	order[#order+1] = team

	PLUGIN.turns[id]["order"] = order
end

--returns every member of the specified team in the table
function PLUGIN:turnGetTeam(id, team)
	PLUGIN.turns[id] = PLUGIN.turns[id] or {}
	
	local entities = PLUGIN.turns[id]["entities"] or {}
	
	local members = {}
	for k, v in pairs(entities) do
		if(string.lower(v) == string.lower(team)) then
			members[k] = v
		end
	end
	
	return members
end

--returns every controller of the specified turn ID
function PLUGIN:turnGetController(id)
	PLUGIN.turns[id] = PLUGIN.turns[id] or {}
	
	local controllers = PLUGIN.turns[id]["controllers"] or {}
	
	return controllers
end

--removes an entity from a turn table
function PLUGIN:turnRemove(id, entity)
	PLUGIN.turns[id] = PLUGIN.turns[id] or {}
	local entities = PLUGIN.turns[id]["entities"] or {}

	entities[entity] = nil

	PLUGIN.turns[id]["entities"] = entities
end

--removes an entity from a turn table
function PLUGIN:turnControlRemove(id, entity)
	PLUGIN.turns[id] = PLUGIN.turns[id] or {}
	local controllers = PLUGIN.turns[id]["controllers"] or {}

	controllers[entity] = nil

	PLUGIN.turns[id]["controllers"] = controllers
end

--removes a team from a turn table
function PLUGIN:turnRemoveTeam(id, teamID)
	PLUGIN.turns[id] = PLUGIN.turns[id] or {}
	local order = PLUGIN.turns[id]["order"] or {}
	
	table.remove(order, teamID)
	
	PLUGIN.turns[id]["order"] = order
end

--advances the specified turn to the next team
function PLUGIN:turnAdvance(id, cur)
	local turn = PLUGIN.turns[id]
	if(!turn) then
		return false
	end
	
	if(!cur) then
		cur = turn.current
	end
	
	local newTurnID = (cur + 1) 
	if(newTurnID > #turn.order) then
		newTurnID = 1
	end
	
	local newTurn = turn.order[newTurnID] --String name for whose turn it is
	
	turn.current = newTurnID
	
	for entity, team in pairs(turn.entities) do
		if(!IsValid(entity)) then continue end
	
		if(newTurn == turn.order[team]) then
			entity:turnProcess(newTurn, true) --each entity processes its turn
		else
			entity:turnProcess(newTurn, false) --each entity processes its turn
		end
	end

	return newTurn
end	

--finds a turn table by its name
function PLUGIN:turnByName(name)
	local id
	for k, v in pairs(PLUGIN.turns) do
		if(string.lower(v.name) == string.lower(name)) then
			id = k
			break
		elseif(string.find(string.lower(v.name), string.lower(name))) then
			id = k
		end
	end
	
	return PLUGIN.turns[id], id
end

--checks to see if a turn table has the specified team or something close to it
function PLUGIN:turnHasTeam(id, team)
	local findTeam

	local teams = PLUGIN.turns[id].order
	for k, v in pairs(teams) do
		if(string.lower(v) == string.lower(team)) then
			return v
		elseif(string.find(string.lower(v), string.lower(team))) then
			findTeam = v
		end
	end
	
	return findTeam
end

--gets the current turn in the ordering
function PLUGIN:turnCurrent(id)
	if(PLUGIN.turns[id]) then
		return PLUGIN.turns[id].current
	end
	
	return 1
end

--syncs a single turn table to a player
function PLUGIN:turnSyncByID(client, id)
	local data = PLUGIN.turns[id]

	if(data) then
		netstream.Start(client, "nut_turnSyncID", id, data)
	end
end

--syncs every turn table to a client
function PLUGIN:turnSyncAll(client)
	local data = PLUGIN.turns

	if(data) then
		netstream.Start(client, "nut_turnSyncAll", data)
	end
end

function PLUGIN:canSeeEntityName(client, id)
	if(client:IsAdmin()) then
		return true
	end
	
	if(client:isTurnController(id)) then
		return true
	end

	return false
end

--processes turns
PLUGIN.helperFuncs["turnProcess"] = function(self, turn, you)
	if(you) then
		if(self:GetMoveType() != MOVETYPE_NOCLIP) then
			self:setNetVar("showAPCircle", self:GetPos() + self:GetUp()) --puts a circle centered at current location
			self:setNetVar("turnOverIcon", nil)
		end
	
		--self:restoreAP()

		local buffs = self:getBuffs() or {}
		for buffID, buff in pairs(buffs) do
			if(buff.func) then
			
			end
		
			if(buff.dmg) then --damaging spells
				local dmgT = buff.dmgT or "Blunt"
				local dmg = self:receiveDamage(buff.dmg, dmgT) --gets the damage based on their resistances
				self:addHP(dmg * -1) --reduce their hp by the dmg
				
				nut.chat.send(self, "turnchat", "You have taken " ..buff.dmg.. " {" ..dmgT.. "} damage from " ..(buff.name or "Unknown").. ".")
				--nut.plugin.list["chatboxextra"]:ChatboxSend(self, "turnchat", "You have taken " ..dmg.. " {" ..dmgT.. "} damage from " ..(buff.name or "Unknown").. ".")
			end
			
			if(buff.dmgP) then --damaging spells
				local dmgT = buff.dmgT or "Blunt"
				
				local dmg = self:receiveDamage(buff.dmgP * self:getMaxHP(), dmgT) --gets the damage based on their resistances
				self:addHP(dmg * -1) --reduce their hp by the dmg
				
				nut.chat.send(self, "turnchat", "You have taken " ..buff.dmg.. " {" ..dmgT.. "} damage from " ..(buff.name or "Unknown").. ".")
				--nut.plugin.list["chatboxextra"]:ChatboxSend(self, "turnchat", "You have taken " ..dmg.. " {" ..dmgT.. "} damage from " ..(buff.name or "Unknown").. ".")
			end

			if(buff.duration and tonumber(buff.duration)) then --counts down the duration
				local duration = tonumber(buff.duration)
				if(duration <= 0) then
					self:removeBuff(buff, buff.uid)
					
					if(self:IsPlayer()) then
						nut.chat.send(self, "turnchat", (buff.name or "Unknown").. " has worn off.")
					end
					--nut.plugin.list["chatboxextra"]:ChatboxSend(self, "turnchat", (buff.name or "Unknown").. " has worn off.")
				else
					if(self:IsPlayer()) then
						nut.chat.send(self, "turnchat", "You are affected by " ..(buff.name or "Unknown").. " for " ..(buff.duration or "Unknown").. " more turns.")
					end
					--nut.plugin.list["chatboxextra"]:ChatboxSend(self, "turnchat", "You are affected by " ..(buff.name or "Unknown").. " for " ..(buff.duration or "Unknown").. " more turns.")
					
					buff.duration = duration - 1
					
					local netBuff = {
						uid = buff.uid,
						name = buff.name,
						duration = buff.duration,
					}
					
					local JSONTbl = util.TableToJSON(netBuff)
					
					--local turnPlayers = {}
					--for k, v in pairs(turnPlayers) do
						nut.plugin.list["combat"]:buffNetworkAll(self, self, JSONTbl, buffID)
					--end
				end
			end
		end	
		
		local cooldowns = self:getCooldowns() or {}
		for spell, duration in pairs(cooldowns) do
			duration = duration - 1
		
			if(duration <= 0) then
				self:removeCooldown(spell)
			else
				cooldowns[spell] = duration

				nut.plugin.list["combat"]:cdNetworkAll(self, spell, duration)
			end
		end
		
		local AI = self:getTurnAI()
		if(AI) then
			local tree = PLUGIN.AITree[AI]

			if(tree) then
				local turnData = self:getTurnData()

				tree.turnProcess(self, turnData)
			end
		end
	
		if(turn) then
			if(self:IsPlayer()) then
				nut.chat.send(self, "turnchat", "Turn Change: " ..turn.. "'s turns. (YOU)")
			end
			
			--nut.plugin.list["chatboxextra"]:ChatboxSend(self, "turnchat", "Turn Change: " ..turn.. "'s turns. (YOU)")
		end
	else
		self:setNetVar("showAPCircle", nil)
		self:setNetVar("turnOverIcon", nil)
	
		if(turn) then
			if(self:IsPlayer()) then
				nut.chat.send(self, "turnchat", "Turn Change: " ..turn.. "'s turns.")
			end
			--nut.plugin.list["chatboxextra"]:ChatboxSend(self, "turnchat", "Turn Change: " ..turn.. "'s turns.")
		end
	end
end

if(SERVER) then
	netstream.Hook("nut_CSwepEndTurn", function(client)
		local turnOver = client:getNetVar("turnOverIcon")
		if(!turnOver) then
			client:setNetVar("turnOverIcon", true)
		else
			client:setNetVar("turnOverIcon", nil)
		end
	end)
end

nut.command.add("turnpass", {
	onRun = function(client, arguments)	
		client:turnProcess(nil, true)
	end
})

nut.command.add("centturnpass", {
	adminOnly = true,
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:turnProcess(nil, true)
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centaitest", {
	adminOnly = true,
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:setNetVar("TurnAI", "melee")
			
			client:notify("AI set to melee.")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("apcircle", {
	onRun = function(client, arguments)	
		local apCircle = client:getNetVar("showAPCircle", nil)
		
		if(apCircle) then
			client:setNetVar("showAPCircle", nil)
		else
			client:setNetVar("showAPCircle", client:GetPos() + client:GetUp())
		end
	end
})

nut.command.add("endturn", {
	onRun = function(client, arguments)	
		local turnOver = client:getNetVar("turnOverIcon", nil)
		
		if(turnOver) then
			client:setNetVar("turnOverIcon", nil)
		else
			client:setNetVar("turnOverIcon", true)
		end
	end
})

--debug function
nut.command.add("endturnall", {
	adminOnly = true,
	onRun = function(client, arguments)	
		for k, v in ipairs(player.GetAll()) do
			v:setNetVar("turnOverIcon", true)
		end
	end
})

nut.command.add("turnnext", {
	adminOnly = true,
	onRun = function(client, arguments)	
		local turnID = client:getTurnID()
		
		if(turnID) then
			local team = PLUGIN:turnAdvance(turnID)
			
			if(team) then
				client:notify(team.. "'s turn.")
			end
		end
	end
})

nut.command.add("turnmenu", {
	onRun = function(client, arguments)	
		netstream.Start(client, "nut_turnOpen")
	end
})

--chattype for turn changing messages
nut.chat.register("turnchat", {
	onChatAdd = function(speaker, text)
		chat.AddText(Color(150,75,75), text)
	end,
	filter = "actions",
	font = "nutChatFontCombat",
	onCanHear = 1,
	deadCanChat = true
})

--various networking hooks
if(SERVER) then
	netstream.Hook("nut_turnCreate", function(client, id, data)
		--only admins can create turns
		if(client:IsAdmin()) then
			PLUGIN:turnCreate(id, data)
		end
		
		PLUGIN:turnSyncByID(client, id)
	end)
	
	netstream.Hook("nut_turnClear", function(client, turnID)
		--only admins can create turns
		if(client:IsAdmin()) then
			--clear their cooldowns first
			if(PLUGIN.turns[turnID]) then
				local entities = PLUGIN.turns[turnID].entities

				for entity, v in pairs(entities) do
					entity:clearCooldowns()
					
					entity:setNetVar("turnOverIcon", nil)
				end
			end
		
			--clear all entities and controllers
			PLUGIN.turns[turnID].entities = {}
			PLUGIN.turns[turnID].controllers = {}
			
			PLUGIN:turnSyncByID(client, turnID)
		end
	end)
	
	netstream.Hook("nut_turnCDReset", function(client, turnID)
		--only admins can create turns
		if(client:IsAdmin() and PLUGIN.turns[turnID]) then
			local entities = PLUGIN.turns[turnID].entities
		
			for entity, v in pairs(entities) do
				entity:clearCooldowns()
			end
			
			client:notify("Cooldowns reset.")
		end
	end)
	
	netstream.Hook("nut_turnSwepAdd", function(client, swep, orderID, teamID)
		if(!IsValid(swep)) then return end
	
		local selected = swep.selected
		if(!selected) then return end
		
		for entity, _ in pairs(selected) do
			PLUGIN:turnAdd(orderID, entity, teamID)
		end
	end)
	
	netstream.Hook("nut_turnJoin", function(client, id, entity, team)
		--only admins can add things other than self to combats
		if(client != entity and !client:IsAdmin()) then return end
	
		PLUGIN:turnAdd(id, entity, team)
		
		PLUGIN:turnSyncByID(client, id)
	end)
	
	netstream.Hook("nut_turnLeave", function(client, id, entity)
		--only admins can remove things other than self from combats
		if(client != entity and !client:IsAdmin()) then return end
	
		PLUGIN:turnRemove(id, entity)
		
		PLUGIN:turnSyncByID(client, id)
	end)
	
	netstream.Hook("nut_turnControlJoin", function(client, id, entity, team)
		--only admins can add things other than self to combats
		if(client != entity and !client:IsAdmin()) then return end
	
		PLUGIN:turnControlAdd(id, entity, team)
		
		PLUGIN:turnSyncAll(client)
	end)
	
	netstream.Hook("nut_turnControlLeave", function(client, id, entity, team)
		--only admins can remove things other than self from combats
		if(client != entity and !client:IsAdmin()) then return end
	
		PLUGIN:turnControlRemove(id, entity)
		
		PLUGIN:turnSyncAll(client)
	end)
	
	netstream.Hook("nut_turnNext", function(client, turnID, entity)
		local team = PLUGIN:turnAdvance(turnID)
		
		if(team) then
			client:notify(team.. "'s turn.")
		end
	end)
	
	netstream.Hook("nut_turnAISet", function(client, entity, id)
		if(istable(entity)) then
			for k, subEntity in pairs(entity) do
				if(IsValid(subEntity) and subEntity.combat) then
					subEntity:setNetVar("TurnAI", id)
				end
			end
		else
			if(IsValid(entity) and entity.combat) then
				entity:setNetVar("TurnAI", id)
			end
		end
	end)
	
	netstream.Hook("nut_turnDeathSet", function(client, entity, state)
		if(istable(entity)) then
			for k, subEntity in pairs(entity) do
				if(IsValid(subEntity) and subEntity.combat) then
					subEntity:setNetVar("autodeath", state)
				end
			end
		else
			if(IsValid(entity) and entity.combat) then
				entity:setNetVar("autodeath", state)
			end
		end
	end)
else
	netstream.Hook("nut_turnSyncID", function(id, data)
		if(id and data) then
			PLUGIN.turns[id] = data
		end
		
		if(IsValid(nut.gui.turnList)) then
			nut.gui.turnList:Refresh()
		end
	end)
	
	netstream.Hook("nut_turnSyncAll", function(data)
		PLUGIN.turns = data

		if(IsValid(nut.gui.turnList)) then
			nut.gui.turnList:Refresh()
		end
	end)
	
	netstream.Hook("nut_turnOpen", function()
		local client = LocalPlayer()
		
		local turnList = vgui.Create("nutTurnList")
			
		local turnID = client:getTurnID()
		if(turnID) then
			turnList.turnID = turnID
			turnList:Refresh()
		end
	end)
end

if CLIENT then
	local matWhite = Material("models/debug/debugwhite")
	matWhite:SetVector( "$color", Vector(0,1,0) )

	local function drawTurnDone()
		local textPosX = 0
		local textPosY = 0
	
		local text = "READY"
		
		surface.SetFont("nutChatFontCombat")
	
		local textSizeX, textSizeY = surface.GetTextSize(text)
		
		surface.SetTextColor(0, 255, 0)
		surface.SetTextPos(textPosX-textSizeX*0.5, textPosY-textSizeY*0.5) 
		surface.DrawText(text)
	end

	function PLUGIN:PostDrawOpaqueRenderables()
		local client = LocalPlayer()
		
		local circlePos = client:getNetVar("showAPCircle")
		if (circlePos) then
			local selected = client:getNetVar("APCircleEnt", client)
			if(!IsValid(selected)) then 
				selected = client 
			end

			circlePos.z = selected:GetPos().z+15
		
			local circleRad = (400)
			local circleRad2 = (160000) --squared circle rad, so we dont have to call :Distance() (expensive)
			local circleRad3 = (1000000) --squared, 2.5x circle rad
		
			local dist = client:GetPos():DistToSqr(circlePos)
			if(dist > circleRad3) then
				render.DrawLine(circlePos, client:GetPos()+Vector(0,0,40), Color(255,0,0))
			elseif(dist > circleRad2) then
				render.DrawLine(circlePos, client:GetPos()+Vector(0,0,40), Color(0,128,0))
			else
				render.DrawLine(circlePos, client:GetPos()+Vector(0,0,40), Color(0,255,0))
			end
			
			render.DrawLine(circlePos, circlePos+Vector(0,0,80), Color(255,255,255))

			circlePos = circlePos + Vector(0,0,42.5)
			
			cam.Start3D2D(circlePos,Angle(0,0,0),1)
				surface.DrawCircle(0,0,circleRad*1,255,55,55,255)
				surface.DrawCircle(0,0,circleRad*2.5,255,255,255,255)
			cam.End3D2D()
		end
		
		--if(client:IsAdmin()) then
			for k, v in ipairs(player.GetAll()) do
				if(v == client) then continue end

				local turnOverIcon = v:getNetVar("turnOverIcon")
				if (turnOverIcon) then
					local position = v:GetPos()+v:GetUp()*80
					local angles = v.turnOverAngle or v:GetAngles()
					
					v.turnOverAngle = angles+(Angle(0,0.1,0))
					if(v.turnOverAngle.y >= 360) then
						v.turnOverAngle.y = 0
					end
					
					angles:RotateAroundAxis(angles:Forward(), 90)
					angles:RotateAroundAxis(angles:Right(), 270)

					cam.Start3D2D(position,angles,1)
						drawTurnDone()
					cam.End3D2D()
					
					cam.Start3D2D(position,angles+Angle(0,180,0),1)
						drawTurnDone(180)
					cam.End3D2D()
				end
			end
		--end
		
		--highlights selected entities by drawing a green stencil on them
		if(client.highlightEnts) then
			render.SetStencilWriteMask(1)
			render.SetStencilTestMask(1)
			render.ClearStencil()
			render.SetStencilEnable(true)
			render.SetStencilFailOperation(STENCIL_REPLACE)
			render.SetStencilPassOperation(STENCIL_REPLACE)
			render.SetStencilZFailOperation(STENCIL_REPLACE)
			render.SetStencilCompareFunction(STENCIL_ALWAYS)
			render.SetStencilReferenceValue(1)

			for entity, v in pairs(client.highlightEnts) do
				if(!IsValid(entity)) then continue end
				
				entity:DrawModel()
			end

			render.SetStencilCompareFunction(STENCIL_EQUAL)
			render.SetStencilReferenceValue(1)
			render.SetMaterial(matWhite)
			render.DrawScreenQuad()

			render.SetStencilEnable(false)
		end
	end
end