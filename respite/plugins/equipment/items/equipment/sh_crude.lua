ITEM.name = "CR-UDE"
ITEM.desc = "A three round revolver made from various scrap parts. What looked like the hammer at first glance would turn out to be some strange rudimentary safety lever."
ITEM.model = "models/weapons/tfa_w_remington_1858.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.class = "tfa_crude"
ITEM.uniqueID = "tfa_crude"
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
	Sound("weapons/tact870/m3-1.wav"),
}

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Magnum"] = 10,
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
	["Magnum"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, -9.5, 2),
	ang = Angle(0, -0, 0),
	fov = 5,
}