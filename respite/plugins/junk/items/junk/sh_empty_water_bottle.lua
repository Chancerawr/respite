ITEM.name = "Empty Water Bottle"
ITEM.uniqueID = "j_empty_water"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.desc = "An empty bottle made of glass, it has no scent."
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
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5
}
