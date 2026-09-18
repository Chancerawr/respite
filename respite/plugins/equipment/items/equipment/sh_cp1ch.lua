ITEM.name = "CP-1CH"
ITEM.desc = "A fully automatic sub-machinegun made out of various scrap parts. This variant has an extended built in suppressor barrel and a stock."
ITEM.model = "models/weapons/tfa_w_hk_mp5.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01b"
ITEM.class = "tfa_cp1ch"
ITEM.uniqueID = "tfa_cp1ch"
ITEM.slot = "sidearm"
ITEM.width = 4
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
	Sound("weapons/mp9/tmp-1.wav"),
}

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
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
	ang = Angle(0, -0, -5),
	fov = 11,
}