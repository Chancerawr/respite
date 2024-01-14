ITEM.name = "Splint"
ITEM.desc = "A crude splint."
ITEM.uniqueID = "medical_splint"
ITEM.model = "models/props_junk/wood_crate001a_chunk05.mdl"
ITEM.category = "Medical"
ITEM.width = 2
ITEM.hp = 50
ITEM.hpTime = 12
ITEM.price = 0
ITEM.color = Color(232, 0, 0)

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
			["Root"] = 10,
			["Knockdown"] = 10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 9,
}