ITEM.name = "Antipsychotics"
ITEM.model = "models/props_junk/glassjug01.mdl"
ITEM.desc = "A bottle filled with numerous pills."
ITEM.uniqueID = "drug_antipsychotics"
ITEM.duration = 100
ITEM.price = 30

ITEM.attribBoosts = {
	["fortitude"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 6),
	ang = Angle(0, -0, 0),
	fov = 2.5,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	item.player:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end)
