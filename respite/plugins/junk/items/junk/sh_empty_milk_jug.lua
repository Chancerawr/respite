ITEM.name = "Empty Milk Jug"
ITEM.uniqueID = "j_empty_milk_jug"
ITEM.model = "models/props_junk/garbage_milkcarton001a.mdl"
ITEM.desc = "An empty milk jug, it smells like rotten milk."
ITEM.flag = "j"
ITEM.fillable = true

ITEM.salvItem = {
	["j_scrap_plastics"] = 3
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
	fov = 5.5,
}