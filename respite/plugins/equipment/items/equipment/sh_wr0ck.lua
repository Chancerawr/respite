ITEM.name = "WR-0CK"
ITEM.desc = "A pump-action shotgun made out of various scrap parts. A heavy body paired with a slightly longer bore barrel makes firing this weapon easier on the arms. However the lack of a stock may make firing it an issue for amateur shooters."
ITEM.model = "models/weapons/tfa_w_remington_870_tact.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.class = "tfa_wr0ck"
ITEM.uniqueID = "tfa_wr0ck"
ITEM.slot = "sidearm"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Shotguns"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_shotgun"
ITEM.WalkAnim = "walk_shotgun"
ITEM.RunAnim = "run_shotgun"

--for turn based combat
ITEM.attackRange = 500

ITEM.AttackSounds = {
	"weapons/590/m3-1.wav",
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
	["parts_gun"] = 3
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Shotgun"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 14, 1.5),
	ang = Angle(0, -0, 3),
	fov = 16,
}