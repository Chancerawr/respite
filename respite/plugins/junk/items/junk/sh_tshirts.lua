ITEM.name = "T-Shirts"
ITEM.uniqueID = "j_tshirts"
ITEM.model = "models/props/de_tides/vending_tshirt.mdl"
ITEM.desc = "A few old t-shirts cluttered together."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.salvItem = {
	["j_scrap_cloth"] = 3
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(0, 200, 16),
	ang = Angle(0, -90, 0),
	fov = 12,
}