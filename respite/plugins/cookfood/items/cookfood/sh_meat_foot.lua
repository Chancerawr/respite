ITEM.name = "Human Foot"
ITEM.uniqueID = "food_human_foot"
ITEM.model = "models/dismemberment/gibs/legs/foot.mdl"
ITEM.hungerAmount = 30
ITEM.desc = "A foot that was once connected to a human being. \n You thought they smelled badly before."
ITEM.quantity2 = 1
ITEM.price = 0
ITEM.width = 1
ITEM.height = 1
ITEM.color = Color(150,50,50)

ITEM.dis = "trait_hunger"
ITEM.disChance = 5

ITEM.attribBoosts = { 
	["fortitude"] = 3 
}

ITEM.iconCam = {
	pos = Vector(-2.5, 200, 1.5),
	ang = Angle(0, 270, -90),
	fov = 3,
}

ITEM.functions.Convert = {
	tip = "Convert this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()	
	
		inventory:addSmart("j_scrap_organic", 1, position, {Amount = 2})
		
		client:EmitSound("physics/flesh/flesh_squishy_impact_hard" ..math.random(1,4).. ".wav", 65, math.random(80,110))
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("converter_meat")
	end
}