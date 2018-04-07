ITEM.name = "Nail Bomb"
ITEM.model = "models/items/grenadeammo.mdl"
ITEM.material = "models/props_interiors/radiator_albedo"
ITEM.desc = "A makeshift shrapnel bomb that uses nails and other sharp pieces of metal to damage foes."
ITEM.class = "tfa_nailbomb"
ITEM.uniqueID = "tfa_nailbomb"
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Grenades"

ITEM.iconCam = {
	pos = Vector(-200, 0, 0.5),
	ang = Angle(0, -0, 0),
	fov = 3.25,
}

--[[
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
		if (item:getOwner() != nil and item:getOwner():getChar():getInv():hasItem("tfa_ch3m0")) then
			return true
		else
			return false
		end
	end
}
--]]