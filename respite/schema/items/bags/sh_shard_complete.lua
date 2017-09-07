ITEM.name = "Crystalline Object"
ITEM.uniqueID = "shard_complete"
ITEM.desc = "A peculiar crystalline object, it emits a bright white light."
ITEM.model = "models/props_phx/misc/smallcannonball.mdl"
ITEM.material = "models/props_combine/portalball001_sheet"
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "1"
ITEM.category = "Shard"
ITEM.data = { shardcount = 10, chipcount = 0, echipcount = 0, producing2 = 0, char = 0 }
ITEM.invWidth = 7
ITEM.invHeight = 7
ITEM.color = Color(255, 255, 255)

local otherBags = {
	shard_complete = true
}

function getDelay(item)
	local eChips = item:getData("echipcount")
	local size = item:getData("shardcount") / 4
	local plasDiv = 25
	
	if(eChips and eChips > 0) then
		plasDiv = 15 + (15 / eChips)
	end
	
	size = (size * size / 2.5) --increases exponentially
	local plastics = math.floor(item:getData("chipcount") / plasDiv)
	if(plastics > (math.floor(size / 2.5) * 3)) then
		plastics = (math.floor(size / 2.5) * 3)
	end	
	return (120 + (3600 / plastics)) -- divide by amount of plastics
end

function orbTimerCheck(item)
	local endTime = item:getData("producing2") + getDelay(item)
	if (item:getOwner() != nil and (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) and (item:getData("chipcount") / 25) >= 1) then
		return true
	else
		return false
	end
end

local function getAmount(item)
	return math.floor((item:getData("shardcount") / 4) / 2.5) -- for every 2.5 square meters of room space, one item is produced.
end

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

ITEM.functions.View = {
	icon = "icon16/house.png",
	onClick = function(item)
		local index = item:getData("id")

		if (index) then
			local panel = nut.gui["inv"..index]
			local parent = item.invID and nut.gui["inv"..item.invID] or nil
			local inventory = nut.item.inventories[index]
			
			if (IsValid(panel)) then
				panel:Remove()
			end

			if (inventory and inventory.slots) then
				panel = vgui.Create("nutInventory", parent)
				panel:setInventory(inventory)
				panel:ShowCloseButton(true)
				panel:SetTitle(item.name)

				nut.gui["inv"..index] = panel
			else
				ErrorNoHalt("[NutScript] Attempt to view an uninitialized inventory '"..index.."'\n")
			end
		end

		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		local inventory = player:getChar():getInv()
		local items = inventory:getItems()
		local packs = 0
		for k, v in pairs(items) do
			if(otherBags[v.uniqueID]) then
				packs = packs + 1
			end
		end
		if(packs > 1) then
			return false
		end
		if(item:getData("char") != player:getChar():getID()) then
			return false
		end
		return !IsValid(item.entity) and item:getData("id")
	end
}

ITEM.functions.Claim = {
	name = "Claim Orb",
	tip = "Claim this orb as yours.",
	icon = "icon16/house.png",
	onRun = function(item)
		item:setData("char", item.player:getChar():getID())
		return false
		end,
	onCanRun = function(item)
		if(IsValid(item.entity)) then
			return false
		end
		if(item:getData("char") == nil or item:getData("char") == 0) then
			return true
		else
			return false
		end
	end
}

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
		local player = item.player or item:getOwner()
	
		if(IsValid(item.entity)) then
			return false
		end

		if(item:getData("char") != player:getChar():getID()) then
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
		local player = item.player or item:getOwner()
	
		if(IsValid(item.entity)) then
			return false
		end

		if(item:getData("char") != player:getChar():getID()) then
			return false
		end
	end
}

ITEM.functions.AbsorbEChips = {
	name = "Absorb Enhanced Chips",
	tip = "Absorb enhanced chips in inventory.",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local chipstack = item:getData("echipcount", 0)
		local chip = inventory:hasItem("cube_chip_enhanced")	
		while(chip) do
			chipstack = chipstack + 1
			chip:remove()
			chip = inventory:hasItem("cube_chip_enhanced")
		end
		item:setData("echipcount", chipstack)
		item.player:EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 100, 80)
		return false
		end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
	
		if(IsValid(item.entity)) then
			return false
		end

		if(item:getData("char") != player:getChar():getID()) then
			return false
		end
	end
}

