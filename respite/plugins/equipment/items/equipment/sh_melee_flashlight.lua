ITEM.name = "Flashlight"
ITEM.model = "models/warz/melee/flashlight.mdl"
ITEM.desc = "A regular flashlight with batteries included."
ITEM.class = "respite_flashlight"
ITEM.uniqueID = "flashlight"
ITEM.slot = "melee"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Illumination"

ITEM.dmg = {
	["Blunt"] = 4,
}

ITEM.scaling = {
	["str"] = 0.1,
}

ITEM.salvage = {
	["j_scrap_metals"] = 3,
	["j_scrap_adhesive"] = 1,
	["j_scrap_battery"] = 1,
	["j_scrap_light"] = 1
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Bludgeon"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(-200, 1.5, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}

ITEM:hook("drop", function(item)
	if (item.player:FlashlightIsOn()) then
		item.player:Flashlight(false)
	end
end)