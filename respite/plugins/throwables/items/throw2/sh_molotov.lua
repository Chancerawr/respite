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
		local client = item.player
	
		if (!client:getChar():getInv():getFirstItemOfType("tfa_ch1l1")) then
			return false
		end
		
		return true
	end
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3,
}