ITEM.functions.Farm = {
	tip = "Generate food from within the respite room.",
	icon = "icon16/world.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local delay = getDelay(item)
		local amount = getAmount(item)
		
		item.player:EmitSound("plats/bigstop1.wav")	
		item:setData("producing2", CurTime())
		timer.Simple(delay, 
			function()
				if (item != nil) then
					local index = item:getData("id")
					local roomspace = nut.item.inventories[index]
					
					for i=1, amount do 
						timer.Simple(i/2, 
							function()
								roomspace:add("food_potato_plastic")
							end
						)
					end
					
					item:setData("producing2", 0)
					client:notify("Farming has finished.")
				end
			end
		)
		
		return false
	end,
	onCanRun = function(item)	
		if(!orbTimerCheck(item)) then
			return false
		end
		local player = item.player or item:getOwner()
	
		if(IsValid(item.entity)) then
			return false
		end

		if(item:getData("char") != player:getChar():getID()) then
			return false
		end
		
		return orbTimerCheck(item)
	end
}

ITEM.functions.Fish = {
	tip = "Generate fish from within the respite room.",
	icon = "icon16/bug.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local delay = getDelay(item)
		local amount = getAmount(item)
		
		item.player:EmitSound("plats/bigstop1.wav")
		item:setData("producing2", CurTime())
		
		timer.Simple(delay, 
			function()
				if (item != nil) then
					local index = item:getData("id")
					local roomspace = nut.item.inventories[index]
					local unique

					for i=1, amount do 
						timer.Simple(i/2, 
							function()
								roomspace:add("food_fish"..math.random(1,2).."_plastic")
							end
						)
					end
					
					item:setData("producing2", 0)
					client:notify("Fishing has finished.")
				end
			end
		)
		
		return false
		end,
	onCanRun = function(item)
		if(!orbTimerCheck(item)) then
			return false
		end
		local player = item.player or item:getOwner()
	
		if(IsValid(item.entity)) then
			return false
		end

		if(item:getData("char") != player:getChar():getID()) then
			return false
		end
	end
}

ITEM.functions.Hunt = {
	tip = "Generate monster meat from within the respite room.",
	icon = "icon16/bug.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local delay = getDelay(item)
		local amount = getAmount(item)
		
		item.player:EmitSound("plats/bigstop1.wav")
		item:setData("producing2", CurTime())
		
		timer.Simple(delay, 
			function()
				if (item != nil) then
					local index = item:getData("id")
					local roomspace = nut.item.inventories[index]
					
					for i=1, amount do 
						timer.Simple(i/2, 
							function()
								roomspace:add("food_monster_meat")
							end
						)
					end
					
					item:setData("producing2", 0)
					client:notify("Hunting has finished.")
				end
			end
		)
		
		return false
		end,
	onCanRun = function(item)
		if(!orbTimerCheck(item)) then
			return false
		end
		local player = item.player or item:getOwner()
	
		if(IsValid(item.entity)) then
			return false
		end

		if(item:getData("char") != player:getChar():getID()) then
			return false
		end
	end
}

ITEM.functions.Well = {
	tip = "Generate water from within the respite room.",
	icon = "icon16/cup.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local delay = getDelay(item)
		local amount = getAmount(item)
		
		item.player:EmitSound("plats/bigstop1.wav")
		item:setData("producing2", CurTime())
		
		timer.Simple(delay, 
			function()
				if (item != nil) then
					local index = item:getData("id")
					local roomspace = nut.item.inventories[index]
					
					for i=1, amount do 
						timer.Simple(i/2, 
							function()
								roomspace:add("food_water_misc")
							end
						)
					end
					
					item:setData("producing2", 0)
					client:notify("Water has been extracted from the respite well.")
				end
			end
		)
		
		return false
		end,
	onCanRun = function(item)
		if(!orbTimerCheck(item)) then
			return false
		end
		
		local player = item.player or item:getOwner()
	
		if(IsValid(item.entity)) then
			return false
		end

		if(item:getData("char") != player:getChar():getID()) then
			return false
		end
	end
}

