ITEM.name = "Restoration Kit"
ITEM.desc = "A storage device containing unknown chemicals. Will easily treat most non-life-threatening wounds."
ITEM.uniqueID = "medical_kit"
ITEM.model = "models/items/healthkit.mdl"
ITEM.category = "Medical"
ITEM.width = 2
ITEM.height = 2
ITEM.hp = 40
ITEM.hpTime = 10
ITEM.price = 0
ITEM.color = Color(232, 0, 0)
ITEM.container = "j_used_res_kit"
ITEM.quantity2 = 10

ITEM.sound = "items/medshot4.wav"
ITEM.soundPitch = 110

ITEM.stomach = false

ITEM.buffRemove = {
	["bleed"] = 3,
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
	pos = Vector(5, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 5.8,
}