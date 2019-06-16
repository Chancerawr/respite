ITEM.name = "Explosive Grenade"
ITEM.model = "models/items/grenadeammo.mdl"
ITEM.desc = "An explosive grenade capable of dealing massive damage."
ITEM.class = "tfa_exnade"
ITEM.uniqueID = "nut_explosivegrenade"
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Grenades"

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
		if (!client:getChar():getInv():getFirstItemOfType("tfa_ch3m0")) then
			return false
		end
		
		return true
	end
}