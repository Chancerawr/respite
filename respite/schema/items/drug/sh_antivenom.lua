ITEM.name = "Antivenom"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.desc = "A small bottle filled with some kind of liquid."
ITEM.duration = 100
ITEM.price = 30
ITEM.uniqueID = "drug_antivenom"
ITEM.attribBoosts = {
	["end"] = 10,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	item.player:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end)
