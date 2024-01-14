ITEM.name = "Airsoft G36"
ITEM.desc = "An expensive mil-sim spec airsoft G36 for all your wannabe operator needs. Features a fake recoil system and fake cartridges that you get to load individually! Claims to feel like the real thing."
ITEM.ammoString = "Airsoft Pellets"
ITEM.model = "models/weapons/tfa_w_hk_g36c.mdl"
ITEM.class = "tfa_airsoftg36"
ITEM.slot = "primary"
ITEM.width = 3
ITEM.height = 2
ITEM.flag = "v"
ITEM.category = "Weapons - Misc"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Blunt"] = 1,
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
	pos = Vector(-200, 7, 2),
	ang = Angle(0, -0, 5),
	fov = 10,
}
