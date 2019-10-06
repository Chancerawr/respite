ITEM.name = "Brewery"
ITEM.uniqueID = "brewery"
ITEM.model = "models/props_c17/trappropeller_engine.mdl"
ITEM.material = "models/props_pipes/destroyedpipes01a"
ITEM.desc = "A large metallic object, it seems to have a chip slot and a circular hole."
ITEM.width = 3
ITEM.height = 3
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(70, 120, 70)

ITEM.functions.Brew = {
	icon = "icon16/drink.png",
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

		local water = inventory:getFirstItemOfType("food_water_misc") or inventory:getFirstItemOfType("food_water") or inventory:getFirstItemOfType("food_water_mountain") or inventory:getFirstItemOfType("food_blood")
		local chip = inventory:getFirstItemOfType("cube_chip")
		local clean = true
		if (water) then
			if (chip) then
				if(water.uniqueID == "food_water_misc") then
					clean = false
				end
				water:remove()
				chip:remove()
				nut.chat.send(client, "itclose", "The machine takes the water and the chip, and begins to brew.")
				
				timer.Simple(30, function()
					if (item != nil) then
						local cleanN = 1
						if (clean) then
							cleanN = 3
						end
						
						for i = 1,cleanN do
							if(!IsValid(item:getEntity())) then --checks if item is not on the ground									
								inventory:addSmart(alcohol[math.random(1,cleanN*3)], 1, client:getItemDropPos())
								
								client:EmitSound("physics/glass/glass_bottle_impact_hard3.wav")
							else --if the item it on the ground
								nut.item.spawn(alcohol[math.random(1,cleanN*3)], item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the created item above the item
								item:getEntity():EmitSound("physics/glass/glass_bottle_impact_hard3.wav")
							end
						end
						
						if(clean) then
							if(math.random(0,9) == 0) then
								if(!IsValid(item:getEntity())) then --checks if item is not on the ground
									inventory:addSmart("alc_cloud", 1, client:getItemDropPos())
									
									client:EmitSound("hl1/ambience/steamburst1.wav")
								else --if the item it on the ground
									nut.item.spawn("alc_cloud", item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the created item above the item
									item:getEntity():EmitSound("hl1/ambience/steamburst1.wav")
								end
							end
						end
						
						client:notify("Brewing has finished.")
					end
				end)
			else			
				client:notify("You don't have a chip!") return false
			end
		else
			client:notify("You don't have any water!") return false
		end
		return false
	end
}

ITEM.functions.Potion2 = {
    name = "Potions",
    tip = "useTip",
    icon = "icon16/star.png",
	sound = "ambient/machines/thumper_amb.wav",
    isMulti = true,
    multiOptions = function(item, client)
        local targets = {
            {name = "Healing Salve", data = "none"},
            {name = "Accuracy", data = "accuracy"},
            {name = "Agility", data = "agility"},
            {name = "Craftiness", data = "craftiness"},
            {name = "Endurance", data = "endurance"},
            {name = "Fortitude", data = "fortitude"},
            {name = "Luck", data = "luck"},
            {name = "Perception", data = "perception"},
            {name = "Strength", data = "strength"},
        }
       
        return targets
    end,
    onRun = function(item, data)
        local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local object = inventory:getFirstItemOfType("food_apple_cursed")
		
		local recipes = {
			["accuracy"] = "orange",
			["agility"] = "apple",
			["endurance"] = "melon",
			["strength"] = "potato",
			["perception"] = "banana",
			["luck"] = "lemon",
			["fortitude"] = "monster_meat",
			["craftiness"] = "cactus"
		}
		
		if(data != "none") then --for anything other than healing salve
			local potCore = inventory:getFirstItemOfType("food_" .. recipes[data])
			if(!potCore) then
				client:notify("You do not have a(n) " .. recipes[data])
				return false
			end
			
			potCore:remove()
			object:remove()
			
			--calculates crafting quality of the item
			local iness = client:getChar():getAttrib("medical", 0)
			
			local craftMod = math.Clamp((iness/10) + math.random(-2,2), 0, 10)
			craftMod = math.Round(craftMod)
			
			nut.item.spawn("potion_" .. data, position,
				function(item2)
					item2:setData("quality", craftMod)
				end
			)
			nut.chat.send(client, "itclose", "The objects move through the brewery quickly, and a liquid is dispensed into a vial.")	
		else --for healing salve
			object:remove()
			nut.item.spawn("salve_healing", position)
			nut.chat.send(client, "itclose", "The object moves through the brewery quickly, and a liquid is dispensed into a vial.")
		end
	 
        return false
    end,
	    onCanRun = function(item)      
		local player = item.player
		
		--item doesn't work when on the ground, so make them have to pick it up I guess.
		if(IsValid(item.entity)) then
			return false
		end
		
		if(!player:getChar():getInv():getFirstItemOfType("food_apple_cursed")) then
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
		nut.item.spawn("drug_antibiotics", position)
		nut.item.spawn("drug_disinfectant", position)
		nut.item.spawn("bleach", position)
		
		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces bleach, disinfectant, and antibiotics.")

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
