ITEM.name = "Colt 1911"
ITEM.desc = "An American made pistol whose design has stood the test of time. Suppressor and lighter attachment not included."
ITEM.model = "models/weapons/tfa_w_dmgf_co1911.mdl"
ITEM.class = "tfa_colt1911"
ITEM.uniqueID = "tfa_colt1911"
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

ITEM.attackRange = 500

ITEM.AttackSounds = {
	Sound("Dmgfok_co1911.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Pistol"] = 6.5,
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
	pos = Vector(0, 200, -2.5),
	ang = Angle(0, 270, 5),
	fov = 4.5,
}