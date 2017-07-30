ITEM.name = "Stack of Newspapers"
ITEM.uniqueID = "j_newspaper_stack"
ITEM.model = "models/props/cs_militia/newspaperstack01.mdl"
ITEM.desc = "A large stack of old newspapers."
ITEM.flag = "j"
ITEM.width = 3
ITEM.height = 3

ITEM.salvItem = "j_newspaper"

ITEM.functions.Scrap = {
  tip = "Scrap this item",
  icon = "icon16/cross.png",
  onRun = function(item)
  	local position = item.player:getItemDropPos()
	
	nut.item.spawn(item.salvItem, position)
	nut.item.spawn(item.salvItem, position)
	nut.item.spawn(item.salvItem, position)
	nut.item.spawn(item.salvItem, position)
	item:remove()
	return false
	
	end,
  onCanRun = function(item)
	if (item:getOwner() == nil) then
		return item.player:getChar():hasFlags("q") or item.player:getChar():getInv():hasItem("kit_salvager")
	else
		return item:getOwner():getChar():hasFlags("q") or item:getOwner():getChar():getInv():hasItem("kit_salvager")
	end
  end
}