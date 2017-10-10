ITEM.name = "Cold Can"
ITEM.uniqueID = "food_soda_cold"
ITEM.model = "models/props_junk/garbage_glassbottle003a.mdl"
ITEM.material = "models/props/cs_office/clouds"
ITEM.hungerAmount = 4
ITEM.foodDesc = "A very cold can, the liquid inside is some kind of slushy substance, it is incredibly tasty, but also very, very cold."
ITEM.quantity = 2
ITEM.price = 2
ITEM.width = 1
ITEM.height = 2
ITEM.cookable = false
ITEM.sound = "hl1/ambience/steamburst1.wav"

ITEM.container = "j_empty_soda_can"
 

local function onUse(item)
	item.player:ScreenFade(1, Color(150, 150, 150, 100), .4, 0)
end

ITEM:hook("use", onUse)

ITEM.attribBoosts = { ["stm"] = -5 }