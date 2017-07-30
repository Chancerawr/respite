ITEM.name = "Food Base"
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.isFood = true
ITEM.cookable = true
ITEM.foodDesc = "This is test food."
ITEM.category = "Consumable"
ITEM.mustCooked = false
ITEM.quantity = 1
ITEM.container = ""
ITEM.flag = "v"
ITEM.sound = "npc/barnacle/barnacle_crunch2.wav"
ITEM.attribBoosts = { ["str"] = 0 }
ITEM.duration = 3600

function ITEM:getDesc()
	local str = self.foodDesc

	if(self:getData("customDesc") != nil) then
		str = self:getData("customDesc")
	end
	
	if (self.mustCooked != false) then
		str = str .. "\nThis food must be cooked."
	end

	if (self.cookable != false) then
		str = str .. "\nFood Status: %s."
	end

	str = str .. "\nPortions remaining: " .. self.quantity

	return Format(str, COOKLEVEL[(self:getData("cooked") or 1)][1])
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
		local cooked = item:getData("cooked", 1)
		local quantity = item:getData("quantity", item.quantity)

		if (quantity > 1) then
			draw.SimpleText(quantity, "DermaDefault", 6, h - 16, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
		end

		if (cooked > 1) then
			local col = COOKLEVEL[cooked][3]

			surface.SetDrawColor(col.r, col.g, col.b, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end

ITEM:hook("use", function(item)
	item.player:EmitSound(item.sound)
end)

ITEM.functions.use = {
	name = "Consume",
	tip = "useTip",
	icon = "icon16/cup.png",
	onRun = function(item)
		local cooked = item:getData("cooked", 1)
		local quantity = item:getData("quantity", item.quantity)
		local mul = COOKLEVEL[cooked][2]
		local position = item.player:getItemDropPos()
		local client = item.player
		local char = client:getChar()
		--local inventory = character:getInv()
		
		--item.player:addHunger(item.hungerAmount * mul) 
		quantity = quantity - 1
		
		if (char and client:Alive()) then
			if (item.attribBoosts) then
				for k, v in pairs(item.attribBoosts) do
					char:addBoost(item.uniqueID, k, v)
				end
			end
			
			local charID = char:getID()
			local name = item.name
			timer.Create("DrugEffect_" .. item.uniqueID .. "_" .. client:EntIndex(), item.duration, 1, function()

				if (client and IsValid(client)) then
					local curChar = client:getChar()
					if (curChar and curChar:getID() == charID) then
						client:notify(Format("%s has worn off.", name))

						if (item.attribBoosts) then
							for k, v in pairs(item.attribBoosts) do
								char:removeBoost(item.uniqueID, k)
							end
						end
					end
				end
			end)
		end
		
		if (quantity >= 1) then
			item:setData("quantity", quantity)
			return false
		else
			if(item.container != "") then
				nut.item.spawn(item.container, position)
			end
		end
		--nut.item.spawn(item.container, position)
		--inventory.add(item.container, 1, true )
		
		
		return true
	end,
	onCanRun = function(item)
		if (item.mustCooked and item:getData("cooked", 1) == 1) then
			return false
		end

		return (!IsValid(item.entity))
	end
}

ITEM.functions.Custom = {
	tip = "Customize this item",
	icon = "icon16/add.png",
	onRun = function(item)
	client = item.player
	client:requestString("Change Name", "What name do you want this item to have?", function(text)
		item:setData("customName", text)
		client:requestString("Change Description", "What Description do you want this item to have?", function(text)
			item:setData("customDesc", text)
		end, item.foodDesc)
	end, item.name)
		return false
	end,
	onCanRun = function(item)
		if (item:getOwner() == nil) then	
			return item.player:getChar():hasFlags("1")
		else
			return item:getOwner():getChar():hasFlags("1")
		end	
	end
}