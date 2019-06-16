local PANEL = {}

function PANEL:Init()
	self.title = self:addLabel("Select a model")

	self.models = self:Add("DIconLayout")
	self.models:Dock(FILL)
	self.models:SetSpaceX(4)
	self.models:SetSpaceY(4)
	self.models:SetDrawBackground(false)
	self.models:SetStretchWidth(true)
	self.models:SetStretchHeight(true)
	self.models:StretchToParent(0, 0, 0, 0)
	
	self.slidePanel = {}
end

function PANEL:onDisplay()
	local oldChildren = self.models:GetChildren()
	self.models:InvalidateLayout(true)

	local faction = nut.faction.indices[self:getContext("faction")]
	if (not faction) then return end

	local function paintIcon(icon, w, h)
		self:paintIcon(icon, w, h)
	end
	
	for k, v in SortedPairs(faction.models) do
		local icon = self.models:Add("SpawnIcon")
		icon:SetSize(64, 128)
		icon:InvalidateLayout(true)
		icon.DoClick = function(icon)
			self:onModelSelected(icon)
		end
		icon.PaintOver = paintIcon

		if (type(v) == "string") then
			icon:SetModel(v)
			icon.model = v
			icon.skin = 0
			icon.bodyGroups = {}
		else
			icon:SetModel(v[1], v[2] or 0, v[3])
			icon.model = v[1]
			icon.skin = v[2] or 0
			icon.bodyGroups = v[3]
		end
		icon.index = k

		if (self:getContext("model") == k) then		
			self:onModelSelected(icon, true)
		end
	end
	
	self.models:Layout()
	self.models:InvalidateLayout()
	for _, child in pairs(oldChildren) do
		child:Remove()
	end	
end

function PANEL:paintIcon(icon, w, h)
	if (self:getContext("model") ~= icon.index) then return end
	local color = nut.config.get("color", color_white)

	surface.SetDrawColor(color.r, color.g, color.b, 200)

	local i2
	for i = 1, 3 do
		i2 = i * 2
		surface.DrawOutlinedRect(i, i, w - i2, h - i2)
	end
end

function PANEL:onModelSelected(icon, noSound)
	self:setContext("model", icon.index or 1)
	if (not noSound) then
		nut.gui.character:clickSound()
	end
	
	self:updateModelPanel()
	self:updateSliders()
end

function PANEL:shouldSkip()
	local faction = nut.faction.indices[self:getContext("faction")]
	return faction and #faction.models == 1 or false
end

function PANEL:updateSliders()
	if(nut.gui.charCreate.model) then
		if(self.slidePanel.used) then
			self.slidePanel.used = nil
			self.slidePanel:Remove()
		end
	
		local entity = nut.gui.charCreate.model:GetEntity()
		
		if(entity) then
			local slidePanel = nut.gui.charCreate:Add("DPanel")
		
			slidePanel:SetPos(ScrW() * 0.05, ScrH() * 0.2)
			slidePanel:SetSize(ScrW() * 0.15, ScrH() * 0.25)		
		
			--bodygroup sliders
			
			local groups = {}
			for k, v in pairs(entity:GetBodyGroups()) do
				if(v.id == 0) then --skips over a weird useless one
					continue
				end

				tempSlide = slidePanel:Add("DNumSlider")
				tempSlide:SetSize(ScrW() * 0.03, 50)
				
				local name = "  " ..string.gsub(v.name, "^.", string.upper)
				
				tempSlide:SetText(name)
				tempSlide:SetMax(v.num) --max based on the models number of groups
				tempSlide:SetDecimals(0)
				tempSlide:Dock(TOP)
				tempSlide:Center()
				
				function tempSlide:OnValueChanged(value)
					local entity = nut.gui.charCreate.model:GetEntity()
				
					if(entity) then
						groups[v.id] = math.Round(self:GetValue())
	
						PANEL:setContext("groups", groups)
						PANEL:onGroups()
					end
				end
			end

			if(entity:SkinCount() > 1) then
				--skin slider
				skinSlide = slidePanel:Add("DNumSlider")
				skinSlide:SetSize(ScrW() * 0.04, 50)
				skinSlide:SetText("  Skin")
				skinSlide:SetMax(entity:SkinCount() - 1) --max based on the models number of skins
				skinSlide:SetDecimals(0)
				skinSlide:Dock(TOP)
				skinSlide:Center()
				
				function skinSlide:OnValueChanged(value)
					PANEL:setContext("skin", math.Round(skinSlide:GetValue()))
					PANEL:onGroups()
				end
			end
			
			slidePanel:InvalidateLayout(true)
			slidePanel:SizeToChildren(false, true)
			
			self.slidePanel = slidePanel
			self.slidePanel.used = true
		end
	end	
end

function PANEL:onGroups()
	self:updateModelPanel()
end

function PANEL:onSkip()
	self:setContext("model", 1)
end

function PANEL:Think()
	if(self.slidePanel and self.slidePanel.GetAlpha) then
		if(self:GetAlpha() < 100) then
			self.slidePanel:SetAlpha(0)
		else
			self.slidePanel:SetAlpha(255)
		end
	end
end

vgui.Register("nutCharacterModel", PANEL, "nutCharacterCreateStep")
