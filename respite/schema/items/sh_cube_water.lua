ITEM.name = "Device - Water"
ITEM.uniqueID = "cube_water"
ITEM.model = "models/hunter/blocks/cube05x05x05.mdl"
ITEM.desc = "A strange metal box, it would be seemingly vibrating lightly. The box appears to have only a single button, labelled 'WATER', and a slot in the top for some sort of chip."
ITEM.width = 3
ITEM.height = 3
ITEM.flag = "v"
ITEM.price = 500
ITEM.material = "models/props_c17/metalladder001"
ITEM.category = "Machines"
ITEM.color = Color(128, 128, 128)

ITEM.iconCam = {
	ang = Angle(0, 270, 0),
	fov	= 9.4,
	pos	= Vector(0, 200, 0)
}

ITEM.functions.Activate = {
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
			local client = item.player
			local position = client:getItemDropPos()
			local inventory = client:getChar():getInv()
			local chip = inventory:hasItem("cube_chip")	
			
			if (!chip) then
				client:notifyLocalized("You need a chip to insert!") return false
			end
			
			for i = 1,4 do 
				--if(!inventory:add("food_water_misc")) then --if the inventory has space, put it in the inventory
					nut.item.spawn("food_water_misc", position) --if not, drop it on the ground
				--end				
			end
			
			chip:remove()
			nut.chat.send(client, "itclose", "The machine accepts the chip, and begins to dispense multiple bottles of corrupted water.")
			
			return false
	end
}