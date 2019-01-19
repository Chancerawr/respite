ITEM.name = "HK45C"
ITEM.desc = "A compact variant of the popular HK45, designed to be easily concealed, and drawn from concealment. It's just as accurate as it's older brother.\nThis weapon utilizes .45 ACP rounds."
ITEM.model = "models/weapons/tfa_w_hk45c.mdl"
ITEM.class = "tfa_hk45"
ITEM.uniqueID = "tfa_hk45"
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