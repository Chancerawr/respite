ITEM.name = "CR-1CK"
ITEM.desc = "Fully automatic carbine variant of the CR-0CK. Features a high firerate, and then an experimental motorized burst mode with an even higher firerate. No, we're not joking."
ITEM.model = "models/weapons/tfa_w_fg42.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01b"
ITEM.class = "tfa_cr1ck"
ITEM.uniqueID = "tfa_cr1ck"
ITEM.slot = "primary"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Rifles"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_ar2"
ITEM.WalkAnim = "walk_ar2"
ITEM.RunAnim = "run_ar2"

ITEM.attackRange = 1000

ITEM.AttackSounds = {
	Sound("weapons/twinkie_hk416/m4a1_unsil-1.wav"),
}

ITEM.rarity = 8
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
	["parts_gun"] = 3
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Rifle"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 9, 2.5),
	ang = Angle(0, -0, 5),
	fov = 10,
}