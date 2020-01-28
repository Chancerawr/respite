ENT.Type = "nextbot"
ENT.PrintName = "Combat Base"
ENT.Category = "NutScript"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.combat = true
ENT.AutomaticFrameAdvance = true
ENT.model = "models/tnb/citizens/male_04.mdl"

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

function ENT:Initialize()
	self.name = "Plastic"
	self:basicSetup()
	if(SERVER) then
		self:SetMaterial("phoenix_storms/mrref2")
	end
end

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:basicSetup()
	self:SetRenderMode(RENDERMODE_TRANSALPHA)

	if (SERVER) then
		self.inv = {}
	
		self.attribs = self.savedAttribs or self.attribs or {}
	
		self:SetModel(self.savedModel or self.model)
		self:SetMaterial(self.savedMat or self:GetMaterial())
		self:SetUseType(SIMPLE_USE)
		self:SetMoveType(MOVETYPE_NONE)
		self:DrawShadow(true)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetSolid(SOLID_BBOX)

		self:DropToFloor()
		
		self:setNetVar("name", self:getNetVar("name", self.name or self.PrintName))
		self:setNetVar("desc", self:getNetVar("desc", self.desc or ""))

		local physObj = self:GetPhysicsObject()
		
		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
			physObj:EnableGravity(false)
			--physObj:Sleep()
			physObj:EnableCollisions(false)
		end
	end

	self:SetCollisionBounds(Vector(-30,-30,0), Vector(30,30,100))
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

	saveData.model = self:GetModel()
	saveData.mat = self:GetMaterial()
	saveData.attribs = self.attribs
	saveData.anim = self:GetSequence()
	
	return saveData
end

function ENT:Think()
	if(SERVER) then
		if(!self:IsPlayerHolding()) then
			local physObj = self:GetPhysicsObject()
			
			if(IsValid(physObj) and !physObj:IsAsleep()) then
				physObj:Sleep()
			end
		end
		
		--this is really stupid but it was fun to mess around with
		if(self.desiredPos) then
			if(!self.prevAnim) then
				local tempAnim = self:GetSequence()
				if(tempAnim != self.walkAnim) then
					self.prevAnim = tempAnim
				end
			end
			
			local pos = self:GetPos()
			if((self.lerpRatio or 0) < 1) then
				self.originPos = self.originPos or pos
				self.lerpRate = self.lerpRate or (1/pos:Distance(self.desiredPos) * 20)
				self.lerpRatio = (self.lerpRatio or 0) + self.lerpRate

				local newPos = LerpVector(self.lerpRatio, self.originPos, self.desiredPos)
				if((self.lerpRatio or 0) >= 1) then
					self:SetPos(self.desiredPos)
				else
					self:SetPos(newPos)
				end
			else
				self.desiredPos = nil
				self.originPos = nil
				self.lerpRatio = nil
				self.lerpRate = nil
				
				if(self.prevAnim) then
					timer.Simple(3, function()
						self:ResetSequence(self.prevAnim)
					end)
				elseif(self.idle) then
					timer.Simple(3, function()
						self:ResetSequence(self.idle)
					end)
				else
					local newAct = self:SelectWeightedSequence(ACT_IDLE, 0)
					if(newAct != -1 and newAct != self.walkAnim) then
						timer.Simple(3, function()
							self:ResetSequence(newAct)
						end)
					end
				end
			end
		end
	end
end

function ENT:walkAnims()
	local newAct = self:SelectWeightedSequence(ACT_RUN)
	if(newAct == -1) then
		newAct = self:SelectWeightedSequence(ACT_WALK)
	end	
	
	if(newAct == -1) then
		newAct = self:SelectWeightedSequence(ACT_HL2MP_RUN_FAST)
	end	
	
	if(newAct == -1) then
		newAct = self:SelectWeightedSequence(ACT_HL2MP_WALK)
	end
	
	if(newAct != -1) then
		self.walkAnim = newAct

		self:ResetSequence(newAct)
		self:SetPoseParameter("move_x", 1)
	end
