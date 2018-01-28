ITEM.name = "Branch"
ITEM.desc = "A wooden branch pulled off a tree."
ITEM.model = "models/props/cs_office/Snowman_arm.mdl"
ITEM.class = "hl2_m_branch"
ITEM.uniqueID = "hl2_m_branch"
ITEM.weaponCategory = "melee"
ITEM.width = 1
ITEM.height = 4
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.iconCam = {
	pos = Vector(128.44482421875, 107.6841506958, 78.216918945313),
	ang = Angle(25, 220, 0),
	fov = 4,
}

ITEM.data = { scrapamount = 4 }
ITEM.salvItem = "j_scrap_wood"

ITEM.functions.Scrap = {
  tip = "Scrap this item",
  icon = "icon16/cross.png",
  onRun = function(item)
    if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
		item.player:getChar():getInv():add(item.salvItem, 1, { Amount = item:getData("scrapamount") })
		item:remove()
		return false 
    else
		item.player:notify("You don't have any room in your inventory!")
		return false 
    end
  end,
  onCanRun = function(item)
	if (item:getOwner() == nil) then
		return item.player:getChar():hasFlags("q") or item.player:getChar():getInv():hasItem("kit_salvager")
	else
		return item:getOwner():getChar():hasFlags("q") or item:getOwner():getChar():getInv():hasItem("kit_salvager")
	end
  end
}