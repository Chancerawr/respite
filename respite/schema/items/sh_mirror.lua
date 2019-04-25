ITEM.name = "Shattered Mirror"
ITEM.uniqueID = "mirror"
ITEM.model = "models/props_c17/Frame002a.mdl"
ITEM.material = "models/props_c17/frostedglass_01a"
ITEM.desc = "A framed slab of glass. Various cracks can be seen in its surface. It appears to be a mirror, but it doesn't reflect any Drifter that stands in front of it."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(128, 128, 128)
ITEM.data = { producing2 = 0, glass = 0 }

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 10.5,
}

ITEM.functions.Reflect = {
	name = "Reflect",
	icon = "icon16/picture.png",
	sound = "physics/glass/glass_impact_bullet1.wav",
	onRun = function(item)
		local client = item.player
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
		
		client:notify("The mirror is changing somehow.")
		item:setData("producing", CurTime())
		timer.Simple(101, function()
			item:setData("producing", nil)
		
			local position = client:getItemDropPos()
			
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
				if(!inventory:add("j_scrap_memory", 1, { Amount = 5, feeling = emotion})) then --if the inventory has space, put it in the inventory
					nut.item.spawn("j_scrap_memory", position,
						function(item2)
							item2:setData("feeling", emotion)
							item2:setData("Amount", 5)
						end
					)
				end
			else
				--spawn the reward item above the entity
				nut.item.spawn("j_scrap_memory", item:getEntity():GetPos() + item:getEntity():GetUp()*50,
					function(item2)
						item2:setData("feeling", emotion)
						item2:setData("Amount", 5)
					end
				)
			end
			
			client:notify("The mirror is finished.")
			nut.chat.send(client, "itclose", "The mirror shows you something from the past.")
		end)
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		local glass = player:getChar():getInv():hasItem("j_scrap_glass")
		
		local prodTime = 101
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end		
		
		if (!glass or glass:getData("Amount") < 11) then --if item of importance isn't in the inventory.
			return false
		end
	end
}

ITEM.functions.Idea = {
	name = "Idea",
	icon = "icon16/map.png",
	sound = "ambient/water/distant_drip4.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local object = inventory:hasItem("j_scrap_idea")	
		
		nut.chat.send(client, "itclose", "You push an idea into the mirror, it reflects the world through your eyes for seventy-seven seconds.")

		local amount = object:getData("Amount", 1)
		if(amount > 3) then
			object:setData("Amount", amount - 3)
		else
			object:remove()
		end
		
		client:notify("The mirror is changing somehow.")
		
		item:setData("producing", CurTime())
		timer.Simple(77, function()
			item:setData("producing", nil)
		
			local position = client:getItemDropPos()
		
			local reward = "reflective"
		
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
		end)
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		local object = player:getChar():getInv():hasItem("j_scrap_idea")
		
		local prodTime = 202
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		if (!object) then --if item of importance isn't in the inventory.
			return false
		end
		
		local amount = object:getData("Amount", 1)
		if(amount < 3) then
			return false
		end
	end
}

ITEM.functions.EChip = {
	name = "Enhanced Chip",
	icon = "icon16/map.png",
	sound = "ambient/water/distant_drip4.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local chip = inventory:hasItem("cube_chip_enhanced")	
		
		nut.chat.send(client, "itclose", "You push an enhanced chip into the mirror, it presents a different location.")

		chip:remove()
		
		client:notify("The mirror is changing somehow.")
		
		item:setData("producing", CurTime())
		timer.Simple(202, function()
			item:setData("producing", nil)
		
			local position = client:getItemDropPos()
			local rewards = {}
				rewards[1] = "haze_bottled"
				rewards[2] = "haze_bottled_pink"
				rewards[3] = "haze_bottled_blood"
				rewards[4] = "food_apple_cursed"
		
			local reward = rewards[math.random(1,4)]
		
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
		end)
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		local chip = player:getChar():getInv():hasItem("cube_chip_enhanced")
		
		local prodTime = 202
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		if (!chip) then --if item of importance isn't in the inventory.
			return false
		end
	end
}

ITEM.functions.IChip = {
	name = "Intrinsic Symbol",
	icon = "icon16/map.png",
	sound = "ambient/water/distant_drip4.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local chip = inventory:hasItem("chip_escape")	
		
		nut.chat.send(client, "itclose", "You push an intrinsic symbol into the mirror, it stops reflecting.")

		chip:remove()
		
		client:notify("The mirror is changing somehow.")
		item:setData("producing", CurTime())
		timer.Simple(303, 
			function()
				item:setData("producing", nil)			
			
				local position = client:getItemDropPos()
				local rewards = {
					"drug_nightmare",
					"reflective",
					"j_gnome",
					"story_respites",
					"story_memory",
					"story_void",
					"story_wraith"
				}
			
				local reward
				if(math.random(1,3) == 1) then
					reward = table.Random(rewards)
					giveDisease(client, "dis_past")
					nut.chat.send(client, "itclose", "You receive knowledge?")
				else
					reward = "chip_escape"
					nut.chat.send(client, "itclose", "The symbol returns from the mirror.")
				end
		
				if(!IsValid(item:getEntity())) then
					if(!inventory:add(reward, 1)) then --if the inventory has space, put it in the inventory
						nut.item.spawn(reward, position)
					end
				else
					--spawn the reward item above the entity
					nut.item.spawn(reward, item:getEntity():GetPos() + item:getEntity():GetUp()*50)
				end
			end
		)
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		local chip = player:getChar():getInv():hasItem("chip_escape")
		
		local prodTime = 202
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		if (!chip) then --if item of importance isn't in the inventory.
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
		nut.item.spawn("alc_cloud", position)

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces a bottle filled with a strange substance.")

		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		
		if !player:getChar():getInv():hasItem("ammo_battery") then 
			return false
		end
	end
}

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("producing", false)) then
		desc = desc .. "\nThe mirror is showing you something."
	end
	
	return Format(desc)
end