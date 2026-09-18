ITEM.name = "First Aid Kit"
ITEM.desc = "A medical kit used to apply first aid."
ITEM.uniqueID = "medical_first"
ITEM.model = "models/warz/items/medkit.mdl"
ITEM.category = "Medical"
ITEM.width = 1
ITEM.height = 2
ITEM.hp = 40
ITEM.hpTime = 10
ITEM.price = 0
ITEM.color = Color(232, 0, 0)
ITEM.container = "j_used_first_aid_kit"
ITEM.quantity2 = 5

ITEM.sound = "items/medshot4.wav"
ITEM.soundPitch = 110

ITEM.stomach = false

ITEM.buffRemove = {
	["bleed"] = 2,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(30, 120, 30, 255), 1, 1)
end

ITEM.loot = {
	["Medical"] = 5,
}

ITEM.craft = {
	hp = 50,
	
	buffTbl = {
		res = {
			["Bleed"] = 10,
			["Disease"] = 10,
			["Poison"] = 10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 2.9,
}