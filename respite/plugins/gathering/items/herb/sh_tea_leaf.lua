ITEM.name = "Tea Leaf"
ITEM.uniqueID = "j_tealeaf"
ITEM.model = "models/props/cs_office/plant01_gib2.mdl"
ITEM.material = "models/XQM/CinderBlock_Tex"
ITEM.desc = "A tea leaf."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 1

ITEM.iconCam = {
	pos = Vector(54.2, 45.6, 33),
	ang = Angle(25, 220, 0),
	fov = 4.21,
}

ITEM.functions.Tea = {
	tip = "Make some tea.",
	icon = "icon16/bullet_green.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()
		local position = client:getItemDropPos()

		local water = inventory:getFirstItemOfType("food_water") or inventory:getFirstItemOfType("food_water_mountain")	
		local pot = inventory:getFirstItemOfType("j_empty_teapot")
		
		water:remove()
		pot:remove()
		inventory:addSmart("food_tea", 1, position)
		
		client:EmitSound("ambient/water/drip" ..math.random(1,4).. ".wav", 65, math.random(80,110))
	end,
	onCanRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()

		local water = inventory:hasItem("food_water") or inventory:hasItem("food_water_mountain")
		local tea = inventory:hasItem("j_empty_teapot")
		
		return (water and tea)
	end
}