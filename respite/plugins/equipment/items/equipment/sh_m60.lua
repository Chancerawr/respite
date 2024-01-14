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

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
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
}

ITEM.iconCam = {
	pos = Vector(-200, 12.5, 5),
	ang = Angle(0, -0, 7),
	fov = 15,
}