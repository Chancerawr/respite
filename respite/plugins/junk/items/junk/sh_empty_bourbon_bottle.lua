ITEM.name = "Empty Bourbon Bottle"
ITEM.uniqueID = "j_empty_bourbon"
ITEM.model = "models/props_junk/garbage_glassbottle002a.mdl"
ITEM.material = "models/props/cs_militia/roofedges"
ITEM.desc = "An empty glass bottle, a brown bag is wrapped around it."
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
	fov = 5,
}