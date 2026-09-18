ITEM.name = "Striker 12"
ITEM.desc = "A South-African produced rotary drum, semi-automatic shotgun. It's bulky, it takes a long time to reload, but man does it pack a punch."
ITEM.model = "models/weapons/tfa_w_striker_12g.mdl"
ITEM.class = "tfa_striker12"
ITEM.slot = "primary"
ITEM.width = 3
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Shotguns"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_shotgun"
ITEM.WalkAnim = "walk_shotgun"
ITEM.RunAnim = "run_shotgun"

--for turn based combat
ITEM.attackRange = 500

ITEM.AttackSounds = {
	Sound("ShotStriker12.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Shotgun"] = 20,
}

ITEM.scaling = {
	["str"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 3
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Shotgun"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 6.5, 1),
	ang = Angle(0, -0, 5),
	fov = 11,
}