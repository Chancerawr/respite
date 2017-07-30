ITEM.name = "Flare - Teal"
ITEM.model = "models/items/grenadeammo.mdl"
ITEM.desc = "A flare that emits a bright teal light."
ITEM.class = "tfa_fl_t"
ITEM.uniqueID = "nut_flare_t"
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Illumination"

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
		if (item:getOwner() != nil and item:getOwner():getChar():getInv():hasItem("tfa_cr0f7")) then
			return true
		else
			return false
		end
	end
}