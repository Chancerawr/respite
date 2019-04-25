local PANEL = {}
	function PANEL:Init()
		if (IsValid(nut.gui.charCreate)) then
			nut.gui.charCreate:Remove()
		end

		nut.gui.charCreate = self

		self:SetSize(ScrW() * 0.8, ScrH() * 0.55)
		self:SetPos(ScrW() * 0.1, ScrH() * 0.25 + 16)

		self.notice = self:Add("nutNoticeBar")
		self.notice:setType(4)
		self.notice:setText(L"charCreateTip")
		self.notice:SetWide(self:GetWide())

		self.payload = {}
		self.lastY = self.notice:GetTall() + 8
		self.lastX = 0
	end

	function PANEL:addLabel(text)
		local label = self:Add("DLabel")
		label:SetPos(self.lastX, self.lastY)
		label:SetFont("nutMenuButtonFont")
		label:SetText(L(text))
		label:SizeToContents()
		label:SetTextColor(color_white)
		label:SetExpensiveShadow(2, Color(0, 0, 0, 200))

		self.lastY = self.lastY + label:GetTall() + 8

		return label
	end

	function PANEL:addTextBox()
		local textBox = self:Add("DTextEntry")
		textBox:SetFont("nutMenuButtonLightFont")
		textBox:SetWide(ScrW() * 0.3)
		textBox:SetPos(self.lastX, self.lastY)
		textBox:SetTall(36)

		self.lastY = self.lastY + textBox:GetTall() + 8
		
		return textBox
	end

	function PANEL:setUp(faction)
		self.faction = faction
		self.payload.faction = self.faction
		
		for k, v in SortedPairsByMemberValue(nut.char.vars, "index") do
			if (!v.noDisplay and k != "__SortedIndex") then
			
				--these are ignored so we can draw them elsewhere
				if(v.field == "_attribs") then
					continue
				end
				
				if(v.field == "_traits") then
					continue
				end
			
				if (v.shouldDisplay) then
					if (v.shouldDisplay(self) == false) then
						continue
					end
				end

				self:addLabel(k)

				if (v.onDisplay) then
					local panel = v.onDisplay(self, self.lastY)

					if (IsValid(panel)) then
						self.lastY = self.lastY + panel:GetTall() + 8

						if (v.onPostSetup) then
							v.onPostSetup(panel, faction, self.payload)
						end
					end
				elseif (type(v.default) == "string") then
					local textBox = self:addTextBox()
					textBox.OnTextChanged = function(this)
						self.payload[k] = this:GetText()
					end

					if (v.onPostSetup) then
						v.onPostSetup(textBox, faction, self.payload)
					end
				end
			end
		end
		

		--attribute panel
		local attribs = nut.char.vars.attribs

		self.lastX = ScrW() * 0.5
		self.lastY = self.notice:GetTall() + 8
		
		self:addLabel("attribs")
					
		local panel = attribs.onDisplay(self, self.lastY)

		if (IsValid(panel)) then
			self.lastY = self.lastY + panel:GetTall() + 8

			if (attribs.onPostSetup) then
				attribs.onPostSetup(panel, faction, self.payload)
			end
		end

		--trait panel
		local traits = nut.char.vars.traits

		self.lastX = ScrW() * 0.5
		self.lastY = self.lastY + 20
		
		self:addLabel("Traits")
					
		local panel = traits.onDisplay(self, self.lastY)

		if (IsValid(panel)) then
			self.lastY = self.lastY + panel:GetTall() + 8

			if (traits.onPostSetup) then
				traits.onPostSetup(panel, faction, self.payload)
			end
		end
	end
vgui.Register("nutCharCreate", PANEL, "DScrollPanel")