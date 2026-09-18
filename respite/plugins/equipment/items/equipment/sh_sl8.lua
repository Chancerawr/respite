ITEM.name = "HK SL8"
ITEM.desc = "A German made, civilian sporting rifle, based off of the G36 series of rifles. Featuring an uncommon single stack magazine, and thumbhole stock."
ITEM.model = "models/weapons/tfa_w_hk_sl8.mdl"
ITEM.class = "tfa_sl8"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Snipers"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_ar2"
ITEM.WalkAnim = "walk_ar2"
ITEM.RunAnim = "run_ar2"

--for turn based combat
ITEM.attackRange = 2000

ITEM.AttackSounds = {
	Sound("Weapon_hksl8.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Sniper"] = 15,
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
	["Sniper"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 11, 2.5),
	ang = Angle(0, -0, 4),
	fov = 14,
}