ITEM.name = "Empty Teapot"
ITEM.uniqueID = "j_empty_teapot"
ITEM.model = "models/props_interiors/pot01a.mdl"
ITEM.desc = "An empty teapot."
ITEM.flag = "j"
ITEM.fillable = true

ITEM.salvItem = {
	["j_scrap_metals"] = 2
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
	fov = 4.5,
}