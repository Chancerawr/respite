ITEM.name = "Human Arm"
ITEM.uniqueID = "food_human_arm1"
ITEM.model = "models/dismemberment/gibs/arms/lower_arm.mdl"
ITEM.hungerAmount = 30
ITEM.desc = "The lower arm of a human being."
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.width = 2
ITEM.height = 1
ITEM.color = Color(150,50,50)

ITEM.dis = "trait_hunger"
ITEM.disChance = 10

ITEM.attribBoosts = { 
	["fortitude"] = 6
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 4,
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