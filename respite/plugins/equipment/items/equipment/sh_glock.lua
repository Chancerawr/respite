ITEM.name = "Glock 18"
ITEM.desc = "A select-fire, striker-fired pistol with a fuck-huge fire selector on the left side of the pistol. Equipped with thirty round extended magazines, and a lack of a manual safety. Keep out of reach of children, immature adults, tweens and teenagers."
ITEM.model = "models/weapons/tfa_w_dmg_glock.mdl"
ITEM.class = "tfa_glock"
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
	Sound("Dmgfok_glock.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
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
	pos = Vector(0, 200, -4.5),
	ang = Angle(0, 270, 5),
	fov = 6.5,
}