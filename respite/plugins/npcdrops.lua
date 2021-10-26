local PLUGIN = PLUGIN
PLUGIN.name = "NPC Drops"
PLUGIN.desc = "NPCs drop items."
PLUGIN.author = ""

if SERVER then
	PLUGIN.npcDrops = {
		["amputated"] = {
			["food_monster_meat"] = 5,
			["medical_bandages"] = 5,
			["nothing"] = 10,
		},
	}
	
	-- Weighted random based on rarity of items
	local function GetWeightedRandomKey(items)
		local sum = 0
		
		for item, rarity in pairs(items) do
			sum = sum + (rarity or 1)
		end

		local select = math.random() * sum

		for item, rarity in pairs(items) do
			select = select - (rarity or 1)
			if select < 0 then 
				return item
			end
		end
	end
	
	-- gets an item from the drop table
	function PLUGIN:getDrop(npc)
		return GetWeightedRandomKey(PLUGIN.npcDrops[npc])
	end

	-- Called when any NPC dies
	function PLUGIN:OnNPCKilled(npc, attacker, inflictor)		
		local className = npc:GetClass()
	
		-- If the NPC has a drop table
		if(PLUGIN.npcDrops[className]) then
			local drop = PLUGIN:getDrop(className)
			if(!drop) then return false end
			
			if(drop == "nothing") then
				return
			end
		
			nut.item.spawn(drop, npc:GetPos()+Vector(0,0,20)) -- Spawns the item
		end
	end
end