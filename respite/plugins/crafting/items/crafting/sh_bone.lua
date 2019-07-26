ITEM.name = "Bones"
ITEM.uniqueID = "j_scrap_bone"
ITEM.model = "models/props_lab/jar01a.mdl"
ITEM.material = "models/props_c17/furnituremetal001a"
ITEM.desc = "Some collected bones."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 30

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local position = client:getItemDropPos()

		inventory:addSmart("j_scrap_organic", 1, position, {Amount = item:getData("Amount", 1) * 2})

		client:EmitSound("npc/manhack/grind"..math.random(1,5)..".wav", 70, math.random(85,105))
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("converter_meat")
	end
}