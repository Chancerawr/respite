ITEM.name = "Thompson"
ITEM.desc = "A pre-World War II era American sub-machine gun chambered in .45 ACP. Commonly referred to as the, 'Chicago Typewriter' during its use before the repeal of Prohibition."
ITEM.model = "models/weapons/tfa_w_tommy_gun.mdl"
ITEM.class = "tfa_thompson"
ITEM.slot = "sidearm"
ITEM.width = 4
ITEM.height = 2
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
	["Pistol"] = 12,
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
	pos = Vector(-200, 5.5, 2),
	ang = Angle(0, -0, 14),
	fov = 11,
}