ITEM.name = "Weapon"
ITEM.desc = "A Weapon."
ITEM.category = "Weapons"
ITEM.model = "models/weapons/w_pistol.mdl"
ITEM.class = "weapon_pistol"
ITEM.width = 2
ITEM.height = 2
ITEM.isWeapon = true
ITEM.weaponCategory = "sidearm"
ITEM.color = Color(100,110,100)

ITEM.multiChance = 20 --for scrapping

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

-- Inventory drawing
if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		if (item:getData("equip")) then
			surface.SetDrawColor(110, 255, 110, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end

-- On item is dropped, Remove a weapon from the player and keep the ammo in the item.
ITEM:hook("drop", function(item)
	if (item:getData("equip")) then
		item:setData("equip", nil)

		item.player.carryWeapons = item.player.carryWeapons or {}

		local weapon = item.player.carryWeapons[item.weaponCategory]

		if (IsValid(weapon)) then
			item:setData("ammo", weapon:Clip1())

			item.player:StripWeapon(item.class)
			item.player.carryWeapons[item.weaponCategory] = nil
			item.player:EmitSound("items/ammo_pickup.wav", 80)
		end
		
		local boosts = item:getData("attrib", nil)
		if (boosts) then
			for k, v in pairs(boosts) do
				item.player:getChar():removeBoost(item.uniqueID, k)
			end
		end
	end
end)

-- On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.EquipUn = { -- sorry, for name order.
	name = "Unequip",
	tip = "equipTip",
	icon = "icon16/cross.png",
	onRun = function(item)
		item.player.carryWeapons = item.player.carryWeapons or {}

		local weapon = item.player.carryWeapons[item.weaponCategory]

		if (!weapon or !IsValid(weapon)) then
			weapon = item.player:GetWeapon(item.class)	
		end

		if (weapon and weapon:IsValid()) then
			item:setData("ammo", weapon:Clip1())
		
			item.player:StripWeapon(item.class)
		else
			print(Format("[Nutscript] Weapon %s does not exist!", item.class))
		end

		item.player:EmitSound("items/ammo_pickup.wav", 80)
		item.player.carryWeapons[item.weaponCategory] = nil

		item:setData("equip", nil)

		if (item.onUnequipWeapon) then
			item:onUnequipWeapon(client, weapon)
		end

		local boosts = item:getData("attrib", nil)
		if (boosts) then
			for k, v in pairs(boosts) do
				item.player:getChar():removeBoost(item.uniqueID, k)
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
	tip = "equipTip",
	icon = "icon16/tick.png",
	onRun = function(item)
		local client = item.player
		local items = client:getChar():getInv():getItems()

		client.carryWeapons = client.carryWeapons or {}

		for k, v in pairs(items) do
			if (v.id != item.id) then
				local itemTable = nut.item.instances[v.id]
				
				if (!itemTable) then
					client:notifyLocalized("tellAdmin", "wid!xt")

					return false
				else
					if (itemTable.isWeapon and client.carryWeapons[item.weaponCategory] and itemTable:getData("equip")) then
						client:notifyLocalized("weaponSlotFilled")

						return false
					end
				end
			end
		end
		
		if (client:HasWeapon(item.class)) then
			client:StripWeapon(item.class)
		end

		local weapon = client:Give(item.class)

		if (IsValid(weapon)) then
			client.carryWeapons[item.weaponCategory] = weapon
			client:SelectWeapon(weapon:GetClass())
			client:SetActiveWeapon(weapon)
			client:EmitSound("items/ammo_pickup.wav", 80)

			-- Remove default given ammo.
			if (client:GetAmmoCount(weapon:GetPrimaryAmmoType()) == weapon:Clip1() and item:getData("ammo", 0) == 0) then
				client:RemoveAmmo(weapon:Clip1(), weapon:GetPrimaryAmmoType())
			end
			item:setData("equip", true)
			
			weapon:SetClip1(item:getData("ammo", 0))

			if (item.onEquipWeapon) then
				item:onEquipWeapon(client, weapon)
			end
			
			local boosts = item:getData("attrib")
			--buffs the specified attributes.
			if (boosts) then
				for k, v in pairs(boosts) do
					client:getChar():addBoost(item.uniqueID, k, v)
				end
			end
			
			weapon.item = item.id
		else
			print(Format("[Nutscript] Weapon %s does not exist!", item.class))
		end

		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity) and item:getData("equip") != true)
	end
}