ITEM.functions.Woodcut = {
	name = "Chop Wood",
	tip = "Generate wood from within the respite room.",
	icon = "icon16/world.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local delay = getDelay(item)
		local amount = getAmount(item)
		
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
		if(!orbTimerCheck(item)) then
			return false
		end
		
		local player = item.player or item:getOwner()
	
		if(IsValid(item.entity)) then
			return false
		end

		if(item:getData("char") != player:getChar():getID()) then
			return false
		end
	end
}

ITEM.functions.Mine = {
	tip = "Generate concrete from within the respite room.",
	icon = "icon16/world.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local delay = getDelay(item)
		local amount = getAmount(item)
		
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
		if(!orbTimerCheck(item)) then
			return false
		end
		
		local player = item.player or item:getOwner()
	
		if(IsValid(item.entity)) then
			return false
		end

		if(item:getData("char") != player:getChar():getID()) then
			return false
		end
	end
}

ITEM.functions.Scavenge = {
	name = "Scavenge",
	tip = "Generate random scrap from within the respite room.",
	icon = "icon16/map.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local delay = getDelay(item)
		local amount = getAmount(item)
		
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
					--ranScrap[18] = "cube_chip"
					for i=1,amount*2 do 
						timer.Simple(i/2, 
							function()
								roomspace:add(ranScrap[math.random(1,17)])
							end
						)
					end
					item:setData("producing2", 0)
					client:notify("Scavenging has finished.")
				end
			end
		)
		
		return false
		end,
	onCanRun = function(item)
		if(item:getData("echipcount", 0) < 5) then
			return false
		end
	
		if(!orbTimerCheck(item)) then
			return false
		end
		
		local player = item.player or item:getOwner()
	
		if(IsValid(item.entity)) then
			return false
		end

		if(item:getData("char") != player:getChar():getID()) then
			return false
		end
	end
}

ITEM.functions.Weather = {
	name = "Weather",
	tip = "Start some random weather in your Respite.",
	icon = "icon16/map.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local delay = getDelay(item)
		local amount = getAmount(item)
		
		item.player:EmitSound("plats/bigstop1.wav")
		item:setData("producing2", CurTime())
		
		local ranWeather = {}
		ranWeather[1] = "rain"
		ranWeather[2] = "snow"
		ranWeather[3] = "fog"
		ranWeather[4] = "blue haze"
		ranWeather[5] = "black haze"
		ranWeather[6] = "pink haze"

		local weather = table.Random(ranWeather)
		local reward = "food_lemon_plastic"
		if (weather == "rain") then
			client:notify("It is raining in your Respite.")
			reward = "food_water_misc"
		elseif (weather "snow") then
			client:notify("It is snowing in your Respite.")
			reward = "food_water_misc"
		elseif (weather "fog") then
			client:notify("It is foggy in your Respite.")		
			reward = "food_monster_meat"
		elseif (weather "blue haze") then
			client:notify("Blue Haze has arrived in your Respite.")		
			reward = "haze_bottled"
		elseif (weather "black haze") then
			client:notify("Black Haze has arrived in your Respite.")
			reward = "cure"
		elseif (weather "pink haze") then
			client:notify("Pink Haze has arrived in your Respite.")
			reward = "haze_bottled_pink"
		end
		--client:notify(weather.." has entered your Respite.")
		timer.Simple(delay, 
			function()
				if (item != nil) then
					local index = item:getData("id")
					local roomspace = nut.item.inventories[index]
					
					for i=1, math.ceil(amount/4) do 
						timer.Simple(i/2, 
							function()
								roomspace:add(reward)
							end
						)
					end
					
					item:setData("producing2", 0)
					client:notify("The "..weather.." has left your Respite.")
				end
			end
		)
		
		return false
		end,
	onCanRun = function(item)
		if(item:getData("echipcount", 0) < 5) then
			return false
		end
	
		if(!orbTimerCheck(item)) then
			return false
		end
		
		local player = item.player or item:getOwner()
	
		if(IsValid(item.entity)) then
			return false
		end

		if(item:getData("char") != player:getChar():getID()) then
			return false
		end
	end
}

