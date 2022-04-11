local PLUGIN = PLUGIN

local PANEL = {}
	function PANEL:Init()
		if (IsValid(nut.gui.actionL)) then
			nut.gui.actionL:Remove()
		end
		
		nut.gui.actionL = self
		
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
		
		local colors = {
			["Fire"] = Color(200,0,0),
			["Earth"] = Color(210,105,30),
			["Water"] = Color(0,0,200),
			["Lightning"] = Color(200,200,255),
			["Dark"] = Color(0,0,0),
			["Light"] = Color(255,255,255),
			["Universal"] = Color(200,200,200),
			
			["Martial"] = Color(180,180,180),
			
			--special
			["Chaos"] = Color(153,50,204),
			
			--other
			["Arcane"] = Color(128,0,128),
			["Disease"] = Color(173,255,47),
			["Direct"] = Color(255,255,255),
			["Poison"] = Color(0,255,0),
			
			--physical
			["Pierce"] = Color(180,180,180),
			["Slash"] = Color(180,180,180),
			["Crush"] = Color(180,180,180),
			["Siege"] = Color(180,180,180),
		}
		
		local categories = {}
		local function addActionButton(action)
			local textColor = Color(150,150,150,255)

			local actionData = {}
			if(action.uid) then
				actionData = ACTS.actions[action.uid] or {}
			end
			
			if(actionData.category) then
				if(!categories[actionData.category]) then
					categories[actionData.category] = true
					
					local catLabel = inner:Add("DLabel")
					catLabel:Dock(TOP)
					catLabel:SetTall(50)
					catLabel:DockMargin(8,8,8,8)
					catLabel:SetFont("nutMenuButtonLightFont")
					catLabel:SetText(" " ..actionData.category.. " ")
					
					catLabel.Paint = function(panel, w, h)
						local textSizeX, textSizeY = panel:GetTextSize()

						surface.SetDrawColor(Color(255, 255, 255, 255))
						surface.DrawLine(0, textSizeY, textSizeX, textSizeY)
					end
				end
			
				textColor = colors[actionData.category] or Color(255,255,255,255)
			end
			
			if(actionData.category) then
				textColor = colors[actionData.category] or Color(255,255,255,255)
			end
			
			local desc
			if(actionData.desc) then
				desc = actionData.desc or ""
			else
				desc = ""
			end
		
			if(actionData.dmg and actionData.dmgT) then
				desc = desc.. "\nBase Damage: " ..actionData.dmg.. " " ..actionData.dmgT.. "."
			end	
			
			if(actionData.weaponMult) then
				desc = desc.. "\nWeapon Damage Multiplier: " ..actionData.weaponMult.. "x."
			end		
			
			if(actionData.radius) then
				desc = desc.. "\nArea of Effect: " ..actionData.radius.. "."
			end
			
			if(actionData.CD) then
				desc = desc.. "\nCooldown: " ..actionData.CD.. " turns."
			end
			
			if(actionData.costAP) then
				desc = desc.. "\nAP Cost: " ..actionData.costAP.. "."
			end
		
			if(actionData.costHP) then
				desc = desc.. "\nHP Cost: " ..actionData.costHP.. "."
			end
			
			if(actionData.costMP) then
				desc = desc.. "\nMP Cost: " ..actionData.costMP.. "."
			end
		
			local button = inner:Add("DButton")
			button:Dock(TOP)
			button:DockMargin(2,2,2,2)
			
			button:SetFont("nutSmallFont")
			
			button:SetTextColor(textColor)
			button:SetText(actionData.name or action.name or "Unnamed Action")
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
			
			self.buttons[#self.buttons + 1] = button	
		end
		
		timer.Simple(0, function()
			for k, action in pairs(self.actions) do
				if(action.category == "Default") then 
					addActionButton(action)
				end
			end
		
			for k, action in SortedPairsByMemberValue(self.actions or {}, "category" or "") do
				if(action.category == "Default") then continue end
				
				addActionButton(action)
			end
		end)		
	end
	
	function PANEL:actionPress(button)
		for k, v in pairs(self.buttons) do
			v.active = false
			v:SetTextColor(Color(255,255,255,255))
		end
		
		button:SetTextColor(Color(100,100,200,255))
		button.active = true
		
		if(self.actions and self.swep) then
			for k, v in pairs(self.actions) do
				if(v.name == button:GetText()) then
					self.swep:selectAction(k)
					break
				end
			end
		--[[
		elseif(self.entity) then
			for k, v in pairs(self.entity.actions) do
				if(v.name == button:GetText()) then
					self.entity.casting = true --might be temporary
					
					self.entity.actCur = k
					netstream.Start("ccActionSelect", self.entity, k)
				end
			end
		--]]
		end
	end
vgui.Register("nutActionList", PANEL, "DFrame")