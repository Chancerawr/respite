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

-- Inventory drawing
if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		if (item:getData("equip")) then
			surface.SetDrawColor(110, 255, 110, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end


			
ITEM.buffRefresh = function(item, player)
	local client = player
	if(item.player) then
		client = item.player
	end

	local char = item.player:getChar()

	local boosts = item:getData("attrib")
	--buffs the specified attributes.
	if (boosts) then
		for k, v in pairs(boosts) do
			char:addBoost(item.uniqueID, k, v)
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
		local client = item.player
		
		if(IsValid(client.nutRagdoll)) then
			client:notify("You cannot do this right now.")
			return false
		end
	
		client.carryWeapons = client.carryWeapons or {}

		local weapon = client.carryWeapons[item.weaponCategory]

		if (!weapon or !IsValid(weapon)) then
			weapon = client:GetWeapon(item.class)	
		end

		if (weapon and weapon:IsValid()) then
			item:setData("ammo", weapon:Clip1())
		
			client:StripWeapon(item.class)
		else
			print(Format("[Nutscript] Weapon %s does not exist!", item.class))
		end

		client:EmitSound("items/ammo_pickup.wav", 80)
		client.carryWeapons[item.weaponCategory] = nil

		item:setData("equip", nil)

		if (item.onUnequipWeapon) then
			item:onUnequipWeapon(client, weapon)
		end

		local boosts = item:getData("attrib", nil)
		if (boosts) then
			for k, v in pairs(boosts) do
				client:getChar():removeBoost(item.uniqueID, k)
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
	
		if(IsValid(item.player.nutRagdoll)) then
			client:notify("You cannot do this right now.")
			return false
		end	
	
		local items = client:getChar():getInv():getItems()

		client.carryWeapons = client.carryWeapons or {}

		for k, v in pairs(items) do
			if (v.id != item.id) then
				if (
					v.isWeapon and
					client.carryWeapons[item.weaponCategory] and
					v:getData("equip")
			 	) then
					client:notifyLocalized("weaponSlotFilled")
					return false
				end
			end
		end
		
		if (client:HasWeapon(item.class)) then
			client:StripWeapon(item.class)
		end

		local weapon = client:Give(item.class)

		if (IsValid(weapon)) then
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
			client.carryWeapons[item.weaponCategory] = weapon
			client:EmitSound(item.equipSound or "items/ammo_pickup.wav", 80)

			-- Remove default given ammo.
			local ammoCount =  client:GetAmmoCount(weapon:GetPrimaryAmmoType())
			if (
				ammoCount == weapon:Clip1() and
				item:getData("ammo", 0) == 0
			) then
				client:RemoveAmmo(weapon:Clip1(), weapon:GetPrimaryAmmoType())
			end
			item:setData("equip", true)

			weapon:SetClip1(item:getData("ammo", 0))

			if (item.onEquipWeapon) then
				item:onEquipWeapon(client, weapon)
			end
			
			
			item:buffRefresh(item)
			
			
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

ITEM.functions.Inspect = {
	name = "Inspect",
	tip = "Inspect this item",
	icon = "icon16/picture.png",
	onClick = function(item)
		local customData = item:getData("custom", {})

		local frame = vgui.Create("DFrame")
		frame:SetSize(540, 680)
		frame:SetTitle(item.name)
		frame:MakePopup()
		frame:Center()

		frame.html = frame:Add("DHTML")
		frame.html:Dock(FILL)
		
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
		
		if(item.entity) then
			return false
		end
		
		return true
	end
}

ITEM.functions.Infuse = {
	name = "Infuse",
	tip = "Infuse this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player
		local dust = client:getChar():getInv():getFirstItemOfType("shard_dust")
		client:requestQuery("Are you sure you want to shard infuse this weapon?", "Infuse", function(text)
			if(dust:getData("Amount")) then
				dust:setData("Amount", dust:getData("Amount") - 1)
				if(dust:getData("Amount") == 0) then
					dust:remove()
				end
			else
				dust:remove()
			end

			item:setData("infused", true)
			
			local customData = item:getData("custom", {})
			customData.name = "Infused " .. item:getName()
			customData.desc = item:getDesc(true) .. "\nThis weapon glows lightly."
			customData.color = Color(255, 255, 255)
			
			item:setData("custom", customData)			
		end)
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return (item:getData("infused") == nil) and (client:getChar():getInv():getFirstItemOfType("shard_dust")) and (!IsValid(item.entity))
	end
}

ITEM.functions.Blight = {
	name = "Blight",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player
		local dust = client:getChar():getInv():getFirstItemOfType("blight")
		client:requestQuery("Are you sure you want to blight this weapon?", "Blight", function(text)
			dust:remove()

			item:setData("infused", true)
			
			local customData = item:getData("custom", {})
			customData.name = "Blighted " .. item:getName()
			customData.desc = item:getDesc(true) .. "\nThis weapon is coated in a pitch black material, touching it fills you with nostalgic feelings."
			customData.color = Color(0, 0, 0)
			
			item:setData("custom", customData)
		end)
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return (item:getData("infused") == nil) and client:getChar():getInv():getFirstItemOfType("blight") and (!IsValid(item.entity))
	end
}

ITEM.functions.Phase = {
	name = "Phase",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player
		local chip = client:getChar():getInv():getFirstItemOfType("cube_chip_enhanced")
		client:requestQuery("Are you sure you want to Portal Phase this melee weapon?", "Phase", function(text)
			chip:remove()

			item:setData("infused", true)
			
			local customData = item:getData("custom", {})
			customData.name = "Phased " .. item:getName()
			customData.desc = item:getDesc(true) .. "\nThis weapon's appearance distorts randomly and sometimes becomes translucent.\nHitting an enemy with it will teleport it to somewhere nearby, location determined by wielder. The weapon does no damage, but does inflict pain as if they were hit by the normal weapon."
			customData.color = Color(140, 20, 140)
			
			item:setData("custom", customData)
		end)
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		
		if(item.weaponCategory != "melee") then return false end
		if(item:getData("infused") != nil) then return false end
		if(!client:getChar():getInv():getFirstItemOfType("cube_chip_enhanced")) then return false end
		if(IsValid(item.entity)) then return false end
		
		return true
	end
}

ITEM.functions.Paint = {
	name = "Paint",
	icon = "icon16/color_swatch.png",
	onRun = function(item)
		local client = item.player
		local paint = client:getChar():getInv():getFirstItemOfType("j_paint_can")
		local paintCol = paint:getData("paint", "white")
		
		client:requestQuery("Are you sure you want to paint this weapon " ..paintCol.."?", "Paint", function(text)
			paint:remove()
			
			local customData = item:getData("custom", {})
			customData.desc = item:getDesc(true) .. "\nThis weapon is painted "..paintCol.."."
			
			item:setData("custom", customData)
			
			nut.item.spawn("j_empty_paint_can", client:getItemDropPos())
		end)
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return (client:getChar():getInv():getFirstItemOfType("j_paint_can")) and (!IsValid(item.entity))
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
			
			local boosts = item:getData("attrib", nil)
			if(boosts) then			
				for k, v in pairs(boosts) do
					client:getChar():removeBoost(item.uniqueID, k)
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

HOLSTER_DRAWINFO = HOLSTER_DRAWINFO or {}

-- Called after the item is registered into the item tables.
function ITEM:onRegistered()
	if (self.holsterDrawInfo) then
		HOLSTER_DRAWINFO[self.class] = self.holsterDrawInfo
	end
end

--might mess with this later
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
	
	local customData = self:getData("custom", {})
	if(customData.desc) then
		desc = customData.desc
	end
	
	if(!partial) then		
		local swep = weapons.Get(self.class)
		if(swep) then
			if(self.ammoString) then
				desc = desc .. "\nThis weapon uses " ..self.ammoString.. "."
			elseif(nut.ammo and nut.ammo.descs) then
				if(nut.ammo.descs[swep.Primary.Ammo]) then
					desc = desc .. "\nThis weapon uses " ..nut.ammo.descs[swep.Primary.Ammo].. "."
				end
			end
		end
	
		if(customData.dura) then
			local maxDura = self:getData("maxDura", 7000)
		
			desc = desc .. "\nDurability: " ..math.Round(((customData.dura / maxDura) * 100), 2).. "%"
		end
		
		if(customData.quality) then
			desc = desc .. "\nQuality: " ..customData.quality
		end
		
		local boosts = self:getData("attrib")
		if(boosts and !table.IsEmpty(boosts)) then --no bonuses means no need for bonuses in the desc
			desc = desc .. "\n\n<color=50,200,50>Bonuses</color>"
			for k, v in pairs(boosts) do
				if(v != 0) then --dont want to display 0 values.
					desc = desc .. "\n " .. nut.attribs.list[k].name .. ": " .. v
				end
			end
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

function ITEM:onGetDropModel()
	local model = self.model
	
	local customData = self:getData("custom", {})
	if(customData.model) then
		model = customData.model
	end
	
	return Format(model)
end

function ITEM:onRemoved()
	local inv = nut.item.inventories[self.invID]
	if (inv) then
		local receiver = inv.getReceiver and inv:getReceiver()

		if (IsValid(receiver) and receiver:IsPlayer()) then
			local weapon = receiver:GetWeapon(self.class)

			if (IsValid(weapon)) then
				weapon:Remove()
			end
		end
	end
end