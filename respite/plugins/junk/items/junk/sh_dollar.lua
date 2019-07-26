ITEM.name = "Dollar Bill"
ITEM.uniqueID = "j_dollar"
ITEM.model = "models/props/cs_assault/Dollar.mdl"
ITEM.desc = "An old American dollar, it has George Washington's face on it."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 100

ITEM.salvItem = {
	["j_scrap_cloth"] = 1
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, -90),
	fov = 2.75,
}

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player
		
		client:requestQuery("Are you sure you want to scrap this money?", "Scrap", function(text)
			local char = client:getChar()
			local inv = char:getInv()
			local position = client:getItemDropPos()
			local scrap
			local amt
			
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
			
			client:EmitSound("npc/manhack/grind"..math.random(1,5)..".wav", 70, math.random(85,105))
			
			if(item:getData("Amount", 1) > 1) then
				item:setData("Amount", item:getData("Amount", 1) - 1)
			else
				item:remove()
			end
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

ITEM.functions.Stack = {
	tip = "Stack items of the same type.",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()
		local stack = item:getData("Amount", 1)
		
		local total = stack
		for k, v in pairs(inventory:getItems()) do
			if(v.id == item.id) then
				continue
			end
		
			if(v.uniqueID == item.uniqueID) then
				total = total + v:getData("Amount", 1)
				
				if(v.id != item.id) then
					v:remove()
				end
			end
		end
		
		if(total <= item.maxstack) then
			item:setData("Amount", total)
		else
			local position = client:getItemDropPos()
		
			for i = 1, math.floor(total / item.maxstack) do
				timer.Simple(i/5, function()
					inventory:addSmart(item.uniqueID, 1, position, {Amount = item.maxstack})
				end)
			end
			
			local remainder = total - (item.maxstack * math.floor(total / item.maxstack))
			if(remainder > 0) then
				item:setData("Amount", remainder)
			else
				return true
			end
		end
		
		client:EmitSound("ambient/materials/dinnerplates1.wav", 65, 60)
		
		return false
	end,
	onCanRun = function(item)
		if(item.entity) then
			return false
		end
		
		return true
	end
}

ITEM.functions.Unstack = {
	tip = "Take a part out.",
	icon = "icon16/delete.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local position = client:getItemDropPos()
		
		local stack = item:getData("Amount", 1)
		if(stack <= 1) then return false end

		client:requestString("Split", "", function(text)	
			amount = math.Clamp(tonumber(text), 1, stack - 1)
			
			item:setData("Amount", item:getData("Amount") - amount)
			
			inventory:addSmart(item.uniqueID, 1, position, {Amount = amount})
			
			client:EmitSound("ambient/materials/dinnerplates1.wav", 65, 130)
		end, 1)		

		return false
	end,
	onCanRun = function(item)
		if(item.entity) then
			return false
		end
		
		if(item:getData("Amount", 1) <= 1) then
			return false
		end
		
		return true
	end	
}

ITEM.onCombine = function(itemSelf, itemTarget)
	if(itemSelf.uniqueID == itemTarget.uniqueID) then
		local amountSelf = itemSelf:getData("Amount", 1)
		local amountTarget = itemTarget:getData("Amount", 1)

		local combined = amountSelf + amountTarget
		
		if(combined > itemSelf.maxstack) then
			itemSelf:setData("Amount", itemSelf.maxstack)
			itemTarget:setData("Amount", combined - itemSelf.maxstack)
		else
			itemTarget:remove()
			itemSelf:setData("Amount", amountSelf + amountTarget)
		end
	end
end

function ITEM:getDesc(partial)
	local desc = self.desc
	
	local customData = self:getData("custom", {})
	if(customData.desc) then
		desc = customData.desc
	end
	
	if(!partial) then
		if(customData.quality) then
			desc = desc .. "\nQuality: " ..customData.quality
		end
	end
	
	if(self:getData("Amount") != nil) then
		desc = desc .. "\nQuantity: " .. self:getData("Amount", 1) .. "."
	end	
	
	return desc
end

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		local quantity = item:getData("Amount", 1)

		if (quantity > 1) then
			draw.SimpleText(quantity, "DermaDefault", w - 12, h - 14, Color(64,128,64), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
		end
	end
end