ITEM.name = "PSG-1"
ITEM.desc = "A Designated Marksman variant of the G3A3, initially designed by H&K for German police and counter-terrorism forces."
ITEM.class = "tfa_psg1"
ITEM.slot = "primary"
ITEM.model = "models/weapons/tfa_w_hk_psg1.mdl"
ITEM.width = 6
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
ITEM.attackRange = 5000

ITEM.AttackSounds = {
	Sound("Weapon_psg_1.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Sniper"] = 21,
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
	pos = Vector(-200, 14, 3),
	ang = Angle(0, -0, 6),
	fov = 15,
}