ITEM.name = "STEN"
ITEM.desc = "A World War II era British sub-machine gun, intended for paratroopers and rear-echelon soldiers."
ITEM.model = "models/weapons/tfa_w_sten.mdl"
ITEM.class = "tfa_sten"
ITEM.slot = "sidearm"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Submachine Guns"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_smg1"
ITEM.WalkAnim = "walk_smg1"
ITEM.RunAnim = "run_smg1"

--for turn based combat
ITEM.attackRange = 500

ITEM.AttackSounds = {
	Sound("Weaponsten.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Pistol"] = 10,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Pistol"] = 10,
}

ITEM.iconCam = {
	pos = Vector(200, 9, 3),
	ang = Angle(180, -0, 180),
	fov = 10,
}