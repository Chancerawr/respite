ITEM.name = "First Aid Kit"
ITEM.desc = "A standard medical kit used to apply first aid."
ITEM.uniqueID = "medical_kit"
ITEM.model = "models/items/healthkit.mdl"
ITEM.category = "Medical"
ITEM.width = 2
ITEM.height = 2
ITEM.hp = 50
ITEM.hpTime = 10
ITEM.price = 0
ITEM.color = Color(232, 0, 0)
ITEM.container = "j_used_first_aid_kit"
ITEM.quantity2 = 6

ITEM.sound = "items/medshot4.wav"
ITEM.soundPitch = 110

ITEM.stomach = false

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(30, 120, 30, 255), 1, 1)
end

ITEM.loot = {
	["Medical"] = true,
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
	pos = Vector(5, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 5.8,
}