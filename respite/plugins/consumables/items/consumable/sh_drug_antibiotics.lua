ITEM.name = "Antibiotics"
ITEM.desc = "A bottle filled with antibiotics."
ITEM.uniqueID = "drug_antibiotics"
ITEM.model = "models/healthvial.mdl"
ITEM.category = "Drug"
ITEM.duration = 6000
ITEM.price = 200
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.hp = 25
ITEM.mp = 10

ITEM.stomach = false

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end

ITEM.loot = {
	["Consumable"] = true,
	["Medical"] = true,
	["Drug"] = true,
}

ITEM.craft = {
	hp = 25,
	mp = 10,
	
	buffTbl = {
		attrib = {
			["fortitude"] = 3,
		},
		
		res = {
			["Disease"] = 15,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}

--