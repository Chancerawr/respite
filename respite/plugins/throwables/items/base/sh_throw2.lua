ITEM.name = "Throwable Objects 2"
ITEM.model = "models/Items/grenadeAmmo.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.class = "nut_beac"
ITEM.desc = "A throwable object."

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

ITEM.functions.Equip = {
	name = "Equip",
	tip = "equipTip",
	icon = "icon16/tick.png",
	onRun = function(item)
		local client = item.player
		
		if (client:HasWeapon(item.class)) then
			client:notify("You're already holding this grenade!") return false
		end

		local weapon = client:Give(item.class)

		if (IsValid(weapon)) then
			client:SelectWeapon(weapon:GetClass())
			client:EmitSound("items/ammo_pickup.wav", 80)
			weapon:SetClip1(1)
		else
			print(Format("[Nutscript] Weapon %s does not exist!", item.class))
		end
		
		return true
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

ITEM.functions.Infuse = {
	name = "Infuse",
	tip = "Infuse this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player
		local dust = client:getChar():getInv():getFirstItemOfType("shard_dust")
		client:requestString("Infuse", "Are you sure you want to shard infuse this weapon?",
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
			item:setData("customDesc", item:getDesc() .. "\nThis weapon glows lightly.")
			item:setData("customCol", Color(255, 255, 255))
			item:setData("infused", true)
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
		client:requestString("Blight", "Are you sure you want to blight this weapon?",
		function(text)
			dust:remove()
			item:setData("customName", "Blighted " .. item:getName())
			item:setData("customDesc", item:getDesc() .. "\nThis weapon makes you nostalgic.")
			item:setData("customCol", Color(0, 0, 0))
			item:setData("infused", true)
		end
		)
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return (item:getData("infused") == nil) and client:getChar():getInv():getFirstItemOfType("blight")
	end
}

ITEM.functions.Paint = {
	name = "Paint",
	icon = "icon16/color_swatch.png",
	onRun = function(item)
		local client = item.player
		local paint = client:getChar():getInv():getFirstItemOfType("j_paint_can")
		local paintCol = paint:getData("paint", "white")
		client:requestString("Paint", "Are you sure you want to paint this grenade " ..paintCol.."?",
			function(text)
				paint:remove()
				item:setData("customDesc", item:getDesc() .. "\nThis weapon is painted "..paintCol..".")
				nut.item.spawn("j_empty_paint_can", client:getItemDropPos())
			end
		)
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return (client:getChar():getInv():getFirstItemOfType("j_paint_can"))
	end
}

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("customDesc") != nil) then
		desc = self:getData("customDesc")
	end	
	
	if(self:getData("quality") != nil) then
		desc = desc .. "\nQuality: " .. quality[math.Round(self:getData("quality"))]
	end
	
	--[[
	local boosts = self:getData("attrib")
	if(boosts and boosts != {}) then --no bonuses means no need for bonuses in the desc
		desc = desc .. "\n\n<color=50,200,50>Bonuses</color>"
		for k, v in pairs(boosts) do
			if(v != 0) then --dont want to display 0 values.
				desc = desc .. "\n " .. nut.attribs.list[k].name .. ": " .. v
			end
		end
	end	
	--]]
	
	return Format(desc)
end

function ITEM:getName()
	local name = self.name
	
	if(self:getData("customName") != nil) then
		name = self:getData("customName")
	end

	return Format(name)
end