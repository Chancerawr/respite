ITEM.name = "Pliers"
ITEM.uniqueID = "j_pliers"
ITEM.model = "models/props_c17/tools_pliers01a.mdl"
ITEM.desc = "Some handy pliers."
ITEM.flag = "j"

ITEM.salvItem = {
	["j_scrap_metals"] = 2
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Tool"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 6.54,
}