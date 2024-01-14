ITEM.name = "Depressants"
ITEM.prefix = "Depressing"
ITEM.desc = "A small bottle filled with some pills, there's something sad about them."
ITEM.uniqueID = "drug_depress"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.material = "models/player/player_chrome1"
ITEM.category = "Drug"
ITEM.duration = 6000
ITEM.price = 30
ITEM.color = Color(100, 100, 100)
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.mp = -2

ITEM.stomach = false

ITEM.attrib = {
	["fortitude"] = -3,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end

ITEM.loot = {
	["Consumable"] = 10,
	["Drug"] = 10,
}

ITEM.craft = {
	mp = -2,

	buffTbl = {
		attrib = {
			["fortitude"] = -3,
			["end"] = 2,
		},
		
		res = {
			["Slow"] = -5,
			["Fear"] = 10,
			["Pain"] = 10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3.75,
}