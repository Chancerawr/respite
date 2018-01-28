ITEM.name = "Molotov Cocktail"
ITEM.model = "models/props_junk/garbage_glassbottle003a.mdl"
ITEM.desc = "A old bottle filled with a flammable liquid."
ITEM.class = "tfa_molly"
ITEM.uniqueID = "molotov"
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Makeshift"

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
		if (item:getOwner() != nil and item:getOwner():getChar():getInv():hasItem("tfa_ch1l1")) then
			return true
		else
			return false
		end
	end
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3,
}