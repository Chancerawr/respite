ITEM.name = "WP-0NS"
ITEM.desc = "An automatic pistol made out of various scrap parts. It features a illuminated sight and weighs very little, resulting in a harder time compensating for recoil. This sacrifices accuracy for a higher firerate.\nThis variant features a silencer."
ITEM.model = "models/weapons/tfa_w_hk45c.mdl"
ITEM.material = "models/props_wasteland/metal_tram001a"
ITEM.class = "tfa_wp0ns"
ITEM.uniqueID = "tfa_wp0ns"
ITEM.slot = "sidearm"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Pistols"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_revolver"
ITEM.WalkAnim = "walk_revolver"
ITEM.RunAnim = "run_revolver"

--for turn based combat
ITEM.attackRange = 500

ITEM.AttackSounds = {
	"weapons/dmg_m4a1/m4a1-1.wav",
}

ITEM.rarity = 0
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
	pos = Vector(-200, -5, 1.5),
	ang = Angle(0, -0, 0),
	fov = 4.5,
}