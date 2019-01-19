ITEM.name = "Cube - Dirt"
ITEM.uniqueID = "cube_dirt"
ITEM.model = "models/hunter/blocks/cube05x05x05.mdl"
ITEM.material = "phoenix_storms/potato"
ITEM.desc = "A cube of solid dirt. Could there be something inside?"
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Miscellaneous"
ITEM.color = Color(165, 42, 42)

ITEM.iconCam = {
	ang = Angle(0, 270, 0),
	fov	= 9.4,
	pos	= Vector(0, 200, 0)
}

ITEM.functions.Dig = {
	icon = "icon16/arrow_down.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()
		local shovel = inventory:hasItem("hl2_m_shovel_alt") or inventory:hasItem("hl2_m_shovel")
		
		if (!shovel) then
			client:notify("You need a shovel to dig in this dirt.") return false
		end

		local luck = math.Clamp(math.floor(char:getAttrib("luck")), 0, 100)
		local luckRan = math.random(0, luck)
		local roll = (math.random(luckRan, 100))
		
		if(roll <= 25) then
			client:notify("There was nothing in the dirt.")
		elseif(roll < 40) then
			client:notify("There was " .. roll/2 .. " scrap coins in the dirt.")
			char:giveMoney(roll/2)
		elseif(roll < 75) then
			client:notify("You receive some buried memories.")
			inventory:add("j_scrap_memory", 1, { Amount = 5 })
		elseif(roll < 95) then
			client:notify("You dig up some cheese?")
			inventory:add("food_cheese", 2)
		else
			client:notify("You receive a strange device.")
			inventory:add("mister", 1)
		end
	end
}
