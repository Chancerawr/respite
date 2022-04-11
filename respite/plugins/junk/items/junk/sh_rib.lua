ITEM.name = "Rib"
ITEM.uniqueID = "j_rib"
ITEM.model = "models/gibs/hgibs_rib.mdl"
ITEM.desc = "A rib from some humanoid."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.salvItem = {
	["j_scrap_bone"] = 1
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Bone"] = true,
		["Corpse"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 5.5,
}