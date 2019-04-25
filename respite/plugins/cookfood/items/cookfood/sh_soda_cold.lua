ITEM.name = "Cold Can"
ITEM.uniqueID = "food_soda_cold"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.material = "models/props/cs_office/clouds"
ITEM.hungerAmount = 4
ITEM.desc = "A very cold can, the liquid inside is some kind of slushy substance, it is incredibly tasty, but also very, very cold."
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.width = 1
ITEM.height = 1
ITEM.cookable = false
ITEM.sound = "hl1/ambience/steamburst1.wav"
ITEM.container = "j_empty_soda_can"

ITEM.attribBoosts = { 
	["stm"] = -5
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 2.5,
}

local function onUse(item)
	item.player:ScreenFade(1, Color(150, 150, 150, 100), 2, 0)
end

ITEM:hook("use", onUse)