ITEM.name = "M60 Machine Gun"
ITEM.desc = "A fully automatic, yet slow-firing General Purpose Machine Gun from the Vietnam war era, Better known by many as 'the Pig'. Its recoil is substantial, and jams frequently without consistent maintenance."
ITEM.model = "models/weapons/tfa_w_m60_machine_gun.mdl"
ITEM.class = "tfa_m60"
ITEM.slot = "primary"
ITEM.width = 5
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
ITEM.attackRange = 750

ITEM.AttackSounds = {
	Sound("Weapon_M_60.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Rifle"] = 16,
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
	pos = Vector(-200, 12.5, 5),
	ang = Angle(0, -0, 7),
	fov = 15,
}