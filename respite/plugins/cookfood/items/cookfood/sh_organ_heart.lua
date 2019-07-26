ITEM.name = "Heart"
ITEM.uniqueID = "food_heart"
ITEM.hungerAmount = 15
ITEM.model = "models/gibs/humans/heart_gib.mdl"
ITEM.desc = "An entire human heart, that can't be normal."
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.color = Color(150,50,50)

ITEM.dis = "trait_hunger"
ITEM.disChance = 15

ITEM.attribBoosts = { 
	["fortitude"] = 10 
}

ITEM.iconCam = {
	pos = Vector(200, 0, 0),
	ang = Angle(180, -0, 180),
	fov = 3.5,
}

ITEM.functions.Convert = {
	tip = "Convert this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()	
	
		inventory:addSmart("j_scrap_organic", 1, position, {Amount = 5})
		
		client:EmitSound("physics/flesh/flesh_squishy_impact_hard" ..math.random(1,4).. ".wav", 65, math.random(80,110))
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("converter_meat")
	end
}