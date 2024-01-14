ITEM.name = "Refinery - Enhanced Chips"
ITEM.uniqueID = "refinery_enhanced"
ITEM.material = "models/props_combine/stasisfield_beam"
ITEM.desc = "A strange metal box, It has a large slot that is labelled 'DISTORTIONS', another slot labelled 'CHIP', and a small output slot labelled 'ENHANCED CHIP'."

ITEM.funcTable = {
	{
		id = "chip",
		name = "Distortion Key",
		icon = "icon16/cog.png",
		sound = "ambient/machines/spindown.wav",	
		--startString = "The machine accepts the materials and outputs adhesive."
		--endString = "The machine accepts the materials and outputs adhesive."
		required = {
			["distortion"] = 3,
			["cube_chip"] = 1,
		},	
		
		results = {
			["cube_chip_enhanced"] = 1,
		},
	},
	{
		id = "chip2",
		name = "Soul Mark",
		icon = "icon16/cog.png",
		sound = "ambient/machines/spindown.wav",	
		--startString = "The machine accepts the materials and outputs adhesive."
		--endString = "The machine accepts the materials and outputs adhesive."
		required = {
			["ichor"] = 7,
			["cube_chip"] = 1,
		},	
		
		results = {
			["cube_chip_ichor"] = 1,
		},
	},
	{
		id = "chip3",
		name = "Mind Sigil",
		icon = "icon16/cog.png",
		sound = "ambient/machines/spindown.wav",	
		--startString = "The machine accepts the materials and outputs adhesive."
		--endString = "The machine accepts the materials and outputs adhesive."
		required = {
			["blight"] = 7,
			["cube_chip"] = 1,
		},	
		
		results = {
			["cube_chip_blight"] = 1,
		},
	},
	{
		id = "chip4",
		name = "Flesh Icon",
		icon = "icon16/cog.png",
		sound = "ambient/machines/spindown.wav",	
		--startString = "The machine accepts the materials and outputs adhesive."
		--endString = "The machine accepts the materials and outputs adhesive."
		required = {
			["shard_dust"] = 7,
			["cube_chip"] = 1,
		},	
		
		results = {
			["cube_chip_shard"] = 1,
		},
	},
	{
		id = "chip5",
		name = "Intrinsic Symbol",
		icon = "icon16/cog.png",
		sound = "ambient/machines/spindown.wav",	
		--startString = "The machine accepts the materials and outputs adhesive."
		--endString = "The machine accepts the materials and outputs adhesive."
		required = {
			["j_scrap_memory"] = 10,
			["cube_chip"] = 1,
		},	
		
		results = {
			["cube_chip_memory"] = 1,
		},
	},
	{
		id = "chip6",
		name = "Voltaic Crest",
		icon = "icon16/cog.png",
		sound = "ambient/machines/spindown.wav",	
		--startString = "The machine accepts the materials and outputs adhesive."
		--endString = "The machine accepts the materials and outputs adhesive."
		required = {
			["j_scrap_energy"] = 3,
			["cube_chip"] = 1,
		},	
		
		results = {
			["cube_chip_energy"] = 1,
		},
	},
	{
		id = "chip7",
		name = "Toxic Curse",
		icon = "icon16/cog.png",
		sound = "ambient/machines/spindown.wav",	
		--startString = "The machine accepts the materials and outputs adhesive."
		--endString = "The machine accepts the materials and outputs adhesive."
		required = {
			["drug_venom"] = 7,
			["cube_chip"] = 1,
		},	
		
		results = {
			["cube_chip_venom"] = 1,
		},
	},
}

local function requiredItems(inventory, item, required)
	local found = {}
	
	for k, v in pairs(required) do
		local items = inventory:getItemsOfType(k)
		
		if(table.IsEmpty(items)) then
			return false
		end
		
		local count = 0
		for k, item in pairs(items) do
			local amt = item:getData("Amount", 1)
			
			count = count + amt
		
			if(count >= v) then
				local leftover = count - v
				table.insert(found, {item, leftover})
				
				break
			end

			table.insert(found, {item, 0})
		end
		
		if(count < v) then
			return false
		end
	end

	for k, v in pairs(found) do
		local item = found[k][1]
		local leftover = found[k][2]
		
		local amt = item:getData("Amount", 1)
		
		if(leftover != 0) then
			item:setData("Amount", leftover)
		else
			item:remove()
		end
	end
	
	return true
end

for k, v in pairs(ITEM.funcTable) do
	ITEM.functions[v.id] = {
		name = v.name,
		icon = v.icon,
		onRun = function(item)
			local client = item.player
			local position = client:getItemDropPos()
			local inventory = client:getChar():getInv()
			
			if(v.required) then
				local required = requiredItems(inventory, item, v.required)
				if (!required) then
					client:notify("You do not have the required materials.") 
					return false
				end
			end
		
			if(v.results) then
				for newItem, amt in pairs(v.results) do
					inventory:addSmart(newItem, amt, position, v.data)
				end
			end
			
			if(v.sound) then
				client:EmitSound(v.sound)
			end
			
			if(v.endString) then
				nut.chat.send(client, "itclose", v.endString)
			end

			return false
		end
	}
end