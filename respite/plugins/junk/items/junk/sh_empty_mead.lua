ITEM.name = "Empty Mead Bottle"
ITEM.uniqueID = "j_empty_mead"
ITEM.model = "models/props/cs_militia/bottle01.mdl"
ITEM.desc = "An empty bottle made of glass, it smells like mead."
ITEM.flag = "j"
ITEM.fillable = true

ITEM.salvItem = {
	["j_scrap_glass"] = 2
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Container"] = true,
		["Garbage"] = true,
	}
end