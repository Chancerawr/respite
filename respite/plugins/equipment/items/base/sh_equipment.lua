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
	["Crush"] = 5,
}
ITEM.scaling = {
	["str"] = 0.2,
}
--]]

ITEM.buffRefresh = function(item, player)
	local client = player
	if(item.player) then
		client = item.player
	end

	local char = client:getChar()

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
		
		if(item.class) then
			client.equip = client.equip or {}
		
			local weapon = client.equip[item.slot]

			if (!weapon or !IsValid(weapon)) then
				weapon = client:GetWeapon(item.class)	
			end

			if (IsValid(weapon)) then
				item:setData("ammo", weapon:Clip1())
			
				client:StripWeapon(item.class)
			else
				print(Format("[Nutscript] Weapon %s does not exist!", item.class))
			end
			
			client.equip[item.slot] = nil
			
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
					if ((itemTable:getData("equip") and itemTable.slot) and (string.lower(itemTable:getData("customSlot", itemTable.slot)) == string.lower(item:getData("customSlot", item.slot)))) then
						client:notify("Your " ..item.slot.. " slot is already filled.")

						return false
					end
				end
			end
		end
		
		if(item.class) then
			if (client:HasWeapon(item.class)) then
				client:StripWeapon(item.class)
			end
			
			local weapon = client:Give(item.class)

			if (IsValid(weapon)) then
				--weapon stat customization stuff, needs to be reworked or moved for sure
				--[[
				timer.Simple(0, function()
					local custom = item:getData("custom", {})
					
					if(custom.wepDmg) then
						weapon.Primary.Damage = tonumber(custom.wepDmg)
					end
					
					if(custom.wepSpd) then
						weapon.Primary.RPM = tonumber(custom.wepSpd)
					end
					
					if(custom.wepRec) then
						weapon.Primary.KickUp = weapon.Primary.KickUp and (weapon.Primary.KickUp * custom.wepRec)
						
						weapon.Primary.KickDown = weapon.Primary.KickDown and (weapon.Primary.KickDown * custom.wepRec)
						
						weapon.Primary.KickHorizontal = weapon.Primary.KickHorizontal and (weapon.Primary.KickHorizontal * custom.wepRec)
						
						weapon.Primary.StaticRecoilFactor = weapon.Primary.StaticRecoilFactor and (weapon.Primary.StaticRecoilFactor * custom.wepRec)
					end

					if(custom.wepAcc) then
						weapon.Primary.Spread = weapon.Primary.Spread * custom.wepAcc
						weapon.Primary.IronAccuracy = weapon.Primary.IronAccuracy * custom.wepAcc
					end				

					if(custom.wepMag) then
						weapon.Primary.ClipSize = tonumber(custom.wepMag)
					end
				
					client:SelectWeapon(weapon:GetClass())
					
					timer.Simple(1, function()
						if(nut.plugin.list["customization"]) then
							nut.plugin.list["customization"]:updateSWEP(client, item)
						end
					end)
				end)
				--]]
				client.equip = client.equip or {}
				
				weapon:SetClip1(item:getData("ammo", 0))
				weapon.item = item.id
				client.equip[item.slot] = weapon
				
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
			
			if(TRAITS and hasTrait(client, "scrapper")) then --trait increases chance of multi result
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
							timer.Simple(i/2, function()
								inv:addSmart(scrap, 1, position, {Amount = amt})
							end)
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
		
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("kit_salvager")
	end
}

ITEM.functions.Repair = {
	name = "Repair",
	tip = "useTip",
	icon = "icon16/wrench_orange.png",
	onRun = function(item)
		local inventory = item.player:getChar():getInv()
		local kit = inventory:getFirstItemOfType("repair_kit")
		kit:remove()
		
		local customData = item:getData("custom", {})
		customData.dura = item:getData("maxDura", 7000)
		item:setData("custom", customData)
		
		item.player:EmitSound("doors/vent_open1.wav", 50, 140)
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
	
		if(!item.dura) then return false end
	
		local kit = inventory:getFirstItemOfType("repair_kit")
		if(!kit) then
			return false
		end
		
		local customData = item:getData("custom", {})
		if(customData.dura) then
			local maxDura = item:getData("maxDura", 7000)
		
			if(customData.dura < maxDura) then
				return true
			end
		else
			return false
		end
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

ITEM.functions.Clone = {
	name = "Clone",
	tip = "Clone this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player	
	
		client:requestQuery("Are you sure you want to clone this item?", "Clone", function(text)
			local inventory = client:getChar():getInv()
			local data = item.data
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
		
		if(item.class) then
			client.equip = client.equip or {}

			local weapon = client.equip[item.slot]
			
			if (IsValid(weapon)) then
				item:setData("ammo", weapon:Clip1())
				
				client:StripWeapon(item.class)
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
		if(self.ammoString) then
			desc = desc .. "\nThis weapon uses " ..self.ammoString.. "."
		elseif(self.class) then
			local swep = weapons.Get(self.class)
			if(swep) then
				if(nut.ammo and nut.ammo.descs and nut.ammo.descs[swep.Primary.Ammo]) then
					desc = desc .. "\nThis weapon uses " ..nut.ammo.descs[swep.Primary.Ammo].. "."
				end
			end
		end
	
		local slot = self:getData("customSlot", self.slot)
		if(slot) then
			slot = string.upper(string.sub(slot, 0, 1))..string.sub(slot, 2)
		
			desc = desc .. "\nSlot: " ..slot.. "."
		end
			
		if(customData.quality) then
			desc = desc .. "\nQuality: " ..customData.quality
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
			desc = desc.. "\n\n<color=50,200,50>Properties</color>"
			
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
						desc = desc.. "\n " ..attrib.name.. ": Grade[" ..nut.plugin.list["equipment"]:getGrade(v).. "]"
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
	if(self.class) then
		local weapon = self.player:GetWeapon(self.class)

		if (IsValid(weapon)) then
			self:setData("ammo", weapon:Clip1())
		end
	end
end

function ITEM:onLoadout()
	if (self.class and self:getData("equip")) then
		local client = self.player
		client.equip = client.equip or {}

		local weapon = client:Give(self.class)
		if (IsValid(weapon)) then
			client:RemoveAmmo(weapon:Clip1(), weapon:GetPrimaryAmmoType())
			client.equip[self.slot] = weapon

			weapon:SetClip1(self:getData("ammo", 0))
		else
			print(Format("[Nutscript] Weapon %s does not exist!", self.class))
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
	end
end