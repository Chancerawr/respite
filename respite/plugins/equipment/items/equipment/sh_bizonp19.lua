ITEM.name = "Bizon PP19"
ITEM.desc = "A Russian designed and produced submachine gun. Sporting a sixty-round helical drum magazine, short, controlled bursts are heavily reccomended for this comparitively light AK-patform sub-machine gun."
ITEM.model = "models/weapons/tfa_w_pp19_bizon.mdl"
ITEM.class = "tfa_bizonp19"
ITEM.slot = "sidearm"
ITEM.width = 2
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

ITEM.AttackSounds = {
	Sound("Weapon_P19.Single"),
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
	["parts_gun"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Pistol"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 6, 2),
	ang = Angle(0, -0, 12),
	fov = 9.5,
}