ITEM.name = "Scoped Raging Bull"
ITEM.desc = "A powerful revolver, noted for it's reliability and accuracy. This one has a scope attached."
ITEM.model = "models/weapons/tfa_w_raging_bull_scoped.mdl"
ITEM.class = "tfa_scoped_taurus"
ITEM.slot = "sidearm"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Pistols"

ITEM.IdleAnim = "idle_revolver"
ITEM.WalkAnim = "walk_revolver"
ITEM.RunAnim = "run_revolver"

--for turn based combat
ITEM.attackRange = 750

ITEM.AttackSounds = {
	Sound("weapon_r_bull.single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Magnum"] = 10,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 1
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Magnum"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 9, 3),
	ang = Angle(0, -0, 0),
	fov = 5.5,
}