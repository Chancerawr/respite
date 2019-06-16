ITEM.name = "Flare - Red"
ITEM.model = "models/items/grenadeammo.mdl"
ITEM.desc = "A flare that emits a bright red light."
ITEM.class = "tfa_fl"
ITEM.uniqueID = "nut_flare"
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Illumination"

ITEM.iconCam = {
	pos = Vector(-200, 0, 0.5),
	ang = Angle(0, -0, 0),
	fov = 3.25,
}

ITEM.functions.Load = { -- sorry, for name order.
	name = "Load",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		item.player:GiveAmmo(1, "SMG1_Grenade")
		item.player:EmitSound("items/ammo_pickup.wav", 110)
		
		return true
		end,
	onCanRun = function(item)
		local client = item.player
		if (!client:getChar():getInv():getFirstItemOfType("tfa_cr0f7")) then
			return false
		end
		
		return true		
	end
}

ITEM.scrapAmt = 3
ITEM.salvItem = "j_scrap_metals"

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local client = item.player
		
		
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
  
		inventory:addSmart(item.salvItem, 1, position, {Amount = item.scrapAmt})
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("kit_salvager")
	end
}