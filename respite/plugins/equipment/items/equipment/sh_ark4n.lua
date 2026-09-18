ITEM.name = "AR-K4N"
ITEM.desc = "A small pump action shotgun. There's nothing amazing about but it's pretty light, it's probably a good idea to be really close to your enemy due to the really short barrel. 'Altruit Industries' is engraved on it's stock."
ITEM.model = "models/weapons/tfa_w_winchester_1897_trench.mdl"
ITEM.material = "models/props_wasteland/tugboat01"
ITEM.class = "tfa_ark4n"
ITEM.uniqueID = "tfa_ark4n"
ITEM.slot = "primary"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Altruit"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_shotgun"
ITEM.WalkAnim = "walk_shotgun"
ITEM.RunAnim = "run_shotgun"

ITEM.attackRange = 500

ITEM.AttackSounds = {
	Sound("weapons/1897trench/m3-1.wav"),
}

ITEM.rarity = 0
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Shotgun"] = 20,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Shotgun"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 10.5, 2),
	ang = Angle(0, -0, 4.7),
	fov = 8,
}