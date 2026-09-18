ITEM.name = "Intervention"
ITEM.desc = "A long range, precision rifle. Made extensively popular by video games and movies."
ITEM.model = "models/weapons/tfa_w_snip_int.mdl"
ITEM.class = "tfa_intervention"
ITEM.slot = "primary"
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
	Sound("Weapon_INT.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Sniper"] = 20,
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
	pos = Vector(-7, 200, -1),
	ang = Angle(0, 270, 0),
	fov = 14.5,
}