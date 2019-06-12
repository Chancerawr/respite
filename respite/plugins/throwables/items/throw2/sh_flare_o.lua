ITEM.name = "Flare - Orange"
ITEM.model = "models/items/grenadeammo.mdl"
ITEM.desc = "A flare that emits a bright orange light."
ITEM.class = "tfa_fl_o"
ITEM.uniqueID = "nut_flare_o"
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
		if (item:getOwner() != nil and item:getOwner():getChar():getInv():getFirstItemOfType("tfa_cr0f7")) then
			return true
		else
			return false
		end
	end
}

ITEM.data = { scrapamount = 3 }
ITEM.salvItem = "j_scrap_metals"

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
		return item.player:getChar():hasFlags("q") or item.player:getChar():getInv():getFirstItemOfType("kit_salvager")
	else
		return item:getOwner():getChar():hasFlags("q") or item:getOwner():getChar():getInv():getFirstItemOfType("kit_salvager")
	end
  end
}