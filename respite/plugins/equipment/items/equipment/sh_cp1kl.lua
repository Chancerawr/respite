ITEM.name = "CP-1KL"
ITEM.desc = "Low capacity high calibre pistol with an extended barrel made out of various pieces of scrap."
ITEM.model = "models/weapons/tfa_w_dmgf_co1911.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01b"
ITEM.class = "tfa_cp1kl"
ITEM.uniqueID = "tfa_cp1kl"
ITEM.slot = "sidearm"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Pistols"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_revolver"
ITEM.WalkAnim = "walk_revolver"
ITEM.RunAnim = "run_revolver"

ITEM.attackRange = 500

ITEM.AttackSounds = {
	Sound("weapons/model500/deagle-1.wav"),
}

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Pistol"] = 6,
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
	pos = Vector(0, 200, -2.5),
	ang = Angle(0, 270, 5),
	fov = 4.5,
}