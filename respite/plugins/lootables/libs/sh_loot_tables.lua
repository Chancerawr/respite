local PLUGIN = PLUGIN

PLUGIN.loot = PLUGIN.loot or {}

PLUGIN.loot["example1"] = {
	--["uniqueID"] = chance, --the chance is relative to every other item in the table, higher number is more likely
	["food_banana"] = 1,
	["food_apple"] = 1,
	["food_orange"] = 1,
	["food_pumpkin"] = 0.5,
}

--these are examples put the stuff you want in them
PLUGIN.loot["ammo"] = {
	["ammo_919"] = 1,
}

PLUGIN.loot["food"] = {
	["food_apple"] = 1,
}