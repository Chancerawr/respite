local PLUGIN = PLUGIN

nut.util.include("sh_anim.lua")

ENT.Type = "nextbot"
ENT.Base = "base_nextbot"
ENT.PrintName = "Combat Base"
ENT.Category = "NutScript"
ENT.Spawnable = false
ENT.AdminOnly = true
ENT.combat = true

ENT.model = "models/Humans/Group01/male_02.mdl"

--ENT.name = "Bob"

--[[
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 0,
	["medical"] = 0,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}
--]]

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

--ENT.material = "phoenix_storms/mrref2"

function ENT:Initialize()
	self:basicSetup()
end

--this is just here because it's a nextbot
function ENT:RunBehaviour()
	while (true) do
		coroutine.wait(60)
		
		coroutine.yield()
	end
end

function ENT:basicSetup()
	self:SetRenderMode(RENDERMODE_TRANSALPHA)

	if (SERVER) then
		local model
		if(self.models) then
			model = table.Random(self.models)
		else
			model = self.model
		end

		self.attribs = self.savedAttribs or self.attribs or {}
	
		self:SetModel(self.savedModel or model)
		self:SetMaterial(self.savedMat or self.material or self:GetMaterial())
		self:SetColor(self.color)
		
		self:SetUseType(SIMPLE_USE)
		--self:SetMoveType(MOVETYPE_STEP)
		self:DrawShadow(true)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetSolid(SOLID_BBOX)

		if(!self.saveKey) then
			self:DropToFloor()
		end
		
		self:setNetVar("name", self:getNetVar("name", self.name or self.PrintName))
		self:setNetVar("desc", self:getNetVar("desc", self.desc or ""))

		local physObj = self:GetPhysicsObject()
		
		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
			physObj:EnableGravity(false)
			--physObj:Sleep()
			physObj:EnableCollisions(false)
		end
		
		if(self.loco) then
			self.loco:SetAcceleration(900)
			self.loco:SetDeceleration(100000)
			self.loco:SetGravity(0)
			
			self:SetGravity(0)
		end
		
		self.inv = {}
	end

	self:SetCollisionBounds(Vector(-20,-20,0), Vector(20,20,100))
	self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	
	timer.Simple(0.5, function()
		if (IsValid(self)) then
			self:setAnim()
		end
	end)
end

function ENT:getSaveData()
	local saveData = {}
	saveData.name = self:getNetVar("name")
	saveData.desc = self:getNetVar("desc")
	saveData.hp = self:getNetVar("hp")
	saveData.hpMax = self:getNetVar("hpMax")
	--saveData.mp = self:getNetVar("mp")
	--saveData.mpMax = self:getNetVar("mpMax")
	saveData.dmg = self:getNetVar("dmg")
	saveData.dmgT = self:getNetVar("dmgT")
	saveData.model = self:GetModel()
	saveData.mat = self:GetMaterial()
	saveData.attribs = self.attribs
	saveData.res = self.res
	saveData.anim = self:GetSequence()
	
	saveData.bodygroups = {
		self:GetBodygroup(1),
		self:GetBodygroup(2),
		self:GetBodygroup(3),
		self:GetBodygroup(4),
		self:GetBodygroup(5),
		self:GetBodygroup(6),
		self:GetBodygroup(7),
		self:GetBodygroup(8),
		self:GetBodygroup(9),
	}
	
	return saveData
end

