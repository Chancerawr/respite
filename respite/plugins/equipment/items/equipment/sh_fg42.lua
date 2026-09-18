ITEM.name = "FG 42"
ITEM.desc = "A very large machine gun."
ITEM.model = "models/weapons/tfa_w_fg42.mdl"
ITEM.class = "tfa_fg42"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Machine Guns"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_crossbow"
ITEM.WalkAnim = "walk_crossbow"
ITEM.RunAnim = "run_crossbow"

--for turn based combat
ITEM.attackRange = 750

ITEM.AttackSounds = {
	Sound("FG42_weapon.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Rifle"] = 17,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 5
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Rifle"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 10, 3),
	ang = Angle(0, -0, 5),
	fov = 11.5,
}