ITEM.name = "Human Leg"
ITEM.uniqueID = "food_human_legs"
ITEM.model = "models/dismemberment/gibs/legs.mdl"
ITEM.hungerAmount = 35
ITEM.desc = "A separated humanoid leg."
ITEM.quantity2 = 4
ITEM.price = 0
ITEM.width = 4
ITEM.height = 1
ITEM.color = Color(150,50,50)

ITEM.dis = "trait_hunger"
ITEM.disChance = 10

ITEM.attribBoosts = { 
	["fortitude"] = 10
}

ITEM.iconCam = {
	pos = Vector(-15, 200, 2.5),
	ang = Angle(0, 270, 0),
	fov = 14.5,
}

ITEM.functions.Convert = {
	tip = "Convert this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()	
	
		inventory:addSmart("j_scrap_organic", 1, position, {Amount = 8})
		
		client:EmitSound("physics/flesh/flesh_squishy_impact_hard" ..math.random(1,4).. ".wav", 65, math.random(80,110))
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("converter_meat")
	end
}