ITEM.functions.Portal = {
	name = "Explore Portal",
	tip = "Explore a random portal in your Respite.",
	icon = "icon16/map.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local delay = getDelay(item)
		local amount = getAmount(item)
		
		item.player:EmitSound("plats/bigstop1.wav")
		item:setData("producing2", CurTime())
		
		client:notify("Your Plastics enter a portal inside of your Respite.")
		timer.Simple(delay, 
			function()
				if (item != nil) then
					local index = item:getData("id")
					local roomspace = nut.item.inventories[index]
					
					local ranPort = {}
					ranPort[1] = "white"
					ranPort[2] = "red"
					ranPort[3] = "blue"
					ranPort[4] = "green"
					ranPort[5] = "black"
					ranPort[6] = "yellow"
					ranPort[7] = "orange"
					ranPort[8] = "brown"
					ranPort[9] = "gray"

					local portal = table.Random(ranPort)
					local reward = "food_lemon_plastic"
					if (portal == "white") then
						reward = {"cube_chip", "j_scrap_glass", "j_scrap_memory", "j_scrap_plastics"}
					elseif (portal == "red") then
						reward = {"food_monster_meat", "j_scrap_bone", "hl2_m_monsterclaw", "food_human_meat", "j_scrap_organic", "food_soda_cherry"}
					elseif (portal == "blue") then
						reward = {"food_water_misc", "j_empty_water", "food_water", "food_water_mountain", "purifier_water_tablet"}
					elseif (portal == "green") then
						reward = {"food_yams", "food_beans", "food_peas", "food_canned_1", "food_peaches", "food_corn", "j_cactus_plant"}
					elseif (portal == "black") then
						reward = {"cure", "j_scrap_memory", "drug_depress"}
					elseif (portal == "yellow") then
						reward = {"nut_flare", "nut_flare_b", "nut_flare_g", "nut_flare_o", "nut_flare_p", "nut_flare_t", "nut_flare_w", "nut_flare_y", "molotov", "flashlight"}
					elseif (portal == "orange") then
						reward = {"food_orange", "food_lemon_soda", "food_orange_plastic"}
					elseif (portal == "brown") then
						reward = {"food_tea", "food_whiskey", "j_scrap_wood", "food_potato", "food_soda_cola"}
					elseif (portal == "gray") then
						reward = {"drug_depress", "cube_chip", "drug_sleepingpills", "drug_painkillers", "food_apple_cursed", "cure"}
					end
					
					for i=1, math.ceil(amount/3) do 
						timer.Simple(i/2, 
							function()
								roomspace:add(table.Random(reward), 1)
							end
						)
					end
					
					item:setData("producing2", 0)
					client:notify("Your Plastics return from the " ..portal.. " portal.")
				end
			end
		)
		
		return false
		end,
	onCanRun = function(item)
		if(item:getData("echipcount", 0) < 5) then
			return false
		end
	
		if(!orbTimerCheck(item)) then
			return false
		end
		
		local player = item.player or item:getOwner()
	
		if(IsValid(item.entity)) then
			return false
		end

		if(item:getData("char") != player:getChar():getID()) then
			return false
		end
	end
}


function ITEM:getDesc()
	local str = self.desc
	
	local size = 0
	local plastics = 0
	local eChips = self:getData("echipcount", 0)
	
	local plasDiv = 25
	
	if(eChips > 0) then
		plasDiv = 15 + (15 / eChips)
	end
	
	if (self:getData("shardcount")) then
		size = self:getData("shardcount") / 4
		size = (size * size / 2.5) --increases exponentially
		str = str .. "\nRespite Size: "..size.." square meters."
	end
	if (self:getData("chipcount")) then
		plastics = math.floor(self:getData("chipcount") / plasDiv)
		if(plastics > (math.floor(size / 2.5)) * 3) then --we dont want more plastics than the room can fit. at most 3 plastics for every 2.5 cubic meters.
			plastics = (math.floor(size / 2.5) * 3)
		end
		if(plastics >= 1) then
			str = str .. "\nPlastics: "..plastics.."."
		end
	end	
	if (eChips > 0) then
		str = str .. "\nEnhanced Chips: "..eChips.."."
	end
	
	return Format(str)
end