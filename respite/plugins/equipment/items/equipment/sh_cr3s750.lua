ITEM.name = "CR-3S7-50"
ITEM.desc = "A makeshift break action single shot .50 BMG hunting rifle with a long barrel and stock built from various scrap parts. Appears to be based off the much more compact CR-3ST."
ITEM.model = "models/weapons/tfa_w_g2_contender.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.class = "tfa_cr3s750"
ITEM.uniqueID = "tfa_cr3s750"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Rifles"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_revolver"
ITEM.WalkAnim = "walk_revolver"
ITEM.RunAnim = "run_revolver"

ITEM.AttackSounds = {
	Sound("weapons/m82/barret50-1.wav"),
}

ITEM.rarity = 5
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Sniper"] = 16,
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
	["Sniper"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 11.5, 2.8),
	ang = Angle(0, -0, 0),
	fov = 10,
}