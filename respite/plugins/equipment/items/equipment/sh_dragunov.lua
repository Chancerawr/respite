ITEM.name = "SVD Dragunov"
ITEM.desc = "A ruggedly dependable and averagely accurate designated marksman's rifle, developed in the late fifties as a replacement for the SVT-40's role as a marksman's rifle."
ITEM.model = "models/weapons/tfa_w_svd_dragunov.mdl"
ITEM.class = "tfa_dragunov"
ITEM.slot = "primary"
ITEM.width = 5
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
	Sound("Weapon_svd01.Single"),
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
	pos = Vector(-200, 15.5, 4),
	ang = Angle(0, -0, 6),
	fov = 13.5,
}