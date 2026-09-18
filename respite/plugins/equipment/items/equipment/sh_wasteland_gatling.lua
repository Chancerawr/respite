ITEM.name = "Scavenger Gatling Gun"
ITEM.desc = "Heavy-duty makeshift gatling gun. May take a few moments to begin firing."
ITEM.model = "models/weapons/w_physics.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01b"
ITEM.class = "tfa_wasteland_gatling"
ITEM.uniqueID = "tfa_wasteland_gatling"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Scavenger"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_crossbow"
ITEM.WalkAnim = "walk_crossbow"
ITEM.RunAnim = "run_crossbow"

--for turn based combat
ITEM.attackRange = 750

ITEM.AttackSounds = {
	"weapons/minigun/mini-1.wav",
}

ITEM.rarity = 2
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Rifle"] = 12,
}

ITEM.scaling = {
	["str"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 5
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Rifle"] = 10,
}

ITEM.iconCam = {
	pos = Vector(11.5, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 9.5,
}