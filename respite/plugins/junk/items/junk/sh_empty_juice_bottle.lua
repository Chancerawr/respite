ITEM.name = "Juice Bottle"
ITEM.uniqueID = "j_empty_juice_bottle"
ITEM.model = "models/props_junk/garbage_glassbottle001a.mdl"
ITEM.desc = "An empty bottle, the inside is sticky."
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
	fov = 5,
}