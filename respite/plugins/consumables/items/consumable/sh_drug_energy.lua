ITEM.name = "Energy Pills"
ITEM.desc = "Strange vibrating pills. This drug gives the user a burst of energy.\nAfter it wears off, the user will lose all energy, and collapse for an hour, some experience extreme pain."
ITEM.uniqueID = "drug_energy"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.material = "models/alyx/emptool_glow"
ITEM.duration = 6000
ITEM.price = 200
ITEM.color = Color(50, 255, 50)
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.stomach = false

ITEM.attrib = {
	["stm"] = 10
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(0, 128, 128, 255), 10, 0)
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3.75,
}