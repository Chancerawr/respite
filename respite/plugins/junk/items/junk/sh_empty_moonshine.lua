ITEM.name = "Empty Moonshine Container"
ITEM.uniqueID = "j_empty_moonshine"
ITEM.model = "models/props_junk/garbage_glassbottle003a.mdl"
ITEM.material = "models/props_wasteland/tugboat02"
ITEM.desc = "An empty container, it smells horrible."
ITEM.flag = "j"
ITEM.fillable = true

ITEM.salvItem = {
	["j_scrap_glass"] = 2
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