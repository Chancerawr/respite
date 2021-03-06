ITEM.name = "Antidepressants"
ITEM.desc = "A small bottle filled with some pills."
ITEM.uniqueID = "drug_antidepressants"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.duration = 6000
ITEM.price = 30
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.stomach = false

ITEM.attrib = {
	["fortitude"] = 3,
}

ITEM.cures = {
	["fort_nost"] = true,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3.75,
}