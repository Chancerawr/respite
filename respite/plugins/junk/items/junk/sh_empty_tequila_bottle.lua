ITEM.name = "Empty Tequila Bottle"
ITEM.uniqueID = "j_empty_tequila"
ITEM.model = "models/props_junk/glassjug01.mdl"
ITEM.desc = "An empty bottle made of glass, it smells like tequila."
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

ITEM.iconCam = {
	pos = Vector(-200, 0, 6),
	ang = Angle(0, -0, 0),
	fov = 5,
}