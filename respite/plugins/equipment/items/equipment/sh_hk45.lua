ITEM.name = "HK45C"
ITEM.desc = "A compact variant of the popular HK45, designed to be easily concealed, and drawn from concealment. It's just as accurate as it's older brother."
ITEM.model = "models/weapons/tfa_w_hk45c.mdl"
ITEM.class = "tfa_hk45"
ITEM.uniqueID = "tfa_hk45"
ITEM.slot = "sidearm"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Pistols"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_revolver"
ITEM.WalkAnim = "walk_revolver"
ITEM.RunAnim = "run_revolver"

--for turn based combat
ITEM.attackRange = 500

ITEM.AttackSounds = {
	Sound("Weapon_hk45.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Pistol"] = 8,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 1
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Pistol"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, -5, 1.5),
	ang = Angle(0, -0, 0),
	fov = 4.5,
}