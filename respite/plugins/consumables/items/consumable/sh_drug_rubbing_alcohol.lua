ITEM.name = "Rubbing Alcohol"
ITEM.desc = "A bottle filled with rubbing alcohol."
ITEM.uniqueID = "drug_rubbingalcohol"
ITEM.model = "models/props_junk/glassjug01.mdl"
ITEM.material = "models/xqm/cinderblock_tex"
ITEM.category = "Drug"
ITEM.duration = 6000
ITEM.price = 30
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.hp = 20

ITEM.stomach = false

ITEM.attrib = {
	["fortitude"] = 2,
	["end"] = 3,
	["stm"] = -1,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end

ITEM.loot = {
	["Consumable"] = 10,
	["Drug"] = 10,
}

ITEM.craft = {
	buffTbl = {
		attrib = {
			["fortitude"] = 2,
			["end"] = 3,
			["stm"] = -3,
		},
		
		res = {
			["Bleed"] = -10,
			["Poison"] = 10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 4,
}