ITEM.name = "Fish Base"
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.isFood = true
ITEM.cookable = true
ITEM.foodDesc = "This is a base fish."
ITEM.category = "Consumable"
ITEM.mustCooked = false
ITEM.quantity2 = 2
ITEM.container = ""
ITEM.flag = "v"
ITEM.sound = "npc/barnacle/barnacle_crunch2.wav"
ITEM.attribBoosts = { ["str"] = 0 }
ITEM.duration = 7200
ITEM.color = Color(50, 50, 255)

ITEM.functions.use = {
	name = "Consume",
	tip = "useTip",
	icon = "icon16/cup.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		--stomach checker
		if(char:getData("stomach", 0) < 4) then
			char:setData("stomach", char:getData("stomach", 0) + 1)
			timer.Simple(item.duration, function() --needs to be independent of attribute since those don't stack for the same item.
				char:setData("stomach", char:getData("stomach", 0) - 1)
			end)
		else
			client:notify("You are too full!")
			return false
		end	
	
		local cooked = item:getData("cooked", 1)
		local quantity2 = item:getData("quantity", item.quantity2)
		local mul = COOKLEVEL[cooked][2]
		local position = item.player:getItemDropPos()
		
		quantity2 = quantity2 - 1
		
		local buffAmt --amount of stats the thing gives you
		local dur --duration of effect
		
		if (char and client:Alive()) then
			if (item.attribBoosts) then
				for k, v in pairs(item.attribBoosts) do
					buffAmt = v
					if(hasTrait(client, "glutton")) then
						buffAmt = buffAmt * 1.2
					end
					char:addBoost(item.uniqueID, k, buffAmt)
				end
			end
			
			local charID = char:getID()
			local name = item.name
			
			--if we already have a thing for that buff, refresh it.
			if(timer.Exists("DrugEffect_" .. item.uniqueID .. "_" .. client:EntIndex())) then 
				dur = item.duration
				if(TRAITS and hasTrait(client, "survival")) then
					dur = dur * 1.2
				end
			
				timer.Adjust("DrugEffect_" .. item.uniqueID .. "_" .. client:EntIndex(), dur, 1, function()

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
			else
			
				dur = item.duration
				if(TRAITS and hasTrait(client, "survival")) then
					dur = dur * 1.2
				end
				
				timer.Create("DrugEffect_" .. item.uniqueID .. "_" .. client:EntIndex(), dur, 1, function()
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
		end
		
		item.player:EmitSound(item.sound)
		
		if (quantity2 >= 1) then
			item:setData("quantity", quantity2)
			return false
		else
			if(item.container != "") then
				nut.item.spawn(item.container, position)
			end
		end
		
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
	name = "Customize",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player
		client:requestString("Change Name", "What name do you want this item to have?", function(text)
			item:setData("customName", text)
			client:requestString("Change Description", "What Description do you want this item to have?", function(text)
				item:setData("customDesc", text)
				client:requestString("Change Model", "What Model do you want this item to have?\nBe sure it is a valid model.", function(text) --start of model
					item:setData("customMdl", text)
				end, item:getData("customMdl", item.model)) --end of model
			end, item:getDesc()) --end of desc
		end, item:getName()) --end of name
		
		--hopefully resets the player's icons
		client:ConCommand("nut_flushicon")
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomCol = {
	name = "Customize Color",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		local color = item:getData("customCol", Color(255,255,255))
		client:requestString("Change Color", "Enter ', ' separated RGB values.", function(text) --start of model
			local colorTbl = string.Split(text, ", ")
			if(table.Count(colorTbl) == 3) then
				red = tonumber(colorTbl[1])
				green = tonumber(colorTbl[2])
				blue = tonumber(colorTbl[3])
				if(red and green and blue) then --i put in a lot of extra shit here to idiot proof it.
					color.r = red
					color.g = green
					color.b = blue
				end
			end
		
			item:setData("customCol", color)
		end, color.r .. ", " .. color.b .. ", " .. color.g) --end of color
		
		--hopefully resets the player's icons
		client:ConCommand("nut_flushicon")
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.Name = {
	tip = "Name this item",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		client:requestString("Change Name", "What do you want to name your fish? (This is final)", function(text)
			item:setData("customName", text)
		end, item.name)
		
		return false
	end,
	onCanRun = function(item)
		if (item:getData("customName") != nil) then
			return false
		else
			return true
		end
	end
}

ITEM.functions.Convert = {
  tip = "Convert this item",
  icon = "icon16/cross.png",
  onRun = function(item)
    if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
		item.player:getChar():getInv():add("j_scrap_organic", 1, { Amount = 2 })
		item:remove()
		return false 
    else
		item.player:notify("You don't have any room in your inventory!")
		return false 
    end
  end,
  onCanRun = function(item)
	if(item.plastic) then
		return false
	end
  
	if (item:getOwner() == nil) then
		return item.player:getChar():hasFlags("q") or item.player:getChar():getInv():hasItem("converter_meat")
	else
		return item:getOwner():getChar():hasFlags("q") or item:getOwner():getChar():getInv():hasItem("converter_meat")
	end
  end
}

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

	if(self.quantity2) then
		str = str .. "\nPortions remaining: " .. self:getData("quantity", self.quantity2)
	end
		
	return Format(str, COOKLEVEL[(self:getData("cooked") or 1)][1])
end

function ITEM:getName()
	local name = self.name
	
	if(self:getData("customName") != nil) then
		name = self:getData("customName")
	end
	
	return Format(name)
end

if (CLIENT) then --draws a square on the food item for how well cooked it is.
	function ITEM:paintOver(item, w, h)
		local cooked = item:getData("cooked", 1)
		local quantity2 = item:getData("quantity", item.quantity2)

		if (quantity2 > 1) then
			draw.SimpleText(quantity2, "DermaDefault", 6, h - 16, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
		end

		if (cooked > 1) then
			local col = COOKLEVEL[cooked][3]

			surface.SetDrawColor(col.r, col.g, col.b, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end


