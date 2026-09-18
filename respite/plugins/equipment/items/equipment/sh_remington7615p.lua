ITEM.name = "Remington 7615P"
ITEM.desc = "A pump action patrol rifle, utilizing a scaled down 870 action."
ITEM.model = "models/weapons/tfa_w_remington_7615p.mdl"
ITEM.class = "tfa_remington7615p"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Shotguns"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_shotgun"
ITEM.WalkAnim = "walk_shotgun"
ITEM.RunAnim = "run_shotgun"

--for turn based combat
ITEM.attackRange = 500

ITEM.AttackSounds = {
	Sound("7615p_remington.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Shotgun"] = 15,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 3
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Shotgun"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 10, 2.5),
	ang = Angle(0, -0, 6),
	fov = 16,
}