ITEM.name = "Colt Python"
ITEM.desc = "An expertly crafted revolver, from a time when Colt wasn't riding the government contract gravy train. Use both hands when firing, and god help you if you limp-wrist."
ITEM.model = "models/weapons/tfa_w_colt_python.mdl"
ITEM.onGetDropModel = "models/weapons/tfa_w_remington_1858.mdl"
ITEM.class = "tfa_coltpython"
ITEM.weaponCategory = "sidearm"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Pistols"
ITEM.iconCam = {
	pos = Vector(-200, -7.5, 2),
	ang = Angle(0, -0, 0),
	fov = 4.5,
}

function ITEM:onGetDropModel(self)
	return "models/weapons/tfa_w_remington_1858.mdl"
end