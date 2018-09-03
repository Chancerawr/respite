ENT.Type = "anim"
ENT.PrintName = "Combat Base"
ENT.Category = "NutScript"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.combat = true

--all attributes
ENT.agil = 0
ENT.stre = 0
ENT.accu = 0
ENT.craf = 0
ENT.endu = 0
ENT.luck = 0
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	if (SERVER) then
		self:SetModel("models/tnb/citizens/male_04.mdl")
		self:SetMaterial("phoenix_storms/mrref2")
		self:SetUseType(SIMPLE_USE)
		self:SetMoveType(MOVETYPE_PUSH)
		self:DrawShadow(true)
		self:SetSolid(SOLID_BBOX)
		--self:PhysicsInit(SOLID_BBOX)

		self:setNetVar("name", "Plastic")
		self:setNetVar("desc", "")

		local physObj = self:GetPhysicsObject()

		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
			physObj:Sleep()
		end
	end

	timer.Simple(1, function()
		if (IsValid(self)) then
			self:setAnim()
		end
	end)
end

function ENT:setAnim()
	for k, v in ipairs(self:GetSequenceList()) do
		if (v:lower():find("idle") and v != "idlenoise") then
			return self:ResetSequence(k)
		end
	end

	self:ResetSequence(4)
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
	
function ENT:runCMD(client, command)
	if(self:rollHandle(client, command)) then
		return true
	else
		return false
	end
end
	
function ENT:critCalc()
	local crit = math.random(1, 1000)
	local critmsg = ""
	if (crit <= (self.luck + 10)) then
		crit = (1.5 + self.luck/25)
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

function ENT:rollHandle(client, command)
	--translates attribute names to the values the entity has, kind of shitty.
	local attribTrans = { 
		["stm"] = self.agil,
		["str"] = self.stre,
		["accuracy"] = self.accu,
		["medical"] = self.craf,
		["end"] = self.endu,
		["luck"] = self.luck,
		["perception"] = self.perc,
		["fortitude"] = self.fort
	}

	local comTable = CMBT.commands[command] --the specific command's data
	if(!comTable) then return false end --if the command doesn't exist don't do shit
	
	local part
	local crit, critmsg = 1, ""
	
	--calculates the base attribute value to start from.
	local base = 0
	for k, v in pairs(comTable.stats) do
		base = base + attribTrans[k] * v
	end
	
	if(base < 0) then
		base = 0
	end
	
	--generates 1 or more rolls based on command data
	local rolls = comTable.rolls(base, attribTrans)
	for k, roll in pairs(rolls) do --refines, prints, and logs the rolls.
		roll = roll * comTable.mult
		--roll = traitModify(client, command, roll)
		
		if(comTable.parts) then
			part = table.Random(bParts)
		end
		
		if(!comTable.noCrit) then
			crit, critmsg = self:critCalc()
			roll = roll * crit
		end
		
		if(!comTable.print) then
			if(!part) then
				nut.log.addRaw(self:getNetVar("name", "ENT").."(NPC)".." rolled \""..roll.."\".", 2)
				nut.chat.send(client, comTable.category.."_npc", self:getNetVar("name", "ENT").. " has rolled " ..roll..critmsg.. " for " ..comTable.attackString .. ".")
			else
				nut.log.addRaw(self:getNetVar("name", "ENT").."(NPC)".." has rolled \""..roll .." ".. part.."\".", 2)
				nut.chat.send(client, comTable.category.."_npc", self:getNetVar("name", "ENT").. " has rolled " ..roll..critmsg.. " for " ..comTable.attackString.. " at target's " ..part.. ".")
			end
		else
			comTable.print(rolls, part)
		end
	end
	
	return rolls --returns all the rolls
end

--calculates rolls for most basic rolling commands.
function ENT:combatRoll(client, attr, debuff, msg, category, command, noPrint) --this is way too many parameters, it's killing me.
	local crit = math.random(1, 1000)
	local critmsg = ""
	if (crit <= (self.luck + 10)) then
		crit = (1.5 + self.luck/25)
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
	
	--rolled = traitModify(client, command, rolled)
	
	--nut.log.addRaw(client:Name().." rolled \""..rolled.."\".", 2)
	if(!noPrint) then
		nut.chat.send(client, "react_npc", "has rolled " .. rolled .. critmsg .. " for " .. msg)
	end
	
	return rolled
