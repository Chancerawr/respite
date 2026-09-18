ITEM.name = "G36"
ITEM.desc = "A German carbine, intended for rear echelon troops, commandos, and polizei alike. Boasts tight tolerances and dependable accuracy. Tends to overheat and become inoperable in desert environments."
ITEM.model = "models/weapons/tfa_w_hk_g36c.mdl"
ITEM.class = "tfa_g36"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Rifles"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_ar2"
ITEM.WalkAnim = "walk_ar2"
ITEM.RunAnim = "run_ar2"

--for turn based combat
ITEM.attackRange = 1000

ITEM.AttackSounds = {
	Sound("G36.single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Rifle"] = 14,
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
	["Rifle"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 7, 2),
	ang = Angle(0, -0, 5),
	fov = 10,
}