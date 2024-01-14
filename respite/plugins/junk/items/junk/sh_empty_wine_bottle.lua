ITEM.name = "Empty Wine Bottle"
ITEM.uniqueID = "j_empty_wine"
ITEM.model = "models/props/cs_militia/bottle01.mdl"
ITEM.desc = "An empty bottle made of glass, it smells like wine."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 2
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
	pos = Vector(-200, 0, 7),
	ang = Angle(0, -0, 0),
	fov = 5,
}