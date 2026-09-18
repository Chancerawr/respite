local PLUGIN = PLUGIN

local PANEL = {}
	function PANEL:Init()
		local client = LocalPlayer()
	
		if (IsValid(nut.gui.itemCustom)) then
			nut.gui.itemCustom:Remove()
		end
		
		nut.gui.itemCustom = self
		self:SetSize(ScrW() * 0.3, ScrH() * 0.6)
		self:Center()
		self:SetTitle("")
		self:MakePopup()
		self:ShowCloseButton(true)
		
		self.Paint = function(panel, w, h)
			--background image
			surface.SetDrawColor(Color(40, 40, 40, 255))
			surface.DrawRect(0, 0, w, h)
		end
		
		self.buttons = {}
		self.categories = {}
		self.labels = {}
		
		local inner = vgui.Create("DScrollPanel", self)
		inner:Dock(FILL)
		self.inner = inner
		
		--inner:SetVerticalScrollbarEnabled(false)
		local vBar = inner:GetVBar()
		function vBar:Paint(w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 100))
		end
		function vBar.btnUp:Paint(w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))
		end
		function vBar.btnDown:Paint(w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))
		end
		function vBar.btnGrip:Paint(w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))
		end
		
		local saveButton = vgui.Create("DButton", self)
		saveButton:Dock(BOTTOM)
		saveButton:SetTextColor(Color(255,255,255))
		saveButton:SetText("SAVE")
		saveButton.Paint = function(panel, w, h)
			surface.SetDrawColor(255,255,255)
			
			surface.DrawOutlinedRect(0,0,w,h,1)
		end
		saveButton.DoClick = function()
			self:SaveItem()
			self:Close()
		end
	end
	
	--panel for selected entity
	function PANEL:ItemConfig(itemID, dataFields)
		local client = LocalPlayer()
		
		self.itemID = itemID
		self.fields = {}
		
		local item = nut.item.instances[itemID]
		
		local entity = item.entity

		local fields = PLUGIN:getCustomFields(item, entity)
		
		local inner = self.inner

		for _, data in pairs(fields) do
			if(table.IsEmpty(data)) then continue end
		
			local catPanel = vgui.Create("DPanel", inner)
			catPanel:Dock(TOP)
			catPanel:DockMargin(0,0,0,8)
			catPanel.Paint = function(this, w, h)
				surface.SetDrawColor(40,40,40)
				surface.DrawRect(0,0,w,h)
			end
			
			local catButton = catPanel:Add("DButton")
			catButton:Dock(TOP)
			catButton:DockMargin(0,0,0,4)
			catButton:SetSize(0, ScreenScaleH(18))
			catButton:SetText("")
			
			catButton.DoClick = function(this)
				if(catPanel.minimized) then
					catPanel.minimized = false
					
					for k, v in pairs(catPanel:GetChildren()) do
						if(IsValid(v) and v != this) then
							v:SetVisible(true)
						end
					end
				else
					catPanel.minimized = true
					
					for k, v in pairs(catPanel:GetChildren()) do
						if(IsValid(v) and v != this) then
							v:SetVisible(false)
						end
					end
				end
				
				catPanel:InvalidateLayout(true)
				catPanel:SizeToChildren(false, true)
			end
			
			catButton.Paint = function(this, w, h)
				surface.SetDrawColor(40,40,40)
				surface.DrawRect(0,0,w,h)
				
				local sizeX, sizeY
				surface.SetFont("nutMenuButtonLightFont")
				
				if(catPanel.minimized) then
					surface.SetTextColor(128, 128, 128)
				
					sizeX, sizeY = surface.GetTextSize(">")
				
					surface.SetTextPos(sizeX*0.5, h*0.5-sizeY*0.5)
					surface.DrawText(">")
				else
					surface.SetTextColor(255, 255, 255)
				
					surface.SetDrawColor(128,128,128)
					surface.DrawLine(0,0,0,h)
				end
				
				local name = catPanel.name or "Unnamed Category"
				sizeX, sizeY = surface.GetTextSize(name)
				
				surface.SetTextPos(w*0.5-sizeX*0.5, 0)
				surface.DrawText(name)
				
				surface.SetDrawColor(128,128,128)
				surface.DrawLine(w*0.25,h-1,w*0.75,h-1)
			end
			
			for k, v in SortedPairsByMemberValue(data, "weight") do
				if(v.category and !catPanel.name) then catPanel.name = v.category end
			
				self:CreateField(k, v, catPanel)
			end
			
			catPanel:InvalidateLayout(true)
			catPanel:SizeToChildren(false, true)
		end
	end
	
	PANEL.FieldFormat = {
		["DLabel"] = function(id, data, parent, fields)
			if(data.extra) then
				fields[id] = {}
			
				for k, v in SortedPairs(data.extra) do
					local box = vgui.Create("DPanel", parent)
					box:Dock(TOP)
				
					local label = vgui.Create("DLabel", box)
					label:SetText(v.name)
					label:SetFont("nutSmallFont")
					label:SetWide(ScreenScale(40))
					label:Dock(LEFT)

					local entry = vgui.Create("DTextEntry", box)
					entry:SetText((data.value and data.value[k]) or "")
					entry:SetFont("nutSmallFont")
					entry:SetWide(ScreenScale(140))
					entry:Dock(LEFT)
					entry:SetTextColor(Color(200,200,200))
					entry:SetCursorColor(Color(255,255,255))
					entry:SetPaintBackground(false)
					
					if(data.numeric) then
						entry:SetNumeric(true)
					end
					
					fields[id][k] = entry
				end
			else
				local box = vgui.Create("DPanel", parent)
				box:Dock(TOP)
			
				local label = vgui.Create("DLabel", box)
				label:SetText(data.name)
				label:SetFont("nutSmallFont")
				label:SetWide(ScreenScale(40))
				label:Dock(LEFT)

				local entry = vgui.Create("DTextEntry", box)
				entry:SetText(data.value or "")
				entry:SetFont("nutSmallFont")
				entry:SetWide(ScreenScale(140))
				entry:Dock(LEFT)
				entry:SetTextColor(Color(200,200,200))
				entry:SetCursorColor(Color(255,255,255))
				entry:SetPaintBackground(false)
				
				if(data.numeric) then
					entry:SetNumeric(true)
				end
				
				fields[id] = entry
			end
		end,
		["DColorMixer"] = function(id, data, parent, fields)
			local box = vgui.Create("DPanel", parent)
			box:Dock(TOP)
			box:SetTall(ScreenScaleH(100))
		
			local label = vgui.Create("DLabel", box)
			label:SetText(data.name)
			label:SetFont("nutSmallFont")
			label:SetWide(ScreenScale(40))
			label:Dock(LEFT)

			local entry = vgui.Create("DColorMixer", box)
			entry:Dock(LEFT)
			entry:SetColor(data.value or Color(255,255,255))
			
			entry.GetFunc = entry.GetColor
			
			fields[id] = entry
		end,
		["DComboBox"] = function(id, data, parent, fields)
			local box = vgui.Create("DPanel", parent)
			box:Dock(TOP)

			local label = vgui.Create("DLabel", box)
			label:SetText(data.name)
			label:SetFont("nutSmallFont")
			label:SetWide(ScreenScale(40))
			label:Dock(LEFT)

			local entry = vgui.Create("DComboBox", box)

			if(data.panelFunc) then
				for choice, v in pairs(data.extra) do
					entry:AddChoice(v)
				end
			else
				for choice, _ in pairs(data.extra) do
					entry:AddChoice(choice)
				end
			end
			
			entry:Dock(LEFT)

			fields[id] = entry
		end,
	}
	
	function PANEL:CreateField(id, data, parent)
		local panelType = data.panelType
		if(!panelType) then 
			panelType = "DLabel"
		end
		
		if(self.FieldFormat[panelType]) then
			self.FieldFormat[panelType](id, data, parent, self.fields)
		end
	end
	
	function PANEL:SaveItem()
		local itemID = self.itemID
		local data = {}
		
		for id, panel in pairs(self.fields) do
			if(istable(panel)) then
				data[id] = {}
				
				for k, v in pairs(panel) do
					if(v.GetFunc) then
						data[id][k] = v:GetFunc()
					elseif(v.GetValue and v:GetValue() != "") then 
						data[id][k] = v:GetValue()
					elseif(v.GetText and v:GetText() != "") then
						data[id][k] = v:GetText()
					end
				end
			else
				if(panel.GetFunc) then
					data[id] = panel:GetFunc()
				elseif(panel.GetValue and panel:GetValue() != "") then 
					data[id] = panel:GetValue()
				elseif(panel.GetText and panel:GetText() != "") then
					data[id] = panel:GetText()
				end
			end
		end
		
		netstream.Start("nut_ItemUpdateData", itemID, data)
	end
vgui.Register("nutItemCustom", PANEL, "DFrame")