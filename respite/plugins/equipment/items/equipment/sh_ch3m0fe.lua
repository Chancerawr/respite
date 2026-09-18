ITEM.name = "CH-3M0"
ITEM.desc = "The old school scrap launcher but the barrels are replaced with very thick metal and containing a single .50 BMG each. Pretty heavy, but it comes off as a .50 BMG revolver."
ITEM.uniqueID = "tfa_ch3m0fe"
ITEM.model = "models/weapons/tfa_w_striker_12g.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01a"
ITEM.class = "tfa_ch3m0fe"
ITEM.uniqueID = "tfa_ch3m0fe"
ITEM.width = 3
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.slot = "primary"
ITEM.category = "Weapons - Misc"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_crossbow"
ITEM.WalkAnim = "walk_crossbow"
ITEM.RunAnim = "run_crossbow"

ITEM.attackRange = 1000

ITEM.AttackSounds = {
	Sound("weapons/fokku_tc_deagle/deagle-1.wav"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Sniper"] = 20,
}

ITEM.scaling = {
	["medical"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Sniper"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 6.5, 1),
	ang = Angle(0, -0, 5),
	fov = 11,
}