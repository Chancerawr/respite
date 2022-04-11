ITEM.name = "Soda Bottle"
ITEM.uniqueID = "j_empty_soda_bottle"
ITEM.model = "models/props_junk/garbage_plasticbottle003a.mdl"
ITEM.desc = "A plastic soda bottle, the inside is sticky.\nThis container can be filled with water."
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
	fov = 6,
}