end

function ENT:reaction(client, rolls, category, attackString, part)
	for k, rollA in pairs(rolls) do
		local dodge = self.agil * 0.5
		local block = (self.endu * 0.3) + (self.agil * 0.2)
		
		if(part) then
			part = table.Random(bParts)
		end
		
		local firearms
		if(category == "firearms") then
			firearms = true
		end
		
		--basically this determines whether it chooses the worst or best roll given its stats.
		local smart = math.Round(math.Clamp(self.perc + math.abs(dodge - block)*2, 0, 100))
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
		
		if(rollA > roll) then	
			if(firearms and part) then --unblockable attack with body part
				self:messagePrint(client, rollA, roll, attackString, true, part)
			else
				self:messagePrint(client, rollA, roll, attackString, true)
			end
		else
			if(firearms and part) then
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

function ENT:messagePrint(client, rollC, rollE, action, success, part)
	local fullString = ""
	
	--detects the currently held weapon and (hopefully) the item it's associated with
	local weapon = ""
	local curWeapon = client:GetActiveWeapon():GetClass()
	if(curWeapon != "nut_hands" and curWeapon != "nut_keys") then
		local items = client:getChar():getInv():getItems()
		for k, v in pairs(items) do
			if(v.base == "base_weapons" and curWeapon == v.class and v:getData("equip", nil)) then
				weapon = " (" ..v:getName().. ")"
			end
		end
	end
	
	if(success) then
		if(isstring(part)) then
			fullString = client:GetName() .. "'s " ..action.. " flies at " ..self:getNetVar("name", "John Doe").. "'s " ..part.. " and hits. (" ..rollC .." | "..rollE .. ")" .. weapon
			--bob's shot flies at joe's left leg and hits.
		else
			fullString = client:GetName().. "'s " ..action.. " on " ..self:getNetVar("name", "John Doe") .. " was successful. (" ..rollC .." | "..rollE .. ")" .. weapon
			--"bob's melee attack on joe was successful"
		end
		
		nut.chat.send(client, "react_success", fullString)
	else
		if(isstring(part)) then
			fullString = client:GetName() .. " misses a " ..action.. " at " ..self:getNetVar("name", "John Doe").. "'s " ..part.. ". (" ..rollC .." | "..rollE .. ")" .. weapon
			--bob misses a shot at joe's left leg.
		else
			fullString = self:getNetVar("name", "John Doe") .. " has " ..def[part].. " " ..client:GetName().. "'s " ..action.. ". (" ..rollC .." | "..rollE .. ")" .. weapon
			--joe has dodged bob's melee attack.
		end
		
		nut.chat.send(client, "react_fail", fullString)
	end
end

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

function ENT:die()
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
		ragdoll:SetBodygroup( 1, self:GetBodygroup(1) )
		ragdoll:SetBodygroup( 2, self:GetBodygroup(2) )
		ragdoll:SetBodygroup( 3, self:GetBodygroup(3) )
		ragdoll:SetBodygroup( 4, self:GetBodygroup(4) )
		ragdoll:SetBodygroup( 5, self:GetBodygroup(5) )
		ragdoll:SetBodygroup( 6, self:GetBodygroup(6) )
		
		ragdoll:SetCollisionGroup( COLLISION_GROUP_DEBRIS )
	end
		
	if (self:IsOnFire()) then --if the npc is on fire, set the ragdoll on fire too.
		ragdoll:Ignite(10,20)
	end
	
	SafeRemoveEntity( self )
end

if (CLIENT) then
	function ENT:Draw()
		self:DrawModel()
	end

	local TEXT_OFFSET = Vector(0, 0, 20)
	local toScreen = FindMetaTable("Vector").ToScreen
	local colorAlpha = ColorAlpha
	local drawText = nut.util.drawText
	local configGet = nut.config.get

	ENT.DrawEntityInfo = true

	function ENT:onDrawEntityInfo(alpha)
		local position = toScreen(self.LocalToWorld(self, self.OBBCenter(self)) + TEXT_OFFSET)
		local x, y = position.x, position.y
		drawText(self:getNetVar("name", "John Doe"), x, y, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 0.65)

		if (self:getNetVar("desc")) then
			drawText(self:getNetVar("desc"), x, y + 16, colorAlpha(color_white, alpha), 1, 1, "nutSmallFont", alpha * 0.65)
		end
	end
end