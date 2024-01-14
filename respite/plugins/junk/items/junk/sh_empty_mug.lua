ITEM.name = "Mug"
ITEM.uniqueID = "j_empty_mug"
ITEM.model = "models/props_junk/garbage_coffeemug001a.mdl"
ITEM.desc = "An empty mug."
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
	}
end

ITEM.iconCam = {
	pos = Vector(0, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 2,
}