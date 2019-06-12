PLUGIN.name = "Fish"
PLUGIN.author = "Chancer"
PLUGIN.desc = "An overcomplicated fish naming system."

local names = {
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
	["Coy"] = 1,
	["Anchovy"] = 0.5
}

local adjs = {
	["Red"] = 1.1,
	["Green"] = 1.05,
	["Blue"] = 1,
	["Large"] = 2,
	["Small"] = 0.5,
	["Shrunken"] = 0.4,
	["Huge"] = 3,
	["Black"] = 1,
	["White"] = 1,
	["Angry"] = 1.2,
	["Sad"] = 1.2,
	["Cat-like"] = 0.95,
	["Skeletal"] = 0.5,
	["Tiny"] = 0.25,
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