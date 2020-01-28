local PLUGIN = PLUGIN

local PANEL = {}
	function PANEL:Init()
		if (IsValid(nut.gui.actionL)) then
			nut.gui.actionL:Remove()
		end
		
		nut.gui.actionL = self
		
		self:SetSize(ScrW() * 0.15, ScrH() * 0.3)
		self:Center()
		self:SetTitle("Actions")
		self:MakePopup()
		
		self.buttons = {}
		
		local inner = vgui.Create("DScrollPanel", self)
		inner:Dock(FILL)
		
		--[[
		local action = inner:Add("DButton")
		action:Dock(TOP)

		action.id = 1
		action:DockMargin(2,2,2,2)
		action:SetSize(ScrW() * 0.2, ScrH() * 0.025)
		action:SetFont("nutSmallFont")
		action:SetText("Attack")
		action:SetTextColor(Color(255,255,255,255))
		action:SetToolTip("Your basic attack with whatever weapon you have equipped.")
		action.DoClick = function()
			self:actionPress(action)
		end
		action.Paint = function(panel, w, h)
			local posX, posY = action:GetPos()

			surface.SetDrawColor(Color(70, 80, 100, 220))
			surface.DrawRect(0, 0, w, h)
		end
		self.buttons[#self.buttons + 1] = action
		

		local spells = LocalPlayer():getSpells()
		for k, v in pairs(spells) do
			local spell = inner:Add("DButton")
			spell:Dock(TOP)
			
			spell:DockMargin(2,2,2,2)
			spell:SetSize(ScrW() * 0.2, ScrH() * 0.025)
			spell:SetFont("nutSmallFont")
			spell:SetText(v.name)
			spell:SetTextColor(Color(255,255,255,255))
			spell:SetToolTip(v.desc or "")
			spell.DoClick = function()
				self:actionPress(spell)
			end
			spell.Paint = function(panel, w, h)
				local posX, posY = spell:GetPos()

				surface.SetDrawColor(Color(70, 80, 100, 220))
				surface.DrawRect(0, 0, w, h)
			end
			
			self.buttons[#self.buttons + 1] = spell
		end
		--]]
		
		--[[
		timer.Simple(0, function()
			for k, v in pairs(self.actions) do
				local spellInfo = {}
				if(v.special) then
					spellInfo = SPLS.spells[v.special]
				end
			
				local action = inner:Add("DButton")
				action:Dock(TOP)

				action:DockMargin(2,2,2,2)
				action:SetFont("nutSmallFont")
				action:SetTextColor(Color(255,255,255,255))
				action:SetText(v.name)
				action:SetToolTip(spellInfo.desc or "")
				action.DoClick = function()
					self:actionPress(action)
				end
				action.Paint = function(panel, w, h)
					surface.SetDrawColor(Color(70, 80, 100, 220))
					surface.DrawRect(0, 0, w, h)
				end
				
				self.buttons[#self.buttons + 1] = action				
			end
		end)
		--]]
	end
	
	function PANEL:actionPress(button)
		for k, v in pairs(self.buttons) do
			v.active = false
			v:SetTextColor(Color(255,255,255,255))
		end
		
		button:SetTextColor(Color(100,100,200,255))
		button.active = true
		
		if(self.swep) then
			for k, v in pairs(self.swep.actions) do
				if(v.name == button:GetText()) then
					self.swep:selectAction(k)
				end
			end
		end
	end
vgui.Register("nutActionList", PANEL, "DFrame")