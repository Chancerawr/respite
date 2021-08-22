ITEM.name = "IV Bag"
ITEM.desc = "A small bag that can be used for IV therapy."
ITEM.uniqueID = "medical_iv"
ITEM.model = "models/props_junk/garbage_bag001a.mdl"
ITEM.material = "models/props/cs_assault/moneywrap02"
ITEM.hp = 65
ITEM.hpTime = 15
ITEM.price = 0
ITEM.color = Color(232, 0, 0)
ITEM.quantity2 = 2

ITEM.sound = "items/medshot4.wav"
ITEM.soundPitch = 110

ITEM.stomach = false

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(30, 160, 30, 255), 1, 1)
end

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 170),
	fov = 5.5,
}