local PLUGIN = PLUGIN

local PANEL = {}
	local colors = {
		["Monsters - Abomination"] = Color(155,30,30),
		["Monsters - Shade"] = Color(155,155,155),
		["Monsters - Wraith"] = Color(255,255,255),
		["Monsters - Nightmare"] = Color(160, 32, 240),
		["Monsters - Husk"] = Color(255, 255, 255),
		["Items"] = Color(30,155,30),
		["Anomalies"] = Color(90,90,210),
	}

	function PANEL:Init()
		if (IsValid(nut.gui.ghostMenu)) then
			nut.gui.ghostMenu:Remove()
		end
		
		nut.gui.ghostMenu = self
		
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
		
		local inner = vgui.Create("DScrollPanel", self)
		inner:Dock(FILL)
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
		
		local categories = {}
		local function addActionButton(action)
			local textColor = Color(150,150,150,255)
			
			if(action.category) then
				if(!categories[action.category]) then
					categories[action.category] = true
					
					local catLabel = inner:Add("DLabel")
					catLabel:Dock(TOP)
					catLabel:SetTall(50)
					catLabel:DockMargin(8,8,8,8)
					catLabel:SetFont("nutMenuButtonLightFont")
					catLabel:SetText(" " ..action.category.. " ")
					
					catLabel.Paint = function(panel, w, h)
						local textSizeX, textSizeY = panel:GetTextSize()

						surface.SetDrawColor(Color(255, 255, 255, 255))
						surface.DrawLine(0, textSizeY, textSizeX, textSizeY)
					end
				end
			
				textColor = colors[action.category] or Color(255,255,255,255)
			end
			
			if(action.category) then
				textColor = colors[action.category] or Color(255,255,255,255)
			end
			
			local desc
			if(action.desc) then
				desc = action.desc or ""
			else
				desc = ""
			end
			
			if(action.CD) then
				desc = desc.. "\nCooldown: " ..action.CD.. " seconds."
			end
			
			if(action.cost) then
				desc = desc.. "\nCost: " ..action.cost.. " points."
			end
		
			local button = inner:Add("DButton")
			button:Dock(TOP)
			button:DockMargin(2,2,2,2)
			
			button:SetFont("nutSmallFont")
			
			button:SetTextColor(textColor)
			button:SetText(action.name or "Unnamed Action")
			button:SetToolTip(desc)
			button.DoClick = function()
				self:actionPress(button)
			end
			button.Paint = function(panel, w, h)
				surface.SetDrawColor(Color(0, 0, 0, 220))
				surface.DrawRect(0, 0, w, h)
				
				--button image
				--[[
				surface.SetDrawColor(Color(255, 255, 255, 255))
				surface.SetMaterial(PLUGIN.buttonIcon)
				surface.DrawTexturedRect(0, 0, w, h)
				--]]
			end
			
			button.action = action
			
			if(self.buttons) then
				self.buttons[#self.buttons + 1] = button
			end
		end
		
		timer.Simple(0, function()
			for k, action in pairs(PLUGIN.actions) do
				addActionButton(action)
			end
		end)		
	end
	
	function PANEL:actionPress(button)
		for k, v in pairs(self.buttons) do
			if(v.active) then
				v.active = false
				local textColor = colors[v.action.category] or Color(120,120,120,255)
				v:SetTextColor(textColor)
			end
		end
		
		button:SetTextColor(Color(255,255,255,255))
		button.active = true

		if(self.swep) then
			for k, v in pairs(PLUGIN.actions) do
				if(v.name == button.action.name) then
					nut.util.notify(v.name .. " selected.")
					self.swep:setSelected(k)
					break
				end
			end
		end
	end
vgui.Register("nutGhostMenu", PANEL, "DFrame")