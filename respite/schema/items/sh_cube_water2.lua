ITEM.name = "Cube - Water"
ITEM.desc = "A cube of water, seemingly disobeying the laws of physics."
ITEM.uniqueID = "cube_water2"
ITEM.model = "models/hunter/blocks/cube05x05x05.mdl"
ITEM.material = "models/props_combine/com_shield001a"
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Miscellaneous"
ITEM.color = Color(135, 200, 255)

local function GetWeightedRandomKey(items)
	local sum = 0
	
	for item, data in pairs(items) do
		sum = sum + (data.chance or 10)
	end

	local select = math.random() * sum

	for item, data in pairs(items) do
		select = select - (data.chance or 10)
		if select < 0 then 
			return data
		end
	end
end

local results = {
	{ --Money
		chance = 12,
		resultFunction = function(client, item, roll)
			local char = client:getChar()
			char:giveMoney(math.Round(roll))
			
			client:notify("There was " .. math.Round(roll) .. " scrap coins in the dirt.")
		end
	},
	{ --water
		chance = 15,
		notify = "You found water.",
		items = {
			["food_water"] = {1,4},
		},
	},
	{ --fish
		chance = 10,
		notify = "You found a fish.",
		items = {
			["food_fish"] = 1,
		},
	},
	{ --fishes
		chance = 7,
		notify = "You found a fish.",
		items = {
			["food_fish"] = {1,2},
			["food_fish2"] = {1,2}
		},
	},
	{ --Memories
		chance = 7,
		notify = "You receive some drowned memories.",
		items = {
			["j_scrap_memory"] = {3,6},
		},
	},
	{ --Bones
		chance = 7,
		notify = "You found some bones.",
		items = {
			["j_skull"] = {-1,1},
			["j_spine"] = {-1,1},
			["j_scapula"] = {-1,1},
			["j_rib"] = {1,2},
		},
	},
	{ --Cheese
		chance = 6,
		notify = "You found a hook.",
		items = {
			["hl2_m_meathook"] = 1,
		},
	},
	{ --Metals
		chance = 2,
		notify = "You find gold.",
		items = {
			["j_scrap_gold"] = {1,2},
		},
	},
	{ --Shard Dust
		chance = 1,
		notify = "You found some shard dust.",
		items = {
			["shard_dust"] = {1,2},
		},
	},
}

ITEM.functions.Break = {
	icon = "icon16/arrow_down.png",
	sound = "player/footsteps/dirt4.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()
		local position = client:getItemDropPos()
		
		local luck = math.Clamp(math.floor(char:getAttrib("luck")), 0, 100)
		local luckRan = math.random(0, luck)
		local roll = (math.random(luckRan, 100))
		
		local resultData = GetWeightedRandomKey(results)
		
		if(resultData) then
			local items = resultData.items
			if(items) then
				for k, v in pairs(items) do
					local amount = math.random(v[1],v[2])
					
					if(amount > 0) then
						inventory:addSmart(k, amount, position)
					end
				end
			end
			
			local resultFunc = resultData.resultFunction
			if(resultFunc) then
				resultFunc(client, item, roll)
			end
			
			local notify = resultData.notify
			if(notify) then
				client:notify(notify)
			end
		end
	end
}

ITEM.iconCam = {
	ang = Angle(0, 270, 0),
	fov	= 9.4,
	pos	= Vector(0, 200, 0)
}