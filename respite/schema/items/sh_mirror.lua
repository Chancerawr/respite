ITEM.name = "Device - Mirror"
ITEM.uniqueID = "mirror"
ITEM.model = "models/props_c17/Frame002a.mdl"
ITEM.material = "models/props_c17/frostedglass_01a"
ITEM.desc = "A framed slab of glass. It appears to be a mirror, but it doesn't reflect any Drifter that stands in front of it."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(128, 128, 128)
ITEM.data = { producing2 = 0, glass = 0 }

ITEM.functions.Reflect = {
	name = "Reflect",
	icon = "icon16/picture.png",
	sound = "physics/glass/glass_impact_bullet1.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local glass = inventory:hasItem("j_scrap_glass")	

		local amount = glass:getData("Amount")
		
		nut.chat.send(client, "itclose", "You add glass to the mirror, and it absorbs it.")

		if(amount > 11) then
			glass:setData("Amount", amount - 11)
		else
			glass:remove()
		end
		item:setData("glass", item:getData("glass") + 11)
		
		client:notifyLocalized("The mirror is changing somehow.")
		item:setData("producing2", CurTime())
		timer.Simple(101, 
			function()
				local emotions = {
					"fear",
					"anger",
					"sadness",
					"joy",
					"disgust",
					"surprise",
					"trust",
					"anticipation",
					"neutral",
				}
				local emotion = emotions[math.random(0,8)]
			
				if(!IsValid(item:getEntity())) then
					if(!inventory:add("j_scrap_memory", 1, { Amount = 1, feeling = emotion})) then --if the inventory has space, put it in the inventory
						nut.item.spawn("j_scrap_memory", position,
							function(item2)
								item2:setData("feeling", emotion)
							end
						)
					end
				else
					--spawn the reward item above the entity
					nut.item.spawn("j_scrap_memory", item:getEntity():GetPos() + item:getEntity():GetUp()*50,
						function(item2)
							item2:setData("feeling", emotion)
						end
					)
				end
				client:notifyLocalized("The mirror is finished.")
				nut.chat.send(client, "itclose", "The mirror shows you something from your past.")
				item:setData("producing2", 0)
			end
		)
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		local glass = player:getChar():getInv():hasItem("j_scrap_glass")
		
		local endTime = item:getData("producing2") + 101
		if(CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) then
		else
			return false
		end
		
		if (!glass or glass:getData("Amount") < 11) then --if item of importance isn't in the inventory.
			return false
		end
	end
}

ITEM.functions.EChip = {
	name = "Enhanced Chip",
	icon = "icon16/map.png",
	sound = "physics/glass/glass_impact_bullet1.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local chip = inventory:hasItem("cube_chip_enhanced")	
		
		nut.chat.send(client, "itclose", "You push an enhanced chip into the mirror, it presents a different location.")

		chip:remove()
		
		client:notifyLocalized("The mirror is changing somehow.")
		item:setData("producing2", CurTime())
		timer.Simple(202, 
			function()
				local rewards = {}
					rewards[1] = "haze_bottled"
					rewards[2] = "haze_bottled_pink"
					rewards[3] = "food_apple_cursed"
			
				local reward = rewards[math.random(1,3)]
			
				item:setData("producing2", 0)
				if(!IsValid(item:getEntity())) then
					if(!inventory:add(reward, 1)) then --if the inventory has space, put it in the inventory
						nut.item.spawn(reward, position)
					end
				else
					--spawn the reward item above the entity
					nut.item.spawn(reward, item:getEntity():GetPos() + item:getEntity():GetUp()*50)
				end
				client:notifyLocalized("The mirror is finished.")
				nut.chat.send(client, "itclose", "Something comes from the other side of the mirror.")
			end
		)
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		local chip = player:getChar():getInv():hasItem("cube_chip_enhanced")
		
		local endTime = item:getData("producing2") + 202
		if(CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) then
		else
			return false
		end
		
		if (!chip) then --if item of importance isn't in the inventory.
			return false
		end
	end
}