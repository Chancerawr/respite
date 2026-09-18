ITEM.name = "Scavenger Geiger Gun"
ITEM.desc = "A handmade rifle with a strange design. Somehow you feel like its design makes it stronger against Aberrations, but nothing about its actual parts verifies this."
ITEM.model = "models/weapons/w_snip_g3sg1.mdl"
ITEM.material = "models/props_pipes/destroyedpipes01a"
ITEM.class = "tfa_wasteland_geiger"
ITEM.uniqueID = "tfa_wasteland_geiger"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Scavenger"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_ar2"
ITEM.WalkAnim = "walk_ar2"
ITEM.RunAnim = "run_ar2"

--for turn based combat
ITEM.attackRange = 1500

ITEM.AttackSounds = {
	"weapons/fokku_tc_m14/sg550-1.wav",
}

ITEM.rarity = 2
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
	["fortitude"] = 0.1,
}

ITEM.salvage = {
	["parts_gun"] = 4
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Rifle"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-4, 200, 5.5),
	ang = Angle(0, 270, 0),
	fov = 13,
}
