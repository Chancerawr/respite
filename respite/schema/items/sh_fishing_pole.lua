ITEM.name = "Fishing Pole"
ITEM.desc = "A pole with a line and a reel attached to it. \nUses chips for bait."
ITEM.model = Model("models/props_junk/harpoon002a.mdl")
ITEM.uniqueID = "fishing_pole"
ITEM.price = 20
ITEM.flag = "v"
ITEM.data = { producing2 = 0 }
ITEM.color = Color(128, 128, 128)

ITEM.functions.FishBait = {
	name = "Baited Fishing",
	icon = "icon16/box.png",
	sound = "npc/barnacle/barnacle_tongue_pull1.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		if(client:WaterLevel() > 0) then
			local inventory = client:getChar():getInv()
			local chip = inventory:hasItem("cube_chip")
			local char = client:getChar()
			
			nut.chat.send(client, "itclose", "The baited hook is cast into the water.")		
			item:setData("producing2", CurTime())
			local oldPos = client:GetPos()
			client:setAction("Fishing...", 5, 
				function()
					if (item != nil and client:GetPos():Distance(oldPos) <= 500) then
						local reward = math.random(math.random(0, math.floor(char:getAttrib("luck"))), 100) -- rolls from character's luck attribute to 100.
						local catch = ""
						
						if (reward < 5) then --giant ugly loot table, sorry
							client:notifyLocalized("You catch nothing, and lose your bait.")
							catch = ""
						elseif (reward < 15) then
							client:notifyLocalized("You catch nothing, but keep your bait.")
							catch = "cube_chip"	
						elseif (reward < 50) then
							client:notifyLocalized("You catch a real fish, how unexpected!")
							if(math.random(0,1) == 0) then
								catch = "food_fish"
							else
								catch = "food_fish2"
							end
						elseif (reward < 98) then
							client:notifyLocalized("You catch a water purification tablet!.")	
							catch = "purifier_water_tablet"	
						elseif (reward <= 100) then
							client:notifyLocalized("You catch a shard!.")	
							catch = "shard"
						end		
					
						chip:remove()
						item:setData("producing2", 0)
						if(catch != "") then --if they dont catch anything, dont even try to give them nothing
							if(!IsValid(item:getEntity())) then --checks if item is not on the ground
								if(!inventory:add(catch)) then --if the inventory has space, put it in the inventory
									nut.item.spawn(catch, client:getItemDropPos()) --if not, drop it on the ground
								end
							else --if the item it on the ground
								nut.item.spawn(catch, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
							end
							client:notify("Fishing has finished.")
						end
					else
						client:notify("Fishing has failed.")
					end
				end
			)
		else
			client:notifyLocalized("You need to be in the water!")
		end
		return false
	end,
	onCanRun = function(item) --only one farm action should be happening at once with one item.
		local endTime = item:getData("producing2") + 5
		local player = item.player or item:getOwner()
		
		if(!player:getChar():getInv():hasItem("cube_chip")) then
			return false
		end
		
		if (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) then
			return true 
		else
			return false
		end
	end
}

ITEM.functions.FishNoBait = {
	name = "Fishing",
	icon = "icon16/box.png",
	sound = "npc/barnacle/barnacle_tongue_pull1.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		if(client:WaterLevel() > 0) then
			local inventory = client:getChar():getInv()
			local reward = math.random(0,10) 
			local catch = ""
			
			if(reward <= 5) then
				if(math.random(0,1) == 0) then
					catch = "food_fish_plastic"
				else
					catch = "food_fish2_plastic"
				end
			elseif(reward <= 6) then
				catch = "j_old_shoe"
			elseif(reward <= 7) then
				catch = "j_family_picture"
			elseif(reward <= 8) then
				catch = "j_baby_doll"
			elseif(reward <= 9) then
				catch = "j_stuffed_turtle"
			else
				catch = "j_soccerball"
			end
			client:notify("Fishing has started.")
			nut.chat.send(client, "itclose", "The unbaited hook is cast into the water.")		
			item:setData("producing2", CurTime())
			local oldPos = client:GetPos()
			client:setAction("Fishing...", 60, 
				function()
					if (item != nil and client:GetPos():Distance(oldPos) <= 500) then
						item:setData("producing2", 0)
						if(!IsValid(item:getEntity())) then --checks if item is not on the ground
							if(!inventory:add(catch)) then --if the inventory has space, put it in the inventory
								nut.item.spawn(catch, client:getItemDropPos()) --if not, drop it on the ground
							end
						else --if the item it on the ground
							nut.item.spawn(catch, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
						end
						client:notify("Fishing has finished.")
					else
						client:notify("Fishing has failed.")
					end
				end
			)
		end
		return false
	end,
	onCanRun = function(item) --only one farm action should be happening at once with one item.
		local endTime = item:getData("producing2") + 30
		if (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) then
			return true 
		else
			return false
		end
	end
}