ITEM.name = "M4A1 Iron"
ITEM.desc = "A select-fire, carbine variant of the wildly popular AR platform of rifles with a comfier pistol grip."
ITEM.model = "models/weapons/tfa_w_m4a1_iron.mdl"
ITEM.class = "tfa_m4a1"
ITEM.uniqueID = "tfa_m4a1"
ITEM.slot = "primary"
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
	Sound("Dmgfok_M4A1.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Rifle"] = 12,
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
	pos = Vector(4.5, 200, 0.5),
	ang = Angle(0, 270, 10),
	fov = 12.5,
}