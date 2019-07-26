ITEM.name = "Human Arm"
ITEM.uniqueID = "food_human_arms"
ITEM.model = "models/dismemberment/gibs/arms.mdl"
ITEM.hungerAmount = 30
ITEM.desc = "The upper arm of a human being."
ITEM.quantity2 = 4
ITEM.price = 0
ITEM.width = 3
ITEM.height = 1
ITEM.color = Color(150,50,50)

ITEM.dis = "trait_hunger"
ITEM.disChance = 10

ITEM.attribBoosts = { 
	["fortitude"] = 7
}

ITEM.iconCam = {
	pos = Vector(1, 22, 200),
	ang = Angle(90, 0, 0),
	fov = 9,
}

ITEM.functions.Convert = {
	tip = "Convert this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()	
	
		inventory:addSmart("j_scrap_organic", 1, position, {Amount = 7})
		
		client:EmitSound("physics/flesh/flesh_squishy_impact_hard" ..math.random(1,4).. ".wav", 65, math.random(80,110))
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("converter_meat")
	end
}