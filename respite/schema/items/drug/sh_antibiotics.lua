ITEM.name = "Antibiotics"
ITEM.model = "models/healthvial.mdl"
ITEM.desc = "A bottle filled with antibiotics."
ITEM.uniqueID = "drug_antibiotics"
ITEM.duration = 6000
ITEM.price = 200

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	item.player:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end)
