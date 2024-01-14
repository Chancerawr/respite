ITEM.name = "Empty Vial"
ITEM.uniqueID = "j_empty_vial"
ITEM.model = "models/items/healthvial2.mdl"
ITEM.desc = "An empty vial that once contained some sort of substance."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.fillable = true

ITEM.salvItem = {
	["j_scrap_glass"] = 1
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Container"] = true,
		["Garbage"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}