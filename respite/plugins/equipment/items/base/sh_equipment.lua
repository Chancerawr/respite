ITEM.name = "Equipment Base"
ITEM.desc = ""
ITEM.model = "models/props_junk/gnome.mdl"
ITEM.category = "Equipment"
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.slot = "Gnome"

--gives SWEP on equip
--ITEM.class = "weapon_pistol"

--scrapping
--ITEM.multiChance = 10

--[[
ITEM.salvage = {
	["j_scrap_plastics"] = 1
}
--]]

--[[
ITEM.armor = 0
ITEM.dmg = {
	["Blunt"] = 5,
}
ITEM.scaling = {
	["str"] = 0.2,
}
--]]

ITEM.customizable = {
	["name"] = true,
	["desc"] = true,
	["model"] = true,
	["modelScale"] = true,
	["modelColor"] = true,
	["material"] = true,
	["color"] = true,
	["img"] = true,
	
	["dmg"] = true,
	["res"] = true,
	["resEffect"] = true,
	["amp"] = true,
	["attrib"] = true,
	
	["accuracy"] = true,
	["evasion"] = true,
	["armor"] = true,
	["scale"] = true,
}

ITEM.updateSWEP = function(item, client, weapon)
	if(nut.plugin.list["customization"]) then
		nut.plugin.list["customization"]:updateSWEP(client, item, weapon)
	end
end

ITEM.buffRefresh = function(item, player)
	local client = player
	if(item.player) then
		client = item.player
	end

	local char = client:getChar()
	if(!char) then return end

	local customBoosts = item:getData("attrib", item.attrib or {})
	for k, v in pairs(customBoosts) do
		char:addBoost(item:getName(), k, v)
	end
end
--
-- On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.EquipUn = { -- sorry, for name order.
	name = "Unequip",
	icon = "icon16/cross.png",
	--sound = "npc/roller/blade_in.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
	
		if(IsValid(client.nutRagdoll)) then
			client:notify("You cannot do this right now.")
			return false
		end
		
		local class = item:getData("class", item.class)
		if(class) then
			client.equip = client.equip or {}
		
			local slot = item:getData("customSlot", item.slot)
		
			local weapon = client.equip[slot]

			if (!weapon or !IsValid(weapon)) then
				weapon = client:GetWeapon(class)	
			end

			if (IsValid(weapon)) then
				item:setData("ammo", weapon:Clip1())
			
				client:StripWeapon(class)
			else
				print(Format("[Nutscript] Weapon %s does not exist!", class))
			end
			
			client.equip[slot] = nil
			
			if (item.onUnequipWeapon) then
				item:onUnequipWeapon(client, weapon)
			end
			
			client:EmitSound(item.unequipSound or "items/ammo_pickup.wav", 80)
		else
			client:EmitSound(item.unequipSound or "npc/roller/blade_in.wav", 75, 80)
		end
		
		--removes the buffs
		local customBoosts = item:getData("attrib", item.attrib or {})
		if (!table.IsEmpty(customBoosts)) then
			for k, v in pairs(customBoosts) do
				char:removeBoost(item:getName(), k)
			end
		end
		
		item:setData("equip", false)

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
	--sound = "npc/roller/blade_in.wav",
	onRun = function(item)		
		local client = item.player
		local char = client:getChar()
		
		--prevents equip when fallen over
		if(IsValid(item.player.nutRagdoll)) then
			client:notify("You cannot do this right now.")
			return false
		end
		
		local items = client:getChar():getInv():getItems()

		for k, v in pairs(items) do --checks if they have that slot filled already
			if (v.id != item.id) then
				local itemTable = nut.item.instances[v.id]
				
				if (!itemTable) then
					--client:notifyLocalized("tellAdmin", "wid!xt")

					return false
				else
					local slotItem = itemTable:getData("customSlot", itemTable.slot)
					local slotSelf = item:getData("customSlot", item.slot)
				
					if ((itemTable:getData("equip") and slotItem) and (string.lower(slotItem) == string.lower(slotSelf))) then
						client:notify("Your " ..slotSelf.. " slot is already filled.")

						return false
					end
				end
			end
		end
		
		local class = item:getData("class", item.class)
		if(class) then
			if (client:HasWeapon(class)) then
				client:StripWeapon(class)
			end
			
			local weapon = client:Give(class)

			if (IsValid(weapon)) then
				weapon.item = item
				--item:updateSWEP(client, weapon)
			
				local slot = item:getData("customSlot", item.slot)
			
				client.equip = client.equip or {}
				
				weapon:SetClip1(item:getData("ammo", 0))
				weapon.item = item.id
				client.equip[slot] = weapon
				
				client:SelectWeapon(class)
				
				if (item.onEquipWeapon) then
					item:onEquipWeapon(client, weapon)
				end
				
				client:EmitSound(item.equipSound or "items/ammo_pickup.wav", 80)
			end
		else
			client:EmitSound(item.equipSound or "npc/roller/blade_in.wav", 75, 80)
		end
		
		item:setData("equip", true)
		
		--buffs the specified attributes.
		if (item:getData("attrib", item.attrib)) then
			item:buffRefresh(item)
		end
		
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity) and item:getData("equip") != true)
	end
}