function ENT:Think()
	self:CustomThink()

	if(SERVER) then	
		if(self:IsPlayerHolding()) then
			--if held with physgun while moving, will teleport to end when hold ends
			if(self.desiredPos) then 
				self.nudged = true
			end
		else
			local physObj = self:GetPhysicsObject()
			
			if(IsValid(physObj) and !physObj:IsAsleep()) then
				physObj:Sleep()
			end
			
			--if held with physgun while moving, will teleport to end when hold ends
			if(self.nudged) then
				self:SetPos(self.desiredPos)
				self.desiredPos = nil
				self.nudged = nil
				
				self:resetAnim()
			end
			
			if(!self.desiredPos) then
				self.loco:SetVelocity(Vector(0,0,0))
			elseif(self.desiredPos and !self.loco:IsOnGround()) then --basically they drift off into the sunset if you dont do this
				self:SetPos(self.desiredPos)
				self.desiredPos = nil
				
				self:resetAnim()
			end
		end
		
		if(self.desiredPos) then
			self.loco:Approach(self.desiredPos, 1)
			
			local stuck = self.loco:IsStuck()
			
			if(self:GetRangeSquaredTo(self.desiredPos) < 128 or stuck) then
				self.loco:SetVelocity(Vector(0,0,0))

				self:SetPos(self.desiredPos)
				
				self.desiredPos = nil
				
				self:resetAnim()
			end
		end

		if(IsValid(self.follow) and !self.desiredPos and !(self.follow and self.follow:InVehicle())) then
			local followPos = self.follow:GetPos() + self.follow:GetRight() * -50
		
			local range = self:GetRangeSquaredTo(followPos)
		
			if(range > 32768 and !stuck) then
				self:movementStart(followPos)
			
				self.desiredPos2 = followPos
			elseif((self.desiredPos2 and range < 256) or stuck) then
				self.loco:SetVelocity(Vector(0,0,0))

				self:SetPos(followPos)
				
				self.desiredPos2 = nil
				
				self:resetAnim()
			end
			
			if(self.desiredPos2) then
				self.loco:Approach(followPos, 1)
			end
		end
	end
end

function ENT:CustomThink()

end

function ENT:HandleStuck()

end


--death
function ENT:die()
	if(!self.noRag) then
		local ragdoll = ents.Create("prop_ragdoll")
		if ragdoll:IsValid() then 
			ragdoll:SetPos(self:GetPos())
			ragdoll:SetModel(self:GetModel())
			ragdoll:SetAngles(self:GetAngles())
			ragdoll:Spawn()
			ragdoll:SetSkin(self:GetSkin())
			ragdoll:SetColor(self:GetColor())
			ragdoll:SetMaterial(self:GetMaterial())
			ragdoll:SetBloodColor(self:GetBloodColor())
				
			local num = ragdoll:GetPhysicsObjectCount()-1
	   
			for i=0, num do
				local bone = ragdoll:GetPhysicsObjectNum(i)

				if IsValid(bone) then
					local bp, ba = self:GetBonePosition(ragdoll:TranslatePhysBoneToBone(i))
					if bp and ba then
						bone:SetPos(bp)
						bone:SetAngles(ba)
					end
				end
			end
				
			--I hate this
			ragdoll:SetBodygroup(1, self:GetBodygroup(1))
			ragdoll:SetBodygroup(2, self:GetBodygroup(2))
			ragdoll:SetBodygroup(3, self:GetBodygroup(3))
			ragdoll:SetBodygroup(4, self:GetBodygroup(4))
			ragdoll:SetBodygroup(5, self:GetBodygroup(5))
			ragdoll:SetBodygroup(6, self:GetBodygroup(6))
			
			ragdoll:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
			
			if (self:IsOnFire()) then --if the npc is on fire, set the ragdoll on fire too.
				ragdoll:Ignite(10,20)
			end
			
			ragdoll.hasMenu = true
		end
	
		--gets rid of ragdolls that dont have phys objects, just a cautionary thing.
		if(!IsValid(ragdoll:GetPhysicsObject())) then
			SafeRemoveEntity(ragdoll)
		end		
	end
	
	if(self.inv) then
		for k, v in pairs(self.inv) do
			nut.item.spawn(v, self:GetPos())
		end
	end
	
	SafeRemoveEntity( self )
end

function ENT:movementStart(position)
	if(SERVER) then
		local tempEnt = ents.Create("info_particle_system")
		tempEnt:SetParent(self)
		tempEnt:SetPos(position)
		
		self:PointAtEntity(tempEnt)
		local angle = self:GetAngles()
		self:SetAngles(Angle(0, angle.y, 0))
		
		SafeRemoveEntity(tempEnt)
		
		self.desiredPos = position
		
		self:walkAnims(self:GetPos():Distance(position))
	end
end

--dont do anything
function ENT:OnTakeDamage(dmginfo)
end

--dont do it
function ENT:OnTraceAttack( dmginfo, dir, trace )
end

--no
function ENT:OnKilled( dmginfo )
end

