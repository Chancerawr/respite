ITEM.name = "Cactus"
ITEM.uniqueID = "j_cactus_plant"
ITEM.model = "models/props_lab/cactus.mdl"
ITEM.desc = "A plant native to the desert."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.data = { scrapamount = 1 }
ITEM.salvItem = "j_scrap_organic"

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 4.5,
}

ITEM.functions.Harvest = {
	name = "Harvest Flesh",
	tip = "Scrap this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
			item.player:getChar():getInv():add("food_cactus")
		else
			item.player:notify("You don't have any room in your inventory!")
			return false 
		end
		return true
	end
}

ITEM.functions.Name = {
	tip = "Name this item",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		client:requestString("Change Name", "What do you want to name your plant? (This is final)", function(text)
			item:setData("customName", text)
		end, item.name)
		
		return false
	end,
	onCanRun = function(item)
		if (item:getData("customName") != nil) then
			return false
		else
			return true
		end
	end
}