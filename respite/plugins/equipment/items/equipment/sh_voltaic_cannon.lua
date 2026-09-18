ITEM.name = "Voltaic Cannon"
ITEM.desc = "A strange device that strongly resembles a CH-3CK."
ITEM.model = "models/mechanics/solid_steel/box_beam_4.mdl"
ITEM.material = "models/props_combine/tprings_sheet"
ITEM.class = "tfa_voltaic"
ITEM.uniqueID = "tfa_voltaic"
ITEM.slot = "primary"
ITEM.width = 5
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Misc"

ITEM.IdleAnim = "idle_crossbow"
ITEM.WalkAnim = "walk_crossbow"
ITEM.RunAnim = "run_crossbow"

--for turn based combat
ITEM.attackRange = 1500

ITEM.AttackSounds = {
	"weapons/stinger_fire1.wav",
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Electric"] = 100,
}

ITEM.scaling = {
	["medical"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 10,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 20,
}