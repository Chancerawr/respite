ITEM.name = "Empty First-Aid Kit"
ITEM.desc = "A used first-aid kit."
ITEM.uniqueID = "j_used_res_kit"
ITEM.model = "models/items/healthkit.mdl"
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 2

ITEM.salvItem = {
	["j_scrap_plastics"] = 4
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Garbage"] = true,
		["Post battle"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(5, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 5.8,
}