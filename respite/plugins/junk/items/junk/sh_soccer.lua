ITEM.name = "Soccer Ball"
ITEM.uniqueID = "j_soccerball"
ITEM.model = "models/props_phx/misc/soccerball.mdl"
ITEM.desc = "An old soccer ball, it seems to need some air."
ITEM.flag = "j"

ITEM.salvItem = {
	["j_scrap_cloth"] = 3
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(197.50, 165.72, 120.22),
	ang = Angle(25, 220, 0),
	fov = 4.76,
}