ITEM.name = "Prism"
ITEM.uniqueID = "prism"
ITEM.desc = "A strange object that swirls about on its own."
ITEM.model = "models/props_c17/playgroundtick-tack-toe_block01a.mdl"
ITEM.material = "models/props_combine/tpballglow"
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "1"
ITEM.category = "Miscellaneous"
ITEM.invWidth = 5
ITEM.invHeight = 5
ITEM.color = Color(255, 255, 255)
ITEM.openTime = 0.1

--should use shards, memories, maybe organic material, intrinsic symbols

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}

local otherBags = {
	shard_complete = true,
	prism = true
}

local function getDelay(item)
	local workers = item:getData("ichorlings", 1)
	local symbols = item:getData("symbols", 0)
	local size = item:getData("size", 2) / 50
	
	return (120 + (3600 / workers)) -- divide by amount of workers
end

local function timerCheck(item)
	if(item:getData("producing")) then
		if(item:getData("producing") < CurTime() and item:getData("producing") + getDelay(item) >= CurTime()) then
			return false
		end
	end
	
	return true
end

local function subIchor(item, cost)
	item:setData("ichor", item:getData("ichor", 50) - cost)
end

local function subMem(item, cost)
	item:setData("memory", item:getData("memory", 0) - cost)
end

local function addBuild(item, index)
	local builds = item:getData("builds", {})
	builds[index] = 1
	item:setData("builds", builds)
end

local function getAmount(item)
	return math.floor((item:getData("shardcount", 10) / 4) / 2.5) -- for every 2.5 square meters of room space, one item is produced.
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
	icon = "icon16/briefcase.png",
	onClick = function(item)
		nut.bar.actionStart = CurTime()
		nut.bar.actionEnd = CurTime() + item.openTime
		nut.bar.actionText = "Opening.."
		LocalPlayer():ConCommand("play npc/turret_floor/click1.wav")
		timer.Simple(item.openTime, 
			function()
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
			end
		)
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
	name = "Claim Prism",
	tip = "Claim this prism as yours.",
	icon = "icon16/house.png",
	onRun = function(item)
		item:setData("char", item.player:getChar():getID())
		return false
	end,
	onCanRun = function(item)
		if(IsValid(item.entity)) then
			return false
		end
		
		if(!item:getData("char") or item:getData("char") == 0) then
			return true
		else
			return false
		end
	end
}

