ITEM.name = "Suitcase"
ITEM.desc = "A robust worn black suitcase."
ITEM.model = "models/weapons/w_suitcase_passenger.mdl"
ITEM.class = "hl2_m_suitcase"
ITEM.uniqueID = "hl2_m_suitcase"
ITEM.weaponCategory = "melee"
ITEM.width = 2
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.salvItem = {
	["j_scrap_cloth"] = 4
}

ITEM.iconCam = {
	pos = Vector(0, 200, -9),
	ang = Angle(0, 270, 0),
	fov = 8,
}

ITEM.functions.Storage = {
  tip = "Use this item for storage",
  icon = "icon16/box.png",
  onRun = function(item)
  	local position = item.player:getItemDropPos()
		
	nut.item.spawn("stor_suitcase", position)
  end
}