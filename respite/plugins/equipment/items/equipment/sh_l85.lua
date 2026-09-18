ITEM.name = "L85"
ITEM.desc = "A bullpup assault rifle designed in the UK, based on the SA80 program. Boasts multiple design changes and improvements over the A1 model, this one's magazine won't fall out or melt."
ITEM.model = "models/weapons/tfa_w_l85a2.mdl"
ITEM.class = "tfa_l85"
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
	Sound("Weapon_l85.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Rifle"] = 12,
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
	pos = Vector(-200, 5, 3),
	ang = Angle(0, -0, 4),
	fov = 9.75,
}