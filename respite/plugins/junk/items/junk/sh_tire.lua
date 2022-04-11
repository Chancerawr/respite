ITEM.name = "Tire"
ITEM.uniqueID = "j_tire"
ITEM.model = "models/props_vehicles/tire001c_car.mdl"
ITEM.desc = "A tire used for a motor vehicle."
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 2

ITEM.salvItem = {
	["j_scrap_rubber"] = 3
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Car"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 9,
}