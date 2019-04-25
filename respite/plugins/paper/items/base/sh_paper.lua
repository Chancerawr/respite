ITEM.name = "Paper Base"
--ITEM.uniqueID = "misc_paper"
ITEM.model = "models/props_c17/paper01.mdl"
ITEM.desc = "A piece of paper that you can write on.\nPrivate Note: Only you can edit texts.\nPublic Note: Anyone can edit texts."
ITEM.flag = "v"
ITEM.price = 1
ITEM.maxStack = 10
--ITEM.functions = {}
ITEM.functions.Private = {
	alias = "Write (Private)",
	icon = "icon16/page_white_paintbrush.png",
	onRun = function(item)
		local client = item.player

		local position
		if (IsValid(entity)) then
			position = entity:GetPos() + Vector(0, 0, 4)
		else
			local data2 = {
				start = client:GetShootPos(),
				endpos = client:GetShootPos() + client:GetAimVector() * 72,
				filter = client
			}
			local trace = util.TraceLine(data2)
			position = trace.HitPos + Vector(0, 0, 16)
		end
			
		local entity2 = entity
		local entity = ents.Create("nut_paper")
		entity:SetPos(position)
		if (IsValid(entity2)) then
			entity:SetAngles(entity2:GetAngles())
		end
		entity:setNetVar( "owner", client:SteamID() )
		entity:setNetVar( "private", true )
		entity:Spawn()
		entity:Activate()
		entity:SetCreator(client)
			
		if(item:getData("Amount", 0) > 1) then --for stacked
			item:setData("Amount", item:getData("Amount") - 1)
			return false
		else
			return true
		end
	end,
	onCanRun = function(item)
		if(IsValid(item.entity)) then
			return false
		end
	end
}

ITEM.functions.Public = {
	alias = "Write (Public)",
	icon = "icon16/page_white_paint.png",
	onRun = function(item)
		local client = item.player
		local position
		
		if (IsValid(entity)) then
			position = entity:GetPos() + Vector(0, 0, 4)
		else
			local data2 = {
				start = client:GetShootPos(),
				endpos = client:GetShootPos() + client:GetAimVector() * 72,
				filter = client
			}
			local trace = util.TraceLine(data2)
			position = trace.HitPos + Vector(0, 0, 16)
		end
		
		local entity2 = entity
		local entity = ents.Create("nut_paper")
		entity:SetPos(position)
		if (IsValid(entity2)) then
			entity:SetAngles(entity2:GetAngles())
		end
		entity:setNetVar( "owner", client )
		entity:setNetVar( "private", false )
		entity:Spawn()
		entity:Activate()
		entity:SetCreator(client)

		if(item:getData("Amount", 0) > 1) then --for stacked
			item:setData("Amount", item:getData("Amount") - 1)
			return false
		else
			return true
		end
	end,
	onCanRun = function(item)
		if(IsValid(item.entity)) then
			return false
		end
	end
}


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
	local stack = item:getData("Amount", 1)
	
	item:remove()
	
	local toStack = inventory:hasItem(item.uniqueID)
	local unique = item.uniqueID
	item.player:EmitSound("ambient/materials/dinnerplates1.wav")
	
	while(toStack) do
		if(toStack == item) then
			toStack:remove()
		elseif (toStack) then
			stack = stack + toStack:getData("Amount", 1)
			toStack:remove()
		else
			return false
		end
		toStack = inventory:hasItem(unique)	
	end
	
	recursiveAdd(unique, inventory, stack, item.maxStack)
	
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

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		local quantity = item:getData("Amount", 0)

		if (quantity > 1) then
			draw.SimpleText(quantity, "DermaDefault", w - 12, h - 14, Color(200,200,200), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
		end
	end
end
