local PLUGIN = PLUGIN
PLUGIN.name = "Handheld Cities"
PLUGIN.author = "Chancer"
PLUGIN.desc = ""

nut.util.includeDir("extra")

local function getAmount(item)
	return math.floor((item:getData("shardcount", 10) / 4) / 2.5) -- for every 2.5 square meters of room space, one item is produced.
end

local function getDelay(item)
	local workers = item:getData("ichorlings", 1)
	local symbols = item:getData("symbols", 0)
	local size = item:getData("size", 2) / 50
	
	return (120 + (3600 / workers)) -- divide by amount of workers
end

timer.Simple(5, function()
	--[[
	local test = {}
	test.id = "Banana"
	test.name = "Test"
	test.delayMult = 0.001
	test.amountMult = 1
	test.startSound = "plats/bigstop1.wav"

	PLUGIN.resourceFuncs = {
		test
	}
	--]]

	local ITEM = nut.item.list["prism"]

	--for k, v in pairs(PLUGIN.resourceFuncs) do
		ITEM.functions.Generate = {
			icon = "icon16/world.png",
			isMulti = true,
			multiOptions = function(item, client)				
				local targets = {}
				
				for k, v in pairs(PLUGIN.resourceFuncs) do
					local newData = {}
					newData.name = v.name
					newData.delayMult = v.delayMult
					newData.amountMult = v.amountMult
					newData.startSound = v.startSound
					
					targets[v.id] = {name = v.name, data = newData}
				end
			   
				return targets
			end,
			onRun = function(item, data)
				local client = item.player
				local inventory = client:getChar():getInv()
				
				local delay = getDelay(item) * (data.delayMult or 1)
				local amount = getAmount(item) * (data.amountMult or 1)
				
				item.player:EmitSound(data.startSound or "plats/bigstop1.wav")
				item:setData("producing", CurTime())
				
				timer.Simple(delay, function()
					if (item != nil) then
						local index = item:getData("id")
						local roomspace = nut.item.inventories[index]
						
						for i = 1, amount do 
							timer.Simple(i/2, function()
								roomspace:add("food_potato_plastic")
							end)
						end
						
						item:setData("producing", nil)
						
						client:notify((data.name or "Prism").. " complete.")
					end
				end)
				
				return false
			end,
			onCanRun = function(item)
				local player = item.player or item:getOwner()
			
				if(item:getData("char") != player:getChar():getID()) then
					return false
				end		
			
				if(IsValid(item.entity)) then
					return false
				end
				
				local prodTime = getDelay(item) * (1)
				if(item:getData("producing")) then
					if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
						return false
					end
				end			
			end
		}
	--end
end)
