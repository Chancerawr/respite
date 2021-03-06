ITEM.name = "Steroid"
ITEM.desc = "A small bottle filled with medical steroids."
ITEM.uniqueID = "drug_steroid"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.duration = 6000
ITEM.price = 200
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.stomach = false

ITEM.attrib = {
	["str"] = 10,
	["end"] = 5,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3.75,
}