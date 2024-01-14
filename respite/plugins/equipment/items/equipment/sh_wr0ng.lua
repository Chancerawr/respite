ITEM.name = "WR-0NG"
ITEM.desc = "A fully automatic SMG made out of various scrap parts. It features a drum-magazine capable of holding up to seventy two bullets at a time. Medium weight parts paired with the low calibre ammunition ensures this weapon has little to no recoil."
ITEM.model = "models/weapons/tfa_w_hk_ump45.mdl"
ITEM.material = "models/props_pipes/destroyedpipes01a"
ITEM.class = "tfa_wr0ng"
ITEM.uniqueID = "tfa_wr0ng"
ITEM.slot = "sidearm"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Submachine Guns"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Pistol"] = 8,
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
	pos = Vector(-200, 5, 0),
	ang = Angle(0, -0, 0),
	fov = 14.5,
}