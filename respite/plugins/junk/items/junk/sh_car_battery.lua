ITEM.name = "Car Battery"
ITEM.uniqueID = "j_car_battery"
ITEM.desc = "A large, powerful battery."
ITEM.model = "models/items/car_battery01.mdl"
ITEM.flag = "v"
ITEM.width = 1
ITEM.height = 1

ITEM.salvItem = {
	["j_scrap_plastics"] = 4,
	["j_scrap_elecs"] = 2,
	["j_scrap_battery"] = 1
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Car"] = true,
		["Garbage"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}