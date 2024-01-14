ITEM.name = "Suture Kit"
ITEM.prefix = "Suture"
ITEM.desc = "A small box filled tools and sutures."
ITEM.uniqueID = "medical_suture"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/xqm/cinderblock_tex"
ITEM.category = "Medical"
ITEM.hp = 50
ITEM.hpTime = 1
ITEM.price = 0
ITEM.color = Color(232, 0, 0)
ITEM.container = "j_empty_bandage"
ITEM.quantity2 = 3

ITEM.sound = "items/medshot4.wav"
ITEM.soundPitch = 110

ITEM.stomach = false

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(30, 160, 30, 255), 1, 1)
end

ITEM.loot = {
	["Medical"] = 5,
}

ITEM.craft = {
	hp = 60,
	
	buffTbl = {
		res = {
			["Bleed"] = 15,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(89.43, 74.9, 54.5),
	ang = Angle(25, 220, 0),
	fov = 5,
}