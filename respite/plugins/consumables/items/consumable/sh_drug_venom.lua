ITEM.name = "Venom"
ITEM.desc = "A small bottle filled with a venomous toxin, it needs to enter through a wound to do anything.\nDon't drink it."
ITEM.uniqueID = "drug_venom"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.material = "models/xqm/woodtexture_1"
ITEM.category = "Drug"
ITEM.duration = 6000
ITEM.price = 30
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.hp = -20

ITEM.stomach = false

ITEM.attrib = {
	["end"] = -10,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end

ITEM.loot = {
	["Consumable"] = true,
	["Drug"] = true,
}

ITEM.craft = {
	hp = -50,

	buffTbl = {
		attrib = {
			["end"] = -10,
		},
		
		res = {
			["Poison"] = -10,
			["Sleep"] = 10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3.75,
}