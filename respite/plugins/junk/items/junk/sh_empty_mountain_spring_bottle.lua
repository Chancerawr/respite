ITEM.name = "Empty Mountain Spring Bottle"
ITEM.uniqueID = "j_empty_mountain_spring"
ITEM.model = "models/props/cs_office/water_bottle.mdl"
ITEM.desc = "An empty bottle made of plastic, it has no scent."
ITEM.flag = "j"
ITEM.fillable = true

ITEM.salvItem = {
	["j_scrap_plastics"] = 2
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
	fov = 4
}