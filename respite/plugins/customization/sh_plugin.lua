local PLUGIN = PLUGIN
PLUGIN.name = "Customization"
PLUGIN.author = ""
PLUGIN.desc = "Item Customization."

function PLUGIN:getCustomFields(item, entity)
	if(item and !item.customizable) then return end
	
	local saveData
	local customizable
	local itemTable = item
	
	if(item) then
		customizable = item.customizable
		saveData = item:getData("custom", {})	
		
		if(item.getCustomFields) then
			local config = item:getCustomFields()
			return config
		end
	else
		itemTable = entity:getItemTable()
		customizable = itemTable.customizable
		saveData = entity:getData("custom", {})	
		
		if(itemTable.getCustomFields) then
			local config = itemTable:getCustomFields()
			return config
		end
		
		item = entity
	end

	local config = {
		{
			["name"] = {
				weight = 1, 
				name = "Name", 
				category = "Basic",
				value = saveData.name or itemTable.name,
				updateType = "Custom",
			},
			["desc"] = {
				weight = 2, 
				name = "Description", 
				category = "Basic",
				value = saveData.desc or itemTable.desc,
				updateType = "Custom",
			},	
			["model"] = {
				weight = 13, 
				name = "Model", 
				category = "Basic",
				value = saveData.model or itemTable.model,
				updateType = "Custom",
				onUpdate = function(item, data)
					local entity = item:getEntity()
					if(entity and IsValid(entity)) then
						entity:SetModel(data)
						entity:PhysicsInit(SOLID_VPHYSICS)
						entity:SetSolid(SOLID_VPHYSICS)
					end
				end,
			},
			["modelScale"] = {
				weight = 14, 
				name = "Model Scale", 
				category = "Basic",
				value = saveData.modelScale or itemTable.modelScale or 1,
				numeric = true,
				updateType = "Custom",
				onUpdate = function(item, data)
					local entity = item:getEntity()
					if(entity and IsValid(entity)) then
						item:onEntityCreated(entity)
					end
				end,
			},
			["material"] = {
				weight = 15, 
				name = "Material", 
				category = "Basic",
				value = saveData.material or itemTable.material,
				updateType = "Custom",
				onUpdate = function(item, data)
					local entity = item:getEntity()
					if(entity and IsValid(entity)) then
						entity:SetModelScale(data)
					end
				end,
			},
			["color"] = {
				weight = 17, 
				name = "Inventory Color", 
				category = "Basic",
				value = saveData.color or itemTable.color or nut.config.get("color"),
				updateType = "Custom",
				panelType = "DColorMixer",
			},
			["modelColor"] = {
				weight = 18, 
				name = "Model Color", 
				category = "Basic",
				value = saveData.modelColor or itemTable.modelColor,
				updateType = "Custom",
				panelType = "DColorMixer",
				onUpdate = function(item, data)
					local entity = item:getEntity()
					if(entity and IsValid(entity)) then
						entity:SetColor(data)
					end
				end,
			},
			["img"] = {
				weight = 19, 
				name = "Image", 
				category = "Basic",
				value = saveData.img or itemTable.img,
				updateType = "Custom",
			},	
		},
		{
			["armor"] = {
				weight = 7, 
				name = "Armor (Bonus)", 
				category = "Combat Stats",
				value = saveData.armor,
				numeric = true,
			},
			["accuracy"] = {
				weight = 8, 
				name = "Accuracy (Bonus)", 
				category = "Combat Stats",
				value = saveData.accuracy,
				numeric = true,
			},
			["evasion"] = {
				weight = 9, 
				name = "Evasion (Bonus)", 
				category = "Combat Stats",
				value = saveData.evasion,
				numeric = true,
			},
		},
		{
			["attrib"] = {
				weight = 8, 
				name = "Attributes", 
				category = "Attributes",
				value = item:getData("attrib", itemTable.attrib),
				extra = nut.attribs.list,
				numeric = true,
			},
		},
		{
			["res"] = {
				weight = 9, 
				name = "Resistances (Damage)", 
				category = "Resistances",
				value = item:getData("res", itemTable.res),
				extra = nut.plugin.list["combat"].dmgTypes, --needs effect types too
				numeric = true,
				updateType = function(item, data, fullData)
					local res = data
				
					local resEffect = fullData["resEffect"] or {}
					for k, v in pairs(data) do
						res[k] = v
					end
					
					item:setData("res", res)
				end,
			},
			["resEffect"] = {
				weight = 10, 
				name = "Resistances (Effects)", 
				category = "Resistances",
				value = item:getData("res", itemTable.res),
				extra = EFFS.effects, --needs effect types too
				numeric = true,
				updateType = function(item, data, fullData)
					--handled by res category
				end,
			},
		},
		{
			["amp"] = {
				weight = 10, 
				name = "Amplifications", 
				category = "Amplifications",
				value = item:getData("amp", itemTable.amp),
				extra = nut.plugin.list["combat"].dmgTypes,
				numeric = true,
			},
		},
		{
			["dmg"] = {
				weight = 11, 
				name = "Damage Types/Values", 
				category = "Damage Values",
				value = item:getData("dmg", itemTable.dmg),
				extra = nut.plugin.list["combat"].dmgTypes,
				numeric = true,
			},
		},
		{
			["scale"] = {
				weight = 12, 
				name = "Scaling", 
				category = "Attribute Scaling",
				value = item:getData("scale", itemTable.scaling),
				extra = nut.attribs.list,
				numeric = true,
			},
		},
		--[[
		{
			["actions"] = {
				weight = 12, 
				name = "Actions", 
				category = "Actions",
				value = 1,--saveData.actions
				updateType = "netVar",
				--panelType = "DComboBox",
			},
		},
		--]]
	}
	
	for k, category in pairs(config) do
		for var, _ in pairs(category) do
			if(!customizable[var]) then
				config[k][var] = nil
			end
		end
	end
	
	return config
