ITEM.name = "Empty Plastic Bag"
ITEM.uniqueID = "j_plastic_bag"
ITEM.model = "models/props_junk/garbage_bag001a.mdl"
ITEM.desc = "An empty plastic bag that once contained potato chips."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.salvItem = {
	["j_scrap_plastics"] = 1
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Garbage"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 170),
	fov = 5.5,
}