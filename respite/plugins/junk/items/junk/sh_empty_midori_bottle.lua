ITEM.name = "Empty Midori Bottle"
ITEM.uniqueID = "j_empty_midori"
ITEM.model = "models/props_junk/garbage_glassbottle003a.mdl"
ITEM.material = "phoenix_storms/pack2/interior_sides"
ITEM.desc = "An empty bottle made of glass, it smells like midori."
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