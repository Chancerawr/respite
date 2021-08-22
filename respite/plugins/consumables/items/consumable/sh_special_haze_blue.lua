ITEM.name = "Bottled Blue Haze"
ITEM.desc = "A gaseous, hallucinogenic substance, individuals that make contact with the blue haze may see vivid hallucinations for an hour or so."
ITEM.uniqueID = "haze_bottled"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.material = "models/xqm/boxfull_diffuse"
ITEM.duration = 6000
ITEM.price = 200
ITEM.color = Color(50, 50, 255)
ITEM.sound = "hl1/ambience/steamburst1.wav"

ITEM.disease = "addict_bh"
ITEM.disChance = 10

ITEM.stomach = false
ITEM.noEnhance = true

ITEM.attrib = {
	["fortitude"] = 4,
	["end"] = -2,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(100, 255, 100, 255), 10, 0)
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}