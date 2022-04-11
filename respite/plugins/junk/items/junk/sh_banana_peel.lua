ITEM.name = "Banana Peel"
ITEM.uniqueID = "j_bananaskin"
ITEM.model = "models/props/cs_italy/banannagib2.mdl"
ITEM.desc = "A banana skin from a peeled banana."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.salvItem = {
	["j_scrap_organic"] = 1
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Garbage"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(109.67, 92.04, 65.99),
	ang = Angle(25, 220, 0),
	fov = 4.417,
}