local PLUGIN = PLUGIN



local PANEL = {}
	function PANEL:Init()
		if (IsValid(nut.gui.body)) then
			nut.gui.body:Remove()
		end

		nut.gui.body = self
		
		local client = LocalPlayer()
		local char = client:getChar()
		
		local body = client:GetBody()
		local injuries = client:InjuryGetAll()

		--MAIN PANEL, BODY PARTS
		self:SetSize(ScrW() * 0.3, ScrH() * 0.45)
		self:Center()
		--self:SetPos(ScrW() * 0.5, ScrH()*0.2)
		--self:SetTitle("Body Info: " ..math.Round(PLUGIN:calcPercent(charParts), 2).. "% Abnormal")
		self:SetTitle(client:Name())
		self:MakePopup()
		
		local inner = vgui.Create("DScrollPanel", self)
		inner:Dock(FILL)
		inner:SetBackgroundColor(Color(255,0,0,255))

		for k, partID in SortedPairs(body) do
			local partTbl = PLUGIN:GetPartByID(partID)
			if(!partTbl) then continue end

			local part = inner:Add("DPanel", inner)
			part:DockMargin(0,0,0,-1)
			part:Dock(TOP)
			part:SetTall(ScrH() * 0.055)
			part:SetBackgroundColor(Color(255,0,0,255))
			
			local bodyText = part:Add("DLabel")
			bodyText:DockMargin(2,2,2,2)
			bodyText:Dock(FILL)
			bodyText:SetContentAlignment(5)
			bodyText:SetWrap(true)
			bodyText:SetFont("nutObjDescFont")
			bodyText:SetColor(Color(64,128,128,255))

			local text = partTbl.name
			
			local injuryText = ""
			local injury = injuries[partID]

			if(injury) then
				local count = 0
				for injuryID, serverity in pairs(injury) do
					local injuryTbl = PLUGIN:GetInjuryByID(partID)
					if(!injuryTbl) then continue end
					
					count = count + 1
					injuryText = injuryText..(injuryTbl.name or injuryTbl.id)
					
					if(count < table.Count(injury)) then
						injuryText = injuryText.. ", "
					end
				end
				
				text = text.. " - " ..injuryText
			else
				text = text.. " - Healthy."
			end

			bodyText:SetText(text)
			part:SizeToContents()
		end
	end
vgui.Register("nutParts", PANEL, "DFrame")

hook.Add("CreateMenuButtons", "nutParts", function(tabs)
	tabs["Body"] = function(panel)
		panel:Add("nutParts")
	end
end)