ITEM.name = "Plastic Converter"
ITEM.desc = "A strange box, it appears to be made out of some kind of very hard plastic. The box has a large slot at the top, and some sort of output slot on the left side. The top says 'PLASTIC FOOD'."
ITEM.uniqueID = "converter"
ITEM.model = "models/hunter/blocks/cube05x05x05.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(50, 150, 50)

ITEM.foods = {
	"food_apple_plastic",
	"food_banana_plastic",
	"food_lemon_plastic",
	"food_melon_plastic",
	"food_orange_plastic",
	"food_potato_plastic",
	"food_pumpkin_plastic",
	"food_onion_plastic",
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
			plastics = inventory:getFirstItemOfType(v)
			if (plastics and !done) then
				done = true
				break
			end
		end	
		
		if(!done) then
			client:notifyLocalized("You don't have a suitable plastic food!") return false
		end
		
		client:notifyLocalized("Converting has started.")
		item:setData("producing", CurTime())
		plastics:remove()
		timer.Simple(60, function()
			if (item != nil) then
				item:setData("producing", nil)
				local regular = string.sub(plastics.uniqueID, 1, (string.len(plastics.uniqueID) - 8))
				client:notify("Converting has finished.")
				if(!IsValid(item:getEntity())) then --checks if item is not on the ground
					inventory:addSmart(regular, 1, client:getItemDropPos())
				else --if the item is on the ground
					nut.item.spawn(regular, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
				end
			end
		end)
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local prodTime = 60
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

ITEM.functions.Cactus = {
	icon = "icon16/arrow_refresh.png",
	sound = "physics/plastic/plastic_barrel_break1.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()

		local plastics = inventory:getFirstItemOfType("j_cactus_plant_plastic")
		
		client:notifyLocalized("Converting has started.")
		item:setData("producing", CurTime())
		plastics:remove()
		timer.Simple(60, function()
			if (item != nil) then
				item:setData("producing", nil)
				local regular = "j_cactus_plant"
				client:notify("Converting has finished.")

				if(!IsValid(item:getEntity())) then --checks if item is not on the ground
					inventory:addSmart(regular, 1, client:getItemDropPos())
				else --if the item is on the ground
					nut.item.spawn(regular, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
				end
			end
		end)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.		
		local player = item.player
		
		local inventory = player:getChar():getInv()
		local cactus = inventory:getFirstItemOfType("j_cactus_plant_plastic")
		if(!cactus) then
			return false
		end
		
		local prodTime = 30
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
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
		nut.item.spawn("j_scrap_plastics", position)
		nut.item.spawn("j_scrap_plastics", position)
		nut.item.spawn("j_scrap_plastics", position)
		nut.item.spawn("j_scrap_plastics", position)

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces some scrap plastic.")

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