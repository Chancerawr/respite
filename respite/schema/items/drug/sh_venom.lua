ITEM.name = "Venom"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.material = "models/xqm/woodtexture_1"
ITEM.desc = "A small bottle filled with some kind of liquid, it doesn't look safe."
ITEM.duration = 1
ITEM.price = 30
ITEM.uniqueID = "drug_venom"

ITEM.attribBoosts = {
	["end"] = -10,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3.75,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	item.player:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end)
