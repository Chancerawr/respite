ITEM.name = "Empty Bleach Container"
ITEM.uniqueID = "j_empty_bleach"
ITEM.model = "models/props_junk/garbage_plasticbottle001a.mdl"
ITEM.desc = "An empty plastic container that smells of bleach."
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
	pos = Vector(224.21286010742, 188.08586120605, 136.6078338623),
	ang = Angle(25, 220, 0),
	fov = 5,
}