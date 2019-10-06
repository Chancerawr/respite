ITEM.name = "Mister"
ITEM.uniqueID = "mister"
ITEM.model = "models/roller_vehicledriver.mdl"
ITEM.material = "models/props_lab/tank_glass001"
ITEM.desc = "A strangely shaped object, it has slots in it that seem to fit bottles."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(70, 120, 70)

ITEM.functions.HazeBlue = {
	name = "Blue Haze",
	icon = "icon16/bullet_blue.png",
	sound = "hl1/ambience/steamburst1.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local object = inventory:getFirstItemOfType("haze_bottled")
		
		nut.chat.send(client, "itclose", "The bottle of haze is put into the machine.")
		object:remove()
		
		item:setData("producing", CurTime())
		timer.Simple(60, function()
			local position = client:getItemDropPos()
			local reward
			
			if(math.random(1,4) == 1) then
				reward = "j_scrap_idea"
			else
				reward = "haze_bottled_pink"
			end
			
			item:setData("producing", nil)
			
			if(!IsValid(item:getEntity())) then
				inventory:addSmart(reward, 1, position)
			else
				nut.item.spawn(reward, item:getEntity():GetPos() + item:getEntity():GetForward()*5 + item:getEntity():GetForward()*50) --spawn the reward item above the entity
			end
			
			nut.chat.send(client, "itclose", "The machine rumbles, and it dispenses something.")
		end)
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("haze_bottled") then --if item of importance isn't in the inventory.
			return false
		end
		
		local prodTime = 60
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

ITEM.functions.HazeBlood = {
	name = "Blood Haze",
	icon = "icon16/bullet_red.png",
	sound = "hl1/ambience/steamburst1.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local object = inventory:getFirstItemOfType("haze_bottled_blood")
		
		nut.chat.send(client, "itclose", "The bottle of haze is put into the machine.")
		object:remove()
		
		item:setData("producing", CurTime())
		timer.Simple(30, 
			function()
				local position = client:getItemDropPos()
				
				local rewards = {
					"haze_bottled_pink",
					"food_blood",
					"food_monster_meat",
					"food_human_meat",
					"j_skull"
				}
				
				local reward = table.Random(rewards)
				
				item:setData("producing", nil)
				
				if(!IsValid(item:getEntity())) then
					inventory:addSmart(reward, 1, position)
				else
					nut.item.spawn(reward, item:getEntity():GetPos() + item:getEntity():GetForward()*5 + item:getEntity():GetForward()*50) --spawn the reward item above the entity
				end
				
				nut.chat.send(client, "itclose", "The machine rumbles, and it dispenses something.")
			end
		)
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("haze_bottled_blood") then --if item of importance isn't in the inventory.
			return false
		end
		
		local prodTime = 30
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

ITEM.functions.HazePink = {
	name = "Pink Haze",
	icon = "icon16/bullet_pink.png",
	sound = "hl1/ambience/steamburst1.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local object = inventory:getFirstItemOfType("haze_bottled_pink")
		
		nut.chat.send(client, "itclose", "The bottle of haze is put into the machine.")
		object:remove()
		
		item:setData("producing", CurTime())
		timer.Simple(30, function()
			local position = client:getItemDropPos()
			
			local rewards = {
				"haze_bottled_blood",
				"haze_bottled"
			}
			
			local reward = table.Random(rewards)
			
			item:setData("producing", nil)
			
			if(!IsValid(item:getEntity())) then					
				inventory:addSmart(reward, 1, position)
			else
				nut.item.spawn(reward, item:getEntity():GetPos() + item:getEntity():GetForward()*5 + item:getEntity():GetForward()*50) --spawn the reward item above the entity
			end
			
			nut.chat.send(client, "itclose", "The machine rumbles, and it dispenses something.")
		end)
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("haze_bottled_pink") then --if item of importance isn't in the inventory.
			return false
		end
		
		local prodTime = 30
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("producing", false)) then
		desc = desc .. "\nThe device is processing something."
	end
	
	return Format(desc)
end