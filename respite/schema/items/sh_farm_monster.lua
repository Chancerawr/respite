ITEM.name = "Monstrous Plant"
ITEM.uniqueID = "farm_monster"
ITEM.model = "models/props_junk/terracotta01.mdl"
ITEM.material = "models/flesh"
ITEM.desc = "A strange pot of glowing dirt."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Mysterious"
ITEM.color = Color(255, 50, 50)

ITEM.iconCam = {
	pos = Vector(188.63706970215, 158.96276855469, 122.02513885498),
	ang = Angle(25, 220, 0),
	fov = 4.7276473777797,
}

ITEM.functions.Water = {
	icon = "icon16/picture.png",
	sound = "npc/barnacle/barnacle_tongue_pull1.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local position = client:getItemDropPos()
		local inventory = char:getInv()
		
		local water = inventory:getFirstItemOfType("food_water") or inventory:getFirstItemOfType("food_water_mountain") or inventory:getFirstItemOfType("food_blood")

		if(water) then
			local grow = 1
			if(water.uniqueID == "food_blood" and item:getData("growth", 0) < 8) then
				grow = 2
			end	

			local container = water.container
			water:remove()
			inventory:add(container)
			
			nut.chat.send(client, "itclose", "The liquid is poured onto the strange plant.")	
			
			item:setData("producing", CurTime())
			timer.Simple(300, function()
				if (item != nil) then
					item:setData("producing", nil)
					item:setData("growth", item:getData("growth", 0) + grow)
					client:notify("Your mysterious plant has grown.")
				end
			end)
		else
			client:notify("You don't have any water!") return false
		end
		return false
	end,
	onCanRun = function(item)
		local prodTime = 300
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		local growth = item:getData("growth", 0)
		
		if (growth < 10) then
		else
			return false
		end
		
		return true
	end
}

ITEM.functions.Feed = {
	icon = "icon16/box.png",
	sound = "npc/barnacle/barnacle_crunch3.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()

		local meats = {
			"food_human_meat",
			"food_human_torso3",
			"food_human_torso2",
			"food_human_torso1",
			"food_human_pelvis",
			"food_human_legs",
			"food_human_leg2",
			"food_human_leg1",
			"food_human_hand",
			"food_human_foot",
			"food_human_arms",
			"food_human_arm2",
			"food_human_arm1",
			"food_brain",
			"food_lung",
			"food_liver",
			"food_heart",
			"food_eye"
		}
		
		for k, v in pairs (meats) do
			meat = inventory:getFirstItemOfType(v)
			if (meat) then
				meat:remove()
				break
			end
		end
		
		if (!meat) then
			client:notify("You don't have any usable meat!") return false
		end		
		
		nut.chat.send(client, "itclose", "The strange plant ravenously consumes the meat.")	
		item:setData("producing", CurTime())
		timer.Simple(1800, function()
			if (item != nil) then
				item:setData("producing", nil)
				item:setData("growth", item:getData("growth", 0) + 1)
				client:notify("Your mysterious plant grows further.")
			end
		end)

		return false
	end,
	onCanRun = function(item)
		local prodTime = 1800
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
	
		local growth = item:getData("growth", 0)
		
		if (growth > 9 and growth < 15) then --Can only feed plant when it's done with water phase.
			return true
		else
			return false
		end
	end
}

ITEM.functions.Cut = { --monster meat
	icon = "icon16/box.png",
	sound = "ambient/machines/slicer4.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local position = client:getItemDropPos()
		local inventory = char:getInv()

		inventory:addSmart("food_monster_meat", 1, position)
		
		item:setData("growth", item:getData("growth", 0) - 2)
		
		return false
	end,
	onCanRun = function(item)
		local growth = item:getData("growth", 0)
		
		if (growth > 1) then --want to have at least 2 growth to be able to cut plant.
			return true
		else
			return false
		end
	end
}

ITEM.functions.Harvest = {
	icon = "icon16/box.png",
	sound = "ambient/machines/slicer2.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local position = client:getItemDropPos()
		local inventory = char:getInv()
		
		inventory:addSmart("shard_dust", 1, position)
		
		item:setData("growth", 0)
		
		return false
	end,
	onCanRun = function(item)
		local growth = item:getData("growth", 0)
		
		if (growth == 15) then --The plant needs to be fully grown.
			return true
		else
			return false
		end
	end
}

ITEM.functions.Name = {
	tip = "Name this item",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		
		local customData = item:getData("custom", {})
		
		client:requestString("Change Name", "What do you want to name your plant? (This is final)", function(text)
			customData.name = text
			item:setData("custom", customData)
			nut.log.addRaw(client:Name().. " has set name of " ..item.name.. " to " ..text.. ".")
		end, customData.name or item.name)
		
		return false
	end,
	onCanRun = function(item)
		local customData = item:getData("custom", {})
		
		if (customData.name) then
			return false
		end
		
		return true
	end
}

function ITEM:getName()
	local name = self.name
	
	local customData = self:getData("custom", {})
	if(customData.name) then
		name = customData.name
	end

	return Format(name)
end

function ITEM:getDesc()
	local desc = self.desc
	local growth
	local growthMsg

	growth = self:getData("growth", 0)
	if(growth == 0) then -- 0
		growthMsg = " There is nothing but soil."
	elseif(growth <= 2) then -- 1-2
		growthMsg = " Something has sprouted from the dirt."
	elseif(growth <=5 ) then -- 3-5
		growthMsg = " The plant is growing nicely."
	elseif(growth <=9 ) then -- 6-9
		growthMsg = " The plant looks like it's breathing."
	elseif(growth ==10 ) then -- 10
		growthMsg = " The plant looks hungry."
	elseif(growth <=12 ) then -- 11-12
		growthMsg = " The plant has a ravenous look about it."
	elseif(growth <=14 ) then -- 13-14
		growthMsg = " The plant is almost fully grown."
	else --15
		growthMsg = " A white light shines from the plant."
	end
	
	desc = desc .. growthMsg

	if(self:getData("producing", false)) then
		desc = desc .. "\nThe plant is growing."
	end
	
	return Format(desc)
end
