ITEM.name = "Sleeping Pills"
ITEM.prefix = "Sleep"
ITEM.desc = "A small bottle filled with some pills."
ITEM.uniqueID = "drug_sleepingpills"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.category = "Drug"
ITEM.duration = 6000
ITEM.price = 30
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.mp = 4

ITEM.stomach = false

ITEM.attrib = {
	["stm"] = -6,
	["fortitude"] = 10,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end

ITEM.loot = {
	["Consumable"] = true,
	["Drug"] = true,
}

ITEM.craft = {
	buffTbl = {
		evasion = -5,
		
		attrib = {
			["stm"] = -6,
			["fortitude"] = 10,
		},
		
		res = {
			["Sleep"] = -50,
			["Mind"] = 50,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3.75,
}