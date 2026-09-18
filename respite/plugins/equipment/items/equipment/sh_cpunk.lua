ITEM.name = "CP-UNK"
ITEM.desc = "Cheap scrap concrete slug pistol. Utilizes a special case device when loading that gets more out of the ammo permitted by its breach loaded design. One handing normally will more than likely break your wrist."
ITEM.model = "models/weapons/tfa_w_sw_model_500.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.class = "tfa_cpunk"
ITEM.uniqueID = "tfa_cpunk"
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

ITEM.attackRange = 500

ITEM.AttackSounds = {
	Sound("gdc/rockets/m202f2.wav"),
}

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Blunt"] = 15,
}

ITEM.scaling = {
	["str"] = 0.25,
	["perception"] = 0.15,
}

ITEM.upgradeSlots = {
	["Firearm"] = true, 
}

ITEM.salvage = {
	["parts_gun"] = 1
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Concrete"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, -9, 2),
	ang = Angle(0, -0, 0),
	fov = 5,
}