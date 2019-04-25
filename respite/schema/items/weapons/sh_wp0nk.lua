ITEM.name = "WP-0NK"
ITEM.desc = "An automatic pistol made out of various scrap parts. It features a illuminated sight and weighs very little, resulting in a harder time compensating for recoil. This sacrifices accuracy for a higher firerate.\nThis weapon utilizes .45 ACP rounds."
ITEM.model = "models/weapons/tfa_w_hk45c.mdl"
ITEM.material = "models/props_wasteland/metal_tram001a"
ITEM.class = "tfa_wp0nk"
ITEM.uniqueID = "tfa_wp0nk"
ITEM.weaponCategory = "sidearm"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Pistols"

ITEM.iconCam = {
	pos = Vector(-200, -5, 1.5),
	ang = Angle(0, -0, 0),
	fov = 4.5,
}

ITEM.holsterDrawInfo = {
	model = ITEM.model,
	bone = "ValveBiped.Bip01_R_Thigh",
	ang = Angle(270, 90, 180),
	pos = Vector(-2, -1, -5),
}