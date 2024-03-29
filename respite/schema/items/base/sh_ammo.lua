ITEM.name = "Ammo Base"
ITEM.model = "models/Items/BoxSRounds.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.ammo = "pistol" // type of the ammo
ITEM.ammoAmount = 1 // amount of the ammo
ITEM.desc = "A Box that contains %s of Pistol Ammo"
ITEM.category = "Ammunition"
ITEM.maxstack = 30

--extra function to make ammo saving more reliable
local function onLoad(item)
	local plugin = nut.plugin.list["ammosave"]
	local client = item.player
	if(client and client:getChar()) then
		local ammoTable = {}
		
		for k, v in ipairs(plugin.ammoList) do
			local ammo = client:GetAmmoCount(v)
			if (ammo > 0) then
				ammoTable[v] = ammo
			end
		end
		client:getChar():setData("ammo", ammoTable)
	end
end

ITEM.onCombine = function(itemSelf, itemTarget)
	if(!itemSelf:getData("ammo", itemSelf.ammoAmount)) then
		return false
	end

	if(itemSelf.uniqueID == itemTarget.uniqueID) then
		local amountSelf = itemSelf:getData("ammo", itemSelf.ammoAmount)
		local amountTarget = itemTarget:getData("ammo", itemTarget.ammoAmount)

		local combined = amountSelf + amountTarget
		
		local maxstack = itemSelf.maxstack
		
		if(combined > maxstack) then
			itemSelf:setData("ammo", maxstack)
			itemTarget:setData("ammo", combined - maxstack)
		else
			itemTarget:remove()
			itemSelf:setData("ammo", amountSelf + amountTarget)
		end
		
		--itemSelf.player:EmitSound("ambient/materials/dinnerplates1.wav", 65, 130)
	end
end

// On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.use = { -- sorry, for name order.
	name = "Load",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		item.player:GiveAmmo(item:getData("ammo", item.ammoAmount), item.ammo)
		item.player:EmitSound("items/ammo_pickup.wav", 110)
		onLoad(item)
		
		return true
	end,
	onCanRun = function(item)
		local player = item.player
		
		--makes it so players can't load a ton of ammo into their guns
		--[[
		if (player:GetAmmoCount(item.ammo) >= item.ammoAmount) then
			return false
		end
		--]]
		
		return true
	end
}

ITEM.functions.StackModify = {
	name = "Modify Stack",
	icon = "icon16/cog.png",
	onRun = function(item)
		local client = item:getOwner()

		client:requestString("Modify Stack", "Modify the item's stack count.",function(text)
			local value = tonumber(text)
			if (value) then
				item:setData("ammo", math.Clamp(value, 1, item.maxstack))
			end
		end, item:getData("ammo", item.ammoAmount))

		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.Split = {
	tip = "Take a part out.",
	icon = "icon16/delete.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local position = client:getItemDropPos()
		
		local stack = item:getData("ammo", item.ammoAmount)
		if(stack <= 1) then return false end

		client:requestString("Split", "", function(text)	
			amount = math.Clamp(tonumber(text), 1, stack - 1)
			
			item:setData("ammo", item:getData("ammo", item.ammoAmount) - amount)
			
			inventory:addSmart(item.uniqueID, 1, position, {ammo = amount})
			
			--client:EmitSound("ambient/materials/dinnerplates1.wav", 65, 130)
		end, 1)

		return false
	end,
	onCanRun = function(item)
		if(item.entity) then
			return false
		end
		
		if(item:getData("ammo", item.ammoAmount) <= 1) then
			return false
		end
		
		return true
	end	
}

ITEM.functions.Custom = {
	name = "Customize",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)		
		nut.plugin.list["customization"]:startCustom(item.player, item)
		
		return false
	end,
	
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

function ITEM:getDesc()
	local desc = Format(self.desc, self:getData("ammo", self.ammoAmount))
	
	local customData = self:getData("custom", {})
	if(customData.desc) then
		desc = customData.desc
	end
	
	if(!partial) then
		if(customData.quality) then
			desc = desc .. "\nQuality: " ..customData.quality
		end
	end
	
	return desc
end

function ITEM:getName()
	local name = self.name
	
	local customData = self:getData("custom", {})
	if(customData.name) then
		name = customData.name
	end

	return name
end

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		draw.SimpleText(item:getData("ammo", item.ammoAmount), "DermaDefault", w , h - 5, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end