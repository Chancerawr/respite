ITEM.name = "Empty First-Aid Kit"
ITEM.desc = "An empty first-aid kit."
ITEM.uniqueID = "j_used_first_aid_kit"
ITEM.model = "models/warz/items/medkit.mdl"
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 2

ITEM.salvItem = {
	["j_scrap_plastics"] = 3,
	["j_scrap_cloth"] = 2
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Garbage"] = true,
		["Post battle"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 2.9,
}