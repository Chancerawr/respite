ITEM.name = "Device - Brewery"
ITEM.uniqueID = "brewery"
ITEM.model = "models/props_c17/trappropeller_engine.mdl"
ITEM.desc = "A large metallic object, it seems to have a chip slot and a circular hole."
ITEM.width = 3
ITEM.height = 4
ITEM.flag = "v"
ITEM.price = 500
ITEM.material = "models/props_pipes/destroyedpipes01a"
ITEM.category = "Machines"
ITEM.color = Color(128, 128, 128)

ITEM.functions.Brew = {
	icon = "icon16/box.png",
	sound = "ambient/machines/thumper_amb.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()

		local alcohol = {} --potential sacrifices
		alcohol[1] = "alc_beer"
		alcohol[2] = "alc_rum"
		alcohol[3] = "alc_moonshine"
		alcohol[4] = "alc_vodka"
		alcohol[5] = "alc_bourbon"
		alcohol[6] = "alc_tequila"
		alcohol[7] = "alc_whiskey"
		alcohol[8] = "alc_midori"
		alcohol[9] = "alc_wine"

		local water = inventory:hasItem("food_water_misc") or inventory:hasItem("food_water") or inventory:hasItem("food_water_mountain") or inventory:hasItem("food_blood")
		local chip = inventory:hasItem("cube_chip")
		local clean = true
		if (water) then
			if (chip) then
				if(water.uniqueID == "food_water_misc") then
					clean = false
				end
				water:remove()
				chip:remove()
				nut.chat.send(client, "itclose", "The machine takes the water and the chip, and begins to brew.")
				timer.Simple(30, 
					function()
						if (item != nil) then
							local cleanN = 1
							if (clean) then
								cleanN = 3
							end
							
							for i = 1,cleanN do
								if(!IsValid(item:getEntity())) then --checks if item is not on the ground
									if(!inventory:add(alcohol[math.random(1,cleanN*3)])) then --if the inventory has space, put it in the inventory
										nut.item.spawn(alcohol[math.random(1,cleanN*3)], client:getItemDropPos()) --if not, drop it on the ground
									end
									client:EmitSound("physics/glass/glass_bottle_impact_hard3.wav")
								else --if the item it on the ground
									nut.item.spawn(alcohol[math.random(1,cleanN*3)], item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the created item above the item
									item:getEntity():EmitSound("physics/glass/glass_bottle_impact_hard3.wav")
								end
							end
							
							client:notify("Brewing has finished.")
						end
					end
				)
			else			
				client:notifyLocalized("You don't have a chip!") return false
			end
		else
			client:notifyLocalized("You don't have any water!") return false
		end
		return false
	end
}