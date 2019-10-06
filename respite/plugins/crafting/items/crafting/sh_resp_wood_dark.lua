ITEM.name = "Darkened Wood"
ITEM.uniqueID = "j_dark_wood"
ITEM.model = "models/gibs/wood_gib01a.mdl"
ITEM.material = "models/effects/portalrift_sheet"
ITEM.desc = "A strange black wood, it gives off an eerie feeling."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 20
ITEM.color = Color(0, 0, 0)

ITEM.data = {
	Amount = 1
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 18,
}

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local position = client:getItemDropPos()
		
		if(math.random(1,10) == 1) then
			inventory:addSmart("blight", 1, position, {Amount = item:getData("Amount")})
		else
			inventory:addSmart("j_scrap_wood", 1, position, {Amount = item:getData("Amount")})
		end
		
		client:EmitSound("npc/manhack/grind"..math.random(1,5)..".wav", 70, math.random(85,105))
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("kit_salvager")
	end
}