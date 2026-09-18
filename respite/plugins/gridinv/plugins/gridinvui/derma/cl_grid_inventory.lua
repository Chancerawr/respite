local PLUGIN = PLUGIN

local PANEL = {}

local PADDING = 2
local BORDER = 4
local WEIGHT_PANEL_HEIGHT = 32
local HEADER_FIX = 22
local BORDER_FIX_H = 9 + PADDING

local SHADOW_COLOR = Color(0, 0, 0, 100)

local inventoryBackground = Material("respite/ui/inventory.png")

surface.CreateFont("nutInventoryTitleFont", {
	font = "Type-Ra",
	size = ScreenScale(9),
	weight = 1000
})

function PANEL:Init()
	self:MakePopup()

	self.content = self:Add("nutGridInventoryPanel")
	self.content:Dock(FILL)
	self.content:setGridSize(1, 1)
end

function PANEL:setInventory(inventory)
	self.gridW, self.gridH = inventory:getSize()
	self:SetSize(
		self.gridW * (NS_ICON_SIZE + PADDING) + BORDER*2,
		self.gridH * (NS_ICON_SIZE + PADDING) + HEADER_FIX + BORDER*2
	)
	self:InvalidateLayout(true)

	self.content:setGridSize(self.gridW, self.gridH)
	self.content:setInventory(inventory)
	self.content.InventoryDeleted = function(content, deletedInventory)
		if (deletedInventory == inventory) then
			self:InventoryDeleted()
		end
	end
end

function PANEL:InventoryDeleted()
	self:Remove()
end

function PANEL:Center()
	local parent = self:GetParent()
	local centerX, centerY = ScrW() * 0.5, ScrH() * 0.5
	
	self:SetPos(
		centerX - (self:GetWide() * 0.5),
		centerY - (self:GetTall() * 0.5)
	)
end

function PANEL:Paint(w,h)
	--[[
	local alpha = 255--math.random(0, 255)

	local timeSince = CurTime() - self.creationTime
	if(timeSince < 0.4) then
		alpha = 0
	elseif(timeSince < 1) then
		alpha = math.random(1,255)
	end
	--]]

	--[[
	surface.SetDrawColor(50, 50, 50, 255)
	surface.DrawRect(0, 0, w, h)
	--]]

	
	local backgroundColor = Color(255,255,255,100)
		
	if(LocalPlayer().GetSanity) then
		local sanityPercent = LocalPlayer():GetSanityPercent()
		if(sanityPercent < 0.5) then
			backgroundColor.g = backgroundColor.g * sanityPercent*2
			backgroundColor.b = backgroundColor.b * sanityPercent*2
		end
	end

	surface.SetDrawColor(backgroundColor)
	surface.SetMaterial(inventoryBackground)
	surface.DrawTexturedRect(0, 0, w, h)
	
	surface.SetDrawColor(5, 5, 5, 255)
	surface.DrawOutlinedRect(0, 0, w, h, BORDER)
	surface.DrawRect(0, 0, w, HEADER_FIX+BORDER)

	local name = self.inventoryName or "Inventory"
	surface.SetFont("nutInventoryTitleFont")
	surface.SetTextColor(255, 255, 255)
	
	local textSizeX, textSizeY = surface.GetTextSize(name)
	
	surface.SetTextPos(w*0.5-textSizeX*0.5, 0-textSizeY*0.1)
	surface.DrawText(name)
end

vgui.Register("nutGridInventory", PANEL, "nutInventory")
