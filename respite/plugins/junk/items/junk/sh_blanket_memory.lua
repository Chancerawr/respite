ITEM.name = "Memory Blanket"
ITEM.desc = "A strange sheet of nostalgic memories."
ITEM.uniqueID = "j_blanket_memory"
ITEM.model = "models/props_junk/garbage_carboard001a.mdl"
ITEM.material = "models/props_lab/security_screens"
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.salvItem = {
	["j_scrap_memory"] = 2
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Bed"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(0, -1, 200),
	ang = Angle(90, 0, 0),
	fov = 20,
}