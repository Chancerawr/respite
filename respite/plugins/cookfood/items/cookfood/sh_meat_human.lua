ITEM.name = "Human Meat"
ITEM.desc = "Meat ripped from the body of a human, it smells disgusting."
ITEM.model = "models/gibs/antlion_gib_small_2.mdl"
ITEM.material = "models/flesh"
ITEM.uniqueID = "food_human_meat"
ITEM.hungerAmount = 15
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.material = "models/flesh"
ITEM.color = Color(150,50,50)

ITEM.attribBoosts = { 
	["fortitude"] = 5
}

ITEM.iconCam = {
	pos = Vector(0.5, -0.25, 200),
	ang = Angle(90, 0, 0),
	fov = 2.75,
}

ITEM.functions.Convert = {
	tip = "Convert this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()	
	
		inventory:addSmart("j_scrap_organic", 1, position, {Amount = 3})
		
		client:EmitSound("physics/flesh/flesh_squishy_impact_hard" ..math.random(1,4).. ".wav", 65, math.random(80,110))
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("converter_meat")
	end
}