ITEM.name = "CR-0C5"
ITEM.desc = "Semi automatic rifle made from various scrap parts. A true example of what can be achieved solely by putting your mind and efforts into junk firearms. This one has an extended barrel and a stock."
ITEM.model = "models/weapons/tfa_w_fg42.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.class = "tfa_cr0c5"
ITEM.uniqueID = "tfa_cr0c5"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Machine Guns"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_crossbow"
ITEM.WalkAnim = "walk_crossbow"
ITEM.RunAnim = "run_crossbow"

ITEM.attackRange = 750

ITEM.AttackSounds = {
	Sound("weapons/coltpython/python-1.wav"),
}

ITEM.rarity = 9
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Rifle"] = 12,
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
	pos = Vector(-200, 10, 3),
	ang = Angle(0, -0, 5),
	fov = 11.5,
}