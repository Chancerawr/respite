ITEM.name = "Ice Crammer"
ITEM.uniqueID = "ice_crammer"
ITEM.model = "models/props_wasteland/prison_toiletchunk01c.mdl"
ITEM.material = "models/props/cs_office/snowmana"
ITEM.desc = "A strange pump-like object that has a couple intake areas. One of them is labelled 'MILK', another is labelled 'COLD'."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(50, 150, 50)

ITEM.data = { producing2 = 0 }

ITEM.iconCam = {
	pos = Vector(197.53092956543, 175.19358825684, 132.29721069336),
	ang = Angle(25, 220, 0),
	fov = 4.7979049387853,
}

ITEM.functions.Cream = {
	name = "Ice Cream",
	icon = "icon16/cup.png",
	sound = "HL1/fvox/hiss.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local milk = inventory:hasItem("food_milk_carton") or inventory:hasItem("food_milk_jug")
		local amount = 1
		
		client:notifyLocalized("Converting has started.")
		nut.chat.send(client, "itclose", "The machine accepts the milk.")	
		
		item:setData("producing2", CurTime())
		
		if(milk.uniqueID == "food_milk_jug") then
			amount = 2
		end
		
		milk:remove()
		
		timer.Simple(45, 
			function()
				for i = 1, amount do
					timer.Simple(amount, 
						function()
							if(!IsValid(item:getEntity())) then --checks if item is not on the ground
								if(!inventory:add("food_ice_cream")) then --if the inventory has space, put it in the inventory
									nut.item.spawn("food_ice_cream", client:getItemDropPos()) --if not, drop it on the ground
								end
							else --if the item is on the ground
								nut.item.spawn("food_ice_cream", item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
							end
						end
					)
				end
				client:notify("Converting has finished.")
				nut.chat.send(client, "itclose", "Ice Cream is released from the strange machine.")
			end
		)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local player = item.player or item:getOwner()
		local endTime = item:getData("producing2") + 45
		local milk = player:getChar():getInv():hasItem("food_milk_carton") or player:getChar():getInv():hasItem("food_milk_jug")
		local can = player:getChar():getInv():hasItem("food_soda_cold")
		if (milk and can (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0)) then
			return true 
		else
			return false
		end
	end
}

ITEM.functions.Battery = {
	name = "Charged Battery",
	icon = "icon16/asterisk_orange.png",
	sound = "ambient/energy/zap9.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local required = inventory:hasItem("ammo_battery")
			
		required:remove()
		nut.item.spawn("food_brain", position)

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces- That can't be normal.")

		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		
		if !player:getChar():getInv():hasItem("ammo_battery") then 
			return false
		end
	end
}