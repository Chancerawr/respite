ITEM.name = "Farm - Pumpkin"
ITEM.uniqueID = "farm_pumpkin"
ITEM.model = "models/props_junk/terracotta01.mdl"
ITEM.desc = "A strange pot, the dirt in it gives off a dim light."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Farms"
ITEM.data = { producing2 = 0 }
ITEM.color = Color(50, 150, 50)

ITEM.functions.Farm = {
	icon = "icon16/box.png",
	sound = "npc/barnacle/barnacle_tongue_pull1.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local position = client:getItemDropPos()
		local inventory = char:getInv()

		local water = inventory:hasItem("food_water_misc") or inventory:hasItem("food_water") or inventory:hasItem("food_water_mountain") or inventory:hasItem("food_blood")
		local grow
		if(water) then
			if (water.uniqueID == "food_water_misc" ) then
				grow = "food_pumpkin_plastic"
			else
				grow = "food_pumpkin"
			end	
			local container = water.container
			water:remove()
			inventory:add(container)
			nut.chat.send(client, "itclose", "The liquid is poured onto the strange dirt.")	
			item:setData("producing2", CurTime())
			timer.Simple(600, 
				function()
					if (item != nil) then
						item:setData("producing2", 0)
						if(!IsValid(item:getEntity())) then --checks if item is not on the ground
							if(!inventory:add(grow)) then --if the inventory has space, put it in the inventory
								nut.item.spawn(grow, client:getItemDropPos()) --if not, drop it on the ground
							end
						else --if the item it on the ground
							nut.item.spawn(grow, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
						end
						client:notify("Farming has finished.")
					end
				end
			)
		else
			client:notifyLocalized("You don't have any water!") return false
		end
		return false
	end,
	onCanRun = function(item) --only one farm action should be happening at once with one item.
		local endTime = item:getData("producing2") + 600
		if (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) then
			return true 
		else
			return false
		end
	end
}