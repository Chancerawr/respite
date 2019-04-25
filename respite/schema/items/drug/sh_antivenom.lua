ITEM.name = "Antivenom"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.material = "models/combine_advisor/body9"
ITEM.desc = "A small bottle filled with some kind of liquid."
ITEM.duration = 6000
ITEM.price = 30
ITEM.uniqueID = "drug_antivenom"

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3.75,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	item.player:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end)
