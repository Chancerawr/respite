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
ITEM.color = Color(70, 120, 70)

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
		
		local milk = inventory:getFirstItemOfType("food_milk_carton") or inventory:getFirstItemOfType("food_milk_jug")
		local can = client:getChar():getInv():getFirstItemOfType("food_soda_cold")
		local amount = 1
		
		client:notify("The creaming has begun.")
		nut.chat.send(client, "itclose", "The machine accepts the milk.")	
		
		if(milk.uniqueID == "food_milk_jug") then
			amount = 2
		end
		
		milk:remove()
		can:remove()
		
		item:setData("producing", CurTime())
		
		timer.Simple(45, function()
			item:setData("producing", nil)
		
			for i = 1, amount do
				timer.Simple(amount, function()
					if(!IsValid(item:getEntity())) then --checks if item is not on the ground
						inventory:addSmart("food_ice_cream", 1, client:getItemDropPos())
					else --if the item is on the ground
						nut.item.spawn("food_ice_cream", item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
					end
				end)
			end
			
			client:notify("Converting has finished.")
			nut.chat.send(client, "itclose", "Ice Cream is released from the strange machine.")
		end)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local player = item.player

		local milk = player:getChar():getInv():getFirstItemOfType("food_milk_carton") or player:getChar():getInv():getFirstItemOfType("food_milk_jug")
		local can = player:getChar():getInv():getFirstItemOfType("food_soda_cold")
		
		local prodTime = 45
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		if (milk and can) then
			return true 
		else
			return false
		end
		
		return true
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
		local required = inventory:getFirstItemOfType("ammo_battery")
			
		required:remove()
		nut.item.spawn("food_brain", position)

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces- That can't be normal.")

		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("ammo_battery") then 
			return false
		end
		
		return true
	end
}

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("producing", false)) then
		desc = desc .. "\nThe device is cold to the touch."
	end
	
	return Format(desc)
end