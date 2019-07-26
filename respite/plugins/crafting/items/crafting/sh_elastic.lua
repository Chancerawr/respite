ITEM.name = "Elastic"
ITEM.uniqueID = "j_scrap_elastic"
ITEM.model = "models/gibs/manhack_gib05.mdl"
ITEM.material = "phoenix_storms/officewindow_1-1"
ITEM.desc = "Some elastic."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 4.5,
}

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local position = client:getItemDropPos()

		inventory:addSmart("j_scrap_plastics", 1, position, {Amount = item:getData("Amount", 1) * 2})

		client:EmitSound("npc/manhack/grind"..math.random(1,5)..".wav", 70, math.random(85,105))
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("kit_salvager")
	end
}
