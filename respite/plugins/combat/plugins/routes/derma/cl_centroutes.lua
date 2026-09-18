local PANEL = {}
	function PANEL:Init()
		local PLUGIN = nut.plugin.list["routes"]
	
		local client = LocalPlayer()
	
		if (IsValid(nut.gui.routes)) then
			nut.gui.routes:Remove()
		end

		nut.gui.routes = self
		
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
		newB:SetText("New Route")
		newB:Dock(TOP)
		
		newB:SetTextColor(Color(255,255,255,255))
		newB.Paint = function(panel, w, h)
			surface.SetDrawColor(Color(70, 80, 100, 220))
			surface.DrawRect(0, 0, w, h)
		end
		
		newB.DoClick = function()
			Derma_StringRequest("Route Name", "Route Name", "", function(text)
				local existing = PLUGIN:GetRoute(text)
				if(existing) then
					Derma_Query("A route already exists with this name, replace it?", "Replace?", "Yes", function()
						self.swep.routeID = text
						self.swep.routeData = {}
						self:PopulateRoute({})
						
						PLUGIN.routes[text] = {}
						netstream.Start("nut_routeSave", text, {})
						
						self:LoadButtons(scroll2)
					end, "No.")
				else
					self.swep.routeID = text
					self.swep.routeData = {}
					self:PopulateRoute({})
					
					PLUGIN.routes[text] = {}
					netstream.Start("nut_routeSave", text, {})

					self:LoadButtons(scroll2)
				end
			end)
		end
		
		self:LoadButtons(scroll2)
	end
	
	function PANEL:LoadButtons(scroll2)
		local client = LocalPlayer()
		local PLUGIN = nut.plugin.list["routes"]
	
		if(self.routes) then
			for k, v in pairs(self.routes) do
				v:Remove()
			end
		end
		
		self.routes = {}
	
		for ID, data in pairs(PLUGIN.routes) do
			--select route
			local button = vgui.Create("DButton", scroll2)
			
			button:SetText(ID)
			button:Dock(TOP)
			
			button:SetTextColor(Color(255,255,255,255))
			button.Paint = function(panel, w, h)
				surface.SetDrawColor(Color(70, 80, 100, 220))
				surface.DrawRect(0, 0, w, h)
			end
			
			button.DoClick = function()
				self.swep.routeID = ID
				self.swep.routeData = data
				client.patrolMarker = data
			
				--select this route here
				self:PopulateRoute(data)
			end
			button.DoRightClick = function()
				Derma_Query("Delete this route?", "Delete", "Yes", function(text)
					local existing = PLUGIN:GetRoute(ID)

					if(existing) then
						client.patrolMarker = {}
					
						self.swep.routeID = nil
						self.swep.routeData = nil
						
						PLUGIN.routes[ID] = nil
						
						netstream.Start("nut_routeSave", ID, nil)
						
						self:PopulateRoute({})
						self:LoadButtons(scroll2)
					end
				end, "No")
			end
			
			self.routes[#self.routes+1] = button
		end
	end
	
	function PANEL:PopulateRoute(data)
		-- remove the old ones
		for k, v in pairs(self.buttons) do
			if(IsValid(v)) then
				v:Remove()
			end
		end

		for order, pos in pairs(data) do
			local posString = order.. " ["..math.Round(pos.x)..", "..math.Round(pos.y)..", "..math.Round(pos.z).."]"

			local button = self.inner:Add("DButton")
			button:Dock(TOP)
			button:DockMargin(2,2,2,2)
			
			button:SetFont("nutSmallFont")
			
			button:SetTextColor(Color(255,255,255))
			button:SetText(posString)
			--button:SetToolTip(desc)
			button.DoClick = function()
				netstream.Start("nutRouteTP", pos)
			end
			button.Paint = function(panel, w, h)
				surface.SetDrawColor(Color(0, 0, 0, 220))
				surface.DrawRect(0, 0, w, h)
			end
			
			self.buttons[#self.buttons + 1] = button
		end
	end
vgui.Register("nutRoutes", PANEL, "DFrame")