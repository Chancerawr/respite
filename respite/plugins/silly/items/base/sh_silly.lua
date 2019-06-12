ITEM.name = "Silly Item"
ITEM.model = "models/Items/grenadeAmmo.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = "An item that really doesn't make any sense."
ITEM.category = "Stuff"
ITEM.sound = "items/battery_pickup.wav"

ITEM:hook("use", function(item)
	item.player:EmitSound(item.sound)
end)

ITEM.functions.use = {
	name = "Use",
	tip = "useTip",
	icon = "icon16/cup.png",
	onRun = function(item)
		item:setData("producing", CurTime())
		timer.Simple(600, function()
			item:setData("producing", nil)
		end)
	
		return false --makes it so item is not consumed, allows for multiple silly uses.
	end,
	onCanRun = function(item)
		local prodTime = 600
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}