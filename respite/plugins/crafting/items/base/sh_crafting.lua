ITEM.name = "Resource Base"
ITEM.category = "Resources"
ITEM.flag = "j"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.data = { Amount = 1 }
ITEM.maxstack = 50

local function recursiveAdd(item, inventory, toStack, maxStack)
	timer.Simple(.2,
		function()
			if (toStack > maxStack) then
				inventory:add(item, 1, { Amount = maxStack })
				recursiveAdd(item, inventory, toStack-maxStack, maxStack)
			else
				inventory:add(item, 1, { Amount = toStack })
			end
		end
	)
end

ITEM.functions.Unstack = {
	tip = "Take a part out.",
	icon = "icon16/delete.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local position = client:getItemDropPos()
		
		local stack = item:getData("Amount", 1)
		if(stack <= 1) then return false end

		item:setData("Amount", item:getData("Amount") - 1)
		if(!inventory:add(item.uniqueID, 1)) then
			nut.item.spawn(item.uniqueID, position)
		end
		
		item.player:EmitSound("ambient/materials/dinnerplates1.wav")
		
		return false
	end,
	onCanRun = function(item)
		if(item.entity) then
			return false
		end
		
		if(item:getData("Amount", 1) <= 1) then
			return false
		end
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
					if(!inventory:add(item.uniqueID, 1, {Amount = item.maxstack})) then
						nut.item.spawn(item.uniqueID, position,
							function(item2)
								item2:setData("Amount", item.maxstack)
							end
						)
					end
				end)
			end
			
			local remainder = total - (item.maxstack * math.floor(total / item.maxstack))
			if(remainder > 0) then
				item:setData("Amount", remainder)
			else
				return true
			end
		end
		
		return false
	end,
	onCanRun = function(item)
		if(item.entity) then
			return false
		end
	end
}

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("Amount") != nil) then
		desc = desc .. "\nQuantity: " .. self:getData("Amount") .. "."
	end
	
	return Format(desc)
end


if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		local quantity = item:getData("Amount", 1)

		if (quantity > 1) then
			draw.SimpleText(quantity, "DermaDefault", w - 12, h - 14, Color(50,50,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
		end
	end
end