ITEM.name = "CH-34T"
ITEM.desc = "Heavy bullpup concrete slug carbine. Hits hard with heavy concrete slug rounds, but useless at longer range as the heavy rounds have a lot of drop."
ITEM.model = "models/weapons/tfa_w_magpul_pdr.mdl"
ITEM.material = "models/props_pipes/pipesystem01a_skin1"
ITEM.class = "tfa_ch34t"
ITEM.uniqueID = "tfa_ch34t"
ITEM.slot = "primary"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Misc"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Blunt"] = 20,
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
}

ITEM.iconCam = {
	pos = Vector(-200, 1.7, 2.5),
	ang = Angle(0, -0, 6),
	fov = 7,
}