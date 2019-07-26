ITEM.name = "Light Bulbs"
ITEM.uniqueID = "j_scrap_light"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.desc = "A box of lightbulbs."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 10

ITEM.iconCam = {
	pos = Vector(89.432174682617, 74.904991149902, 54.501823425293),
	ang = Angle(25, 220, 0),
	fov = 5,
}

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local position = client:getItemDropPos()

		if(math.random(0,1) == 1) then
			inventory:addSmart("j_scrap_elecs", 1, position, {Amount = item:getData("Amount", 1)})
		else
			inventory:addSmart("j_scrap_glass", 1, position, {Amount = item:getData("Amount", 1)})
		end
		
		client:EmitSound("npc/manhack/grind"..math.random(1,5)..".wav", 70, math.random(85,105))
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("kit_salvager")
	end
}