ITEM.name = "Depressants"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.material = "models/player/player_chrome1"
ITEM.desc = "A small bottle filled with some pills, there's something odd about them."
ITEM.duration = 3600
ITEM.price = 30
ITEM.uniqueID = "drug_depress"

ITEM.attribBoosts = {
	["fortitude"] = -3,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3.75,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	item.player:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end)

ITEM.data = { Amount = 1 }
ITEM.maxstack = 5

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
	item.player:EmitSound("ambient/materials/dinnerplates1.wav")
	
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
		local quantity = item:getData("Amount")

		if (quantity > 1) then
			draw.SimpleText(quantity, "DermaDefault", w - 12, h - 14, Color(85,85,85), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
		end
	end
end