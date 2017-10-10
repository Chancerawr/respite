ITEM.name = "Memory"
ITEM.uniqueID = "j_scrap_memory"
ITEM.model = "models/props_c17/playgroundtick-tack-toe_block01a.mdl"
ITEM.material = "models/props_lab/security_screens"
ITEM.desc = "A strange nostalgic object, it makes you feel an emotion when you touch it."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.color = Color(100, 100, 100)
ITEM.maxstack = 10

ITEM.data = {
	Amount = 1
}

local function recursiveAdd(item, inventory, toStack, maxStack, emotion)
	timer.Simple(.2,
		function()
			if (toStack > maxStack) then
				inventory:add(item, 1, { Amount = maxStack, feeling = emotion})
				recursiveAdd(item, inventory, toStack-maxStack, maxStack)
			else
				inventory:add(item, 1, { Amount = toStack, feeling = emotion})
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
	
	recursiveAdd(unique, inventory, stack, item.maxstack, item:getData("feeling"))
	
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
		inventory:add(item.uniqueID, 1, { Amount = 1, feeling = item:getData("feeling")})
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
	
	if(self:getData("feeling") != nil) then
		desc = desc .. "\nThis memory makes you feel " .. self:getData("feeling") .. "."
	end
	
	if(self:getData("Amount") != nil) then
		desc = desc .. "\nQuantity: " .. self:getData("Amount") .. "."
	end
	
	return Format(desc)
end

if (CLIENT) then
	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		entity:SetModelScale(.7)
		entity:DrawShadow(false)
	end
end

local emotions = {
	"fear",
	"anger",
	"sadness",
	"joy",
	"disgust",
	"surprise",
	"trust",
	"anticipation",
	"neutral",
}

--makes it so it randomizes the paint's color. Couldn't find a good function to hook this onto so it just happens when picked up or dropped.
local function onUse(item)
	if(!item:getData("feeling")) then
		item:setData("feeling", table.Random(emotions))
	end
end

ITEM:hook("drop", onUse)
ITEM:hook("take", onUse)