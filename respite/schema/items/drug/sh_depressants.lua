ITEM.name = "Depressants"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.material = "models/player/player_chrome1"
ITEM.desc = "A small bottle filled with some pills, there's something odd about them."
ITEM.duration = 3600
ITEM.price = 30
ITEM.uniqueID = "drug_depress"
ITEM.attribBoosts = {
	["fortitude"] = -3,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	item.player:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end)
