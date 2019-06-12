local PLUGIN = PLUGIN

local PANEL = {}
	function PANEL:Init()
		if (IsValid(nut.gui.trait)) then
			nut.gui.traits:Remove()
		end
		
		nut.gui.traits = self
	
		local charTraits = LocalPlayer():getChar():getData("traits", {})

		--MAIN PANEL, TRAITS
		self:SetSize(ScrW() * 0.3, ScrH() * 0.45)
		self:Center()
		--self:SetPos(ScrW() * 0.2, ScrH() * 0.2)
		self:SetTitle("Trait Info")
		self:MakePopup()
		
		local inner = vgui.Create("DPanel", self)
		inner:Dock(FILL)
		
		--TRAITS
		if(nut.plugin.list["traits"]) then
			self.traits = vgui.Create( "DScrollPanel", inner )
			self.traits:Dock(FILL)
			--self.traits:SetSize(ScrW() * 0.3, ScrH() * 0.45)
			--self.traits:SetPos(ScrW() * 0.25, ScrH() * 0.2)
			
			local traits = LocalPlayer():getChar():getData("traits", {})
			for k, v in pairs(traits) do
				local trait = self.traits:Add("DLabel")
				trait:Dock(TOP)
				trait:SetWrap(true)
				trait:SetTall(ScrH() * 0.055)
				trait:SetAutoStretchVertical(true)
				trait:SetContentAlignment(5)
				trait:DockMargin(2,2,2,2)
				
				local traitText = TRAITS.traits[k].name.. ": " ..TRAITS.traits[k].desc.. "\n"
				
				trait:SetFont("nutSmallFont")
				trait:SetText(traitText)
			end
		end
	end
vgui.Register("nutTraits", PANEL, "DFrame")

timer.Simple(1, function()
	nut.plugin.list["minimenu"]:addMenu({"Character Traits", "nutTraits"})
end)