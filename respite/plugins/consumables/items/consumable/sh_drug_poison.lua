ITEM.name = "Poison"
ITEM.desc = "A small bottle filled with a poisonous toxin, it will affect anything that touches it.\nDon't drink it."
ITEM.uniqueID = "drug_poison"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.material = "phoenix_storms/pack2/interior_sides"
ITEM.duration = 6000
ITEM.price = 30
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.stomach = false

ITEM.attrib = {
	["end"] = -10,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3.75,
}