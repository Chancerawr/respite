ITEM.name = "Television"
ITEM.uniqueID = "j_broken_tv"
ITEM.model = "models/props_c17/tv_monitor01.mdl"
ITEM.desc = "An older looking television."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.salvItem = {
	["j_scrap_elecs"] = 3,
	["j_scrap_screws"] = 2,
	["j_scrap_glass"] = 3
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Tech"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(200, 0, 0),
	ang = Angle(180, -0, 180),
	fov = 7.5,
}