ITEM.name = "Memory Wraps"
ITEM.desc = "A small box filled with some strange wrappings.\nThese wrappings help deal with numbness caused by blight damage and cure mental ailments. They lose all effectiveness after used once."
ITEM.uniqueID = "medical_memory"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/props_lab/security_screens"
ITEM.category = "Medical"
ITEM.mp = 10
ITEM.mpTime = 1
ITEM.price = 0
ITEM.color = Color(232, 0, 0)
ITEM.quantity2 = 3

ITEM.container = "j_empty_bandage"
ITEM.color = Color(0, 128, 128)

ITEM.sound = "physics/cardboard/cardboard_box_impact_soft7.wav"
ITEM.soundPitch = 50

ITEM.stomach = false

ITEM.cures = {
	["fort_pani"] = true, 
	["fort_nost"] = true,
	["fort_conf"] = true,
	["fort_headache"] = true,
	["fort_migraine"] = true,
	["fort_hall"] = true,
	["fort_para"] = true,
	["fort_noia"] = true,
	["fort_insa"] = true,
	["fort_enrage"] = true,
	["dis_poti"] = true,
	["dis_wrai"] = true,
	["dis_eyes"] = true,
	["dis_mind"] = true,
	["dis_touch"] = true
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(20, 128, 128, 255), 1, 1)
end

ITEM.loot = {
	["Medical"] = true,
	["Special"] = true,
}

ITEM.craft = {
	mp = 10,
	
	buffTbl = {
		res = {
			["Blight"] = 5,
			["Ichor"] = 5,
			["Shard"] = 5,
			["Mind"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(89.43, 74.9, 54.5),
	ang = Angle(25, 220, 0),
	fov = 5,
}