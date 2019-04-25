ITEM.name = "Energy Pills"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.desc = "Strange vibrating pills. This drug gives the user a burst of energy.\nAfter it wears off, the user will lose all energy, and collapse for an hour, some experience extreme pain."
ITEM.duration = 6000
ITEM.uniqueID = "drug_energy"
ITEM.price = 200
ITEM.material = "models/alyx/emptool_glow"
ITEM.color = Color(50, 255, 50)

ITEM.attribBoosts = {
	["stm"] = 10
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3.75,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	item.player:ScreenFade(1, Color(0, 128, 128, 255), 10, 0)
end)
