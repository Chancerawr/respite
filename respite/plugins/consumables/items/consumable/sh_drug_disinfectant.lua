ITEM.name = "Disinfectant"
ITEM.desc = "A bottle filled with some kind of disinfectant."
ITEM.uniqueID = "drug_disinfectant"
ITEM.model = "models/props_junk/glassjug01.mdl"
ITEM.category = "Drug"
ITEM.duration = 6000
ITEM.price = 30
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.mp = 3
ITEM.hp = 10

ITEM.stomach = false

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end

ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 4,
}