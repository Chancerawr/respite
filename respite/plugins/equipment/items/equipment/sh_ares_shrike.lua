ITEM.name = "Ares Shrike"
ITEM.desc = "A belt-fed, select fire support weapon, based upon the AR-15 platform of rifles. Capable of a startling rate of fire, brace yourself before firing."
ITEM.class = "tfa_ares_shrike"
ITEM.slot = "primary"
ITEM.model = "models/weapons/tfa_w_ares_shrike.mdl"
ITEM.width = 4
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Machine Guns"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_crossbow"
ITEM.WalkAnim = "walk_crossbow"
ITEM.RunAnim = "run_crossbow"

ITEM.attackRange = 750

ITEM.AttackSounds = {
	Sound("Weapon_shrk.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Rifle"] = 20,
}

ITEM.scaling = {
	["str"] = 0.2,
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
	pos = Vector(-200, 11, 0),
	ang = Angle(0, -0, 5),
	fov = 11.5,
}