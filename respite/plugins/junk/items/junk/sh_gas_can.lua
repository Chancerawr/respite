ITEM.name = "Fuel"
ITEM.uniqueID = "j_fuel"
ITEM.model = "models/props_junk/gascan001a.mdl"
ITEM.desc = "A cannister filled with gasoline."
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 2

ITEM.salvItem = {
	["j_scrap_chems"] = 3,
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
		local client = item.player
	
		if (!client:getChar():getInv():getFirstItemOfType("tfa_chafe")) then
			return false
		end
		
		return true
	end
}