ITEM.functions.Upgrades = {
	name = "Remove Upgrades",
	icon = "icon16/contrast.png",
	isMulti = true,
	multiOptions = function(item, client)
		local targets = {}
		
		local openSlots = item.upgradeSlots or {}
		local upgradeSlots = item:getData("upgradeSlots", {})
		
		for slotName, v in pairs(openSlots) do
			if(slotName == "Dream") then continue end --excluded

			if(upgradeSlots[slotName]) then
				local newAbs = {
					name = slotName,
					data = {
						slotName,
						upgradeSlots[slotName]
					}
				}
				
				table.insert(targets, newAbs)
			end
		end
		
		return targets
	end,
	onRun = function(item, data)
		local client = item.player
		
		local slotName = data[1]
		local slotData = data[2]
		
		if(slotData) then
			local client = item.player
			local char = client:getChar()
			local inventory = char:getInv()
			local position = client:getItemDropPos()
			
			local upgradeSlots = item:getData("upgradeSlots", {})
			
			for itemID, slotWeight in pairs(slotData) do
				--item that's in the slot
				local itemU = nut.item.instances[itemID]

				if(itemU) then
					x, y = inventory:findFreePosition(itemU)
					if(x and y) then
						itemU:setData("x", x)
						itemU:setData("y", y)
					
						inventory:addItem(itemU)
					else
						itemU:spawn(position)
					end
					
					itemU:upgrade(itemU, item, true)
				end
			end
			
			upgradeSlots[slotName] = nil
			
			item:setData("upgradeSlots", upgradeSlots)
		end

		return false
	end,
	onCanRun = function(item)
		local client = item.player
		
		local upgradeSlots = item:getData("upgradeSlots", {})
		upgradeSlots["Dream"] = nil
		if(table.IsEmpty(upgradeSlots)) then
			return false
		end
		
		return true
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
			local chance = item.multiChance or 0
			local multi = 1
			
			if(TRAITS and client:hasTrait("scrapper")) then --trait increases chance of multi result
				chance = chance + 10
			end
			
			if(roll < chance) then
				multi = 2
			end
			
			if(istable(item.salvage)) then
				for i = 1, multi do
					amt, scrap = table.Random(item.salvage)
					
					local itemTable = nut.item.list[scrap]
					if(itemTable) then
						if(itemTable.maxstack) then
							--timer.Simple(i/2, function()
								inv:addSmart(scrap, 1, position, {Amount = amt})
							--end)
						else
							inv:addSmart(scrap, amt, position)
						end
					end
				end
			end
			
			local customBoosts = item:getData("attrib", item.attrib or {})
			if (!table.IsEmpty(customBoosts)) then			
				for k, v in pairs(customBoosts) do
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
		if(!item.salvage) then
			return false
		end
		
		if(item:getData("equip")) then
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


--for people to name their crafted items
ITEM.functions.CustomName = {
	name = "Change Name",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		local customData = item:getData("custom", {})

		client:requestString("Change Name", "", function(text)
			customData.name = text or " "
			item:setData("custom", customData)
		end, customData.name)

		return false
	end,
	onCanRun = function(item)
		local creator = item:getData("creator")
	
		local client = item.player
		
		if(creator and client:getChar():getID() == creator) then
			return true
		else
			return false
		end
	end
}

ITEM.functions.CustomSlot = {
	name = "Customize Slot",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		client:requestString("Change Slot", "Input the slot name, two items of the same slot cannot be equipped at once.", function(text) --start of model
			local slot = tostring(text)
			
			item:setData("customSlot", slot)
		end, item:getData("customSlot", item.slot))
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomClass = {
	name = "Customize Weapon Class",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		client:requestString("Change Weapon", "Input the weapon class name, such as 'weapon_pistol'", function(text) --start of model
			local class = tostring(text)
			
			item:setData("class", class)
		end, item:getData("class", item.class))
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomW = {
	name = "Customize Weapon",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)		
		nut.plugin.list["customization"]:startCustomWeap(item.player, item)
		
		return false
	end,
	
	onCanRun = function(item)
		local client = item.player
		
		--only for weapons
		local class = item:getData("class", item.class)
		if(!class) then
			return false
		end
		
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomStats = {
	name = "Customize Stats",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)		
		nut.plugin.list["customization"]:startCustomE(item.player, item)
		
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

ITEM.functions.CustomRes = {
	name = "Customize Resistances",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item, data)
		nut.plugin.list["customization"]:startCustomR(item.player, item)
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomAmp = {
	name = "Customize Amplifications",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item, data)
		nut.plugin.list["customization"]:startCustomAmp(item.player, item)
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.Clone = {
	name = "Clone",
	tip = "Clone this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player	
	
		client:requestQuery("Are you sure you want to clone this item?", "Clone", function(text)
			local inventory = client:getChar():getInv()
			local data = table.Copy(item.data)
			data.x = nil
			data.y = nil
			data.equip = nil

			if(!inventory:add(item.uniqueID, 1, data)) then
				client:notify("Inventory is full")
			end
		end)
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

-- On item is dropped, Remove a weapon from the player and keep the ammo in the item.
ITEM:hook("drop", function(item)
	if (item:getData("equip")) then
		local client = item.player
	
		item:setData("equip", nil)
		
		local class = item:getData("class", item.class)
		if(class) then
			client.equip = client.equip or {}

			local weapon = client.equip[item.slot]
			
			if (IsValid(weapon)) then
				item:setData("ammo", weapon:Clip1())
				
				client:StripWeapon(class)
				client.equip[item.slot] = nil
				
				client:EmitSound(item.unequipSound or "items/ammo_pickup.wav", 80)
			end
		end
		
		local customBoosts = item:getData("attrib", item.attrib or {})
		if (!table.IsEmpty(customBoosts)) then
			for k, v in pairs(customBoosts) do
				client:getChar():removeBoost(item:getName(), k)
			end
		end
	end
end)

--prevents equipped items from being transferred
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
		local class = self:getData("class", self.class)
	
		if(self.ammoString) then
			desc = desc .. "\nThis weapon uses " ..self.ammoString.. "."
		elseif(class) then
			local swep = weapons.Get(class)
			if(swep) then
				if(nut.ammo and nut.ammo.types and nut.ammo.types[swep.Primary.Ammo]) then
					desc = desc .. "\nThis weapon uses " ..nut.ammo.types[swep.Primary.Ammo].name.. "."
				end
			end
		end
	
		local slot = self:getData("customSlot", self.slot)
		if(slot) then
			slot = string.upper(string.sub(slot, 0, 1))..string.sub(slot, 2)
		
			desc = desc .. "\nSlot: " ..slot.. "."
		end
		
		if(self.upgradeSlots) then
			desc = desc .. "\n\n<color=50,200,50>Upgrade Slots</color>"
			
			for slotName, slotMax in pairs(self.upgradeSlots) do
				local slotData = self:getData("upgradeSlots", {})

				local slotUsed = 0
				for k, v in pairs(slotData[slotName] or {}) do
					slotUsed = slotUsed+v
				end

				desc = desc .. "\n[" ..slotName.. "](" ..slotUsed.. "/" ..slotMax..")"
			end
		end
		
		local boosts = self:getData("attrib", self.attrib)
		if(boosts and !table.IsEmpty(boosts)) then
			desc = desc .. "\n\n<color=50,200,50>Bonuses</color>"
			
			for k, v in pairs(boosts) do
				if(v != 0) then
					desc = desc .. "\n " ..(nut.attribs.list[k] and nut.attribs.list[k].name).. ": " ..v
				end
			end
		end

		local dmg = self:getData("dmg", self.dmg)
		local armor = self:getData("armor", self.armor)
		local scaling = self:getData("scale", self.scaling)

		if(dmg or armor or scaling) then
			--desc = desc.. "\n\n<color=50,200,50>Properties</color>"
			
			if(dmg and !table.IsEmpty(dmg)) then
				desc = desc .. "\n\n<color=50,200,50>Base Damage</color>"
				
				for dmgT, dmgV in pairs(dmg) do
					if(dmgV != 0) then
						desc = desc .. "\n " ..dmgV.. " " ..dmgT.. " Damage."
					end
				end
			end
			
			if(armor) then
				desc = desc.. "\n\nPhysical Armor: " ..armor.. "."
			end
			
			if((scaling and !table.IsEmpty(scaling))) then
				desc = desc.. "\n\n<color=50,200,50>Attribute Scaling</color>"
				
				for k, v in pairs(scaling) do
					local attrib = nut.attribs.list[k]
					if(attrib and attrib.name) then
						desc = desc.. "\n " ..attrib.name.. ": Grade [" ..nut.plugin.list["equipment"]:getGrade(v).. "]"
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

function ITEM:onSave()
	local class = self:getData("class", self.class)
	if(class) then
		local weapon = self.player:GetWeapon(class)

		if (IsValid(weapon)) then
			self:setData("ammo", weapon:Clip1())
		end
	end
end

function ITEM:onRestored()
	local item = self

	--make sure to load in all of its upgrade items just in case
	local upgradeSlots = item:getData("upgradeSlots", {})
	
	for slotName, slotData in pairs(upgradeSlots) do
		for itemID, slotWeight in pairs(slotData) do
			local item = nut.item.instances[itemID]

			if(!item) then
				nut.item.loadItemByID(itemID)
			end
		end
	end
end

function ITEM:onLoadout()
	local client = self.player

	if(self:getData("equip")) then
		self:buffRefresh(self, client)
	
		local class = self:getData("class", self.class)
		if(class) then
			client.equip = client.equip or {}

			local weapon = client:Give(class)
			
			if (IsValid(weapon)) then
				weapon.item = self
				--self:updateSWEP(client, weapon)
				
				client:RemoveAmmo(weapon:Clip1(), weapon:GetPrimaryAmmoType())
				client.equip[self.slot] = weapon

				weapon:SetClip1(self:getData("ammo", 0))
			else
				print(Format("[Nutscript] Weapon %s does not exist!", class))
			end
		end
	end
end

--might mess with this later
hook.Add("PlayerDeath", "nutStripClip", function(client)
	client.carryWeapons = {}

	for k, v in pairs(client:getChar():getInv():getItems()) do
		local class = v:getData("class", v.class)
		if (class and v:getData("equip")) then
			local weapon = client:GetWeapon(class)
			
			if(IsValid(weapon)) then
				v:setData("ammo", weapon:Clip1())
			end
		end
	end
end)

function ITEM:onEntityCreated(entity)
	local customData = self:getData("custom", {})
	
	local modelColor = customData.modelColor or self.modelColor
	if(modelColor) then
		entity:SetColor(modelColor)
	end
	
	local scale = customData.modelScale or self.modelScale
	scale = tonumber(scale)

	--crashes the server sometimes, don't know why
	--[[
	if(scale) then
		--clamp this so you cant just crash the server with it
		scale = math.Clamp(scale, 0.1, 10)
		
		entity:SetModelScale(scale)

		local physobj = entity:GetPhysicsObject()
		if (!IsValid(physobj)) then return false end

		--grabbed from a collision resizer tool
		local physmesh = physobj:GetMeshConvexes()
		if (!istable(physmesh)) or (#physmesh < 1) then return false end

		for convexkey, convex in pairs(physmesh) do
			for poskey, postab in pairs(convex) do
				convex[poskey] = postab.pos * scale
			end
		end

		local asleep = physobj:IsAsleep()

		entity:PhysicsInitMultiConvex(physmesh)
		
		if(!asleep) then
			entity:GetPhysicsObject():Wake()
		end
	end
	--]]

	if(self.entMass) then
		local physObj = entity:GetPhysicsObject()
		if(IsValid(physObj)) then
			physObj:SetMass(self.entMass)
		end
	end
end

-- Inventory drawing
if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		if (item:getData("equip")) then
			surface.SetDrawColor(110, 255, 110, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
		
		--[[
		local customData = item:getData("custom", {})
		local color = customData.color or item.color or nut.config.get("color", Color(0,0,0,255))
		
		surface.SetDrawColor(color)
		surface.DrawOutlinedRect(0, 0, w, h, 1)
		--]]
	end
	
	function ITEM:DrawWorldModel(entity)
		if (!entity.WElements) then 
			entity:DrawModel()
			return
		end
		
		if (!entity.wRenderOrder) then
			entity.wRenderOrder = {}

			for k, v in pairs(entity.WElements) do
				if (v.type == "Model") then
					table.insert(entity.wRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(entity.wRenderOrder, k)
				end
			end
		end
		
		// when the weapon is dropped
		bone_ent = entity

		for k, name in pairs(entity.wRenderOrder) do
		
			local v = entity.WElements[name]
			if (!v) then entity.wRenderOrder = nil break end
			if (v.hide) then continue end
			
			local pos, ang
			
			if (v.bone) then
				pos, ang = self:GetBoneOrientation( entity.WElements, v, bone_ent )
			else
				pos, ang = self:GetBoneOrientation( entity.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
			end
			
			if (!pos) then continue end

			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (v.type == "Model" and IsValid(model)) then
				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				model:SetAngles(entity:GetAngles())
				
				//model:SetModelScale(v.size)
				--[[
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				--]]
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end
	
	function ITEM:GetBoneOrientation( basetab, tab, ent, bone_override )
		local bone, pos, ang
		if (tab.rel and tab.rel != "") then
			local v = basetab[tab.rel]
			if (!v) then return end
			
			// Technically, if there exists an element with the same name as a bone
			// you can get in an infinite loop. Let's just hope nobody's that stupid.
			pos, ang = self:GetBoneOrientation( basetab, v, ent )

			if (!pos) then return end
			
			pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
		else
			bone = ent:LookupBone(bone_override or tab.bone)

			if (!bone) then return end

			pos, ang = Vector(0,0,0), Angle(0,0,0)
			local m = ent:GetBoneMatrix(bone)
			if (m) then
				pos, ang = m:GetTranslation(), m:GetAngles()
			end
			
			--[[
			if (IsValid(self.Owner) and self.Owner:IsPlayer() and 
				ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
				ang.r = -ang.r // Fixes mirrored models
			end
			--]]
		
		end
		
		return pos, ang
	end

	function ITEM:CreateModels( tab, entity )
		if (!tab) then return end
		
		// Create the clientside models here because Garry says we can't do it in the render hook
		for k, v in pairs( tab ) do
			if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and 
					string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then
				
				if(IsValid(v.modelEnt)) then 
					v.modelEnt:Remove()
				end

				v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)

				if (IsValid(v.modelEnt)) then
					v.modelEnt:SetPos(entity:GetPos())
					v.modelEnt:SetAngles(entity:GetAngles())
					v.modelEnt:SetParent(entity)
					v.modelEnt:SetNoDraw(true)
					v.createdModel = v.model
				else
					v.modelEnt = nil
				end
				
			elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite) 
				and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then
				
				local name = v.sprite.."-"
				local params = { ["$basetexture"] = v.sprite }
				// make sure we create a unique name based on the selected options
				local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
				for i, j in pairs( tocheck ) do
					if (v[j]) then
						params["$"..j] = 1
						name = name.."1"
					else
						name = name.."0"
					end
				end

				v.createdSprite = v.sprite
				v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)
				
			end
		end
		
	end
	
	local allbones
	local hasGarryFixedBoneScalingYet = false

	function ITEM:UpdateBonePositions(vm)
		
		if self.ViewModelBoneMods then
			
			if (!vm:GetBoneCount()) then return end
			
			// !! WORKAROUND !! //
			// We need to check all model names :/
			local loopthrough = self.ViewModelBoneMods
			if (!hasGarryFixedBoneScalingYet) then
				allbones = {}
				for i=0, vm:GetBoneCount() do
					local bonename = vm:GetBoneName(i)
					if (self.ViewModelBoneMods[bonename]) then 
						allbones[bonename] = self.ViewModelBoneMods[bonename]
					else
						allbones[bonename] = { 
							scale = Vector(1,1,1),
							pos = Vector(0,0,0),
							angle = Angle(0,0,0)
						}
					end
				end
				
				loopthrough = allbones
			end
			// !! ----------- !! //
			
			for k, v in pairs( loopthrough ) do
				local bone = vm:LookupBone(k)
				if (!bone) then continue end
				
				// !! WORKAROUND !! //
				local s = Vector(v.scale.x,v.scale.y,v.scale.z)
				local p = Vector(v.pos.x,v.pos.y,v.pos.z)
				local ms = Vector(1,1,1)
				if (!hasGarryFixedBoneScalingYet) then
					local cur = vm:GetBoneParent(bone)
					while(cur >= 0) do
						local pscale = loopthrough[vm:GetBoneName(cur)].scale
						ms = ms * pscale
						cur = vm:GetBoneParent(cur)
					end
				end
				
				s = s * ms
				// !! ----------- !! //
				
				if vm:GetManipulateBoneScale(bone) != s then
					vm:ManipulateBoneScale( bone, s )
				end
				if vm:GetManipulateBoneAngles(bone) != v.angle then
					vm:ManipulateBoneAngles( bone, v.angle )
				end
				if vm:GetManipulateBonePosition(bone) != p then
					vm:ManipulateBonePosition( bone, p )
				end
			end
		else
			self:ResetBonePositions(vm)
		end
		   
	end
	 
	function ITEM:ResetBonePositions(vm)
		
		if (!vm:GetBoneCount()) then return end
		for i=0, vm:GetBoneCount() do
			vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
			vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
			vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
		end
		
	end
	
	// Fully copies the table, meaning all tables inside this table are copied too and so on (normal table.Copy copies only their reference).
	// Does not copy entities of course, only copies their reference.
	// WARNING: do not use on tables that contain themselves somewhere down the line or you'll get an infinite loop
	function table.FullCopy( tab )

		if (!tab) then return nil end
		
		local res = {}
		for k, v in pairs( tab ) do
			if (type(v) == "table") then
				res[k] = table.FullCopy(v) // recursion ho!
			elseif (type(v) == "Vector") then
				res[k] = Vector(v.x, v.y, v.z)
			elseif (type(v) == "Angle") then
				res[k] = Angle(v.p, v.y, v.r)
			else
				res[k] = v
			end
		end
		
		return res
		
	end
	
	function ITEM:drawEntity(entity)
		if (!self.WElements) then 
			entity:DrawModel()
			return
		end
	
		if(!entity.WElementGenerated) then
			entity.WElements = table.FullCopy(self.WElements)
			self:CreateModels(entity.WElements, entity) // create worldmodels
			
			entity.WElementGenerated = true
		else
			self:DrawWorldModel(entity)
			entity:DrawModel()
		end
	end
end