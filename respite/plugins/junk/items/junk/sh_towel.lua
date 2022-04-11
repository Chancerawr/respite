ITEM.name = "Towel"
ITEM.uniqueID = "j_towel"
ITEM.model = "models/props_junk/garbage_carboard002a.mdl"
ITEM.desc = "A piece of absorbent fabric used for drying."
ITEM.flag = "j"
ITEM.material = "models/props_c17/furniturefabric003a"

ITEM.salvItem = {
	["j_scrap_cloth"] = 2
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Bath"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(0, -1, 200),
	ang = Angle(90, 0, 0),
	fov = 20,
}