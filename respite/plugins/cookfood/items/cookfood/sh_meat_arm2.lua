ITEM.name = "Human Arm"
ITEM.uniqueID = "food_human_arm2"
ITEM.model = "models/dismemberment/gibs/arms/upper_arm.mdl"
ITEM.hungerAmount = 30
ITEM.desc = "The upper arm of a human being."
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
	pos = Vector(0, 1.25, 200),
	ang = Angle(90, 0, 0),
	fov = 5.25,
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