ITEM.name = "AAC Honey Badger"
ITEM.desc = "An automatic PDW based off of the AR-15."
ITEM.model = "models/weapons/tfa_w_aac_honeybadger.mdl"
ITEM.class = "tfa_honeybadger"
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

ITEM.attackRange = 500

--for turn based combat
ITEM.attackRange = 500

ITEM.AttackSounds = {
	Sound("Weapon_HoneyB.single"),
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
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Rifle"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 9, 2),
	ang = Angle(0, -0, 0),
	fov = 10.5,
}