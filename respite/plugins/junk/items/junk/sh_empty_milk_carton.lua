ITEM.name = "Empty Milk Carton"
ITEM.uniqueID = "j_empty_milk_carton"
ITEM.model = "models/props_junk/garbage_milkcarton002a.mdl"
ITEM.desc = "An empty milk carton, it smells like rotten milk."
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