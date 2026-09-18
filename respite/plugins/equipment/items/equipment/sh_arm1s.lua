ITEM.name = "AR-M1N"
ITEM.desc = "A compact 12-gauge bullpup revolver shotgun made out of scrap parts. It uses removable 6-round cylindrical magazines. 'Altruit Industries' is engraved on it's stock. This version features a silencer."
ITEM.model = "models/weapons/tfa_w_pancor_jackhammer.mdl"
ITEM.material = "models/props_wasteland/tugboat02"
ITEM.class = "tfa_arm1s"
ITEM.uniqueID = "tfa_arm1s"
ITEM.slot = "primary"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Shotguns"

--for CEnts
ITEM.firearm = true

ITEM.attackRange = 500

ITEM.IdleAnim = "idle_shotgun"
ITEM.WalkAnim = "walk_shotgun"
ITEM.RunAnim = "run_shotgun"

ITEM.AttackSounds = {
	Sound("weapons/m3/m3-1.wav"),
}

ITEM.rarity = 0
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Shotgun"] = 20,
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
	["Shotgun"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 5.5, 3),
	ang = Angle(0, -0, 2),
	fov = 9.5,
}