local PLUGIN = PLUGIN

local PANEL = {}
	function PANEL:Init()
		if (IsValid(nut.gui.body)) then
			nut.gui.body:Remove()
		end

		nut.gui.body = self
	
		local charParts = LocalPlayer():getChar():getData("parts", {})
	
		local parts = PLUGIN.parts

		--MAIN PANEL, BODY PARTS
		self:SetSize(ScrW() * 0.3, ScrH() * 0.45)
		self:Center()
		--self:SetPos(ScrW() * 0.5, ScrH()*0.2)
		self:SetTitle("Body Info: " ..math.Round(PLUGIN:calcPercent(charParts), 2).. "% Abnormal")
		self:MakePopup()
		
		local inner = vgui.Create("DScrollPanel", self)
		inner:Dock(FILL)
		inner:SetBackgroundColor(Color(255,0,0,255))
		

		for k, v in SortedPairs(parts) do
			local limb = inner:Add("DPanel", inner)
			limb:DockMargin(0,0,0,-1)
			limb:Dock(TOP)
			limb:SetTall(ScrH() * 0.055)
			limb:SetBackgroundColor(Color(255,0,0,255))
			
			local bodyText = limb:Add("DLabel")
			bodyText:DockMargin(2,2,2,2)
			bodyText:Dock(FILL)
			bodyText:SetContentAlignment(5)
			bodyText:SetWrap(true)
			bodyText:SetFont("nutObjDescFont")
			bodyText:SetColor(Color(64,128,128,255))

			local percent = (((charParts[k] and charParts[k][1]) or 0) / parts[k][2]) * 100
			local material = ((charParts[k] and charParts[k][2]) or nil)

			local text = parts[k][1].." - Normal."
			if(material) then
				text = parts[k][1].." - "..math.Round(percent, 2).."% "..material.."."
				
				if (percent > 75) then
					text = text.."\n".."Unrecognisable."
				elseif(percent > 50) then
					text = text.."\n".."Unnatural."			
				elseif(percent > 25) then
					text = text.."\n".."Irregular."
				else
					text = text.."\n".."Stable."
				end
			end

			bodyText:SetText(text)
		end
	end
	
vgui.Register("nutParts", PANEL, "DFrame")

timer.Simple(1, function()
	nut.plugin.list["minimenu"]:addMenu({"Body Parts", "nutParts"})
end)