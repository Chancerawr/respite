ITEM.name = "Equip Base"
ITEM.model = "models/props_junk/gnome.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = ""
ITEM.category = "Equippable Buffs"
ITEM.flag = "v"
ITEM.buffCategory = "gnome"

-- Inventory drawing
if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		if (item:getData("equip")) then
			surface.SetDrawColor(255, 110, 110, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end

-- On item is dropped, Remove a weapon from the player and keep the ammo in the item.
ITEM:hook("drop", function(item)
	if (item:getData("equip")) then
		item:setData("equip", nil)
		if (item.attribBoosts) then
			for k, v in pairs(item.attribBoosts) do
				item.player:getChar():removeBoost(item.buffCategory, k)
			end
		end
	end
end)

-- On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.EquipUn = { -- sorry, for name order.
	name = "Unequip",
	icon = "icon16/cross.png",
	sound = "physics/plastic/plastic_barrel_impact_soft4.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
	
		item:setData("equip", false)
		--buffs the specified attributes.
		if (item.attribBoosts) then
			for k, v in pairs(item.attribBoosts) do
				char:removeBoost(item.buffCategory, k)
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
	sound = "physics/plastic/plastic_barrel_impact_soft3.wav",
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
					if (itemTable:getData("equip") and itemTable.buffCategory == item.buffCategory) then
						client:notify("Your " .. item.buffCategory .. " slot is already filled.")

						return false
					end
				end
			end
		end
		
		item:setData("equip", true)
		--buffs the specified attributes.
		if (item.attribBoosts) then
			for k, v in pairs(item.attribBoosts) do
				char:addBoost(item.buffCategory, k, v)
			end
		end
		
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity) and item:getData("equip") != true)
	end
}

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/wrench.png",
	--sound = "npc/manhack/grind"..math.random(1,5)..".wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
	
		if (item.attribBoosts) then
			for k, v in pairs(item.attribBoosts) do
				char:removeBoost(item.buffCategory, k)
			end
		end
	
		if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
			item.player:getChar():getInv():add(item.salvItem, 1, { Amount = item:getData("scrapamount") })
			item:remove()
		else
			item.player:notify("You don't have any room in your inventory!")
		end
		
		--Randomized sounds don't work up there so I had to do this.
		item.player:EmitSound("npc/manhack/grind"..math.random(1,5)..".wav")
		return false
	end,
	onCanRun = function(item)
		if(!item.salvItem) then
			return false
		end
		local client = item:getOwner() or item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():hasItem("kit_salvager")
	end
}


local quality = {}
quality[0] = "Terrible"
quality[1] = "Awful"
quality[2] = "Bad"
quality[3] = "Poor"
quality[4] = "Normal"
quality[5] = "Decent"
quality[6] = "Good"
quality[7] = "Great"
quality[8] = "Excellent"
quality[9] = "Master"
quality[10] = "Perfect"

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("quality") != nil) then
		desc = desc .. "\nQuality: " .. quality[math.Round(self:getData("quality"))]
	end
	
	if(self.attribBoosts) then
		desc = desc .. "\n\n<color=50,200,50>Bonuses</color>"
		for k, v in pairs(self.attribBoosts) do
			desc = desc .. "\n " .. nut.attribs.list[k].name .. ": " .. v
		end
	end
	
	return Format(desc)
end

function ITEM:getName()
	local name = self:getData("customName", self.name)
	
	return Format(name)
end
