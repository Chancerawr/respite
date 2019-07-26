ITEM.name = "Eyeball"
ITEM.uniqueID = "food_eye"
ITEM.hungerAmount = 15
ITEM.model = "models/gibs/humans/eye_gib.mdl"
ITEM.desc = "A human eyeball, that can't be normal."
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.color = Color(150,50,50)

ITEM.dis = "trait_hunger"
ITEM.disChance = 5

ITEM.attribBoosts = {
	["fortitude"] = 5 
}

ITEM.iconCam = {
	pos = Vector(0, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 1.25,
}

ITEM.functions.Convert = {
	tip = "Convert this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()	
	
		inventory:addSmart("j_scrap_organic", 1, position, {Amount = 1})
		
		client:EmitSound("physics/flesh/flesh_squishy_impact_hard" ..math.random(1,4).. ".wav", 65, math.random(80,110))
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("converter_meat")
	end
}