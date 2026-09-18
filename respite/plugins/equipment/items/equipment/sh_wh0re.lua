ITEM.name = "WH-0RE"
ITEM.desc = "A semi-automatic shotgun with a questionable name made out of scrap parts. It features a highlighted aiming reticle and can fire in two-round bursts."
ITEM.model = "models/weapons/tfa_w_winchester_1873.mdl"
ITEM.material = "models/props_canal/metalwall005b"
ITEM.class = "tfa_wh0re"
ITEM.uniqueID = "tfa_wh0re"
ITEM.slot = "primary"
ITEM.width = 3
ITEM.height = 1
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
	"weapons/jackhammer/xm1014-1.wav",
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
	pos = Vector(-200, 12, 2),
	ang = Angle(0, -0, 5),
	fov = 14.5,
}