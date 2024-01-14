ITEM.name = "Enhancement Base"
ITEM.desc = " "
ITEM.model = "models/props_c17/pulleywheels_small01.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 1

ITEM.flag = "v"
ITEM.category = "Upgrades"

ITEM.enhancement = true

--[[
ITEM.armorOnly = true
ITEM.weaponOnly = true
ITEM.armor = 5
ITEM.dmg = 1
ITEM.weight = 0.75

ITEM.attribs = 1
--]]

local function tableMerger(finished, tab)
	for k, v in pairs(tab) do
		if(istable(v)) then
			if(!finished[k]) then
				finished[k] = {}
			end
			
			tableMerger(finished[k], v)
		else
			if(isnumber(v)) then
				finished[k] = (finished[k] or 0) + v
			elseif(isstring(v)) then
				finished[k] = v
			end
		end
	end
end

local function tableRemover(finished, tab)
	for k, v in pairs(tab) do
		if(istable(v)) then
			if(!finished[k]) then
				finished[k] = {}
			end
			
			tableRemover(finished[k], v)
		else
			if(isnumber(v)) then
				finished[k] = (finished[k] or 0) - v
			elseif(isstring(v)) then
				finished[k] = nil
			end
		end
	end
end

--[[
	local log = item:getData("upgradeLog", {})
	
	log[slot] = {
		item1,
		item2,
		item3,
	}
--]]

ITEM.onCombineTo = function(itemSelf, itemTarget)
	if(!itemSelf.combiner) then return true end

	local client = itemSelf.player

	if(itemSelf.trait and client:hasTrait(itemSelf.trait)) then 
		client:notify("You do not have the proper trait to do this.")
		return true 
	end

	if(itemSelf:getData("armorOnly", itemSelf.armorOnly) and !itemTarget:getData("armor", itemTarget.armor)) then
		client:notify("Can only be used on items with armor.")
		return true
	end	
	
	if(itemSelf:getData("weaponOnly", itemSelf.weaponOnly) and !itemTarget:getData("dmg", itemTarget.dmg)) then
		client:notify("Can only be used on items with damage.")
		return true
	end
	
	local enhanceSlot = itemSelf:getData("slot", itemSelf.slot)
	if(enhanceSlot and !itemTarget.upgradeSlots) then
		client:notify("Can only be used on items with slots.")
		return true
	elseif(enhanceSlot and !itemTarget.upgradeSlots[enhanceSlot]) then
		client:notify("Item does not have the correct slot.")
		return true
	end
	
	local query = "Do you want to upgrade this equipment?" --the message it gives the player
	
	--upgrade slot
	local openSlots = itemTarget.upgradeSlots or {}
	local upgradeSlots = itemTarget:getData("upgradeSlots", {})
	--local upgradeLog = itemTarget:getData("upgradeLog", {})
	
	--the item's slots and how much space they have
	local slotSpace = openSlots[enhanceSlot]
	
	--the enhance in the slot
	local curEnhance = upgradeSlots[enhanceSlot] or {}
	local upgradeSize = itemSelf.upgradeSize or slotSpace
	
	local usedSpace = 0
	for itemID, itemSpace in pairs(curEnhance) do
		usedSpace = usedSpace+itemSpace
	end
	
	if((upgradeSize + usedSpace) > slotSpace) then
		client:notify("No room in the " ..enhanceSlot.. " slot.")
		return true
	end
	
	if(enhanceSlot) then 
		query = "Do you want to add this upgrade to this item's " ..itemSelf.slot.. " slot?"
	end
	
	client:requestQuery(query, "Upgrade", function(text)
		local newSlot = upgradeSlots[enhanceSlot] or {}
		newSlot[itemSelf.id] = upgradeSize
	
		upgradeSlots[enhanceSlot] = newSlot
		itemTarget:setData("upgradeSlots", upgradeSlots) --marks item as upgraded
	
		itemSelf:upgrade(itemSelf, itemTarget)

		--remove the item from the inventory but do not delete it
		itemSelf:removeFromInventory(true) 
		
		client:EmitSound("ambient/materials/dinnerplates1.wav", 65, 130)
	end)
end

