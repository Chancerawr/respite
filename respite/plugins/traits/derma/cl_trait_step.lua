local PANEL = {}

function PANEL:Init()
	self.title = self:addLabel("Select Traits")
	
	self.traits = self:Add("DScrollPanel")
	self.traits:Dock(FILL)

	self.traits:SetDrawBackground(false)
	--self.traits:SetStretchWidth(true)
	--self.traits:SetStretchHeight(true)
	--self.traits:StretchToParent(0, 0, 0, 0)
end

function PANEL:onDisplay()
	if(!TRAITS or !TRAITS.traits) then return end

	local oldChildren = self.traits:GetChildren()
	--self.traits:InvalidateLayout(true)
	
	local total = 0
	local maximum = nut.config.get("maxTraits", 2) or hook.Run("GetStartTraitPoints", LocalPlayer(), panel.payload)	
	
	for k, v in SortedPairsByMemberValue(TRAITS.traits, "category") do
		if(v.ignore) then continue end
	
		local bar = self:Add("nutAttribBar")
		bar:SetToolTip(v.desc)
		bar:setMax(1)
		bar:Dock(TOP)
		bar:DockMargin(2, 2, 2, 2)
		bar:setText(L(v.name))
		
		bar.onChanged = function(this, difference)
			if ((total + difference) > maximum) then
				return false
			end

			total = total + difference
			
			local traits = self:getContext("traits", {})
			if(traits[k]) then
				traits[k] = nil
			else
				traits[k] = 1
			end
			
			self:setContext("traits", traits)
		end
		
		bar.bar.OnMousePressed = function(this)
			if(bar.value == 0) then
				bar.pressing = 1
				bar:doChange()
			else
				bar.pressing = -1
				bar:doChange()
			end
		end
		
		bar.bar.OnMouseReleased = function()
			if (bar.pressing) then
				bar.pressing = nil
			end
		end
	end

	--self.traits:InvalidateLayout()
	
	for _, child in pairs(oldChildren) do
		--child:Remove()
	end
end

vgui.Register("nutCharTraits", PANEL, "nutCharacterCreateStep")