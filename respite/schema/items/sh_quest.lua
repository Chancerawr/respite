ITEM.name = "Quest Item"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = "A quest item."
ITEM.flag = "1"
ITEM.category = "Quest"
ITEM.onGetDropModel = true
ITEM.data = { customName = ITEM.name, customDesc = ITEM.desc}

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

ITEM.functions.CustomMat = {
	name = "Customize Material",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		local material = item:getData("mat") or item.material or ""
		client:requestString("Change Material", "Enter material path.", function(text) --start of model
			item:setData("mat", text)
		end, material)
	
		--hopefully resets the player's icons
		client:ConCommand("nut_flushicon")
	
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomPic = {
	name = "Customize Image",
	tip = "Customize this item's image",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		local image = item:getData("img", "")
		client:requestString("Change Image", "Enter an image URL.", function(text) --start of model
			item:setData("img", text)
		end, image) --end of color
	
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.Inspect = {
	name = "Inspect",
	tip = "Inspect this item",
	icon = "icon16/wrench.png",
	onClick = function(item)
		local frame = vgui.Create("DFrame")
		frame:SetSize(540, 680)
		frame:SetTitle(item.name)
		frame:MakePopup()
		frame:Center()

		frame.html = frame:Add("DHTML")
		frame.html:Dock(FILL)
		
		local imageCode = [[<img src = "]]..item:getData("img", "")..[["/>]]
		
		frame.html:SetHTML([[<html><body style="background-color: #000000; color: #282B2D; font-family: 'Book Antiqua', Palatino, 'Palatino Linotype', 'Palatino LT STD', Georgia, serif; font-size 16px; text-align: justify;">]]..imageCode..[[</body></html>]])
	end,
	onRun = function(item)
		return false
	end,
	onCanRun = function(item)
		if(!item:getData("img", false)) then
			return false
		end
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
			
			if(!inventory:add(item.uniqueID, 1, item.data)) then
				client:notify("Inventory is full")
			end
		end)
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return client:getChar():hasFlags("1")
	end
}

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("customDesc") != nil) then
		desc = self:getData("customDesc")
	end
	
	return Format(desc)
end

function ITEM:getName()
	local name = self.name
	
	if(self:getData("customName") != nil) then
		name = self:getData("customName")
	end
	
	return Format(name)
end

function ITEM:onGetDropModel()
	local model = self.model
	
	if(self:getData("customMdl") != nil) then
		model = self:getData("customMdl")
	end
	
	return Format(model)
end