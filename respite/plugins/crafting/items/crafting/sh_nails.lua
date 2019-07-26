ITEM.name = "Nails"
ITEM.uniqueID = "j_scrap_nails"
ITEM.model = "models/props_junk/garbage_metalcan002a.mdl"
ITEM.desc = "Some nails in a small tin."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 100

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3,
}

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local position = client:getItemDropPos()

		inventory:addSmart("j_scrap_metals", 1, position, {Amount = item:getData("Amount", 1) * 2})

		client:EmitSound("npc/manhack/grind"..math.random(1,5)..".wav", 70, math.random(85,105))
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("kit_salvager")
	end
}

ITEM.functions.Load = { -- sorry, for name order.
	name = "Load",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		item.player:GiveAmmo(item:getData("Amount", 1), "thumper")
		item.player:EmitSound("items/ammo_pickup.wav", 110)
		
		return true
	end,
	onCanRun = function(item)
		if (!item.player:getChar():getInv():getFirstItemOfType("tfa_wasteland_nailgun")) then
			return false
		end
		
		return true
	end
}