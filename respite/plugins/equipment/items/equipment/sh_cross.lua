ITEM.name = "CR-OSS"
ITEM.desc = "A rigid robust high calibre rifle looking to be built by retrofitting and installing new and more complex parts to the more common CR series rifle. Designed to deliver a single precise and accurate shot at range."
ITEM.model = "models/weapons/tfa_w_snip_m24_6.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.class = "tfa_cross"
ITEM.uniqueID = "tfa_cross"
ITEM.slot = "primary"
ITEM.width = 5
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Snipers"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Sniper"] = 20,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 4
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(-6, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 15,
}