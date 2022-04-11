ITEM.name = "M249 LMG"
ITEM.desc = "A fairly light, Belgian made, belt-fed, fully automatic support weapon. Surprisingly controllable recoil pattern when used from a prone position."
ITEM.model = "models/weapons/tfa_w_m249_machine_gun.mdl"
ITEM.class = "tfa_m249lmg"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Machine Guns"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Rifle"] = 14,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.iconCam = {
	pos = Vector(-200, 8, 2),
	ang = Angle(0, -0, 5),
	fov = 13,
}