ITEM.name = "Pain"
ITEM.prefix = "Painful"
ITEM.desc = "A small bottle filled with some pills."
ITEM.uniqueID = "drug_pain"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.material = "models/props_canal/metalcrate001d"
ITEM.category = "Drug"
ITEM.duration = 6000
ITEM.price = 30
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.mp = 15
ITEM.hp = -5

ITEM.stomach = false

ITEM.attrib = {
	["end"] = -5,
	["fortitude"] = 10,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end

ITEM.loot = {
	["Consumable"] = 10,
	["Drug"] = 5,
}

ITEM.craft = {
	hp = -5,
	mp = 15,

	buffTbl = {
		attrib = {
			["end"] = -5,
			["fortitude"] = 10,
		},
		
		res = {
			["Pain"] = -25,
			["Fear"] = 40,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3.75,
}