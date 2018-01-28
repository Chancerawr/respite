ITEM.name = "Disinfectant"
ITEM.model = "models/props_junk/glassjug01.mdl"
ITEM.desc = "A bottle filled with some kind of disinfectant."
ITEM.uniqueID = "drug_disinfectant"
ITEM.duration = 3600
ITEM.price = 30

ITEM.attribBoosts = {
	["medical"] = 10,
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
