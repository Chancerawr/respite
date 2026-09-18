local PLUGIN = PLUGIN

netstream.Hook("ccSelect", function(client, entity)
	--local check = PLUGIN:checkOwner(client, entity)

	if(entity.onSelected) then
		entity:onSelected(client)
	end
	
	--networks possible actions for client and server
	entity.actions = entity:getActions() or {}
	--netstream.Start(client, "ccUpdate", entity, util.TableToJSON(entity.actions))
end)

netstream.Hook("ccMove", function(client, entity, position)
	--local check = PLUGIN:checkCapable(entity, position)

	entity:movementStart(position)
end)

netstream.Hook("ccAction", function(client, entity, target, position)
	local action = entity.actions[entity.actCur or 1]
	
	if(!(target.combat or target:IsPlayer())) then
		target = nil
	end
	
	if(action.special) then --some spell or arts or something
		local spell = SPLS.spells[action.special] or nut.plugin.list["spells"].spellList[action.special]
		
		if(spell.radius) then
			local targets = ents.FindInSphere((target and target:GetPos()) or position, spell.radius)
			
			target = {}
			
			for k, v in pairs(targets) do
				if(v.combat or v:IsPlayer()) then
					target[#target + 1] = v
				end
			end
		end
		
		nut.plugin.list["combat"]:attack(entity, target, action.special, position)
	else --regular attack	
		nut.plugin.list["combat"]:attack(entity, target)
	end
	
	--local check = PLUGIN:checkCapable(entity, data)
	
	--attempt to use selected action on target
end)

netstream.Hook("ccActionSelect", function(client, entity, action)
	--local check = PLUGIN:checkCapable(entity, data)
	
	entity.actCur = action
	
	entity:onActionSelect(client, action)
end)