ITEM.functions.Custom = {
	name = "Customize",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player
		client:requestString("Change Name", "What name do you want this item to have?", function(text)
			item:setData("customName", text)
			client:requestString("Change Description", "What Description do you want this item to have?", function(text)
				item:setData("customDesc", text)
			end, item:getDesc(true))
		end, item:getName())
		return false
	end,
	onCanRun = function(item)
		local client = item:getOwner() or item.player
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomCol = {
	name = "Customize Color",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player
		local color = item:getData("customCol", Color(255,255,255))
		
		client:requestString("Change Color", "Enter ', ' separated RGB values.", function(text) --start of model
			local colorTbl = string.Split(text, ", ")
			if(table.Count(colorTbl) == 3) then
				red = tonumber(colorTbl[1])
				green = tonumber(colorTbl[2])
				blue = tonumber(colorTbl[3])
				if(red and green and blue) then --i put in a lot of extra shit here to idiot proof it.
					color.r = red
					color.g = green
					color.b = blue
				end
			end
		
			item:setData("customCol", color)
		end, color.r .. ", " .. color.g .. ", " .. color.b) --end of color
		
		--hopefully resets the player's icons
		client:ConCommand("nut_flushicon")
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomAtr = {
	name = "Customize Attributes",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	isMulti = true,
	multiOptions = function(item, client)
        local targets = {
            {name = "accuracy", data = "accuracy"},
            {name = "agility", data = "stm"},
            {name = "craftiness", data = "medical"},
            {name = "endurance", data = "end"},
            {name = "fortitude", data = "fortitude"},
            {name = "luck", data = "luck"},
            {name = "perception", data = "perception"},
            {name = "strength", data = "str"},
        }
       
        return targets
    end,
	onRun = function(item, data)
		local client = item.player
		local attribs = item:getData("attrib", {})
		
		client:requestString("Input Attribute", nut.attribs.list[data].name, function(text)
			attribs[data] = tonumber(text)
			item:setData("attrib", attribs)
		end, attribs[data] or 0)
	
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomMat = {
	name = "Customize Material",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		local material = item:getData("mat") or item.material or ""
		client:requestString("Change Material", "Enter material path.", function(text) --start of model
			item:setData("mat", text)
		end, material)
	
		--hopefully resets the player's icons
		client:ConCommand("nut_flushicon")
	
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
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
			
			if(!inventory:add(item.uniqueID, 1, item.data)) then
				client:notify("Inventory is full")
			end
		end)
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.Infuse = {
	name = "Infuse",
	tip = "Infuse this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player
		local dust = client:getChar():getInv():hasItem("shard_dust")
		client:requestQuery("Are you sure you want to shard infuse this weapon?", "Infuse", function(text)
			if(dust:getData("Amount")) then
				dust:setData("Amount", dust:getData("Amount") - 1)
				if(dust:getData("Amount") == 0) then
					dust:remove()
				end
			else
				dust:remove()
			end
			item:setData("customName", "Infused " .. item:getName())
			item:setData("customDesc", item:getDesc(true) .. "\nThis weapon glows lightly.")
			item:setData("customCol", Color(255, 255, 255))
			item:setData("infused", true)
		end)
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()

		return (item:getData("infused") == nil) and (client:getChar():getInv():hasItem("shard_dust")) and (!IsValid(item.entity))
	end
}

ITEM.functions.Blight = {
	name = "Blight",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player
		local dust = client:getChar():getInv():hasItem("blight")
		client:requestQuery("Are you sure you want to blight this weapon?", "Blight", function(text)
			dust:remove()
			item:setData("customName", "Blighted " .. item:getName())
			item:setData("customDesc", item:getDesc(true) .. "\nThis weapon makes you nostalgic.")
			item:setData("customCol", Color(0, 0, 0))
			item:setData("infused", true)
		end)
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return (item:getData("infused") == nil) and client:getChar():getInv():hasItem("blight") and (!IsValid(item.entity))
	end
}

ITEM.functions.Phase = {
	name = "Phase",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player
		local chip = client:getChar():getInv():hasItem("cube_chip_enhanced")
		client:requestQuery("Are you sure you want to Portal Phase this melee weapon?", "Phase", function(text)
			chip:remove()
			item:setData("customName", "Phased " .. item:getName())
			item:setData("customDesc", item:getDesc(true) .. "\nThis weapon changes and distorts by itself.\nHitting an enemy with it will teleport it to somewhere nearby, location determined by wielder. The weapon does no damage, but does inflict pain as if they were hit by the normal weapon.")
			item:setData("customCol", Color(140, 20, 140))
			item:setData("infused", true)
		end)
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		
		if(!string.find(string.lower(item.category), "melee")) then return false end
		if(item:getData("infused") != nil) then return false end
		if(!client:getChar():getInv():hasItem("cube_chip_enhanced")) then return false end
		if(IsValid(item.entity)) then return false end
	end
}

ITEM.functions.Paint = {
	name = "Paint",
	icon = "icon16/color_swatch.png",
	onRun = function(item)
		local client = item.player
		local paint = client:getChar():getInv():hasItem("j_paint_can")
		local paintCol = paint:getData("paint", "white")
		
		client:requestQuery("Are you sure you want to paint this weapon " ..paintCol.."?", "Paint", function(text)
			paint:remove()
			item:setData("customDesc", item:getDesc(true) .. "\nThis weapon is painted "..paintCol..".")
			nut.item.spawn("j_empty_paint_can", client:getItemDropPos())
		end)
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return (client:getChar():getInv():hasItem("j_paint_can")) and (!IsValid(item.entity))
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
		
		client:requestQuery("Are you sure you want to scrap this weapon?", "Scrap", function(text) --confirmation message
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
					timer.Simple(i/2, function()
						if(!inv:add(scrap, 1, { Amount = amt })) then
							nut.item.spawn(scrap, position,
								function(item2)
									item2:setData("Amount", amt)
								end
							)
						end
					end)
				end
			else
				for i = 1, multi do
					scrap = item.salvItem
					timer.Simple(i/2, function()
						if(!inv:add(scrap, 1, { Amount = item:getData("scrapamount") })) then
							nut.item.spawn(scrap, position,
								function(item2)
									item2:setData("Amount", item:getData("scrapamount"))
								end
							)
						end
					end)
				end
			end
			
			local boosts = item:getData("attrib", nil)
			if(boosts) then			
				for k, v in pairs(boosts) do
					client:getChar():removeBoost(item.uniqueID, k)
				end
			end
			
			--Randomized sounds don't work up there so I had to do this.
			client:EmitSound("npc/manhack/grind"..math.random(1,5)..".wav", 70)
			
			item:remove()
		end)
		
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

function ITEM:onLoadout()
	if (self:getData("equip")) then
		local client = self.player
		client.carryWeapons = client.carryWeapons or {}

		local weapon = client:Give(self.class)

		if (IsValid(weapon)) then
			client:RemoveAmmo(weapon:Clip1(), weapon:GetPrimaryAmmoType())
			client.carryWeapons[self.weaponCategory] = weapon

			weapon:SetClip1(self:getData("ammo", 0))
		else
			print(Format("[Nutscript] Weapon %s does not exist!", self.class))
		end
	end
end

function ITEM:onSave()
	local weapon = self.player:GetWeapon(self.class)

	if (IsValid(weapon)) then
		self:setData("ammo", weapon:Clip1())
	end
end

HOLSTER_DRAWINFO = {}

-- Called after the item is registered into the item tables.
function ITEM:onRegistered()
	if (self.holsterDrawInfo) then
		HOLSTER_DRAWINFO[self.class] = self.holsterDrawInfo
	end
end

hook.Add("PlayerDeath", "nutStripClip", function(client)
	client.carryWeapons = {}

	for k, v in pairs(client:getChar():getInv():getItems()) do
		if (v.isWeapon and v:getData("equip")) then
			v:setData("ammo", nil)
			v:setData("equip", nil)
		end
	end
end)

function ITEM:getDesc(partial)
	local desc = self.desc
	
	if(self:getData("customDesc") != nil) then
		desc = self:getData("customDesc")
	end	
	
	if(!partial) then
		if(self:getData("quality") != nil) then
			desc = desc .. "\nQuality: " .. quality[math.Round(self:getData("quality"))]
		end
		
		local boosts = self:getData("attrib")
		if(boosts and boosts != {}) then --no bonuses means no need for bonuses in the desc
			desc = desc .. "\n\n<color=50,200,50>Bonuses</color>"
			for k, v in pairs(boosts) do
				if(v != 0) then --dont want to display 0 values.
					desc = desc .. "\n " .. nut.attribs.list[k].name .. ": " .. v
				end
			end
		end
	end
	
	return Format(desc)
end

function ITEM:getName()
	local name = self.name
	
	if(self:getData("customName") != nil) then
		name = self:getData("customName")
	end

	return Format(name)
end
