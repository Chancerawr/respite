ITEM.name = "Device - Soda Stream"
ITEM.uniqueID = "soda_stream"
ITEM.model = "models/props/cs_assault/ventilationduct02.mdl"
ITEM.material = "models/props_pipes/pipesystem01a_skin3"
ITEM.desc = "A contraption that can make various types of soda."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(50, 150, 50)

ITEM.data = { producing2 = 0 }

local foods = {
	"food_apple",
	"food_banana",
	"food_lemon",
	"food_melon",
	"food_orange",
	"food_potato",
	"food_pumpkin",
	"food_cactus",
}

ITEM.functions.Soda = {
	icon = "icon16/cup.png",
	sound = "npc/barnacle/neck_snap2.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local done = false
		local fruit
		for k, v in pairs (foods) do
			fruit = inventory:hasItem(v)
			if (fruit and !done) then
				done = true
				break
			end
		end	
		
		if(!done) then
			client:notifyLocalized("You don't have a suitable food!") return false
		end
		
		client:notifyLocalized("Converting has started.")
		nut.chat.send(client, "itclose", "The machine accepts the plant matter.")	
		
		item:setData("producing2", CurTime())
		fruit:remove()
		
		timer.Simple(30, 
			function()
				local cans = 1
				if (fruit.uniqueID == "food_pumpkin") then
					cans = 3
				elseif(fruit.uniqueID == "food_melon") then
					cans = 2
				end
				
				local soda = fruit.uniqueID .. "_soda"

				if(math.random(0,10) == 10) then
					local ran = math.random(0,2)
					if(ran == 0) then
						soda = "food_soda_cherry"
					elseif(ran == 1) then
						soda = "food_soda_blueberry"
					else
						soda = "food_soda_cola"
					end
				end
				
				if(!IsValid(item:getEntity())) then --checks if item is not on the ground
					if(!inventory:add(soda, cans)) then --if the inventory has space, put it in the inventory
						for i = 1, cans do
							nut.item.spawn(soda, client:getItemDropPos()) --if not, drop it on the ground
						end
					end
				else --if the item is on the ground
					for i = 1, cans do
						nut.item.spawn(soda, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
					end
				end
				
				nut.chat.send(client, "itclose", "Soda is dispensed from the machine.")
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
	icon = "icon16/cup.png",
	sound = "npc/barnacle/neck_snap2.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local cactus = inventory:hasItem("j_cactus_plant")
		
		client:notifyLocalized("Converting has started.")
		nut.chat.send(client, "itclose", "The machine accepts the cactus.")	
		
		item:setData("producing2", CurTime())
		cactus:remove()
		
		timer.Simple(45, 
			function()
				local soda = "food_cactus_soda"

				if(!IsValid(item:getEntity())) then --checks if item is not on the ground
					if(!inventory:add(soda)) then --if the inventory has space, put it in the inventory
						nut.item.spawn(soda, client:getItemDropPos()) --if not, drop it on the ground
					end
				else --if the item is on the ground
					nut.item.spawn(soda, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
				end
				
				nut.chat.send(client, "itclose", "Soda is dispensed from the machine.")
			end
		)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local player = item.player or item:getOwner()
		local endTime = item:getData("producing2") + 45
		local cactus = player:getChar():getInv():hasItem("j_cactus_plant")
		if (cactus and (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0)) then
			return true 
		else
			return false
		end
	end
}