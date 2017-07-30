ITEM.name = "Empty Bread Box"
ITEM.uniqueID = "j_empty_bread_box"
ITEM.model = "models/props/cs_office/cardboard_box03.mdl"
ITEM.desc = "An empty cardboard box."
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 1

ITEM.data = { scrapamount = 1 }
ITEM.salvItem = "misc_paper"

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local position = item.player:getItemDropPos()
		
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