ITEM.name = "Equip Base"
ITEM.model = "models/props_junk/gnome.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = ""
ITEM.category = "Equippable Buffs"
ITEM.flag = "v"
ITEM.buffCategory = "Gnome"
ITEM.multiChance = 10

-- Inventory drawing
if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		if (item:getData("equip")) then
			surface.SetDrawColor(255, 110, 110, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end

ITEM.buffRefresh = function(item, player)
	local client = player
	if(item.player) then
		client = item.player
	end

	local char = client:getChar()

	local temp = {}		
	--combines both boost lists
	local customBoosts = item:getData("attrib", {})
	for k, v in pairs(item.attribBoosts) do
		temp[k] = v
	end
	
	for k, v in pairs(customBoosts) do
		temp[k] = (temp[k] or 0) + v
	end		

	for k, v in pairs(temp) do
		char:addBoost(item:getName(), k, v)
	end
end

-- On item is dropped, Remove a weapon from the player and keep the ammo in the item.
ITEM:hook("drop", function(item)
	if (item:getData("equip")) then
		item:setData("equip", nil)
		
		if (item.attribBoosts or item:getData("attrib", nil)) then
			local temp = {}		
			--combines both boost lists
			local customBoosts = item:getData("attrib", {})
			for k, v in pairs(item.attribBoosts) do
				temp[k] = v
			end
			
			for k, v in pairs(customBoosts) do
				temp[k] = (temp[k] or 0) + v
			end	
		
			for k, v in pairs(temp) do
				item.player:getChar():removeBoost(item:getName(), k)
			end
		end
	end
end)
--
-- On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.EquipUn = { -- sorry, for name order.
	name = "Unequip",
	icon = "icon16/cross.png",
	sound = "npc/roller/blade_in.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
	
		item:setData("equip", false)
		
		--removes the buffs
		if (item.attribBoosts or item:getData("attrib", nil)) then
			local temp = {}		
			--combines both boost lists
			local customBoosts = item:getData("attrib", {})
			for k, v in pairs(item.attribBoosts) do
				temp[k] = v
			end
			
			for k, v in pairs(customBoosts) do
				temp[k] = (temp[k] or 0) + v
			end
			
			for k, v in pairs(temp) do
				char:removeBoost(item:getName(), k)
			end
		end

		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity) and item:getData("equip") == true)
	end
}

-- On player eqipped the item, Gives a weapon to player and load the ammo data from the item.
ITEM.functions.Equip = {
	name = "Equip",
	icon = "icon16/tick.png",
	sound = "npc/roller/blade_in.wav",
	onRun = function(item)		
		local client = item.player
		local char = client:getChar()
		
		local items = client:getChar():getInv():getItems()

		for k, v in pairs(items) do --checks if they have that slot filled already
			if (v.id != item.id) then
				local itemTable = nut.item.instances[v.id]
				
				if (!itemTable) then
					--client:notifyLocalized("tellAdmin", "wid!xt")

					return false
				else
					if ((itemTable:getData("equip") and itemTable.buffCategory) and (string.lower(itemTable:getData("customSlot", itemTable.buffCategory)) == string.lower(item:getData("customSlot", item.buffCategory)))) then
						client:notify("Your " .. item.buffCategory .. " slot is already filled.")

						return false
					end
				end
			end
		end
		
		item:setData("equip", true)
		--buffs the specified attributes.
		if (item.attribBoosts or item:getData("attrib", nil)) then
			item:buffRefresh(item)
		end
		
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity) and item:getData("equip") != true)
	end
}

