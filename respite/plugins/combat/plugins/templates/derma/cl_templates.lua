local PLUGIN = PLUGIN

local PANEL = {}
	function PANEL:Init()
		if (IsValid(nut.gui.templates)) then
			nut.gui.templates:Remove()
		end
		
		nut.gui.templates = self
		
		self:SetSize(576, 648)
		self:Center()
		self:SetTitle("")
		self:MakePopup()
		self:ShowCloseButton(false)
		
		self.Paint = function(panel, w, h)
			--background image
			surface.SetDrawColor(Color(40, 40, 40, 255))
			surface.DrawRect(0, 0, w, h)
		end
		
		self.buttons = {}
		
		self.inner = vgui.Create("DScrollPanel", self)
		self.inner:Dock(FILL)
		--inner:SetVerticalScrollbarEnabled(false)
		local vBar = self.inner:GetVBar()
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
		
		local closeButton = vgui.Create("DButton", self)
		closeButton:SetPos(556, 0)
		closeButton:SetSize(20, 20)
		closeButton:SetTextColor(Color(255,255,255))
		closeButton:SetText("X")
		closeButton.Paint = function(panel, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))
		end
		closeButton.DoClick = function()
			self:Close()
		end
		
		--side panel
		local frame = vgui.Create("DFrame", self)
		frame:SetSize(150, 300)
		frame:Center()
		frame:SetTitle("")
		frame:MakePopup()
		frame:ShowCloseButton(true)
		frame:MoveRightOf(self, 50)
		
		local scroll2 = vgui.Create("DScrollPanel", frame)
		scroll2:Dock(FILL)
		
		local newB = vgui.Create("DButton", scroll2)
		newB:SetText("Empty Template")
		newB:Dock(TOP)
		
		newB:SetTextColor(Color(255,255,255,255))
		newB.Paint = function(panel, w, h)
			surface.SetDrawColor(Color(70, 80, 100, 220))
			surface.DrawRect(0, 0, w, h)
		end
		
		newB.DoClick = function()
			netstream.Start("nutTempReset", self.swep)
		end
		
		local saveB = vgui.Create("DButton", scroll2)
		saveB:SetText("Save Template")
		saveB:Dock(TOP)
		
		saveB:SetTextColor(Color(255,255,255,255))
		saveB.Paint = function(panel, w, h)
			surface.SetDrawColor(Color(70, 80, 100, 220))
			surface.DrawRect(0, 0, w, h)
		end
		
		saveB.DoClick = function()
			Derma_StringRequest("Save Template", "Save", "", function(text)
				netstream.Start("nutTempSave", self.swep, text, self.entities)
			end)
		end
		
		local loadB = vgui.Create("DButton", scroll2)
		loadB:SetText("Load Template")
		loadB:Dock(TOP)
		
		loadB:SetTextColor(Color(255,255,255,255))
		loadB.Paint = function(panel, w, h)
			surface.SetDrawColor(Color(70, 80, 100, 220))
			surface.DrawRect(0, 0, w, h)
		end
		
		loadB.DoClick = function()
			Derma_StringRequest("Load Template", "Load", "", function(text)
				netstream.Start("nutTempLoad", self.swep, text)
			end)
		end
	end
	
	function PANEL:PopulateTemplate(data)
		self.entities = data
	
		-- remove the old ones
		for k, v in pairs(self.buttons) do
			if(IsValid(v)) then
				v:Remove()
			end
		end
	
		for k, entity in pairs(data) do
			if(!IsValid(entity)) then continue end
			
			local pos = entity:GetPos()
			local posString = " ["..math.Round(pos.x)..", "..math.Round(pos.y)..", "..math.Round(pos.z).."]"

			local button = self.inner:Add("DButton")
			button:Dock(TOP)
			button:DockMargin(2,2,2,2)
			
			button:SetFont("nutSmallFont")
			
			button:SetTextColor(Color(255,255,255))
			button:SetText(entity:Name()..posString)
			--button:SetToolTip(desc)
			button.DoClick = function()
				netstream.Start("nutTempTP", entity)
			end
			button.Paint = function(panel, w, h)
				surface.SetDrawColor(Color(0, 0, 0, 220))
				surface.DrawRect(0, 0, w, h)
			end
			
			self.buttons[#self.buttons + 1] = button
		end
	end
vgui.Register("nutTemplates", PANEL, "DFrame")