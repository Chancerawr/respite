ITEM.name = "Canned Sadness"
ITEM.uniqueID = "food_sadness"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.material = "models/props_wasteland/tugboat01"
ITEM.hungerAmount = 10
ITEM.desc = "A can filled with.. Something sad, probably."
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.width = 1
ITEM.height = 1
ITEM.color = Color(148, 0, 210)

ITEM.sound = "ambient/creatures/town_muffled_cry1.wav"
ITEM.container = "j_tinc"
 
ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}

ITEM.functions.use = {
	name = "Consume",
	tip = "useTip",
	icon = "icon16/cup.png",
	onRun = function(item)
		local client = item.player
		client:EmitSound(item.sound, 75, 100)
		
		local quantity2 = item:getData("quantity2", item.quantity2)
		quantity2 = quantity2 - 1
		if (quantity2 >= 1) then
			item:setData("quantity2", quantity2)
			return false
		else
			if(item.container) then
				local position = item.player:getItemDropPos()
				local inventory = client:getChar():getInv()
				inventory:addSmart(item.container, 1, position)
			end
		end
		
		client:notify("You feel sad.")
	end
}