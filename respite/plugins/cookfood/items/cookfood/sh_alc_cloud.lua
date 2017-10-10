ITEM.name = "Bottled Cloud"
ITEM.uniqueID = "alc_cloud"
ITEM.model = "models/props_junk/garbage_glassbottle003a.mdl"
ITEM.material = "models/props/cs_office/clouds"
ITEM.hungerAmount = 4
ITEM.foodDesc = "A glass bottle filled with something strange."
ITEM.quantity = 2
ITEM.price = 2
ITEM.width = 1
ITEM.height = 2
ITEM.cookable = false
ITEM.sound = "hl1/ambience/steamburst1.wav"

ITEM.container = "j_empty_beer"
 

local function onUse(item)
	item.player:ScreenFade(1, Color(150, 150, 150, 100), .4, 0)
end

ITEM:hook("use", onUse)

ITEM.attribBoosts = { ["fortitude"] = 5, ["end"] = 5, ["agility"] = 5, ["str"] = -5, ["perception"] = -5 }