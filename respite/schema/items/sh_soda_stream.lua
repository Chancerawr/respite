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
	"food_pumpkin"
}

ITEM.functions.Soda = {
	icon = "icon16/box.png",
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

				if(!inventory:add(soda, cans)) then --if the inventory has space, put it in the inventory
					for i = 1, cans do
						nut.item.spawn(soda, position) --if not, drop it on the ground
					end
				end
				nut.chat.send(client, "itclose", "Soda is dispensed from the machine.")
			end
		)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local endTime = item:getData("producing2") + 30
		if (item:getOwner() != nil and (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0)) then
			return true 
		else
			return false
		end
	end
}