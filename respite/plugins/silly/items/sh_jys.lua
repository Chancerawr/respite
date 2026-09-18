ITEM.name = "Jusagi Your Self"
ITEM.desc = "A button that you really should not press."
ITEM.uniqueID = "silly_jys"
ITEM.model = "models/dav0r/buttons/button.mdl"
ITEM.category = "Weird"
ITEM.color = Color(255, 25, 25)

ITEM.price = 15

ITEM.functions.Press = {
	name = "Press",
	tip = "Jusagi Your Chan",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		
		local PLUGIN = nut.plugin.list["silly"]
		
		local death = PLUGIN:GetRandomDeath()
		
		death(_, client)
		
		return false
	end,
}