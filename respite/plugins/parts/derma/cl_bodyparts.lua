local PLUGIN = PLUGIN

local partsTemp = {
	["al"] = 1,
	["ar"] = 2,
	["ll"] = 3,
	["lr"] = 4,
	["t"] = 5,
	["el"] = 6,
	["er"] = 7,
	["h"] = 8,
}

local injuriesTemp = {
	[1] = {
		name = "Bruise",
	},
	[2] = {
		name = "Fracture",
	},
	[3] = {
		name = "Burn",
	},
	[4] = {
		name = "Laceration",
	},
	[5] = {
		name = "Puncture",
	},
	[6] = {
		name = "Abrasion",
	},
	[7] = {
		name = "Bullet Wound",
	},
}

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

		local injuries = LocalPlayer():getInjuries()
		
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
			
			local text
			
			if(material) then
				text = parts[k][1].. " (" ..material.. " " ..percent.. "%)"
			else
				text = parts[k][1]
			end			
			
			local tempNum = partsTemp[k]
			
			local injuryText = ""
			if(tempNum) then
				local injury = injuries[tempNum]
				
				if(injury) then
					local count = 0
					for k2, v2 in pairs(injury) do
						count = count + 1
						injuryText = injuryText..(injuriesTemp[k2] and injuriesTemp[k2].name)
						
						if(count < table.Count(injury)) then
							injuryText = injuryText.. ", "
						end
					end
					
					text = text.. " - " ..injuryText
				else
					text = text.. " - Healthy."
				end
			else
				text = text.. " - Healthy."
			end	

			bodyText:SetText(text)
			limb:SizeToContents()
		end
	end
	
vgui.Register("nutParts", PANEL, "DFrame")

timer.Simple(1, function()
	nut.plugin.list["minimenu"]:addMenu({"Body Parts", "nutParts"})
end)