ITEM.name = "Rot"
ITEM.desc = "A strange rotting object, it seems to rot forever."
ITEM.uniqueID = "j_scrap_rot"
ITEM.model = "models/gibs/shield_scanner_gib5.mdl"
ITEM.material = "models/barnacle/roots"
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "j"
ITEM.color = Color(128, 255, 0)

ITEM.maxstack = 5

function ITEM:onEntityCreated(item)
	item:SetColor(Color(128,255,0))
end