ITEM.name = "Ammo Base"
ITEM.model = "models/Items/BoxSRounds.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.ammo = "pistol" // type of the ammo
ITEM.ammoAmount = 30 // amount of the ammo
ITEM.desc = "A Box that contains %s of Pistol Ammo"
ITEM.category = "Ammunition"

--extra function to make ammo saving more reliable, turned off for now.
local function onLoad(item)
	local plugin = nut.plugin.list["ammosave"]
	local client = item.player
	if(client and client:getChar()) then
		local ammoTable = {}
		
		for k, v in ipairs(plugin.ammoList) do
			local ammo = client:GetAmmoCount(v)
			--print(v .. ammo)
			
			if (ammo > 0) then
				ammoTable[v] = ammo
			end
		end
		client:getChar():setData("ammo", ammoTable)
	end
end

// On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.use = { -- sorry, for name order.
	name = "Load",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		item.player:GiveAmmo(item.ammoAmount, item.ammo)
		item.player:EmitSound("items/ammo_pickup.wav", 110)
		onLoad(item)
		
		return true
	end,
	onCanRun = function(item)
		local player = item.player
		
		if (player:GetAmmoCount(item.ammo) >= item.ammoAmount) then
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
		client:requestQuery("Are you sure you want to shard infuse this ammo?", "Infuse", function(text)
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
			customData.desc = item:getDesc(true) .. "\nThis ammo glows lightly."
			customData.color = Color(255, 255, 255)
			
			item:setData("custom", customData)
		end)
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return (item:getData("infused") == nil) and client:getChar():getInv():getFirstItemOfType("shard_dust")
	end
}

ITEM.functions.Blight = {
	name = "Blight",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player
		local dust = client:getChar():getInv():getFirstItemOfType("blight")
		client:requestQuery("Are you sure you want to blight this ammo?", "Blight", function(text)		
			dust:remove()
			
			item:setData("infused", true)
			
			local customData = item:getData("custom", {})
			customData.name = "Blighted " .. item:getName()
			customData.desc = item:getDesc(true) .. "\nThis ammo is pitch black."
			customData.color = Color(0, 0, 0)
			
			item:setData("custom", customData)
		end)
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return (item:getData("infused") == nil) and client:getChar():getInv():getFirstItemOfType("blight")
	end
}

ITEM.functions.Phase = {
	name = "Phase",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player
		local chip = client:getChar():getInv():getFirstItemOfType("cube_chip_enhanced")
		client:requestQuery("Are you sure you want to Portal Phase this ammo?", "Phase", function(text)
			chip:remove()

			item:setData("infused", true)
			
			local customData = item:getData("custom", {})
			customData.name = "Phased " .. item:getName()
			customData.desc = item:getDesc(true) .. "\nThis ammo's appearance distorts randomly and sometimes becomes translucent."
			customData.color = Color(140, 20, 140)
			
			item:setData("custom", customData)
		end)
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return (item:getData("infused") == nil) and client:getChar():getInv():getFirstItemOfType("cube_chip_enhanced")
	end
}

function ITEM:getDesc()
	local desc = Format(self.desc, self.ammoAmount)
	
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
		draw.SimpleText(item.ammoAmount, "DermaDefault", w , h - 5, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end