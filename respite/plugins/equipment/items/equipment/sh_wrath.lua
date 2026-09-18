ITEM.name = "WR-ATH"
ITEM.desc = "A fully automatic LMG with an illuminated sight. It's very heavy, but has a very high ammo capacity. While recoil isn't hard to manage, this weapon is cumbersome at the best of times."
ITEM.model = "models/weapons/tfa_w_mach_russ_pkm.mdl"
ITEM.material = "models/props_wasteland/lighthouse_stairs"
ITEM.class = "tfa_wrath"
ITEM.uniqueID = "tfa_wrath"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Machine Guns"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_crossbow"
ITEM.WalkAnim = "walk_crossbow"
ITEM.RunAnim = "run_crossbow"

--for turn based combat
ITEM.attackRange = 500

ITEM.AttackSounds = {
	"weapons/luger/luger-1.wav",
}

ITEM.rarity = 0
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Rifle"] = 14,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
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
	pos = Vector(3, 200, 0),
	ang = Angle(0, 270, 9),
	fov = 13,
}