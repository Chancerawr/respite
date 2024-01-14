ITEM.name = "Cube - Dirt"
ITEM.desc = "A cube of solid dirt. Could there be something inside?"
ITEM.uniqueID = "cube_dirt"
ITEM.model = "models/hunter/blocks/cube05x05x05.mdl"
ITEM.material = "phoenix_storms/potato"
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Miscellaneous"
ITEM.color = Color(80, 50, 50)

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
			char:giveMoney(math.Round(roll*0.5))
			
			client:notify("There was " .. math.Round(roll*0.5) .. " scrap coins in the dirt.")
		end
	},
	{ --Mushrooms
		chance = 10,
		notify = "You found mushrooms.",
		items = {
			["herb_mushroom"] = {1,4},
		},
	},
	{ --Nothing
		chance = 7,
		notify = "There was nothing in the dirt.",
	},
	{ --Memories
		chance = 7,
		notify = "You receive some buried memories.",
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
		notify = "You dig up some cheese?",
		items = {
			["food_cheese"] = {1,3},
		},
	},
	{ --Metals
		chance = 2,
		notify = "You find metal in the ground.",
		items = {
			["j_scrap_copper"] = {-2,3},
			["j_scrap_iron"] = {-1,2},
			["j_scrap_silver"] = {-3,2},
			["j_scrap_gold"] = {-4,2},
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

ITEM.functions.Dig = {
	icon = "icon16/arrow_down.png",
	sound = "player/footsteps/dirt4.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()
		local shovel = inventory:getFirstItemOfType("hl2_m_shovel_alt") or inventory:getFirstItemOfType("hl2_m_shovel")
		local position = client:getItemDropPos()
		
		if (!shovel) then
			client:notify("You need a shovel to dig in this dirt.") 
			return false
		end

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