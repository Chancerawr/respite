ITEM.name = "Antipsychotics"
ITEM.desc = "A bottle filled with numerous pills."
ITEM.uniqueID = "drug_antipsychotics"
ITEM.model = "models/props_junk/glassjug01.mdl"
ITEM.material = "models/props_c17/furnituremetal001a"
ITEM.duration = 6000
ITEM.price = 30
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

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

ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 4,
}