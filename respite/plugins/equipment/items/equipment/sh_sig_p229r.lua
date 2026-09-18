ITEM.name = "SIG Sauer P229R"
ITEM.desc = "A semi-automatic pistol, smaller in size for easier concealment. Similar to the standard model P229, only with the addition of a frame-mounted accessory rail, and a lacking of it's manual decocker."
ITEM.model = "models/weapons/tfa_w_sig_229r.mdl"
ITEM.class = "tfa_sig_p229r"
ITEM.uniqueID = "tfa_sig_p229r"
ITEM.slot = "sidearm"
ITEM.width = 2
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
	Sound("Sauer1_P228.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Pistol"] = 8,
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
	pos = Vector(-200, -5.5, 1.5),
	ang = Angle(0, -0, 0),
	fov = 4.25,
}