ITEM.name = "AI AW50"
ITEM.desc = "A UK produced bolt action rifle chambered in .50BMG. Designed for anti-material and long range anti-infantry operations."
ITEM.model = "models/weapons/tfa_w_acc_int_aw50.mdl"
ITEM.class = "tfa_aw50"
ITEM.uniqueID = "tfa_aw50"
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

ITEM.attackRange = 5000

ITEM.AttackSounds = {
	Sound("Weaponaw50.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Sniper"] = 25,
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
	pos = Vector(-200, 14.5, 2),
	ang = Angle(0, -0, 6),
	fov = 16.5,
}