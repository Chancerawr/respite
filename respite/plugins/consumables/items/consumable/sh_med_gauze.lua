ITEM.name = "Box of Gauze"
ITEM.prefix = "Gauze"
ITEM.desc = "A small box filled with gauze."
ITEM.uniqueID = "medical_gauze"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "phoenix_storms/top"
ITEM.category = "Medical"
ITEM.hp = 45
ITEM.hpTime = 15
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
	["Medical"] = 7,
}

ITEM.craft = {
	hp = 45,
	
	buffTbl = {
		res = {
			["Fire"] = -5,
			["Bleed"] = 15,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(89.432174682617, 74.904991149902, 54.501823425293),
	ang = Angle(25, 220, 0),
	fov = 5,
}