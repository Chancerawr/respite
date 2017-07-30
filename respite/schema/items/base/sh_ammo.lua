ITEM.name = "Ammo Base"
ITEM.model = "models/Items/BoxSRounds.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.ammo = "pistol" // type of the ammo
ITEM.ammoAmount = 30 // amount of the ammo
ITEM.desc = "A Box that contains %s of Pistol Ammo"
ITEM.category = "Ammunition"

function ITEM:getDesc()
	return Format(self.desc, self.ammoAmount)
end

function ITEM:getName()
	local name = self.name
	
	if(self:getData("customName") != nil) then
		name = self:getData("customName")
	end

	return Format(name)
end

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		draw.SimpleText(item.ammoAmount, "DermaDefault", w , h - 5, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end

--extra function to make ammo saving more reliable, turned off for now.
local function onLoad(item)
	local plugin = nut.plugin.list["ammosave"]
	local client = item.player or item:getOwner()
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
}


ITEM.functions.Infuse = {
	name = "Infuse",
	tip = "Infuse this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player
		local dust = client:getChar():getInv():hasItem("shard_dust")
		client:requestString("Infuse", "Are you sure you want to shard infuse this ammo?",
		function(text)
			if(dust:getData("Amount")) then
				dust:setData("Amount", dust:getData("Amount") - 1)
				if(dust:getData("Amount") == 0) then
					dust:remove()
				end
			else
				dust:remove()
			end
			item:setData("customName", "Infused " .. item:getName())
			--item:setData("customDesc", item:getDesc() .. "\nThis ammo glows lightly.")
			item:setData("customCol", Color(255, 255, 255))
			item:setData("infused", true)
		end)
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return (item:getData("infused") == nil) and client:getChar():getInv():hasItem("shard_dust")
	end
}

ITEM.functions.Blight = {
	name = "Blight",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player
		local dust = client:getChar():getInv():hasItem("cure")
		client:requestString("Blight", "Are you sure you want to CURE blight this ammo?",
		function(text)
		dust:remove()
		item:setData("customName", "Blighted " .. item:getName())
		--item:setData("customDesc", item:getDesc() .. "\nThis ammo makes you nostalgic.")
		--doesnt work because of how ammo descriptions work, oh well.
		item:setData("customCol", Color(0, 0, 0))
		item:setData("infused", true)
		end
		)
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return (item:getData("infused") == nil) and client:getChar():getInv():hasItem("cure")
	end
}