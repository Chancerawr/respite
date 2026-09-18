ITEM.name = "AR-M4S"
ITEM.desc = "A compact automatic bullpup revolver made out of scrap parts. It uses removable 60-round cylindrical magazines. 'Altruit Industries' is engraved on it's stock. This variant is shortened and silenced."
ITEM.model = "models/weapons/tfa_w_pancor_jackhammer.mdl"
ITEM.material = "models/props_pipes/pipesystem01a_skin2"
ITEM.class = "tfa_arm4s"
ITEM.uniqueID = "tfa_arm4s"
ITEM.slot = "secondary"
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

ITEM.AttackSounds = {
	Sound("weapons/mp5navy/mp5-1.wav"),
}

ITEM.rarity = 0
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
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
	pos = Vector(-200, 5.5, 3),
	ang = Angle(0, -0, 2),
	fov = 9.5,
}