end

if(SERVER) then
	function PLUGIN:getCustomData(item)
		local customData = {}
	
		if(item.getCustomData) then
			customData = item:getCustomData()
		else
			local custom = item:getData("custom", {})
		
			customData = {
				--name = custom.name or item:getName(),
				--desc = custom.desc or item:getDesc(),
				color = custom.color or item.color or nut.config.get("color") or Color(255, 255, 255),
				model = custom.model or item.model,
				material = custom.material or item.material,
				img = custom.img or item.img,
				modelScale = custom.modelScale or item.modelScale,
				attrib = custom.attrib or item.attrib,
				res = custom.res or item.res,
				amp = custom.amp or item.amp,
				armor = custom.armor or item.armor,
				evasion = custom.evasion or item.evasion,
				accuracy = custom.accuracy or item.accuracy,
				scale = custom.scale or item.scaling,
				dmg = custom.dmg or item.dmg,
			}
		end
		
		return customData
	end

	--customization statrt
	function PLUGIN:startCustom(client, item, extra)
		--customizations require a flag in the items set, so it's unnecessary to do this here, uncomment it if you want.
		--[[
		if !client:IsAdmin() then
			return
		end
		--]]

		--[[
		local customData = item:getData("custom", {})
	
		local itemInfo = {}
		itemInfo.id = item.id
		itemInfo.name = item:getName() or item.name
		itemInfo.desc = item:getDesc(true) or item.desc
		itemInfo.color = customData.color or item.color or nut.config.get("color") or Color(255, 255, 255)
		itemInfo.model = customData.model or item.model
		itemInfo.material = customData.material or item.material
		itemInfo.img = customData.img
		itemInfo.modelScale = customData.modelScale or item.modelScale
		--]]
		
		item:sync()
		
		local data = PLUGIN:getCustomData(item)
		local itemID = item.id

		netstream.Start(client, "nut_custom", itemID, data)
	end
	
	--attribute customization start
	function PLUGIN:startCustomE(client, item)
		local attribData = item:getData("attrib", item.attribBoosts) or {}
	
		local itemInfo = {}
		itemInfo.id = item.id
		
		itemInfo.armor = item:getData("armor", item.armor)
		itemInfo.dmg = item:getData("dmg", item.dmg)
		itemInfo.scale = item:getData("scale", item.scaling)
		
		netstream.Start(client, "nut_customE", itemInfo)
	end	
	
	--attribute customization start
	function PLUGIN:startCustomA(client, item)
		if !client:IsAdmin() then
			return
		end

		local attribData = item:getData("attrib", item.attribBoosts) or {}
	
		local itemInfo = {}
		itemInfo.id = item.id
		itemInfo.attrib = attribData
		
		netstream.Start(client, "nut_customA", itemInfo)
	end
	
	--attribute customization start
	function PLUGIN:startCustomR(client, item)
		local resData = item:getData("res", item.res) or {}
	
		local itemInfo = {}
		itemInfo.id = item.id
		itemInfo.res = resData
		
		netstream.Start(client, "nut_customR", itemInfo)
	end	
	
	--attribute customization start
	function PLUGIN:startCustomAmp(client, item)
		local ampData = item:getData("amp", item.amp) or {}
	
		local itemInfo = {}
		itemInfo.id = item.id
		itemInfo.amp = ampData
		
		netstream.Start(client, "nut_customAmp", itemInfo)
	end	

	--regular finish hook
	netstream.Hook("nut_customF", function(client, data)
		if !client:IsAdmin() then
			return
		end

		local id = data[1]
		local item = nut.item.instances[id]
		local customData = data[2]
		
		if (item) then
			item:setData("custom", customData)
			item:setData("edited", client:Name()) --who last edited this thing
		end
	end)	
	
	--attribute finish hook
	netstream.Hook("nut_attribF", function(client, data)
		if !client:IsAdmin() then
			return
		end

		local id = data[1]
		local item = nut.item.instances[id]
		local attribData = data[2]
		
		if (item) then
			item:setData("attrib", attribData)
			item:setData("edited", client:Name()) --who last edited this thing
		end
	end)
	
	--finish hook
	netstream.Hook("nut_resF", function(client, data)
		local id = data[1]
		local item = nut.item.instances[id]
		local resData = data[2]
		
		if (item) then
			item:setData("res", resData)
			item:setData("edited", client:Name()) --who last edited this thing
		end
	end)

	--finish hook
	netstream.Hook("nut_equipF", function(client, data)
		local id = data[1]
		local item = nut.item.instances[id]
		
		if (item) then
			for k, v in pairs(data[2]) do
				item:setData(k, v)
			end
			
			item:setData("edited", client:Name()) --who last edited this thing
		end
	end)
	
	--finish hook
	netstream.Hook("nut_ItemUpdateData", function(client, itemID, data)
		--if(!item or !item.id) then return end
		
		local item = nut.item.instances[itemID]
		
		local customData = item:getData("custom", {})

		local fields = PLUGIN:getCustomFields(item)
		for _, dataFields in pairs(fields) do
			for id, v in pairs(dataFields) do
				if(data[id]) then
					if(isfunction(v.updateType)) then
						v.updateType(item, data[id], data)
					elseif(v.updateType == "Custom") then
						customData[id] = data[id]
					else
						item:setData(id, data[id])
					end
					
					if(v.onUpdate) then
						v.onUpdate(item, data[id], data)
					end
				end
			end
		end
		
		item:setData("custom", customData)
		
		if(item.postCustom) then
			item:postCustom(client, item, data)
		end
	end)
