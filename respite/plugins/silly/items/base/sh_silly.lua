ITEM.name = "Silly Item"
ITEM.model = "models/Items/grenadeAmmo.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = "An item that really doesn't make any sense."
ITEM.category = "Stuff"
ITEM.sound = "items/battery_pickup.wav"

ITEM:hook("use", function(item)
	local sound = item:getData("quantity", item.sound)
	item.player:EmitSound(sound)
end)

ITEM.functions.use = {
	name = "Use",
	tip = "useTip",
	icon = "icon16/cup.png",
	onRun = function(item)
	
	return false --makes it so item is not consumed, allows for multiple silly uses.
	end
}