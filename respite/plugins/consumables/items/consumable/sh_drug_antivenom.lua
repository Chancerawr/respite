ITEM.name = "Antivenom"
ITEM.desc = "A small bottle filled with some kind of liquid."
ITEM.uniqueID = "drug_antivenom"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.material = "models/combine_advisor/body9"
ITEM.duration = 6000
ITEM.price = 30
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.stomach = false

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3.75,
}