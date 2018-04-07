ITEM.name = "Paper Towels"
ITEM.uniqueID = "j_paper_towels"
ITEM.model = "models/props/cs_office/Paper_towels.mdl"
ITEM.desc = "A large roll of convenient paper towels."
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 1

ITEM.data = { scrapamount = 1 }

ITEM.salvItem = {
	["j_scrap_cloth"] = 2,
	["misc_paper"] = 1
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 10,
}

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local position = item.player:getItemDropPos()
		
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