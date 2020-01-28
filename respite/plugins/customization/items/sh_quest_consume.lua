ITEM.name = "Quest Consumable"
ITEM.desc = "Quest consumable."
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.isFood = true
ITEM.cookable = true
ITEM.category = "Consumable"
ITEM.mustCooked = false
ITEM.quantity2 = 3
ITEM.container = ""
ITEM.flag = "1"
ITEM.duration = 7200
ITEM.color = Color(50, 150, 50)

ITEM.functions.use = {
	name = "Consume",
	tip = "useTip",
	icon = "icon16/cup.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		--stomach checker
		--stomach unnecessary for custom
		--[[
		if(char:getData("stomach", 0) < 4) then
			char:setData("stomach", char:getData("stomach", 0) + 1)
			timer.Simple(item.duration, function() --needs to be independent of attribute since those don't stack for the same item.
				char:setData("stomach", char:getData("stomach", 0) - 1)
			end)
		else
			client:notify("You are too full!")
			return false
		end	
		--]]
	
		local cooked = item:getData("cooked", 1)
		local quantity2 = item:getData("quantity2", item.quantity2)
		local mul = COOKLEVEL[cooked][2]
		local position = item.player:getItemDropPos()
		
		quantity2 = quantity2 - 1
		
		local buffAmt --amount of stats the thing gives you
		local dur --duration of effect
		
		if (char and client:Alive()) then
			if (item:getData("attrib")) then
				for k, v in pairs(item:getData("attrib", {})) do
					buffAmt = v
					if(hasTrait(client, "glutton")) then
						buffAmt = buffAmt * 1.2
					end
					char:addBoost(item.id, k, buffAmt)
				end
			end
			
			local charID = char:getID()
			local name = item.name
			
			dur = item.duration
			local cookBonus = COOKLEVEL[cooked][2]
			
			if(cooked > 1) then
				dur = dur * (cookBonus * 0.6)
			end
			
			if(TRAITS and hasTrait(client, "survival")) then
				dur = dur * 1.2
			end

			--if we already have a thing for that buff, refresh it.
			if(timer.Exists("DrugEffect_" .. item.id .. "_" .. client:EntIndex())) then 
				timer.Adjust("DrugEffect_" .. item.id .. "_" .. client:EntIndex(), dur, 1, function()

					if (client and IsValid(client)) then
						local curChar = client:getChar()
						if (curChar and curChar:getID() == charID) then
							client:notify(Format("%s has worn off.", name))

							if (item:getData("attrib")) then
								for k, v in pairs(item:getData("attrib", {})) do
									char:removeBoost(item.id, k)
								end
							end
						end
					end
				end)
			else				
				timer.Create("DrugEffect_" .. item.id .. "_" .. client:EntIndex(), dur, 1, function()
					if (client and IsValid(client)) then
						local curChar = client:getChar()
						if (curChar and curChar:getID() == charID) then
							client:notify(Format("%s has worn off.", name))

							if (item:getData("attrib")) then
								for k, v in pairs(item:getData("attrib", {})) do
									char:removeBoost(item.id, k)
								end
							end
						end
					end
				end)
			end
		end
		
		--item.player:EmitSound(item.sound)
		
		if (quantity2 >= 1) then
			item:setData("quantity2", quantity2)
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

ITEM.functions.Inspect = {
	name = "Inspect",
	tip = "Inspect this item",
	icon = "icon16/picture.png",
	onClick = function(item)
		local customData = item:getData("custom", {})

		local frame = vgui.Create("DFrame")
		frame:SetSize(540, 680)
		frame:SetTitle(item.name)
		frame:MakePopup()
		frame:Center()

		frame.html = frame:Add("DHTML")
		frame.html:Dock(FILL)
		
		local imageCode = [[<img src = "]]..customData.img..[["/>]]
		
		frame.html:SetHTML([[<html><body style="background-color: #000000; color: #282B2D; font-family: 'Book Antiqua', Palatino, 'Palatino Linotype', 'Palatino LT STD', Georgia, serif; font-size 16px; text-align: justify;">]]..imageCode..[[</body></html>]])
	end,
	onRun = function(item)
		return false
	end,
	onCanRun = function(item)
		local customData = item:getData("custom", {})
	
		if(!customData.img) then
			return false
		end
		
		return true
	end
}

ITEM.functions.Custom = {
	name = "Customize",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)		
		nut.plugin.list["customization"]:startCustom(item.player, item)
		
		return false
	end,
	
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomAtr = {
	name = "Customize Attributes",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item, data)
		nut.plugin.list["customization"]:startCustomA(item.player, item)
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomQuan = {
	name = "Customize Quantity",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		client:requestString("Change Quantity", "", function(text)
			local amount = tonumber(text)
			if(amount) then
				item:setData("quantity2", text)
			end
		end, item:getData("quantity2", 1))
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.Clone = {
	name = "Clone",
	tip = "Clone this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player	
	
		client:requestQuery("Are you sure you want to clone this item?", "Clone", function(text)
			local inventory = client:getChar():getInv()
			local data = item.data
			data.x = nil
			data.y = nil

			if(!inventory:add(item.uniqueID, 1, data)) then
				client:notify("Inventory is full")
			end
		end)
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

if (CLIENT) then --draws a square on the food item for how well cooked it is.
	function ITEM:paintOver(item, w, h)
		local cooked = item:getData("cooked", 1)
		local quantity2 = item:getData("quantity2", item.quantity2)

		if (tonumber(quantity2) > 1) then
			draw.SimpleText(quantity2, "DermaDefault", 6, h - 16, Color(50,200,50), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
		end

		if (cooked > 1) then
			local col = COOKLEVEL[cooked][3]

			surface.SetDrawColor(col.r, col.g, col.b, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
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
		
		if(self.quantity2) then
			desc = desc .. "\nPortions remaining: " .. self:getData("quantity2", self.quantity2)
		end
		
		if(self:getData("attrib")) then
			desc = desc .. "\n\n<color=50,200,50>Bonuses</color>"
			
			for k, v in pairs(self:getData("attrib", {})) do
				if(v != 0) then
					desc = desc .. "\n " .. nut.attribs.list[k].name .. ": " .. v
				end
			end
		end	
	end

	return desc
end

function ITEM:getName()
	local name = self.name
	
	local customData = self:getData("custom", {})
	if(customData.name) then
		name = customData.name
	end
	
	return name
end

function ITEM:onGetDropModel()
	local model = self.model
	
	local customData = self:getData("custom", {})
	if(customData.model) then
		model = customData.model
	end
	
	return Format(model)
end

if (CLIENT) then --draws a square on the food item for how well cooked it is.
	function ITEM:paintOver(item, w, h)
		local cooked = item:getData("cooked", 1)
		local quantity2 = tonumber(item:getData("quantity2", item.quantity2))

		if (quantity2 > 1) then
			draw.SimpleText(quantity2, "DermaDefault", 6, h - 16, Color(50,200,50), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
		end

		if (cooked > 1) then
			local col = COOKLEVEL[cooked][3]

			surface.SetDrawColor(col.r, col.g, col.b, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end