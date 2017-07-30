ITEM.name = "Bottled Blue Haze"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.desc = "A gaseous, hallucinogenic substance, individuals that make contact with the blue haze may see vivid hallucinations for an hour or so."
ITEM.duration = 3600
ITEM.uniqueID = "haze_bottled"
ITEM.price = 200
ITEM.material = "models/xqm/boxfull_diffuse"
ITEM.attribBoosts = {
	["fortitude"] = 5,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("hl1/ambience/steamburst1.wav")
	item.player:ScreenFade(1, Color(100, 255, 100, 255), 10, 0)
end)