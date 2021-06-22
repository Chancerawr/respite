ITEM.name = "Plastic Dust"
ITEM.desc = "A small box filled with some sort of plastic dust."
ITEM.uniqueID = "medical_plastic"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.hp = 50
ITEM.hpTime = 5
ITEM.price = 0
ITEM.color = Color(130, 130, 130)

ITEM.sound = "items/medshot4.wav"
ITEM.soundPitch = 110

ITEM.stomach = false

ITEM.faction = {
	[FACTION_PLASTIC or -1] = true,
}

ITEM.iconCam = {
	pos = Vector(89.43, 74.9, 54.5),
	ang = Angle(25, 220, 0),
	fov = 5,
}