ITEM.name = "Empty Pill Bottle"
ITEM.uniqueID = "j_empty_pill"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.desc = "An empty pill bottle."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.fillable = true

ITEM.salvItem = {
	["j_scrap_plastics"] = 1
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
	fov = 3.75,
}