function ITEM:upgrade(itemSelf, itemTarget, undo)
	local itemStats = {
		dmg = itemTarget:getData("dmg", itemTarget.dmg),
		armor = itemTarget:getData("armor", itemTarget.armor),

		res = itemTarget:getData("res", itemTarget.res),
		amp = itemTarget:getData("amp", itemTarget.amp),
		attrib = itemTarget:getData("attrib", itemTarget.attrib),
	}

	local upgradeStats = {
		dmg = itemSelf:getData("dmg", itemSelf.dmg),
		armor = itemSelf:getData("armor", itemSelf.armor),

		res = itemSelf:getData("res", itemSelf.res),
		amp = itemSelf:getData("amp", itemSelf.amp),
		attrib = itemSelf:getData("attrib", itemSelf.attrib),
	}
	
	local customW = itemSelf.customW
	if(customW) then
		local swep = weapons.Get(itemTarget.class)
		local customData = itemTarget:getData("customW", {})

		local weaponStatTbl = nut.plugin.list["customization"].weaponStatTbl

		local weaponData = {}
		for k, v in pairs(weaponStatTbl) do
			if(v.checkFunction) then
				local check = v.checkFunction(swep)
				
				if(check) then
					if(v.customVars) then
						for stat, statFunc in pairs(v.customVars) do
							weaponData[stat] = statFunc(customData, swep)
						end
					end
				end
			end
		end

		itemStats.customW = weaponData -- the weapons current data
		upgradeStats.customW = customW --upgrade data
	end
	
	--merges the things
	if(!undo) then
		tableMerger(itemStats, upgradeStats)
	else
		tableRemover(itemStats, upgradeStats)
	end

	for k, v in pairs(itemStats) do
		itemTarget:setData(k, v)
	end
end

function ITEM:getName()
	local name = self.name
	
	local customData = self:getData("custom", {})
	if(customData.name) then
		name = customData.name
	end
	
	return name
end

function ITEM:getDesc(partial)
	local desc = self.desc
	
	local customData = self:getData("custom", {})
	if(customData.desc) then
		desc = customData.desc
	end
	
	if(!partial) then
		if(self.armorOnly) then
			desc = desc.. "\nThis can only be applied to items that have armor."
		end
		
		if(self.weaponOnly) then
			desc = desc.. "\nThis can only be applied to items that have damage."
		end
	
		local dmg = self:getData("dmg", self.dmg)
		local armor = self:getData("armor", self.armor)
		
		desc = desc.. "\n\n<color=50,200,50>Properties</color>"
		
		if(dmg) then
			desc = desc.. "\n Damage: "
			
			for dmgT, dmgV in pairs(dmg) do
				desc = desc.. "\n  " ..dmgT.. ": " ..dmgV.. "."
			end
		end
		
		if(armor) then
			desc = desc.. "\n Physical Armor: " ..armor.. "."
		end
		
		if(customData.weight or self.weight) then
			desc = desc.. "\n Weight: " ..(customData.weight or self.weight)
		end	
		
		local boosts = self:getData("attrib", self.attrib)
		if(boosts and boosts != {}) then --no bonuses means no need for bonuses in the desc
			desc = desc .. "\n\n<color=50,200,50>Bonuses</color>"
			for k, v in pairs(boosts) do
				if(v != 0) then --dont want to display 0 values.
					local attrib = nut.attribs.list[k]
					if(attrib and attrib.name) then
						desc = desc .. "\n " ..attrib.name.. ": " ..v.. "."
					end
				end
			end
		end
		
		local res = self:getData("res", self.res)
		if(res and !table.IsEmpty(res)) then --no bonuses means no need for bonuses in the desc
			desc = desc.. "\n\n<color=50,200,50>Resistances</color>"
			
			local combatPlugin = nut.plugin.list["combat"]
			
			for k, v in pairs(res) do
				if(v != 0) then
					local dmgType = (combatPlugin and combatPlugin.dmgTypes[k])
					
					local effect = EFFS.effects[k]
					
					if(dmgType) then
						desc = desc.. "\n " ..dmgType.name.. " Resistance: " ..v.. "%."
					elseif(effect) then
						desc = desc.. "\n " ..effect.name.. " Resistance: " ..v.. "%."
					end
				end
			end
		end	
		
		local amp = self:getData("amp", self.amp)
		if(amp and !table.IsEmpty(amp)) then --no bonuses means no need for bonuses in the desc
			desc = desc.. "\n\n<color=50,200,50>Amplifications</color>"
			
			local combatPlugin = nut.plugin.list["combat"]
			
			for k, v in pairs(amp) do
				if(v != 0) then
					local dmgType = (combatPlugin and combatPlugin.dmgTypes[k])
					if(dmgType) then
						desc = desc.. "\n " ..dmgType.name.. " Amplification: " ..v.. "%."
					end
				end
			end
		end
		
		local crafter = self:getData("crafter")
		if(LocalPlayer():IsAdmin() and crafter) then
			desc = desc.. "\nCrafted by " ..crafter.. "."
		end
	end
	
	return desc
end