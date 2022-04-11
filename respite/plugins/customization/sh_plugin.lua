local PLUGIN = PLUGIN
PLUGIN.name = "Customization"
PLUGIN.author = ""
PLUGIN.desc = "Item Customization."

if(SERVER) then
	--updates clientside values of sweps
	function PLUGIN:updateSWEP(client, item)
		local customData = item:getData("custom", {})
		
		if(item.class) then --i dont know why i need this here
			local swep = weapons.Get(item.class)
			local itemInfo = {}
			
			itemInfo.class = item.class
			
			itemInfo.wepDmg = customData.wepDmg or (swep and swep.Primary.Damage)
			itemInfo.wepSpd = customData.wepSpd or (swep and swep.Primary.RPM)
			itemInfo.wepAcc = customData.wepAcc
			itemInfo.wepRec = customData.wepRec
			itemInfo.wepMag = customData.wepMag or (swep and swep.Primary.ClipSize)
			
			itemInfo.name = customData.name
			
			netstream.Start(client, "nut_swepUpdate", itemInfo)
		end
	end	
	
	--customization statrt
	function PLUGIN:startCustom(client, item, extra)
		--customizations require a flag in the items set, so it's unnecessary to do this here, uncomment it if you want.
		--[[
		if !client:IsAdmin() then
			return
		end
		--]]

		local customData = item:getData("custom", {})
	
		local itemInfo = {}
		itemInfo.id = item.id
		itemInfo.name = item:getName() or item.name
		itemInfo.desc = item:getDesc(true) or item.desc
		itemInfo.color = customData.color or item.color or nut.config.get("color") or Color(255, 255, 255)
		itemInfo.model = customData.model or item.model
		itemInfo.material = customData.material or item.material
		itemInfo.img = customData.img
		
		if(item.isWeapon) then
			itemInfo.weapon = true
			
			local swep = weapons.Get(item.class)
			
			--weapon stat customization stuff
			if(swep) then
				itemInfo.wepDmg = customData.wepDmg or swep.Primary.Damage
				itemInfo.wepSpd = customData.wepSpd or swep.Primary.RPM
				itemInfo.wepAcc = customData.wepAcc
				itemInfo.wepRec = customData.wepRec
				itemInfo.wepMag = customData.wepMag or swep.Primary.ClipSize
			end
			
		end
		
		netstream.Start(client, "nut_custom", itemInfo)
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
else
	--clientside hook for menus
	netstream.Hook("nut_custom", function(data)
		local item = data
	
		--current values of item
		local name = item.name
		local desc = item.desc
		local color = item.color
		local model = item.model
		local material = item.material or ""
		local img = item.img
		
		local dmg = item.wepDmg
		local spd = item.wepSpd
		local acc = item.wepAcc
		local rec = item.wepRec
		local mag = item.wepMag

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
				
		--weapon stuff
		local wepC
		local dmgC
		local rpmC
		local accC
		local recC
		local magC
		
		if(item.weapon) then
			wepC = vgui.Create("DCheckBoxLabel", scroll)
			wepC:SetText("SWEP Modifiers")
			wepC:SetValue(0)
			wepC:SetToolTip("Toggle this if you want any of the stuff below to apply.")
			wepC:Dock(TOP)					
			
			local dmgL = vgui.Create("DLabel", scroll)
			dmgL:SetText(" Damage:")
			dmgL:Dock(TOP)
			
			dmgC = vgui.Create("DTextEntry", scroll)
			dmgC:SetText(dmg or 1)
			dmgC:Dock(TOP)
			
			local rpmL = vgui.Create("DLabel", scroll)
			rpmL:SetText(" RPM:")
			rpmL:Dock(TOP)
			
			rpmC = vgui.Create("DTextEntry", scroll)
			rpmC:SetText(spd or 1)
			rpmC:Dock(TOP)
			
			local accL = vgui.Create("DLabel", scroll)
			accL:SetText(" Accuracy Multiplier:")
			accL:Dock(TOP)
			
			accC = vgui.Create("DTextEntry", scroll)
			accC:SetToolTip("Higher is worse.")
			accC:SetText(acc or 1)
			accC:Dock(TOP)		
			
			local recL = vgui.Create("DLabel", scroll)
			recL:SetText(" Recoil Multiplier:")
			recL:Dock(TOP)
			
			recC = vgui.Create("DTextEntry", scroll)
			recC:SetText(rec or 1)
			recC:Dock(TOP)
			
			local magL = vgui.Create("DLabel", scroll)
			magL:SetText(" Magazine Size:")
			magL:Dock(TOP)
			
			magC = vgui.Create("DTextEntry", scroll)
			magC:SetText(mag or 1)
			magC:Dock(TOP)
		end
		
		--add image customization

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
			
			if(materialC:GetValue() != "") then
				customData[2].material = materialC:GetValue()
			end
			
			if(pictureC:GetValue() != "") then
				customData[2].img = pictureC:GetValue()
			end
			
			if(item.weapon and wepC:GetChecked()) then
				customData[2].wepDmg = math.Clamp(tonumber(dmgC:GetValue()), 0, 100000)
				customData[2].wepSpd = math.Clamp(tonumber(rpmC:GetValue()), 1, 1000000000)
				customData[2].wepAcc = math.Clamp(tonumber(accC:GetValue()), 0.0001, 100)
				customData[2].wepRec = math.Clamp(tonumber(recC:GetValue()), 0, 1000)
				customData[2].wepMag = math.Clamp(tonumber(magC:GetValue()), 0, 10000)
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
						
						for subKey, subValue in pairs(field.extra) do
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
	
	netstream.Hook("nut_swepUpdate", function(data)
		local item = data
		local weapon = LocalPlayer():GetWeapon(item.class)
		
		if(weapon and IsValid(weapon)) then
			if(item.name) then
				weapon.PrintName = item.name
			end
			
			if(item.wepDmg) then
				weapon.Primary.Damage = tonumber(item.wepDmg)
			end
			
			if(item.wepSpd) then
				weapon.Primary.RPM = tonumber(item.wepSpd)
			end
			
			if(item.wepRec) then
				weapon.Primary.KickUp = weapon.Primary.KickUp * item.wepRec
				weapon.Primary.KickDown = weapon.Primary.KickDown * item.wepRec
				weapon.Primary.KickHorizontal = weapon.Primary.KickHorizontal * item.wepRec
				weapon.Primary.StaticRecoilFactor = weapon.Primary.StaticRecoilFactor * item.wepRec
			end
			
			--needs to happen in both client and server
			if(item.wepAcc) then
				weapon.Primary.Spread = weapon.Primary.Spread * item.wepAcc
				weapon.Primary.IronAccuracy = weapon.Primary.IronAccuracy * item.wepAcc
			end				
			
			--needs to happen in both client and server
			if(item.wepMag) then
				weapon.Primary.ClipSize = tonumber(item.wepMag)
			end
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