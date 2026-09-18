local PLUGIN = PLUGIN
PLUGIN.name = "Fish"
PLUGIN.author = "Chancer"
PLUGIN.desc = "An overcomplicated fish naming system."

local names = {
	["Voidfish"] = 2,
	["Snapper"] = 1.1,
	["Snipper"] = 0.9,
	["Biter"] = 1,
	["Flopper"] = 1.1,
	["Flipper"] = 1.1,
	["Shrimp"] = 0.8,
	["Trout"] = 1,
	["Tuna"] = 1,
	["Bass"] = 1.1,
	["Pike"] = 1.2,
	["Fish"] = 1,
	["Carp"] = 1,
	["Catfish"] = 1,
	["Guppie"] = 1,
	["Clownfish"] = 1,
	["Koi"] = 1,
	["Angler"] = 1.2,
	["Anchovy"] = 0.5,
	["Sheepshead"] = 1.2,
}

local adjs = {
	["Red"] = 1.1,
	["Green"] = 1.05,
	["Blue"] = 1,
	["Black"] = 1,
	["White"] = 1,
	["Large"] = 2,
	["Small"] = 0.5,
	["Shrunken"] = 0.4,
	["Nightmarish"] = 3,
	["Huge"] = 3,
	["Angry"] = 1.2,
	["Sad"] = 1.2,
	["Cat-like"] = 0.95,
	["Skeletal"] = 0.5,
	["Tiny"] = 0.25,
	["Gnomish"] = 0.3,
	["Slippery"] = 1,
	["Oily"] = 1.1,
	["Slimy"] = 1.1,
	["Dry"] = 0.9,
	["Wide"] = 1.5,
	["Bulging"] = 2,
	["Monstrous"] = 2,
	["Flat"] = 0.8
}

function PLUGIN:constructFish()
	local name = table.Random(table.GetKeys(names))
	local adj = table.Random(table.GetKeys(adjs))
	
	local weight = (1 + math.random(1,10) * 0.1) * names[name] * adjs[adj]
	local desc = "Something that resembles a " ..name.. ", it is " ..adj.. ".\nIt weighs " .. weight .. " pounds."
	name = adj .." ".. name
	
	return name, desc, weight
end

function PLUGIN:CatchFish(material)
	local name, desc, wgt = PLUGIN:constructFish()
	
	local models = {
		"models/props/de_inferno/goldfish.mdl",
		"models/props/cs_militia/fishriver01.mdl",
		"models/foodnhouseholditems/fishbass.mdl",
		"models/foodnhouseholditems/fishcatfish.mdl",
		"models/foodnhouseholditems/fishgolden.mdl",
		"models/foodnhouseholditems/fishrainbow.mdl",
		"models/foodnhouseholditems/fishrainbow.mdl",
		"models/foodnhouseholditems/fishrainbow.mdl",
	}
	
	local customData = {}
	customData.name = name
	customData.desc = desc
	customData.model = table.Random(models)
	customData.material = material
	
	local data = {custom = customData, weight = wgt}
	
	return "food_fish", data
end

function PLUGIN:CatchFishPlastic()
	return PLUGIN:CatchFish("phoenix_storms/mrref2")
end

function PLUGIN:CatchFishHotDog()
	return PLUGIN:CatchFish("models/food/hotdog")
end

local function GetWeightedRandomKey( tab )
	local sum = 0

	for _, chance in pairs( tab ) do
		sum = sum + chance
	end

	local select = math.random() * sum

	for key, chance in pairs( tab ) do
		select = select - chance
		if select < 0 then return key end
	end
end

function PLUGIN:GetFishLoot(client, item, itemTable)
	if(!item) then return end
	if(!client) then return end
	
	local inventory = client:getChar():getInv()

	local loot = GetWeightedRandomKey(itemTable)
	local data = {}
	
	--checks if we need to run a function to get the loot
	if(isfunction(loot)) then
		--runs the inner loot function
		loot, data = loot()
	end
	
	if(nut.item.list[loot]) then
		local dropPos
		local name = data.customName or nut.item.list[loot].name or loot
	
		if(!IsValid(item:getEntity())) then --checks if item is not on the ground
			dropPos = client:getItemDropPos()
			
			inventory:addSmart(loot, 1, dropPos, data)
		else --if the item it on the ground
			dropPos = item:getEntity():GetPos() + item:getEntity():GetUp()*50
			
			nut.item.spawn(loot, dropPos, function(item2)
				for k, v in pairs(data) do
					item2:setData(k, v)
				end
			end)
		end	
		
		return "You fished " ..name.. " up."
	end
end