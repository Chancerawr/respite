ITEM.name = "Plastic Converter"
ITEM.uniqueID = "converter"
ITEM.model = "models/hunter/blocks/cube05x05x05.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.desc = "A strange box, it appears to be made out of some kind of very hard plastic. The box has a large slot at the top, and some sort of output slot on the left side. The top says 'PLASTIC FOOD'."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.data = { producing2 = 0 }
ITEM.color = Color(50, 150, 50)

ITEM.foods = {
	"food_apple_plastic",
	"food_banana_plastic",
	"food_lemon_plastic",
	"food_melon_plastic",
	"food_orange_plastic",
	"food_potato_plastic",
	"food_pumpkin_plastic",
	"food_fish_plastic",
	"food_fish2_plastic"
}

ITEM.iconCam = {
	ang = Angle(0, 270, 0),
	fov	= 9.4,
	pos	= Vector(0, 200, 0)
}

ITEM.functions.Convert = {
	name = "Convert",
	icon = "icon16/arrow_refresh.png",
	sound = "physics/plastic/plastic_barrel_break1.wav",
	onRun = function(item)
			local client = item.player
			local position = client:getItemDropPos()
			local inventory = client:getChar():getInv()

			local done = false
			local plastics
			for k, v in pairs (item.foods) do
				plastics = inventory:hasItem(v)
				if (plastics and !done) then
					done = true
					break
				end
			end	
			
			if(!done) then
				client:notifyLocalized("You don't have a suitable plastic food!") return false
			end
			
			client:notifyLocalized("Converting has started.")
			item:setData("producing2", CurTime())
			plastics:remove()
			timer.Simple(30, 
				function()
					if (item != nil) then
						item:setData("producing2", 0)
						local regular = string.sub(plastics.uniqueID, 1, (string.len(plastics.uniqueID) - 8))
						client:notifyLocalized("Converting has finished.")
						if(!IsValid(item:getEntity())) then --checks if item is not on the ground
							if(!inventory:add(regular)) then --if the inventory has space, put it in the inventory
								nut.item.spawn(regular, client:getItemDropPos()) --if not, drop it on the ground
							end
						else --if the item is on the ground
							nut.item.spawn(regular, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
						end
					end
				end
			)
			return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local endTime = item:getData("producing2") + 30
		if (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) then
			return true 
		else
			return false
		end
	end
}

ITEM.functions.Cactus = {
	icon = "icon16/arrow_refresh.png",
	sound = "physics/plastic/plastic_barrel_break1.wav",
	onRun = function(item)
			local client = item.player
			local position = client:getItemDropPos()
			local inventory = client:getChar():getInv()

			local plastics = inventory:hasItem("j_cactus_plant_plastic")
			
			client:notifyLocalized("Converting has started.")
			item:setData("producing2", CurTime())
			plastics:remove()
			timer.Simple(30, 
				function()
					if (item != nil) then
						item:setData("producing2", 0)
						local regular = "j_cactus_plant"
						client:notifyLocalized("Converting has finished.")

						if(!IsValid(item:getEntity())) then --checks if item is not on the ground
							if(!inventory:add(regular)) then --if the inventory has space, put it in the inventory
								nut.item.spawn(regular, client:getItemDropPos()) --if not, drop it on the ground
							end
						else --if the item is on the ground
							nut.item.spawn(regular, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
						end
					end
				end
			)
			return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local endTime = item:getData("producing2") + 30
		local player = item.player or item:getOwner()
		
		local inventory = player:getChar():getInv()
		local cactus = inventory:hasItem("j_cactus_plant_plastic")
		if(!cactus) then
			return false
		end
		
		if (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) then
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
		nut.item.spawn("charged_cube", position)

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces a strange energy cube.")

		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		
		if !player:getChar():getInv():hasItem("ammo_battery") then 
			return false
		end
	end
}