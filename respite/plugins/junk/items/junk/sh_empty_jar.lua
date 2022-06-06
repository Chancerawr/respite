ITEM.name = "Jar"
ITEM.uniqueID = "j_empty_jar"
ITEM.model = "models/props_lab/jar01a.mdl"
ITEM.desc = "An empty jar.\nThis container can be filled with water."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.fillable = true

ITEM.salvItem = {
	["j_scrap_glass"] = 1
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Container"] = true,
	}
end