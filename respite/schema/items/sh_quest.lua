ITEM.name = "Quest Item"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = "A quest item."
ITEM.flag = "1"
ITEM.category = "Quest"
ITEM.onGetDropModel = true
ITEM.data = { customName = ITEM.name, customDesc = ITEM.desc, customMdl = ITEM.model}

ITEM.functions.Custom = {
	name = "Customize",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
	client = item.player
	client:requestString("Change Name", "What name do you want this item to have?", function(text)
		item:setData("customName", text)
		client:requestString("Change Description", "What Description do you want this item to have?", function(text)
			item:setData("customDesc", text)
			client:requestString("Change Model", "What Model do you want this item to have?\nBe sure it is a valid model.", function(text) --start of model
				item:setData("customMdl", text)
					client:requestString("Change Color", "What Color do you want this item to have?\n1: Yellow. 2: Red. 3: Green. 4: Blue. 5: Orange. 6: Purple. 7: White. 8: Black. 9: Default", function(text) --start of model
						local color
						if(text == "1") then --yellow
							color = Color(200, 200, 0)
						elseif(text == "2")then --red
							color = Color(255, 50, 50)
						elseif(text == "3")then --green
							color = Color(50, 255, 50)
						elseif(text == "4")then --blue
							color = Color(50, 50, 255)
						elseif(text == "5")then --orange
							color = Color(255, 100, 0)
						elseif(text == "6")then --purple
							color = Color(140, 20, 140)
						elseif(text == "7")then --white
							color = Color(255, 255, 255)
						elseif(text == "8")then --black
							color = Color(0, 0, 0)
						else --default
							color = nut.config.get("color")
						end
						item:setData("customCol", color)
					end, 1) --end of color
			end, item:getData("customMdl")) --end of model
		end, item:getDesc()) --end of desc
	end, item:getName())
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