local PANEL = {}
	local background = Material("newlight/cpui_sample_mainpanel.png")
	local detail = Material("newlight/cpui_sample_detail1.png")
	local logo = Material("newlight/cpui_sample_logo_arint.png")
	local banner = Material("newlight/cpui_sample_menubanner.png")
	local glow = Material("newlight/cpui_sample_text_layerglow.png")
	
	local alpha = 80
	
	-- this scuff is to make sure it scales by resolution
	local scalingX = ScrW() / 2560
	local scalingY = ScrH() / 1440

	function PANEL:Init()
		if(IsValid(nut.gui.playerCard)) then
			nut.gui.playerCard:remove()
		end
		
		nut.gui.playerCard = self
		
		self:SetSize(ScrW() * 0.35, ScrH() * 0.25)
		self:Center()
		
		self:MakePopup()
		
		local name = self:Add("DLabel")
		name:SetFont("nutMediumFont")
		name:SetPos(ScrW() * 0.2, 30)
		name:Dock(TOP)
		name:SetText("")
		name:SetTextColor(Color(255, 255, 255, 255))
		
		self.name = name
		
		local scroll = self:Add("DScrollPanel")
		scroll:SetPos(0, 50)
		scroll:Dock(TOP)
		scroll:Center()
		function scroll:Paint(w, h) end
		
		local desc = scroll:Add("DLabel")
		desc:SetPos(0, 50)
		desc:Dock(TOP)
		desc:DockMargin(16, 0, 16, 0)
		desc:SetFont("nutSmallFont")
		desc:SetText("")
		desc:SetAutoStretchVertical(true)
		desc:SetWrap(true)
		desc:SetSize(ScrW() * 0.35, 10)
		desc:SetTextColor(Color(255, 255, 255, 255))
		desc:PerformLayout()
		
		self.desc = desc
	end
	
	function PANEL:SetPlayer(client)
		local recogName = nut.plugin.list["recognition"]:GetDisplayedName(client) or "Someone"
		local desc = client:getChar():getDesc() or ""

		self:SetTitle(recogName)
		
		self.name:SetText(recogName)
		self.name:SizeToContents()
		self.name:SetContentAlignment(5)
		
		self.desc:SetText(desc)
		self.desc:SizeToContents()
		self.desc:SetContentAlignment(5)
	end

	--[[
	function PANEL:Paint(w, h)
		surface.SetDrawColor(0, 0, 0, 50)
		surface.DrawRect(0, 0, w, h)
		
		surface.SetDrawColor(255, 255, 255, 255)
		
		--panel art
		surface.SetMaterial(background)
		surface.DrawTexturedRect(0, 0, w, h)
		
		--detail
		surface.SetMaterial(detail)
		surface.DrawTexturedRect(0, 0, w, h)
		
		--logo
		surface.SetMaterial(logo)
		surface.DrawTexturedRect(0, 0, w, h)
		
		--banner
		surface.SetMaterial(banner)
		surface.DrawTexturedRect(0, 0, w, h)
		
		--glow
		surface.SetDrawColor(255, 255, 255, alpha)
		surface.SetMaterial(glow)
		surface.DrawTexturedRect(0, 0, w, h)
	end
	--]]

	function PANEL:OnRemove()
	end

	function PANEL:remove()
		--[[
		CloseDermaMenus()
		--]]

		if (!self.closing) then
			self:AlphaTo(0, 0.25, 0, function()
				self:Remove()
			end)
			self.closing = true
		end
	end
vgui.Register("nutPlayerCard", PANEL, "DFrame")

--[[
if (IsValid(nut.gui.playerCard)) then
	vgui.Create("nutPlayerCard")
end
--]]
