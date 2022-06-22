ITEM.name = "Antipsychotics"
ITEM.desc = "A bottle filled with numerous pills."
ITEM.uniqueID = "drug_antipsychotics"
ITEM.model = "models/props_junk/glassjug01.mdl"
ITEM.material = "models/props_c17/furnituremetal001a"
ITEM.category = "Drug"
ITEM.duration = 6000
ITEM.price = 30
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.mp = 15

ITEM.stomach = false

ITEM.attrib = {
	["fortitude"] = 10,
}

ITEM.cures = {
	["fort_pani"] = true,
	["fort_nost"] = true,
	["fort_conf"] = true,
	["fort_hall"] = true,
	["fort_noia"] = true,
	["fort_insa"] = true,
	["fort_enrage"] = true,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end

ITEM.loot = {
	["Consumable"] = 10,
	["Drug"] = 4,
}
	
ITEM.craft = {
	mp = 15,

	buffTbl = {
		attrib = {
			["fortitude"] = 5,
		},
		
		res = {
			["Mind"] = 20,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 4,
}