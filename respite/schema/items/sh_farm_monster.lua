ITEM.name = "Mysterious Plant"
ITEM.uniqueID = "farm_monster"
ITEM.model = "models/props_junk/terracotta01.mdl"
ITEM.material = "models/flesh"
ITEM.desc = "A strange pot of glowing dirt."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Mysterious"
ITEM.data = { producing2 = 0, growth = 0 }
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
		
		local water = inventory:hasItem("food_water") or inventory:hasItem("food_water_mountain") or inventory:hasItem("food_blood")

		if(water) then
			local grow = 1
			if(water.uniqueID == "food_blood" and item:getData("growth") < 8) then
				grow = 2
			end	

			local container = water.container
			water:remove()
			inventory:add(container)
			nut.chat.send(client, "itclose", "The liquid is poured onto the strange plant.")	
			item:setData("producing2", CurTime())
			timer.Simple(300, 
				function()
					if (item != nil) then
						item:setData("producing2", 0)
						item:setData("growth", item:getData("growth") + grow)
						client:notify("Your mysterious plant has grown.")
					end
				end
			)
		else
			client:notifyLocalized("You don't have any water!") return false
		end
		return false
	end,
	onCanRun = function(item)
		local endTime = item:getData("producing2") + 600
		if (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) then
		else
			return false
		end		
		
		local growth = item:getData("growth")
		
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
			meat = inventory:hasItem(v)
			if (meat) then
				meat:remove()
				break
			end
		end
		
		if (!meat) then
			client:notifyLocalized("You don't have any usable meat!") return false
		end		
		
		nut.chat.send(client, "itclose", "The strange plant ravenously consumes the meat.")	
		item:setData("producing2", CurTime())
		timer.Simple(1800, 
			function()
				if (item != nil) then
					item:setData("producing2", 0)
					item:setData("growth", item:getData("growth") + 1)
					client:notify("Your mysterious plant grows further.")
				end
			end
		)

		return false
	end,
	onCanRun = function(item)
		local endTime = item:getData("producing2") + 1800
		if (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) then
		else
			return false
		end		
	
		local growth = item:getData("growth")
		
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
		
		if(!inventory:add("food_monster_meat")) then --if the inventory has space, put it in the inventory
			nut.item.spawn("food_monster_meat", position) --if not, drop it on the ground
		end		
		
		item:setData("growth", item:getData("growth") - 2)
		
		return false
	end,
	onCanRun = function(item)
		local growth = item:getData("growth")
		
		if (growth > 1) then --want to have at least 2 growth to be able to cut plant.
			return true
		else
			return false
		end
	end
}

ITEM.functions.Harvest = { --shard
	icon = "icon16/box.png",
	sound = "ambient/machines/slicer2.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local position = client:getItemDropPos()
		local inventory = char:getInv()
		
		if(!inventory:add("shard_dust")) then --if the inventory has space, put it in the inventory
			nut.item.spawn("shard_dust", position) --if not, drop it on the ground
		end	
		
		item:setData("growth", 0)
		
		return false
	end,
	onCanRun = function(item)
		local growth = item:getData("growth")
		
		if (growth == 15) then --The plant needs to be fully grown.
			return true
		else
			return false
		end
	end
}

ITEM.functions.Name = {
	tip = "Name this item",
	icon = "icon16/heart.png",
	onRun = function(item)
		local client = item.player
		client:requestString("Change Name", "What do you want to name your plant? (This is final)", function(text)
			item:setData("customName", text)
		end, item.name)
		
		return false
	end,
	onCanRun = function(item)
		if (item:getData("customName") != nil) then
			return false
		else
			return true
		end
	end
}

function ITEM:getName()
	local name = self.name
	
	if(self:getData("customName") != nil) then
		name = self:getData("customName")
	end
	
	return Format(name)
end

function ITEM:getDesc()
	local desc = self.desc
	local growth
	local growthMsg
	if(self:getData("growth") != nil) then
		growth = self:getData("growth")
		if(growth <= 2) then -- 0-2
		growthMsg = " Something has sprouted from the dirt."
		
		elseif(growth <=5 ) then -- 3-5
		growthMsg = " The plant looks thirsty."
		
		elseif(growth <=9 ) then -- 6-9
		growthMsg = " It appears to be breathing"
		
		elseif(growth ==10 ) then -- 10
		growthMsg = " It hungers for flesh."
		
		elseif(growth <=12 ) then -- 11-12
		growthMsg = " It is ravenous for more meat."
		
		elseif(growth <=14 ) then -- 13-14
		growthMsg = " It is almost fully grown, but it still wants more."

		else --15
		growthMsg = " Something is giving off light from within the plant."
		
		end
		desc = desc .. growthMsg
	end
	
	return Format(desc)
end
