ITEM.name = "Painting"
ITEM.uniqueID = "j_painting1"
ITEM.model = "models/props/de_inferno/picture3.mdl"
ITEM.desc = "A very old looking painting."
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 2

ITEM.salvItem = {
	["j_scrap_wood"] = 4
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Decor"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(200, 0, 3),
	ang = Angle(180, -0, 180),
	fov = 15,
}