ITEM.functions.Inspect = {
	name = "Inspect",
	tip = "Inspect this item",
	icon = "icon16/picture.png",
	onClick = function(item)
		local frame = vgui.Create("DFrame")
		frame:SetSize(540, 680)
		frame:SetTitle(item.name)
		frame:MakePopup()
		frame:Center()

		frame.html = frame:Add("DHTML")
		frame.html:Dock(FILL)
		
		local customData = item:getData("custom", {})
		
		local imageCode = [[<img src = "]]..customData.img..[["/>]]
		
		frame.html:SetHTML([[<html><body style="background-color: #000000; color: #282B2D; font-family: 'Book Antiqua', Palatino, 'Palatino Linotype', 'Palatino LT STD', Georgia, serif; font-size 16px; text-align: justify;">]]..imageCode..[[</body></html>]])
	end,
	onRun = function(item)
		return false
	end,
	onCanRun = function(item)
		local customData = item:getData("custom", {})
	
		if(!customData.img) then
			return false
		end
		
		return true
	end
}

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/wrench.png",
	--sound = "npc/manhack/grind"..math.random(1,5)..".wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inv = char:getInv()
		local position = client:getItemDropPos()
		local scrap
		local amt
		
		client:requestQuery("Are you sure you want to scrap this item?", "Scrap", function(text) --confirmation message
			local roll = math.random(1,100)
			local chance = item.multiChance
			local multi = 1
			
			if(TRAITS and hasTrait(client, "scrapper")) then --trait increases chance of multi result
				chance = chance + 10
			end
			
			if(roll < chance) then
				multi = 2
			end
			
			if(istable(item.salvItem)) then
				for i = 1, multi do
					amt, scrap = table.Random(item.salvItem)
					
					local itemTable = nut.item.list[scrap]
					if(itemTable) then
						if(itemTable.maxstack) then
							timer.Simple(i/2, function()
								inv:addSmart(scrap, 1, position, {Amount = amt})
							end)
						else
							inv:addSmart(scrap, amt, position)
						end
					end
				end
			end
			
			if (item.attribBoosts or item:getData("attrib", nil)) then			
				local temp = {}		
				--combines both boost lists
				local customBoosts = item:getData("attrib", {})
				for k, v in pairs(item.attribBoosts) do
					temp[k] = v
				end		
				for k, v in pairs(customBoosts) do
					temp[k] = (temp[k] or 0) + v
				end
				
				for k, v in pairs(temp) do
					client:getChar():removeBoost(item:getName(), k)
				end
			end
			
			--Randomized sounds don't work up there so I had to do this.
			client:EmitSound("npc/manhack/grind"..math.random(1,5)..".wav", 70, math.random(85,105))
					
			item:remove()
		end)
		
		return false
	end,
	onCanRun = function(item)
		if(!item.salvItem) then
			return false
		end
		
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("kit_salvager")
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

ITEM.functions.CustomAtr = {
	name = "Customize Attributes",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item, data)
		nut.plugin.list["customization"]:startCustomA(item.player, item)
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

function ITEM:onCanBeTransfered(oldInventory, newInventory)
	if (newInventory and self:getData("equip")) then
		return false
	end
	
	local client = self.player
	if(client and IsValid(client.nutRagdoll)) then
		return false
	end

	return true
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
		if(self:getData("customSlot", self.buffCategory)) then
			local category = self:getData("customSlot", self.buffCategory)
			category = string.upper(string.sub(category, 0, 1))..string.sub(category, 2)
		
			desc = desc .. "\nSlot: " ..category.. "."
		end
			
		if(customData.quality) then
			desc = desc .. "\nQuality: " ..customData.quality
		end
		
		local boosts = self:getData("attrib")
		if(self.attribBoosts or (boosts and !table.IsEmpty(boosts))) then
			desc = desc .. "\n\n<color=50,200,50>Bonuses</color>"
			
			local temp = {}		
			--combines both boost lists
			local customBoosts = self:getData("attrib", {})
			for k, v in pairs(self.attribBoosts) do
				temp[k] = v
			end
			
			for k, v in pairs(customBoosts) do
				temp[k] = (temp[k] or 0) + v
			end
			
			for k, v in pairs(temp) do
				if(v != 0) then
					desc = desc .. "\n " ..(nut.attribs.list[k] and nut.attribs.list[k].name).. ": " ..v
				end
			end
		end
	end
	
	return desc
end

function ITEM:onGetDropModel()
	local model = self.model
	
	local customData = self:getData("custom", {})
	if(customData.model) then
		model = customData.model
	end
	
	return Format(model)
end
