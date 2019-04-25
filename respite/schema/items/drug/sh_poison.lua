ITEM.name = "Poison"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.material = "phoenix_storms/pack2/interior_sides"
ITEM.desc = "A small bottle filled with a poisonous toxin, it will affect anything that touches it.\nDon't drink it."
ITEM.duration = 6000
ITEM.price = 30
ITEM.uniqueID = "drug_poison"

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
