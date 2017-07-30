ITEM.name = "Crystalline Object"
ITEM.uniqueID = "shard_complete"
ITEM.desc = "A peculiar crystalline object, it emits a bright white light."
ITEM.model = "models/props_phx/misc/smallcannonball.mdl"
ITEM.material = "models/props_combine/portalball001_sheet"
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "1"
ITEM.category = "Shard"
ITEM.data = { shardcount = 10, chipcount = 0, producing2 = 0 }
ITEM.invWidth = 7
ITEM.invHeight = 7
ITEM.color = Color(255, 255, 255)

--this function is only necessary if using a shitty external db like I am, if you're using an internal db it's not important
local function recursiveAdd(item, inventory, toAdd)
	timer.Simple(.2,
		function()
			if (toAdd > 1) then
				inventory:add(item)
				recursiveAdd(item, inventory, toAdd-1)
			else
				inventory:add(item, 1)
			end
		end
	)
end

if (CLIENT) then
	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		entity:DrawShadow(false)
		
		local pos = entity:GetPos() + entity:GetUp()
		local dlight = DynamicLight(entity:EntIndex())
		dlight.Pos = pos
		dlight.r = 255
		dlight.g = 255
		dlight.b = 255
		dlight.Brightness = 3
		dlight.Size = 128
		dlight.Decay = 1024
		dlight.style = 5
		dlight.DieTime = CurTime() + .1	
	end
end

ITEM.functions.AbsorbShards = {
	name = "Absorb Shards",
	tip = "Absorb shards in inventory.",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local shardstack = item:getData("shardcount")
		local shard = inventory:hasItem("shard")	
		while(shard) do
			shardstack = shardstack + shard:getData("shardcount")
			shard:remove()
			shard = inventory:hasItem("shard")
		end
		item:setData("shardcount", shardstack)
		item.player:EmitSound("physics/glass/glass_bottle_impact_hard3.wav")
		return false
		end,
	onCanRun = function(item)
		if (item:getOwner() != nil) then
			return true
		else
			return false
		end
	end
}

ITEM.functions.AbsorbChips = {
	name = "Absorb Chips",
	tip = "Absorb chips in inventory.",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local chipstack = item:getData("chipcount")
		local chip = inventory:hasItem("cube_chip")	
		while(chip) do
			chipstack = chipstack + 1
			chip:remove()
			chip = inventory:hasItem("cube_chip")
		end
		item:setData("chipcount", chipstack)
		item.player:EmitSound("physics/glass/glass_bottle_impact_hard3.wav")
		return false
		end,
	onCanRun = function(item)
		if (item:getOwner() != nil) then
			return true
		else
			return false
		end
	end
}

ITEM.functions.Farm = {
	tip = "Generate food from within the respite room.",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local size = (item:getData("shardcount") / 4)
		local plastics = item:getData("chipcount") / 25
		if(plastics > (math.floor(size / 2.5) * 3)) then
			plastics = (math.floor(size / 2.5) * 3)
		end	
		local delay = 120 + (3600 / (item:getData("chipcount") / 25)) -- divide by amount of plastics
		local amount = math.floor((item:getData("shardcount") / 4)/2.5) -- for every 2.5 square meters of room space, one item is produced.
		
		item.player:EmitSound("plats/bigstop1.wav")	
		item:setData("producing2", CurTime())
		timer.Simple(delay, 
			function()
				if (item != nil) then
					local index = item:getData("id")
					local roomspace = nut.item.inventories[index]
					roomspace:add("food_potato", amount)
					item:setData("producing2", 0)
					client:notify("Farming has finished.")
				end
			end
		)
		
		return false
	end,
	onCanRun = function(item)
		local endTime = item:getData("producing2") + (120 + (3600 / (item:getData("chipcount") / 25)))
		if (item:getOwner() != nil and (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) and (item:getData("chipcount") / 25) >= 1) then
			return true 
		else
			return false
		end
	end
}

ITEM.functions.Fish = {
	tip = "Generate fish from within the respite room.",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local size = (item:getData("shardcount") / 4)
		local plastics = item:getData("chipcount") / 25
		if(plastics > (math.floor(size / 2.5) * 3)) then
			plastics = (math.floor(size / 2.5) * 3)
		end
		local delay = 120 + (3600 / plastics) -- divide by amount of plastics
		local amount = math.floor((item:getData("shardcount") / 4)/2.5) -- for every 2.5 square meters of room space, one item is produced.
		
		item.player:EmitSound("plats/bigstop1.wav")
		item:setData("producing2", CurTime())
		
		timer.Simple(delay, 
			function()
				if (item != nil) then
					local index = item:getData("id")
					local roomspace = nut.item.inventories[index]
					local unique
					
					if (math.random(0,1) == 0) then
						unique = "food_fish"..math.random(1,2).."_plastic"
					else
						unique = "food_fish"..math.random(1,2)
					end

					recursiveAdd(unique, roomspace, amount)
					item:setData("producing2", 0)
					client:notify("Fishing has finished.")
				end
			end
		)
		
		return false
		end,
	onCanRun = function(item)
		local endTime = item:getData("producing2") + (120 + (3600 / (item:getData("chipcount") / 25)))
		if (item:getOwner() != nil and (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) and (item:getData("chipcount") / 25) >= 1) then
			return true 
		else
			return false
		end
	end
}

