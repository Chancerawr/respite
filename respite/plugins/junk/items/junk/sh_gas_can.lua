ITEM.name = "Fuel"
ITEM.uniqueID = "j_gas_can"
ITEM.model = "models/props_junk/gascan001a.mdl"
ITEM.desc = "A cannister filled with gasoline."
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 2

ITEM.data = { scrapamount = 5 }
ITEM.salvItem = "j_scrap_chems"

ITEM.salvItem = {
	["j_scrap_chems"] = 5,
	["j_scrap_plastics"] = 3
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 10,
}

ITEM.functions.Load = { -- sorry, for name order.
	name = "Load",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		item.player:GiveAmmo(100, "combinecannon")
		item.player:EmitSound("ambient/water/water_spray2.wav", 50)
		
		return true
		end,
	onCanRun = function(item)
		if (item:getOwner() != nil and item:getOwner():getChar():getInv():hasItem("tfa_chafe")) then
			return true
		else
			return false
		end
	end
}