ITEM.name = "Box of Bandages"
ITEM.prefix = "Bandage"
ITEM.desc = "A small box filled with bandages."
ITEM.uniqueID = "medical_bandages"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/props_c17/furniturefabric002a"
ITEM.category = "Medical"
ITEM.hp = 25
ITEM.hpTime = 10
ITEM.price = 0
ITEM.color = Color(232, 0, 0)
ITEM.container = "j_empty_bandage"
ITEM.quantity2 = 3

ITEM.sound = "physics/cardboard/cardboard_box_impact_soft7.wav"
ITEM.soundPitch = 50

ITEM.stomach = false

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(30, 120, 30, 255), 1, 1)
end

ITEM.loot = {
	["Medical"] = 10,
}

ITEM.craft = {
	hp = 30,
	
	buffTbl = {
		res = {
			["Fire"] = -3,
			["Bleed"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(89.43, 74.9, 54.5),
	ang = Angle(25, 220, 0),
	fov = 5,
}