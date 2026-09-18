ITEM.name = "Barret M82"
ITEM.desc = "An American designed and produced anti-materiel rifle chambered in .50BMG. Once used extensively by US Military sniper teams for anti-vehicle and long range anti-personnel operations."
ITEM.class = "tfa_barret_m82"
ITEM.slot = "primary"
ITEM.model = "models/weapons/tfa_w_barret_m82.mdl"
ITEM.width = 6
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Snipers"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_ar2"
ITEM.WalkAnim = "walk_ar2"
ITEM.RunAnim = "run_ar2"

ITEM.attackRange = 5000

ITEM.AttackSounds = {
	Sound("BarretM82.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Sniper"] = 25,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 4
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Sniper"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 17, 4),
	ang = Angle(0, -0, 7),
	fov = 15,
}