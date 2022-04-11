ITEM.name = "Burn Ointment"
ITEM.desc = "A bottle filled with burn ointment."
ITEM.uniqueID = "drug_burnointment"
ITEM.model = "models/props_junk/glassjug01.mdl"
ITEM.category = "Drug"
ITEM.duration = 6000
ITEM.price = 30
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.hp = 15

ITEM.stomach = false

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end

ITEM.loot = {
	["Medical"] = true,
}

ITEM.craft = {
	hp = 15,
	
	buffTbl = {
		attrib = {
			["fortitude"] = -3,
			["end"] = 2,
		},
		
		res = {
			["Burn"] = 15,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 4,
}