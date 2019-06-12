local PANEL = {}
	function PANEL:Init()
		self:SetDrawBackground(false)
	end

	function PANEL:setMarkup(text, onDrawText, text2)
		local object = nut.markup.parse(text, self:GetWide())
		object.onDrawText = onDrawText
		
		local shadow
		if(text2) then
			shadow = nut.markup.parse(text2, self:GetWide())
			shadow.onDrawText = onDrawText
		end

		self:SetTall(object:getHeight())
		self.Paint = function(this, w, h)
			if(shadow) then
				shadow:draw(1, 1)
			end
			object:draw(0, 0)
		end
	end
vgui.Register("nutMarkupPanel", PANEL, "DPanel")