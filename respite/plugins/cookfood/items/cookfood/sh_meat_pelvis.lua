ITEM.name = "Human Pelvis"
ITEM.uniqueID = "food_human_pelvis"
ITEM.model = "models/dismemberment/gibs/torso/torso_pelvis.mdl"
ITEM.hungerAmount = 45
ITEM.desc = "The pelvis of a human being."
ITEM.quantity2 = 3
ITEM.price = 0
ITEM.width = 2
ITEM.height = 2
ITEM.color = Color(150,50,50)

ITEM.dis = "trait_hunger"
ITEM.disChance = 10

ITEM.attribBoosts = { 
	["fortitude"] = 12
}

ITEM.iconCam = {
	pos = Vector(1, 2, 200),
	ang = Angle(90, 0, 0),
	fov = 4.5,
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