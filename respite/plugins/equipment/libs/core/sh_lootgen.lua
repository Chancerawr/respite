local PLUGIN = PLUGIN

PLUGIN.grades = {
	["S++"] = {
		range = 700, 
		scale = 3
	},
	
	["S+"] = {
		range = 600, 
		scale = 2.5
	},
	
	["S"] = {
		range = 500,
		scale = 2.25
	},	
	
	["S-"] = {
		range = 400,
		scale = 2.1
	},
	
	["A+"] = {
		range = 300, 
		scale = 2.0
	},
	
	["A"] = {
		range = 250,
		scale = 1.75
	},	
	
	["A-"] = {
		range = 200,
		scale = 1.6
	},
	
	["B+"] = {
		range = 150, 
		scale = 1.5
	},
	
	["B"] = {
		range = 130, 
		scale = 1.25
	},	
	
	["B-"] = {
		range = 110, 
		scale = 1.15
	},
	
	["C+"] = {
		range = 95, 
		scale = 1.10
	},
	
	["C"] = {
		range = 80, 
		scale = 1.0
	},	
	
	["C-"] = {
		range = 65, 
		scale = 0.9
	},
	
	["D+"] = {
		range = 50, 
		scale = 0.8
	},
	
	["D"] = {
		range = 40, 
		scale = 0.7
	},
	
	["D-"] = {
		range = 30, 
		scale = 0.6
	},
	
	["E+"] = {
		range = 20, 
		scale = 0.5
	},
	
	["E"] = {
		range = 10, 
		scale = 0.4
	},
	
	["E-"] = {
		range = 0, 
		scale = 0.2
	}
}

function PLUGIN:getGrade(bonus)
	for k, v in pairs(self.grades) do
		for k, v in SortedPairsByMemberValue(self.grades, "scale", true) do
			if(bonus >= v.scale) then
				return k
			end
		end	
	end
	
	return "F"
end

local function GetWeightedRandomKey(items)
	local sum = 0
	
	for _, item in pairs(items) do
		sum = sum + (item.rarity or 1)
	end

	local select = math.random() * sum

	for key, item in pairs(items) do
		select = select - (item.rarity or 1)
		if select < 0 then 
			return item
		end
	end
end

local function getItemFromString(lootTbl, name)
	if(lootTbl[name]) then
		return lootTbl[name]
	end
	
	local found
	for k, v in pairs(lootTbl) do
		local lowerLoot = string.lower(v.name) --lowercase loot
		local lowerSearch = string.lower(name) --lowercase search
	
		if(string.find(lowerLoot, lowerSearch)) then
			found = v
			break
		end
	end
	
	return found
end

if(SERVER) then
	LOOTGEN = LOOTGEN or {}
	LOOTGEN.loot = LOOTGEN.loot or {}
	function LOOTGEN:Register(tbl)
		self.loot[tbl.uniqueID] = tbl
	end

	--main loot generation function
	function PLUGIN:generateLoot(level, dropType, noAdj)
		local data = {}
		local customData = {}

		local potentialLoot = table.Copy(LOOTGEN.loot) --the entire loot table
		local loot
		if(dropType) then --specific type of item specified in arguments
			dropFind = getItemFromString(potentialLoot, string.lower(dropType))
			if(dropFind) then
				loot = dropFind
			else
				return false
			end
		else --if nothing specified just check the whole thing
			local randomLoot = GetWeightedRandomKey(potentialLoot)

			loot = table.Copy(nut.item.list[randomLoot.uniqueID])
		end
		
		--whether or not to use the adj system for this item
		local adj = {}
		if(!noAdj) then
			if(math.random(1,2) == 1) then
				adj = GetWeightedRandomKey(PLUGIN.lootAdj) --sh_tags.lua
			end
			
			if(adj.restrict) then
				for k, v in pairs(adj.restrict) do
					if(!loot.lootTags[v]) then
						adj = {}
					end
				end
			end
		end
		
		if(loot) then
			local itemTable = nut.item.list[loot.uniqueID]
		
			customData.name = (adj.name and (adj.name.. " ") or "") ..itemTable.name
			customData.desc = itemTable.desc.. (adj.desc and ("\n" ..adj.desc) or "")
			customData.model = itemTable.model
			customData.material = itemTable.material
			customData.color = adj.color or itemTable.color
			
			data.slot = itemTable.slot
			
			local baseArmorMult = (itemTable.armor or 1) * 0.1
			data.armor = itemTable.armor and math.Round(((itemTable.armor + level * math.Rand(0.25, 0.5) * baseArmorMult) * (adj.armMult or 1)), 1)
			
			--local baseDmgMult = (itemTable.dmg or 1) * 0.2
			--data.dmg = itemTable.dmg and math.Round(((itemTable.dmg + level * math.Rand(0.05, 0.2) * baseDmgMult) * (adj.dmgMult or 1)), 1)
			--data.dmgT = adj.dmgT or itemTable.dmgT
			
			data.dual = itemTable.weapondual
			
			--attribute bonuses
			data.attrib = itemTable.attrib
			
			if(adj.attrib) then
				if(istable(adj.attrib)) then
					data.attrib = data.attrib or {}
					for k, v in pairs(adj.attrib) do
						data.attrib[k] = math.random(v[1], v[2])
					end
				else
					data.attrib = adj.attrib
				end
			end
			
			--finds the grade (scaling) based on supplied level
			for k, v in SortedPairsByMemberValue(self.grades, "range", true) do 
				if(level >= v.range) then
					data.grade = k
					break
				end
			end
			
			--applies the grade (scaling) to the item's specified attributes
			data.scale = {}
			for k, v in pairs(itemTable.scaling or {}) do
				if(v != 0) then
					data.scale[k] = math.Round(v * self.grades[data.grade].scale, 2)
				end
			end
			
			data.res = itemTable.res
			
			data.amp = itemTable.amp
			
			data.custom = customData
			
			return data, (itemTable.uniqueID or "quest_equip_11")
		end
	end
end

nut.command.add("lootgen", {
	adminOnly = true,
	syntax = "<number level> <string type> <number amount>",
	onRun = function(client, arguments)
		if(!arguments[1] or !tonumber(arguments[1])) then
			client:notify("Specify a level.")
			return false
		end
		
		if (IsValid(client) and client:getChar()) then
            local aimPos = client:GetEyeTraceNoCursor().HitPos 
            aimPos:Add(Vector(0, 0, 10))

			for i = 1, (tonumber(arguments[3]) or 1) do
				local data, uniqueID = PLUGIN:generateLoot(tonumber(arguments[1]), arguments[2]) --genereates the item
				
				if(data) then
					--protects from errors in code where invalid items are specified
					if(uniqueID and !nut.item.list[uniqueID]) then 
						uniqueID = "quest_equip_11"
					end
					
					--creates the item entity
					nut.item.instance(0, uniqueID, data, 1, 1, function(item)
						local entity = item:spawn(aimPos)
					end)
				else
					client:notify("Loot generation failed.")
				end
			end
		end
	end
})

--initializes the loot tables
function PLUGIN:InitPostEntity()
	if(CLIENT) then return end

	local LOOT = {}

	for uniqueID, item in pairs(nut.item.list) do
		if(item.rarity) then
			LOOT = {}
			LOOT.uniqueID = uniqueID
			LOOT.name = item.name
			LOOT.rarity = item.rarity
			LOOT.lootTags = item.lootTags
			LOOTGEN:Register(LOOT)
		end
	end
end