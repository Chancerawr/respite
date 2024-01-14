ITEM.name = "Empty Cherry Soda Can"
ITEM.uniqueID = "j_empty_soda2"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.desc = "An empty aluminum can."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.skin = 1
ITEM.fillable = true

ITEM.salvItem = {
	["j_scrap_metals"] = 1
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
	fov = 2.5,
}