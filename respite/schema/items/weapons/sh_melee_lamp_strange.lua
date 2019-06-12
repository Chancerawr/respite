ITEM.name = "Strange Lamp"
ITEM.desc = "You can't quite put your finger on it, but there's something odd about this lamp."
ITEM.model = "models/props_interiors/furniture_lamp01a.mdl"
ITEM.class = "hl2_m_lamp"
ITEM.uniqueID = "hl2_m_lamp_strange"
ITEM.weaponCategory = "melee"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.salvItem = {
	["j_scrap_memory"] = 1,
	["j_scrap_metals"] = 2,
	["j_scrap_cloth"] = 2
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 90),
	fov = 20.5,
}

ITEM.functions.Place = {
	name = "Deploy",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		local grd = ents.Create( "nut_combat_lamp" )
		grd:SetPos(client:getItemDropPos())
		grd:SetAngles(client:GetAngles())
		grd:Spawn()
		grd:SetCreator(client)
	end
}