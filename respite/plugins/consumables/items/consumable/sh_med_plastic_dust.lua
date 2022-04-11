ITEM.name = "Plastic Dust"
ITEM.prefix = "Plastic"
ITEM.desc = "A small box filled with some sort of plastic dust."
ITEM.uniqueID = "medical_plastic"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.category = "Medical"
ITEM.hp = 30
ITEM.hpTime = 5
ITEM.price = 0
ITEM.color = Color(130, 130, 130)

ITEM.sound = "items/medshot4.wav"
ITEM.soundPitch = 110

ITEM.stomach = false

ITEM.faction = {
	[FACTION_PLASTIC or -1] = true,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(100, 100, 100, 200), 1, 0)
end

ITEM.loot = {
	["Medical"] = true,
	["Plastic"] = true,
}

ITEM.craft = {
	hp = 5,
	
	buffTbl = {
		res = {
			["Electric"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(89.43, 74.9, 54.5),
	ang = Angle(25, 220, 0),
	fov = 5,
}