ITEM.name = "Cactus"
ITEM.uniqueID = "j_cactus_plant"
ITEM.model = "models/props_lab/cactus.mdl"
ITEM.desc = "A plant native to the desert."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.salvItem = {
	["j_scrap_organic"] = 2
}

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
		local client = item.player
		local position = client:getItemDropPos()
		
		client:getChar():getInv():addSmart("food_cactus", 1, position)
	end
}

ITEM.functions.Name = {
	tip = "Name this item",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		
		local customData = item:getData("custom", {})
		
		client:requestString("Change Name", "What do you want to name your sentry? (This is final)", function(text)
			customData.name = text
			item:setData("custom", customData)
			nut.log.addRaw(client:Name().. " has set name of " ..item.name.. " to " ..text.. ".")
		end, customData.name or item.name)
		
		return false
	end,
	onCanRun = function(item)
		local customData = item:getData("custom", {})
		
		if (customData.name) then
			return false
		else
			return true
		end
		
		return true
	end
}