else
	--clientside hook for menus
	netstream.Hook("nut_custom", function(itemID, data)
		local custom = vgui.Create("nutItemCustom")

		custom:ItemConfig(itemID, data)
		
		--[[
		local item = data
	
		--current values of item
		local name = item.name
		local desc = item.desc
		local color = item.color
		local model = item.model
		local material = item.material or ""
		local img = item.img
		local modelScale = item.modelScale

		local frame = vgui.Create("DFrame")
		frame:SetSize(450, 600)
		frame:Center()
		frame:SetTitle(name or "")
		frame:MakePopup()
		frame:ShowCloseButton(true)

		local scroll = vgui.Create("DScrollPanel", frame)
		scroll:Dock(FILL)

		--name customization
		local nameL = vgui.Create("DLabel", scroll)
		nameL:SetText("Name:")
		nameL:Dock(TOP)

		local nameC = vgui.Create("DTextEntry", scroll)
		nameC:SetText(name or "")
		nameC:Dock(TOP)
		
		--description customization
		local descL = vgui.Create("DLabel", scroll)
		descL:SetText("Description:")
		descL:Dock(TOP)

		local descC = vgui.Create("DTextEntry", scroll)
		descC:SetText(desc or "")
		descC:Dock(TOP)

		--model customization
		local modelL = vgui.Create("DLabel", scroll)
		modelL:SetText("Model:")
		modelL:Dock(TOP)

		local modelC = vgui.Create("DTextEntry", scroll)
		modelC:SetText(model)
		modelC:Dock(TOP)
		
		--material customization
		local materialL = vgui.Create("DLabel", scroll)
		materialL:SetText("Material:")
		materialL:Dock(TOP)

		local materialC = vgui.Create("DTextEntry", scroll)
		materialC:SetText(material or "")
		materialC:Dock(TOP)	
		
		--picture customization
		local pictureL = vgui.Create("DLabel", scroll)
		pictureL:SetText("Image:")
		pictureL:Dock(TOP)

		local pictureC = vgui.Create("DTextEntry", scroll)
		pictureC:SetToolTip("Use an image URL.")
		pictureC:SetText(img or "")
		pictureC:Dock(TOP)
		
		--picture customization
		local scaleL = vgui.Create("DLabel", scroll)
		scaleL:SetText("Scale:")
		scaleL:Dock(TOP)

		local scaleC = vgui.Create("DTextEntry", scroll)
		scaleC:SetToolTip("Model scale, be careful about anything spherical")
		scaleC:SetText(modelScale or "")
		scaleC:Dock(TOP)

		--color customization
		local colorL = vgui.Create("DLabel", scroll)
		colorL:SetText("Color:")
		colorL:Dock(TOP)

		local colorC = vgui.Create("DColorMixer", scroll)
		colorC:Dock(TOP)
		colorC:SetColor(color)
		
		--color customization
		local colorRan = vgui.Create("DButton", scroll)
		colorRan:SetText("Random Color")
		colorRan:Dock(TOP)
		colorRan.DoClick = function()
			local ranColor = Color(math.random(0,255), math.random(0,255), math.random(0,255))
			colorC:SetColor(ranColor)
		end

		local finishB = vgui.Create("DButton", scroll)
		finishB:SetSize(60,20)
		finishB:SetText("Complete")
		finishB:Dock(TOP)
		finishB.DoClick = function()
			local customData = {}
			customData[1] = item.id
			customData[2] = {}

			customData[2].name = nameC:GetValue()
			customData[2].desc = descC:GetValue()
			
			customData[2].color = colorC:GetColor()
			
			customData[2].model = modelC:GetValue()
			
			customData[2].modelScale = scaleC:GetValue()
			
			if(materialC:GetValue() != "") then
				customData[2].material = materialC:GetValue()
			end
			
			if(pictureC:GetValue() != "") then
				customData[2].img = pictureC:GetValue()
			end

			netstream.Start("nut_customF", customData)
			
			frame:Remove()
		end
		
		local cancelB = vgui.Create("DButton", scroll)
		cancelB:SetSize(60,20)
		cancelB:SetText("Cancel")
		cancelB:Dock(TOP)
		cancelB.DoClick = function()
			frame:Remove()
		end		
		--]]
	end)
	
	netstream.Hook("nut_customA", function(data)
		local item = data
	
		--current values of item
		local attribData = item.attrib

		local frame = vgui.Create("DFrame")
		frame:SetSize(450, 600)
		frame:Center()
		frame:SetTitle("Attributes")
		frame:MakePopup()
		frame:ShowCloseButton(true)

		local scroll = vgui.Create("DScrollPanel", frame)
		scroll:Dock(FILL)

		--attribute customization
		local attribs = {}
		for k, v in pairs(nut.attribs.list) do
			local attribL = vgui.Create("DLabel", scroll)
			attribL:SetText(v.name)
			attribL:Dock(TOP)
			
			local attribC = vgui.Create("DNumberWang", scroll)
			attribC.attrib = k
			attribC:SetDecimals(2)
			attribC:Dock(TOP)
			attribC:SetMax(200)
			attribC:SetMin(-200)
			attribC:SetValue(attribData[k] or 0)
			
			attribs[k] = attribC
		end
		
		local finishB = vgui.Create("DButton", scroll)
		finishB:SetSize(60,20)
		finishB:SetText("Complete")
		finishB:Dock(TOP)
		finishB.DoClick = function()
			local customData = {}
			customData[1] = item.id
			customData[2] = {}

			for k, v in pairs(attribs) do
				local value = v:GetValue()
				if(value != 0) then
					customData[2][k] = value
				end
			end

			netstream.Start("nut_attribF", customData)
			
			frame:Remove()
		end
		
		local cancelB = vgui.Create("DButton", scroll)
		cancelB:SetSize(60,20)
		cancelB:SetText("Cancel")
		cancelB:Dock(TOP)
		cancelB.DoClick = function()
			frame:Remove()
		end		
	end)
	
	netstream.Hook("nut_customR", function(data)
		local item = data
	
		--current values of item
		local resData = item.res

		local frame = vgui.Create("DFrame")
		frame:SetSize(450, 600)
		frame:Center()
		frame:SetTitle("Resistances")
		frame:MakePopup()
		frame:ShowCloseButton(true)

		local scroll = vgui.Create("DScrollPanel", frame)
		scroll:Dock(FILL)

		local res = {}
		
		--damage type resistance customization
		local dmgTypes = nut.plugin.list["combat"] and nut.plugin.list["combat"].dmgTypes
		for k, v in SortedPairsByMemberValue(dmgTypes or {}, "name") do
			local resL = vgui.Create("DLabel", scroll)
			resL:SetText(v.name)
			resL:Dock(TOP)
			
			local resC = vgui.Create("DNumberWang", scroll)
			resC.res = k
			resC:SetDecimals(2)
			resC:Dock(TOP)
			resC:SetMax(200)
			resC:SetMin(-200)
			resC:SetValue(resData[k] or 0)
			
			res[k] = resC
		end
		
		--attribute customization
		for k, v in SortedPairsByMemberValue(EFFS.effects, "name") do
			local resL = vgui.Create("DLabel", scroll)
			resL:SetText(v.name)
			resL:Dock(TOP)
			
			local resC = vgui.Create("DNumberWang", scroll)
			resC.res = k
			resC:SetDecimals(2)
			resC:Dock(TOP)
			resC:SetMax(200)
			resC:SetMin(-200)
			resC:SetValue(resData[k] or 0)
			
			res[k] = resC
		end
		
		local finishB = vgui.Create("DButton", scroll)
		finishB:SetSize(60,20)
		finishB:SetText("Complete")
		finishB:Dock(TOP)
		finishB.DoClick = function()
			local customData = {}
			customData[1] = item.id
			customData[2] = {}

			for k, v in pairs(res) do
				local value = v:GetValue()
				if(value != 0) then
					customData[2][k] = value
				end
			end

			netstream.Start("nut_resF", customData)
			
			frame:Remove()
		end
		
		local cancelB = vgui.Create("DButton", scroll)
		cancelB:SetSize(60,20)
		cancelB:SetText("Cancel")
		cancelB:Dock(TOP)
		cancelB.DoClick = function()
			frame:Remove()
		end
	end)
	
	local function dataTemp(data, req)
		return data[req]
	end	
	
	local function dataTempTbl(data, req, sub)
		if(data[req]) then
			return data[req][sub]
		end
	end
	
	timer.Simple(1, function()
		local menuGenerate = {
			["nut_customE"] = {
				["dmg"] = {weight = 1, name = "Base Damage", value = dataTempTbl, panelT = "DNumberWang", extra = nut.plugin.list["combat"].dmgTypes},
				--["dmgT"] = {weight = 2, name = "Damage Type", value = dataTemp, panelT = "DComboBox", extra = nut.plugin.list["combat"].dmgTypes},
				["armor"] = {weight = 3, name = "Armor", value = dataTemp, panelT = "DNumberWang"},
				["scale"] = {weight = 6, name = "Grade Scaling", value = dataTempTbl, panelT = "DNumberWang", extra = nut.attribs.list},
			},
			["nut_customAmp"] = {
				["amp"] = {weight = 1, name = "Amplifications", value = dataTempTbl, panelT = "DNumberWang", extra = nut.plugin.list["combat"].dmgTypes},
			},
		}

		for k, v in pairs(menuGenerate) do
			netstream.Hook(k, function(data)
				local item = data
				
				local frame = vgui.Create("DFrame")
				frame:SetSize(450, 600)
				frame:Center()
				frame:SetTitle("Stats")
				frame:MakePopup()
				frame:ShowCloseButton(true)

				local scroll = vgui.Create("DScrollPanel", frame)
				scroll:Dock(FILL)
				
				local configF = {}
				for name, field in SortedPairsByMemberValue(v, "weight") do
					if(!field.extra) then
						local label = vgui.Create("DLabel", scroll)
						label:SetText(field.name)
						label:Dock(TOP)

						local entry = vgui.Create(field.panelT, scroll)
						entry:SetText(field.value(data, name) or "")
						entry:Dock(TOP)
						
						if(field.panelT == "DComboBox") then
							for choice, _ in pairs(field.extra) do
								entry:AddChoice(choice)
							end
						end
						
						configF[name] = entry
					else
						local label = vgui.Create("DLabel", scroll)
						label:SetText(field.name)
						label:Dock(TOP)

						local subTbl = {}
						
						for subKey, subValue in SortedPairsByMemberValue(field.extra, "name") do
							local subLabel = vgui.Create("DLabel", scroll)
							subLabel:SetText(subValue.name)
							subLabel:Dock(TOP)

							local entry = vgui.Create(field.panelT, scroll)
							entry:SetText(field.value(data, name, subKey) or "")
							entry:Dock(TOP)
							
							subTbl[subKey] = entry
						end
						
						configF[name] = subTbl
					end
				end

				local finishB = vgui.Create("DButton", scroll)
				finishB:SetSize(60,20)
				finishB:SetText("Complete")
				finishB:Dock(TOP)
				finishB.DoClick = function()
					local customData = {}
					customData[1] = item.id
					customData[2] = {}
					
					for configK, configV in pairs(configF) do
						if(istable(configV)) then
							local subTbl = {}
							for k2, v2 in pairs(configV) do
								local value = (v2.GetValue and v2:GetValue()) or (v2.GetText and v2:GetText())
								if(value and value != "" and tonumber(value) != 0) then
									subTbl[k2] = value
								else
									subTbl[k2] = nil
								end
							end
							
							if(!table.IsEmpty(subTbl)) then
								customData[2][configK] = subTbl
							end
						else
							local value = (configV.GetValue and configV:GetValue()) or (configV.GetText and configV:GetText())
							if(value and value != "" and tonumber(value) != 0) then
								customData[2][configK] = value
							else
								customData[2][configK] = nil
							end
						end
					end
					
					netstream.Start("nut_equipF", customData)
					
					frame:Remove()
				end
				
				local cancelB = vgui.Create("DButton", scroll)
				cancelB:SetSize(60,20)
				cancelB:SetText("Cancel")
				cancelB:Dock(TOP)
				cancelB.DoClick = function()
					frame:Remove()
				end
			end)
		end
	end)
end

nut.command.add("lootgrouptest", {
	syntax = "<string loot>",
	onRun = function(client, arguments)
		local lootTable = {}
		
		for k, item in pairs(nut.item.list) do
			if(item.loot and item.loot[arguments[1]]) then
				lootTable[#lootTable+1] = item.uniqueID
			end
		end
		
		local randomItem, _ = table.Random(lootTable)
		if(randomItem) then
			local aimPos = client:GetEyeTraceNoCursor().HitPos + Vector(0, 0, 10)
			nut.item.spawn(randomItem, aimPos)
		end
	end
})