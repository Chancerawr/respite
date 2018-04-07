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

ITEM.functions.Stack = {
  tip = "Stack items of the same type.",
  icon = "icon16/add.png",
  onRun = function(item)
	local client = item.player
	local inventory = client:getChar():getInv()
	local stack = item:getData("Amount")
	
	item:remove()
	
	local toStack = inventory:hasItem(item.uniqueID)
	local unique = item.uniqueID
	item.player:EmitSound("ambient/materials/dinnerplates1.wav", 60)
	
	while(toStack) do
		if(toStack == item) then
			toStack:remove()
		elseif (toStack) then
			stack = stack + toStack:getData("Amount")
			toStack:remove()
		else
			return false
		end
		toStack = inventory:hasItem(unique)	
	end
	
	recursiveAdd(unique, inventory, stack, item.maxstack)
	
	return false
  end,
  onCanRun = function(item)
	if(item:getOwner() != nil) then
		return true
	else
		return false
	end
  end
}

ITEM.functions.Unstack = {
  tip = "Take a part out.",
  icon = "icon16/delete.png",
  onRun = function(item)
	local client = item.player
	local inventory = client:getChar():getInv()
	local stack = item:getData("Amount")
	if (stack > 1 and inventory:findEmptySlot(1, 1) != nil) then
		inventory:add(item.uniqueID, 1)
		item:setData("Amount", item:getData("Amount") - 1)
		item.player:EmitSound("ambient/materials/dinnerplates1.wav")
	end
	return false
  end,
  onCanRun = function(item)
	if(item:getOwner() != nil) then
		return true
	else
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