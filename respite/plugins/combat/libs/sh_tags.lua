local PLUGIN = PLUGIN

local playerMeta = FindMetaTable("Player")

--creature tags, WIP
function playerMeta:getTags()
	local tags = {
		["Humanoid"] = true,
	}
	
	return tags
end

--gets the damage bonus from tags
function playerMeta:getTagsBonus()
	local tags = {}
	--[[
	local passives = self:getPassives()
	
	--tags from passive abilities
	for uID, _ in pairs(passives) do
		local passive = PASSIVES.passives[uID]
		if(passive and passive.tags) then
			for tag, v in pairs(passive.tags) do
				tags[tag] = (tags[tag] or 1) * v
			end
		end
	end
	--]]
	
	local char = self:getChar()
	local inventory = char:getInv()
	
	--item related labels, i use labels as the var here since there are also ingredient tags
	for k, v in pairs(inventory:getItems()) do
		if(v:getData("equip")) then
			local labels = v:getData("labels", v.labels) or {}
			for label, v in pairs(labels) do
				tags[label] = (tags[label] or 1) * v
			end
		end
	end
	
	return tags
end

--damage modifiers from tags
function PLUGIN:tagsEffects(target, attackInfo)
	local attacker = attackInfo.attacker
	if(!attacker) then return end
	if(!attacker:IsPlayer()) then return end --only players can do this for right now
	
	local tags = target:getTags()
	local attackTags = attacker:getTagsBonus()
	
	for k, bonus in pairs(attackTags) do
		if(tags[k]) then
			for _, v in pairs(attackInfo.damage) do
				if(v.dmg) then
					v.dmg = v.dmg * bonus --applies the bonus against whatever tag we have here
				end
			end
		end
	end
	
	return attackInfo.damage
end