ITEM.functions.Hunt = {
	tip = "Generate monster meat from within the respite room.",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local size = (item:getData("shardcount") / 4)
		local plastics = item:getData("chipcount") / 25
		if(plastics > (math.floor(size / 2.5) * 3)) then --only allow 4 plastics for every 2.5 meters.
			plastics = (math.floor(size / 2.5) * 3)
		end
		local delay = 120 + (3600 / plastics) -- divide by amount of plastics
		local amount = math.floor(size/2.5) -- for every 2.5 square meters of room space, one item is produced.

		item.player:EmitSound("plats/bigstop1.wav")
		item:setData("producing2", CurTime())
		
		timer.Simple(delay, 
			function()
				if (item != nil) then
					local index = item:getData("id")
					local roomspace = nut.item.inventories[index]
					roomspace:add("food_monster_meat", amount)
					item:setData("producing2", 0)
					client:notify("Hunting has finished.")
				end
			end
		)
		
		return false
		end,
	onCanRun = function(item)
		local endTime = item:getData("producing2") + (120 + (3600 / (item:getData("chipcount") / 25)))
		if (item:getOwner() != nil and (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) and (item:getData("chipcount") / 25) >= 1) then
			return true 
		else
			return false
		end
	end
}

ITEM.functions.Well = {
	tip = "Generate water from within the respite room.",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local size = (item:getData("shardcount") / 4)
		local plastics = item:getData("chipcount") / 25
		if(plastics > (math.floor(size / 2.5) * 3)) then
			plastics = (math.floor(size / 2.5) * 3)
		end
		local delay = 120 + (3600 / plastics) -- divide by amount of plastics
		local amount = math.floor((item:getData("shardcount") / 4)/2.5) -- for every 2.5 square meters of room space, one item is produced.
		
		item.player:EmitSound("plats/bigstop1.wav")
		item:setData("producing2", CurTime())
		
		timer.Simple(delay, 
			function()
				if (item != nil) then
					local index = item:getData("id")
					local roomspace = nut.item.inventories[index]
					roomspace:add("food_water_misc", amount)
					item:setData("producing2", 0)
					client:notify("Water has been extracted from the respite well.")
				end
			end
		)
		
		return false
		end,
	onCanRun = function(item)
		local endTime = item:getData("producing2") + (120 + (3600 / (item:getData("chipcount") / 25)))
		if (item:getOwner() != nil and (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) and (item:getData("chipcount") / 25) >= 1) then
			return true 
		else
			return false
		end
	end
}

ITEM.functions.Woodcut = {
	name = "Chop Wood",
	tip = "Generate wood from within the respite room.",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local size = (item:getData("shardcount") / 4)
		local plastics = item:getData("chipcount") / 25
		if(plastics > (math.floor(size / 2.5) * 3)) then
			plastics = (math.floor(size / 2.5) * 3)
		end
		local delay = 120 + (3600 / plastics) -- divide by amount of plastics
		local amount = math.floor((item:getData("shardcount") / 4)/2.5) -- for every 2.5 square meters of room space, one item is produced.
		
		item.player:EmitSound("plats/bigstop1.wav")
		item:setData("producing2", CurTime())
		
		timer.Simple(delay, 
			function()
				if (item != nil) then
					local index = item:getData("id")
					local roomspace = nut.item.inventories[index]
					roomspace:add("j_scrap_wood", 1, { Amount = (amount * 2) })
					item:setData("producing2", 0)
					client:notify("Woodcutting has finished.")
				end
			end
		)
		
		return false
		end,
	onCanRun = function(item)
		local endTime = item:getData("producing2") + (120 + (3600 / (item:getData("chipcount") / 25)))
		if (item:getOwner() != nil and (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) and (item:getData("chipcount") / 25) >= 1) then
			return true 
		else
			return false
		end
	end
}

