ITEM.name = "Thompson Contender G2"
ITEM.desc = "A small, single shot, break-action pistol with a mounted scope. Perfect for taking down medium sized game at medium ranges."
ITEM.model = "models/weapons/tfa_w_g2_contender.mdl"
ITEM.class = "tfa_contender"
ITEM.slot = "primary"
ITEM.width = 3
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
	["Sniper"] = 12,
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
	pos = Vector(-200, 11.5, 2.8),
	ang = Angle(0, -0, 0),
	fov = 10,
}