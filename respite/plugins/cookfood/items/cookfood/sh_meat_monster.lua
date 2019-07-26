ITEM.name = "Abomination Meat"
ITEM.uniqueID = "food_monster_meat"
ITEM.hungerAmount = 15
ITEM.model = "models/gibs/antlion_gib_small_2.mdl"
ITEM.material = "models/flesh"
ITEM.desc = "Meat from some kind of abomination, it smells terrible. It has a rough texture and its quite hard to chew, especially uncooked. It doesn't taste as bad as it smells, but it's definitely worse than most other kinds of meat."
ITEM.quantity2 = 2
ITEM.price = 5
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.color = Color(150,50,50)

ITEM.attribBoosts = { 
	["fortitude"] = 2
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