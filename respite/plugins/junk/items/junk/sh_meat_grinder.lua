ITEM.name = "Meat Grinder"
ITEM.uniqueID = "j_meat_grinder"
ITEM.model = "models/props_c17/grinderclamp01a.mdl"
ITEM.desc = "A metal tool with a climb and a lever."
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
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 6,
}