ITEM.functions.AbsorbIchor = {
	name = "Absorb Ichor",
	tip = "Absorb ichor in inventory.",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local stack = item:getData("ichor", 10)
		local obj = inventory:hasItem("ichor")
		
		while(obj) do
			stack = stack + obj:getData("ichor", 1)
			obj:remove()
			obj = inventory:hasItem("ichor")
		end
		
		item:setData("ichor", stack)
		
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

ITEM.functions.AbsorbMemory = {
	name = "Absorb Memories",
	tip = "Absorb memories in inventory.",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local stack = item:getData("memory", 0)
		local obj = inventory:hasItem("j_scrap_memory")	

		while(obj) do
			stack = stack + obj:getData("Amount", 1)
			obj:remove()
			obj = inventory:hasItem("j_scrap_memory")
		end
		
		item:setData("memory", chipstack)
		
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

ITEM.functions.AbsorbIChips = {
	name = "Absorb Intrinsic Symbols",
	tip = "Absorb symbols in inventory.",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local stack = item:getData("symbols", 0)
		local obj = inventory:hasItem("chip_escape")	
		
		while(obj) do
			stack = stack + 1
			obj:remove()
			obj = inventory:hasItem("chip_escape")
		end
		
		item:setData("symbols", stack)
		
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

--stored ichor.
--function to create ichorling
--functions for structures?
--

ITEM.functions.Worker = {
	name = "Create Ichorling",
	tip = "Form an ichorling within your prism.",
	icon = "icon16/world.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		subIchor(item, 25) --subtract the cost
		
		item.player:EmitSound("plats/bigstop1.wav") --replace this
		
		item:setData("producing", CurTime())
		local delay = getDelay(item)
		timer.Simple(delay, function()
			if (item) then
				item:setData("ichorling", item:getData("ichorling", 0) + 1)
			
				item:setData("producing", nil)
				client:notify("Ichorling complete.")
			end
		end)
		
		return false
	end,
	onCanRun = function(item)	
		if(!timerCheck(item)) then
			return false
		end
	
		if(IsValid(item.entity)) then
			return false
		end

		local player = item.player or item:getOwner()
		if(item:getData("char") != player:getChar():getID()) then
			return false
		end
	end
}

ITEM.functions.Expand = {
	name = "Expand World",
	tip = "Expand your inner world.",
	icon = "icon16/world.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		subIchor(item, 5) --subtract the cost
		
		item.player:EmitSound("plats/bigstop1.wav") --replace this
		
		item:setData("producing", CurTime())
		local delay = getDelay(item)
		timer.Simple(delay, function()
			if (item) then
				item:setData("size", item:getData("size", 2) * 2)
			
				item:setData("producing", nil)
				client:notify("Inner world expanded.")
			end
		end)
		
		return false
	end,
	onCanRun = function(item)	
		if(!timerCheck(item)) then
			return false
		end
	
		if(IsValid(item.entity)) then
			return false
		end

		local player = item.player or item:getOwner()
		if(item:getData("char") != player:getChar():getID()) then
			return false
		end
	end
}

ITEM.functions.Ichor = {
	name = "Attract Ichor",
	tip = "Generate ichor in your ichor attractor.",
	icon = "icon16/world.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		item.player:EmitSound("plats/bigstop1.wav") --replace this
		
		item:setData("producing", CurTime())
		local delay = getDelay(item)
		timer.Simple(delay, function()
			if (item) then		
				local index = item:getData("id")
				local roomspace = nut.item.inventories[index]

				local amount = 5
				
				for i=1, amount do 
					timer.Simple(i/2, 
						function()
							roomspace:add("ichor")
						end
					)
				end			
			
				item:setData("producing", nil)
				client:notify("Inner world expanded.")
			end
		end)
		
		return false
	end,
	onCanRun = function(item)	
		if(!timerCheck(item)) then
			return false
		end
	
		if(IsValid(item.entity)) then
			return false
		end

		local player = item.player or item:getOwner()
		if(item:getData("char") != player:getChar():getID()) then
			return false
		end
	end
}

ITEM.functions.Build1 = {
	name = "Build Ichor Attractor",
	tip = "Ichor harvesting facility.",
	icon = "icon16/world.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		subMem(item, 20) --subtract the cost
		
		item.player:EmitSound("plats/bigstop1.wav") --replace this
		
		item:setData("producing", CurTime())
		local delay = getDelay(item)
		timer.Simple(delay, function()
			if (item) then
				addBuild(item, 1)
			
				item:setData("producing", nil)
				client:notify("Inner world expanded.")
			end
		end)
		
		return false
	end,
	onCanRun = function(item)	
		if(!timerCheck(item)) then
			return false
		end
	
		if(IsValid(item.entity)) then
			return false
		end

		local player = item.player or item:getOwner()
		if(item:getData("char") != player:getChar():getID()) then
			return false
		end
	end
}

function ITEM:getDesc()
	local str = self.desc

	local workers = self:getData("ichorlings", 1)
	local memories = self:getData("memory", 1)
	local symbols = self:getData("symbols", 0)
	local ichor = self:getData("ichor", 50)
	local size = self:getData("size", 2)

	ichor = ichor / 2
	str = str .. "\nIchor: " ..ichor.. " Liters."
	
	str = str .. "\nIchorlings: " ..workers.. "."
	
	--color these later
	local stability = {
		"Critically Unstable",
		"Very Unstable",
		"Unstable",
		"Near-stable",
		"Stable",
		"Very Stable",
		"Tranquil"
	}
	
	str = str .. "\nSize: " ..size.. " square meters."
	str = str .. "\nStability: " ..stability[1].. "."
	
	if (symbols > 0) then
		str = str .. "\nIntrinsic Symbols: " ..symbols.. "."
	end
	
	return Format(str)
end

--stability, units, structures
--stability based on memories (population max)
--research speed based on intrinsic symbols (unlock new buildings)
--units and structures are built
--structures allow for different activities
