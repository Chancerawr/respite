ITEM.name = "Bone Shiv"
ITEM.desc = "A makeshift shiv made out of bones."
ITEM.model = "models/gibs/hgibs_scapula.mdl"
ITEM.class = "hl2_m_boneshiv"
ITEM.uniqueID = "hl2_m_boneshiv"
ITEM.weaponCategory = "melee"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"
ITEM.iconCam = {
	pos = Vector(-200, -0.5, 1),
	ang = Angle(0, 0, -90),
	fov = 4
}

ITEM.data = { scrapamount = 2 }
ITEM.salvItem = "j_scrap_bone"

ITEM.functions.Scrap = {
  tip = "Scrap this item",
  icon = "icon16/cross.png",
  onRun = function(item)
    if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
		item.player:getChar():getInv():add(item.salvItem, 1, { Amount = item:getData("scrapamount")})
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