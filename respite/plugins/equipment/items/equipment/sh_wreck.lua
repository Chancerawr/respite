ITEM.name = "WR-ECK"
ITEM.desc = "A semi-automatic rifle made out of various scrap parts. This particular firearm features a double magazine and trigger system. Each firing mechanism operates a separate magazine."
ITEM.model = "models/weapons/tfa_w_fn_fal.mdl"
ITEM.material = "models/props_wasteland/tugboat02"
ITEM.class = "tfa_wreck"
ITEM.uniqueID = "tfa_wreck"
ITEM.slot = "sidearm"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Rifles"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_ar2"
ITEM.WalkAnim = "walk_ar2"
ITEM.RunAnim = "run_ar2"

--for turn based combat
ITEM.attackRange = 1000

ITEM.AttackSounds = {
	"weapons/fokku_tc_m14/sg550-1.wav",
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
	["parts_gun"] = 3
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Rifle"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 12, 2.5),
	ang = Angle(0, -0, 8),
	fov = 13,
}