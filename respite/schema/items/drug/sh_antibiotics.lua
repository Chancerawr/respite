ITEM.name = "Antibiotics"
ITEM.model = "models/healthvial.mdl"
ITEM.desc = "A bottle filled with antibiotics."
ITEM.uniqueID = "drug_antibiotics"
ITEM.duration = 100
ITEM.price = 200
ITEM.attribBoosts = {
	["str"] = 5,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	item.player:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end)
