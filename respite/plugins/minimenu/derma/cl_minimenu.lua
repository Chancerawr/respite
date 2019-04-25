local PLUGIN = PLUGIN

local KeyDownDelay = CurTime() or KeyDownDelay
hook.Add("Think", "nut_bodyMenu", function()
	if input.IsKeyDown(KEY_F2) and (KeyDownDelay < CurTime()) then
		KeyDownDelay = CurTime() + 0.5
		
		if(LocalPlayer():getChar()) then
			if (!IsValid(nut.gui.minimenu)) then
				vgui.Create("nutMiniMenu")
			else
				nut.gui.minimenu:Remove()
			end
		end
	end
end)

local PANEL = {}
	function PANEL:Init()
		if (IsValid(nut.gui.minimenu)) then
			nut.gui.minimenu:Remove()
		end
		
		nut.gui.minimenu = self

		--MAIN PANEL, BODY PARTS
		self:SetSize(ScrW() * 0.22, ScrH() * 0.4)
		self:Center()
		--self:SetPos(ScrW() * 0.2, ScrH() * 0.2)
		self:SetTitle("")
		self:MakePopup()
		
		local inner = vgui.Create("DPanel", self)
		inner:Dock(FILL)
		
		self.scroll = vgui.Create( "DScrollPanel", inner )
		self.scroll:Dock(FILL)
		self.scroll:SetPaintBackground(true)
		self.scroll:SetBackgroundColor(Color(100,200,100))
		self.scroll:DockMargin(5, 5, 5, 5)
		
		for k, v in pairs(PLUGIN:getMenu()) do
			local button = self.scroll:Add("DButton")
			button:SetText(v[1])
			button:SetSize(ScrW() * 0.2, ScrH() * 0.025)
			button:SetTextColor(Color(255,255,255,255))
			button:Dock(TOP)
			button:DockMargin(2, 2, 2, 2)
			button:Center()
			button.DoClick = function()
				vgui.Create(v[2])
				self:Close()
			end
			button.Paint = function(panel, w, h)
				local posX, posY = button:GetPos()
		
				surface.SetDrawColor(Color(70, 80, 100, 220))
				surface.DrawRect(0, 0, w, h)
			end
		end
	end
vgui.Register("nutMiniMenu", PANEL, "DFrame")