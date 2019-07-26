ITEM.name = "Human Torso Chunk"
ITEM.uniqueID = "food_human_torso3"
ITEM.model = "models/dismemberment/gibs/torso/torso_right_upper.mdl"
ITEM.hungerAmount = 50
ITEM.desc = "The torso of a human being."
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.width = 2
ITEM.height = 2
ITEM.color = Color(150,50,50)

ITEM.dis = "trait_hunger"
ITEM.disChance = 10

ITEM.attribBoosts = { 
	["fortitude"] = 8
}

ITEM.iconCam = {
	pos = Vector(-200, -1.5, 3),
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
	
		inventory:addSmart("j_scrap_organic", 1, position, {Amount = 6})
		
		client:EmitSound("physics/flesh/flesh_squishy_impact_hard" ..math.random(1,4).. ".wav", 65, math.random(80,110))
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("converter_meat")
	end
}