ITEM.functions.Mine = {
	tip = "Generate concrete from within the respite room.",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local size = (item:getData("shardcount") / 4)
		local plastics = item:getData("chipcount") / 25
		if(plastics > (math.floor(size / 2.5) * 3)) then
			plastics = (math.floor(size / 2.5) * 3)
		end
		local delay = 120 + (3600 / plastics) -- divide by amount of plastics
		local amount = math.floor((item:getData("shardcount") / 4)/2.5) -- for every 2.5 square meters of room space, one item is produced.
		
		item.player:EmitSound("plats/bigstop1.wav")
		item:setData("producing2", CurTime())
		
		timer.Simple(delay, 
			function()
				if (item != nil) then
					local index = item:getData("id")
					local roomspace = nut.item.inventories[index]
					roomspace:add("j_scrap_concrete", 1, { Amount = (amount * 2) })
					item:setData("producing2", 0)
					client:notify("Mining has finished.")
				end
			end
		)
		
		return false
		end,
	onCanRun = function(item)
		local endTime = item:getData("producing2") + (120 + (3600 / (item:getData("chipcount") / 25)))
		if (item:getOwner() != nil and (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) and (item:getData("chipcount") / 25) >= 1) then
			return true 
		else
			return false
		end
	end
}

ITEM.functions.Scavenge = {
	name = "Scavenge",
	tip = "Generate random scrap from within the respite room.",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local size = (item:getData("shardcount") / 4)
		local plastics = item:getData("chipcount") / 25
		if(plastics > (math.floor(size / 2.5) * 3)) then
			plastics = (math.floor(size / 2.5) * 3)
		end
		local delay = 120 + (3600 / plastics) -- divide by amount of plastics
		local amount = math.floor((item:getData("shardcount") / 4)/2.5) -- for every 2.5 square meters of room space, one item is produced.
		
		item.player:EmitSound("plats/bigstop1.wav")
		item:setData("producing2", CurTime())
		
		timer.Simple(delay, 
			function()
				if (item != nil) then
					local index = item:getData("id")
					local roomspace = nut.item.inventories[index]
					local ranScrap = {}
					ranScrap[1] = "j_scrap_adhesive"
					ranScrap[2] = "j_scrap_battery"
					ranScrap[3] = "j_scrap_bone"
					ranScrap[4] = "j_scrap_chems"
					ranScrap[5] = "j_scrap_cloth"
					ranScrap[6] = "j_scrap_concrete"
					ranScrap[7] = "j_scrap_elastic"
					ranScrap[8] = "j_scrap_elecs"
					ranScrap[9] = "j_scrap_glass"
					ranScrap[10] = "j_scrap_light"
					ranScrap[11] = "j_scrap_metals"
					ranScrap[12] = "j_scrap_nails"
					ranScrap[13] = "j_scrap_organic"
					ranScrap[14] = "j_scrap_plastics"
					ranScrap[15] = "j_scrap_rubber"
					--ranScrap[16] = "c_scrap_gnome"
					ranScrap[16] = "j_scrap_screws"
					ranScrap[17] = "j_scrap_wood"
					ranScrap[18] = "cube_chip"
					for i=1,amount*2 do 
						roomspace:add(ranScrap[math.random(1,18)])
					end
					item:setData("producing2", 0)
					client:notify("Scavenging has finished.")
				end
			end
		)
		
		return false
		end,
	onCanRun = function(item)
		local endTime = item:getData("producing2") + (120 + (3600 / (item:getData("chipcount") / 25)))
		if (item:getOwner() != nil and (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) and (item:getData("chipcount") / 25) >= 1) then
			return true 
		else
			return false
		end
	end
}


function ITEM:getDesc()
	local str
	
	local size = 0
	local plastics = 0
	
	if (self:getData("shardcount") != nil) then
		size = self:getData("shardcount") / 4
		size = (size * size / 2.5) --increases exponentially
	end
	if (self:getData("chipcount")) then
		plastics = math.floor(self:getData("chipcount")/25)
		if(plastics > (math.floor(size / 2.5)) * 3) then --we dont want more plastics than the room can fit. at most 3 plastics for every 2.5 cubic meters.
			plastics = (math.floor(size / 2.5) * 3)
		end
	end	
	
	if ((!self.entity or !IsValid(self.entity)) and plastics < 1) then
		str = "A peculiar crystalline object, it emits a bright white light.\nRespite Size: %s square meters."
	elseif ((!self.entity or !IsValid(self.entity)) and plastics >= 1) then
		str = "A peculiar crystalline object, it emits a bright white light.\nRespite Size: %s square meters.\nPlastics: %s."
	else
		str = "A peculiar crystalline object, it emits a bright white light."
	end
	
	return Format(str, size, plastics)
end