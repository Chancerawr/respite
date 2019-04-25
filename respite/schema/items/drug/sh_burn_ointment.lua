ITEM.name = "Burn Ointment"
ITEM.model = "models/props_junk/glassjug01.mdl"
ITEM.desc = "A bottle filled with burn ointment."
ITEM.uniqueID = "drug_burnointment"
ITEM.duration = 6000
ITEM.price = 30

ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 4,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	item.player:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end)