end

function ENT:setAnim()
	local anim = self.savedAnim
	if(anim) then
		timer.Simple(30, function()
			self:ResetSequence(anim)
		end)
		
		for k, v in ipairs(self:GetSequenceList()) do
			if (v:lower():find("idle") and v != "idlenoise") then
				self.idle = k
				return
			end
		end
		
		self.idle = 4
	else
		for k, v in ipairs(self:GetSequenceList()) do
			if (v:lower():find("idle") and v != "idlenoise") then
				self.idle = k
				return self:ResetSequence(k)
			end
		end

		self.idle = 4
		self:ResetSequence(4)
	end
end

function ENT:runCombat(client, attr, debuff, msg, category, command)
	self:combatRoll(client, attr, debuff, msg, category, command)
end

local function critModify(client, command) --ran when crits are computed
	local char = client:getChar()

	local base = char:getAttrib("luck") + 10 --base chance of crit ((luck + 10) / 1000
	local multi = 1.5 + char:getAttrib("luck")/25 --base crit multiplier
	
	local charTraits = char:getData("traits", {}) --the traits the character has
	if(charTraits) then 
		for k, v in pairs(charTraits) do --go through all of char's traits
			local traitData = traits[k] --the actual info of the trait
			if(traitData.critChance) then --if the trait has a modifier for this command
				base = base * traitData.critChance --modify it
			end			
			if(traitData.critMulti) then --if the trait has a modifier for this command
				multi = multi * traitData.critMulti --modify it
			end
		end
	end
	
	return base, multi
end
	
function ENT:runCMD(client, command, extra)
	if(self:rollHandle(client, command)) then
		return true
	else
		return false
	end
end
	
function ENT:critCalc()
	local crit = math.random(1, 1000)
	local critmsg = ""
	
	local luck = self.attribs["luck"]
	
	if (crit <= (luck * 2 + 15)) then
		crit = (1.5 + luck * 0.04)
		critmsg = " (Crit!)"
	else
		if(math.random(1,100) <= 3) then
			crit = 0
			critmsg = "(Fail!)"
		else
			crit = 1
		end
	end
	
	return crit, critmsg
end

--calculates a roll
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

--calculates rolls for most basic rolling commands.
function ENT:combatRoll(client, attr, debuff, msg, category, command, noPrint) --this is way too many parameters, it's killing me.
	local crit = math.random(1, 1000)
	local critmsg = ""
	
	local luck = self.attribs["luck"] or 0
	
	if (crit <= (luck + 10)) then
		crit = (1.5 + luck * 0.04)
		critmsg = " (Crit!)"
	else
		if(math.random(1,100) <= 5) then
			crit = 0
			critmsg = "(Fail!)"
		else
			crit = 1
		end
	end

	local rolled = math.abs(attr + math.random(-10,10)) * crit
	rolled = rolled * debuff --reduction for command
	
	rolled = math.Round(rolled, 3)
	
	--rolled = traitModify(client, command, rolled)
	
	if(!noPrint) then
		nut.chat.send(client, "react_npc", "has rolled " .. rolled .. critmsg .. " for " .. msg)
	end
	
	return rolled
end

--reaction to a command aimed at the ent
function ENT:reaction(client, rolls, category, attackString, part)
	for k, rollA in pairs(rolls) do
		local dodge = (self.attribs["stm"] or 0) * 0.35 + (self.attribs["perception"] or 0) * 0.2
		local block = (self.attribs["end"] or 0) * 0.3 + (self.attribs["str"] or 0) * 0.2

		if(part) then
			part = nut.plugin.list["combat"]:getRandomBpart()
		end
		
		local firearms
		if(category == "firearms") then
			firearms = true
		end
		
		--basically this determines whether it chooses the worst or best roll given its stats.
		local smart = math.Round(math.Clamp((self.attribs["perception"] or 0) + math.abs(dodge - block)*2, 0, 100))
		if(math.random(smart, 100) > 50) then
			smart = true
		else
			smart = false
		end
		
		--decides whether the roll is a block or a dodge.
		local roll, evade
		if(firearms) then
			roll, evade = self:combatRoll(client, dodge, 0.8, "a dodge/miss.", "react", "dodge", true), true
		else
			roll, evade = self:rollCheck(smart, dodge, block)
		end
		
		rollA = math.Round(rollA, 3) --this shouldn't need to be here but it is anyways
		
		if(rollA > roll) then	
			if(part) then --unblockable attack with body part
				self:messagePrint(client, rollA, roll, attackString, true, part)
			else
				self:messagePrint(client, rollA, roll, attackString, true)
			end
		else
			if(part) then
				self:messagePrint(client, rollA, roll, attackString, false, part)
			elseif(evade) then
				self:messagePrint(client, rollA, roll, attackString, false, 0)
			else
				self:messagePrint(client, rollA, roll, attackString, false, 1)
			end
		end
	end
end

--this is temporary and it sucks
local def = {
	[0] = "dodged",
	[1] = "blocked"
}

--prints a message
function ENT:messagePrint(client, rollC, rollE, action, success, part)
	rollC = math.Round(rollC, 4)
	local fullString = ""
	
	--detects the currently held weapon and (hopefully) the item it's associated with
	local weapon = ""
	local curWeapon = client:GetActiveWeapon()
	if(curWeapon:GetClass() != "nut_hands" and curWeapon != "nut_keys") then
		local items = client:getChar():getInv():getItems()
		for k, v in pairs(items) do
			if(v.isWeapon and curWeapon:GetClass() == v.class and v:getData("equip", nil)) then
				if(v.weaponCategory == "melee") then
					weapon = " (" ..v:getName().. ")"
				else
					weapon = " (" ..v:getName().. ")" .. " ["..curWeapon:Clip1().. "|" ..curWeapon:GetMaxClip1().. "]"
				end
			end
		end
	end
	
	local graze
	if(math.random(1,10) > 7) then
		graze = true
	end
	
	if(success) then
		self:setNetVar("hit", self:getNetVar("hit", 0) + 1)
	
		if(isstring(part)) then
			fullString = client:GetName() .. "'s " ..action.. " hits " ..self:getNetVar("name", "John Doe").. "'s " ..part.. ". (" ..rollC .." | "..rollE .. ")" .. weapon
			
			--bob's shot flies at joe's left leg and hits.
		else
			fullString = client:GetName().. "'s " ..action.. " on " ..self:getNetVar("name", "John Doe") .. " was successful. (" ..rollC .." | "..rollE .. ")" .. weapon
			
			--"bob's melee attack on joe was successful"
		end
		
		nut.log.addRaw(fullString, 1)
		nut.chat.send(client, "react_success", fullString)
	else
		if(isstring(part)) then
			if(!graze) then
				fullString = client:GetName().. "'s " ..action.. " misses " ..self:getNetVar("name", "John Doe").. "'s " ..part.. ". (" ..rollC .." | "..rollE .. ")" .. weapon
				
				--bob's action misses name's part.
			else				
				fullString = client:GetName().. "'s " ..action.. " grazes " ..self:getNetVar("name", "John Doe").. "'s " ..part.. ". (" ..rollC.. " | " ..rollE.. ")" ..weapon
				
				--bob's action grazes name's part
			end
		else
			if(!graze) then
				fullString = self:getNetVar("name", "John Doe") .. " has " ..def[part].. " " ..client:GetName().. "'s " ..action..".(" ..rollC .." | "..rollE .. ")" .. weapon

				--joe has dodged/blocked bob's action.
			else
				fullString = client:GetName().. "'s " ..action.. " grazes " ..self:getNetVar("name", "John Doe").. ". (" ..rollC .. " | " ..rollE.. ")" ..weapon
				
				--bob's action grazes name.
			end
		end
		
		if(!graze) then
			nut.log.addRaw(fullString, 3)
			nut.chat.send(client, "react_fail", fullString)
		else
			self:setNetVar("hit", self:getNetVar("hit", 0) + 1)
			
			nut.log.addRaw(fullString, 6)
			nut.chat.send(client, "graze_npc", fullString)
		end
	end
end

--determines which roll it uses as a response.
function ENT:rollCheck(smart, dodge, block)
	if(smart) then --choose the best roll
		if(dodge > block) then
			return self:combatRoll(client, dodge, 0.8, "a dodge/miss.", "react", "dodge", true), true
		else
			return self:combatRoll(client, block, 0.8, "a block attempt.", "react", "block", true), false
		end
	else --choose the worse roll
		if(dodge > block) then
			return self:combatRoll(client, block, 0.8, "a block attempt.", "react", "block", true), false
		else
			return self:combatRoll(client, dodge, 0.8, "a dodge/miss.", "react", "dodge", true), true
		end
	end
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
		end
			
		if (self:IsOnFire()) then --if the npc is on fire, set the ragdoll on fire too.
			ragdoll:Ignite(10,20)
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

--fortitude attacks
function ENT:fortAttack(attackName)
	--these rolls cannot crit
	local rolled = (((self.attribs["fortitude"] or 0) * 0.6) + math.random(-10, 10))
	rolled = math.abs(rolled)-- this is probably bad
	
	--rolled = traitModify(client, "fortattack", rolled) --trait modifier
	
	local ability = {
		confusion = 0,
		nostalgia = 0,
		panic = 0,
		headache = 0,
		whisper = 0,
		echo = 0,

		phase = 0.05,
		simple_weapon = 0.05,
		blight = 0.05,
		blight_blast = 0.05,
		blight_suicide = 0.05,
		direct = 0.05,

		hallucination = 0.1,
		suggestion = 0.1,
		migraine = 0.1,
		insanity = 0.1,
		enrage = 0.1,
		emotion = 0.1,
		sensory = 0.1,
		telekinesis = 0.1,
		conjure_firearm = 0.1,
		blight_chains = 0.1,
		blight_shockwave = 0.1,
		shadow_meld = 0.1,
		open_portal = 0.1,

		paralyze = 0.2,
		sleep = 0.2,
		illusions = 0.2,
		cloak = 0.2,
		teleport = 0.2,
		temperature = 0.2,
		lesser_shade = 0.2,
		darkness = 0.2,
		conjure_special = 0.2,
		
		betray = 0.4,
		regenerate = 0.4,
		smokescreen = 0.4,
		minor_shade = 0.4,
		lights_out = 0.4,
		possession = 0.4,
		haze = 0.4,
		open_respite = 0.4,

		reality_bend = 0.75,
		moderate_shade = 0.75,
		time_reversal = 0.75,
		shadow_plague = 0.75
	}
	
	local fancyStr = attackName
	
	if(ability[attackName]) then
		local fancyStr = attackName
		fancyStr = string.gsub(fancyStr, "_", " ") --replaces _ with a space.
		fancyStr = string.upper(fancyStr) --capitalizes all of it
		fancyStr = "'" .. fancyStr .. "'" --puts apostrophes around it i guess
		fancyStr = self:getNetVar("name", "CEnt").. " has attempted to use an ability: " ..fancyStr
		
		rolled = tonumber(rolled) * (1 - tonumber(ability[attackName]))
		rolled = fancyStr.. ", and rolled " ..rolled.. "."
	else
		return false
	end
	
	--Bob has attempted to use an ability: genital strike, and rolled 69
	nut.log.addRaw(rolled, 2)
	--nut.chat.send(client, "fortattack", rolled)
	nut.chat.send(self, "fort_npc", rolled)
end

function ENT:Name()
	return self:getNetVar("name", self.name or self.PrintName)
end

function ENT:Desc()
	return self:getNetVar("desc", self.desc)
end

function ENT:getActions()
	local actions = {}

	if(CMBT.commands) then
		for k, command in pairs(CMBT.commands) do
			actions[#actions + 1] = {
				name = command.name or "Unnamed Action",
				--func = PLUGIN.attack,
				special = command.uid,
			}
		end
	end

	return actions
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