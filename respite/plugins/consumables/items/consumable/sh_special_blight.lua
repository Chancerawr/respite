ITEM.name = "Blight"
ITEM.desc = "A strange vial that is filled with some black liquid."
ITEM.uniqueID = "blight"
ITEM.model = "models/items/healthvial2.mdl"
ITEM.hp = 0
ITEM.hpTime = 5
ITEM.price = 75
ITEM.container = "j_empty_vial"
ITEM.color = Color(0, 0, 0)

ITEM.sound = "items/medshot4.wav"
ITEM.soundPitch = 75

ITEM.stomach = false
ITEM.noEnhance = true

ITEM.notify = "Your body has changed."

ITEM.confirm = {
	name = "Integrate",
	query = "Are you sure you want to consume this item?",
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(0, 0, 0, 200), 5, 2)
	--nut.plugin.list["parts"]:partsAdd(client, 25, "Blight")
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}