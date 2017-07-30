ITEM.name = "Newspaper"
ITEM.uniqueID = "j_newspaper"
ITEM.model = "models/props_junk/garbage_newspaper001a.mdl"
ITEM.desc = "A typical newspaper talking about current events."
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 2

ITEM.data = { scrapamount = 1 }
ITEM.salvItem = "misc_paper"

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local position = item.player:getItemDropPos()
		
		nut.item.spawn(item.salvItem, position)
		nut.item.spawn(item.salvItem, position)

		return true
	end,
	onCanRun = function(item)
		if (item:getOwner() == nil) then
			return item.player:getChar():hasFlags("q") or item.player:getChar():getInv():hasItem("kit_salvager")
		else
			return item:getOwner():getChar():hasFlags("q") or item:getOwner():getChar():getInv():hasItem("kit_salvager")
		end
	end
	}