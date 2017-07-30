ITEM.name = "Map"
ITEM.uniqueID = "j_map"
ITEM.model = "models/props_c17/paper01.mdl"
ITEM.desc = "An old paper map."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.material = "models/props_canal/canalmap_sheet"

ITEM.salvItem = "misc_paper"

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local position = item.player:getItemDropPos()
		
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