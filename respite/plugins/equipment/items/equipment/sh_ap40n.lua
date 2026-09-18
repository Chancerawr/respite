ITEM.name = "AP-40N"
ITEM.desc = "A small compact submachine gun capable of firing 25 round magazines filled with .45 ACP. 'Altruit Industries' is engraved on it's stock."
ITEM.model = "models/weapons/tfa_w_hk_ump45.mdl"
ITEM.material = "models/props_pipes/pipeset_metal02"
ITEM.class = "tfa_ap40n"
ITEM.uniqueID = "tfa_ap40n"
ITEM.slot = "secondary"
ITEM.height = 2
ITEM.width = 2
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
	Sound("tfa_hk_ump45.Single"),
}

ITEM.rarity = 0
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Pistol"] = 9,
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
	pos = Vector(-200, 5, 0),
	ang = Angle(0, -0, 0),
	fov = 14.5,
}