--calculates a roll
--[[
function ENT:rollHandle(client, command, noPrint)
	--translates attribute names to the values the entity has, kind of shitty.
	local comTable = CMBT.commands[command] --the specific command's data
	
	if(!comTable) then return false end --if the command doesn't exist don't do shit
	
	local part
	local crit, critmsg = 1, ""
	
	--calculates the base attribute value to start from.
	local base = 0
	for k, v in pairs(comTable.stats) do
		base = base + (self.attribs[k] or 0) * v
	end
	
	if(base < 0) then
		base = 0
	end
	
	--generates 1 or more rolls based on command data
	local rolls = comTable.rolls(base, self.attribs)
	for k, roll in pairs(rolls) do --refines, prints, and logs the rolls.
		roll = roll * comTable.mult
		--roll = traitModify(client, command, roll)
		
		if(comTable.parts) then
			part = nut.plugin.list["combat"]:getRandomBpart()
		end
		
		if(!comTable.noCrit) then
			crit, critmsg = self:critCalc()
			roll = roll * crit
		end
		
		roll = math.Round(roll, 3)
		
		if(!noPrint) then
			if(!comTable.print) then
				if(!part) then
					nut.log.addRaw(self:getNetVar("name", "ENT").."(NPC)".." rolled \""..roll.."\".", 2)
					nut.chat.send(client, comTable.category.."_npc", self:getNetVar("name", "ENT").. " has rolled " ..roll..critmsg.. " for " ..comTable.attackString .. ".")
				else
					nut.log.addRaw(self:getNetVar("name", "ENT").."(NPC)".." has rolled \""..roll .." ".. part.."\".", 2)
					nut.chat.send(client, comTable.category.."_npc", self:getNetVar("name", "ENT").. " has rolled " ..roll..critmsg.. " for " ..comTable.attackString.. " at target's " ..part.. ".")
				end
			else
				comTable.print(self, roll, part, critmsg, npc)
			end
		end
	end
	
	return rolls --returns all the rolls
end
--]]

function ENT:Name()
	return self:getNetVar("name", self.name or self.PrintName)
end

function ENT:Desc()
	return self:getNetVar("desc", self.desc)
end

function ENT:getActions()
	local actions = {}

	if(ACTS) then
		--abilities from equipment
		--[[
		local itemActions = {}
		if(char:getInv()) then
			for k, v in pairs(char:getInv():getItems()) do
				if(v:getData("equip") and v.actions) then
					for _, action in pairs(v.actions) do
						itemActions[#itemActions+1] = {
							action = action, 
							itemID = item.id,
						}
					end
				end
			end
		end
		--]]
	
		for k, action in pairs(ACTS.actions) do
			if(action.hidden) then continue end
		
			--if the ability requires stat thresholds to use
			if(action.reqStats) then
				local reqStats = true
				for attrib, reqVal in pairs(action.reqStats) do
					if((self.attribs[attrib] or 0) < reqVal) then
						reqStats = false
					end
				end
				if(!reqStats) then continue end
			end
			
			actions[#actions + 1] = {
				uid = action.uid,
				name = action.name,
				category = action.category,
				notarget = action.notarg,
				radius = action.radius,
				cone = action.cone,
				cone2 = action.cone2,
				selfOnly = action.selfOnly,
				attackOverwrite = action.attackOverwrite,
				--weapon = (item and item.id) or false, --ID of the weapon
			}
		end
	end

	return actions
end

function ENT:getAttrib(attribID, default)
	local attrib = (self.attribs and self.attribs[attribID]) or default
	
	return attrib
end

-- Exists for ocnvenience
function ENT:getChar()
	return self
end

if (CLIENT) then
	function ENT:Draw()
		self:DrawModel()
	end

	local TEXT_OFFSET = Vector(0, 0, 0)
	local toScreen = FindMetaTable("Vector").ToScreen
	local colorAlpha = ColorAlpha
	local drawText = nut.util.drawText
	local configGet = nut.config.get

	ENT.DrawEntityInfo = true

	function ENT:onDrawEntityInfo(alpha)
		--local position = toScreen(self:LocalToWorld(self, self:WorldSpaceCenter(self)) + TEXT_OFFSET)
		local position = toScreen(self:WorldSpaceCenter(self))
		local x, y = position.x, position.y
		drawText(self:getNetVar("name", ""), x, y, colorAlpha(Color(190,50,50), alpha), 1, 1, nil, alpha * 0.65)

		if (self:getNetVar("desc")) then
			drawText(self:getNetVar("desc"), x, y + 16, colorAlpha(color_white, alpha), 1, 1, "nutEntDesc", alpha * 0.65)
		end
	end
end