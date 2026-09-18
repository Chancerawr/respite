ITEM.name = "AP-2RT"
ITEM.desc = "A large triple barreled handcannon with a really strange and complex design alongside a large caliber for you to use, your hand might dislike it though. 'Altruit Industries' is engraved on it's grip."
ITEM.model = "models/weapons/tfa_w_sw_model_500.mdl"
ITEM.material = "models/props_wasteland/metal_tram001a"
ITEM.class = "tfa_ap2rt"
ITEM.uniqueID = "tfa_ap2rt"
ITEM.slot = "secondary"
ITEM.height = 1
ITEM.width = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Altruit"

--for CEnts
ITEM.firearm = true

ITEM.IdleAnim = "idle_revolver"
ITEM.WalkAnim = "walk_revolver"
ITEM.RunAnim = "run_revolver"

ITEM.attackRange = 500

ITEM.AttackSounds = {
	"weapons/fokku_tc_deagle/deagle-1.wav",
}

ITEM.rarity = 0
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Pistol"] = 20,
}

ITEM.scaling = {
	["str"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Pistol"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, -9, 2),
	ang = Angle(0, -0, 0),
	fov = 7,
}