ITEM.name = "AN-94"
ITEM.desc = "A Russian designed and produced prototype assault rifle. Utilizing a reciprocating barrel and internal pulley system to function. Alarmingly accurate, and capable of producing a staggering rate of fire when utilized with it's two-round burst firemode."
ITEM.ammoString = "5.45x39mm rounds"
ITEM.model = "models/weapons/tfa_w_rif_an_94.mdl"
ITEM.class = "tfa_an94"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Rifles"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_ar2"
ITEM.WalkAnim = "walk_ar2"
ITEM.RunAnim = "run_ar2"

ITEM.attackRange = 1000

ITEM.AttackSounds = {
	Sound("an94.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
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
	pos = Vector(4.5, 200, -1.5),
	ang = Angle(0, 270, 10),
	fov = 13,
}