local PLUGIN = PLUGIN

local PANEL = {}

function PANEL:Init()
	local client = LocalPlayer()
	local char = client:getChar()

	nut.gui.status = self

	self:SetSize(self:GetParent():GetSize())

	self.scroll = self:Add("DScrollPanel")
	self.scroll:Dock(TOP)
	self.scroll:SetSize(self:GetParent():GetSize())

	local followers = client:getFollowers()

	local y = 0

	for followerID, follower in pairs(followers) do
		local data = follower.saveData
	
		local followerButton = self.scroll:Add("DButton")
		followerButton:SetSize(ScrW()*0.2, 30)
		followerButton:SetPos(ScrW()*0.02, ScrH()*0.025 + y)
		followerButton:DockMargin(0, 10, 0, 0)
		followerButton:SetFont("nutMediumFont")
		followerButton:SetTextColor(color_white)
		followerButton:SetText(data.name or "Unnamed")
		
		if(data.desc) then
			followerButton:SetTooltip(data.desc)
		end
		
		followerButton.Paint = function(panel, w, h)
			local posX, posY = followerButton:GetPos()
	
			surface.SetDrawColor(Color(70, 80, 100, 220))
			surface.DrawRect(0, 0, w, h)
		end
		
		followerButton.DoClick = function()
			local subFrame = self:Add("DFrame")
			subFrame:SetSize(600, 400)
			subFrame:SetTitle(data.name or "Unnamed")
			subFrame:MakePopup()
			subFrame:Center()
			
			subScroll = subFrame:Add("DScrollPanel")
			subScroll:Dock(TOP)
			subScroll:SetSize(600, 300)
		
			local desc = subScroll:Add("DTextEntry")
			desc:Dock(FILL)
			desc:SetSize(600, 300)
			desc:DockMargin(0, 10, 0, 0)
			desc:SetPaintBackground(false)
			desc:SetWrap(true)
			desc:SetMultiline(true)
			desc:SetTextColor(Color(255,255,255))
			desc:SetFont("nutSmallFont")
			desc.AllowInput = function()
				return true
			end
			desc:SetEnabled(false)
			
			local descString = data.name or "Unnamed"
			if(data.desc) then
				descString = descString.. "\n" ..data.desc
			end
			
			if(data.attribs) then
				descString = descString.. "\n\n"
				for k, v in pairs(data.attribs) do
					local attribName = (nut.attribs.list[k] and nut.attribs.list[k].name) or "Unknown Attrib"
					descString = descString..attribName.. ": " ..v.. "\n"
				end
			end
			
			desc:SetText(descString)
			
			local spawnButton = subFrame:Add("DButton")
			spawnButton:Dock(BOTTOM)
			spawnButton:DockMargin(5,5,5,0)
			spawnButton:SetTextColor(Color(255,255,255))
			spawnButton:SetText("Spawn")
			spawnButton.DoClick = function()
				netstream.Start("nut_followerSpawn", followerID)
			end
			spawnButton.Paint = function(panel, w, h)
				local posX, posY = spawnButton:GetPos()
		
				surface.SetDrawColor(Color(70, 80, 100, 220))
				surface.DrawRect(0, 0, w, h)
			end
			
			local recallButton = subFrame:Add("DButton")
			recallButton:Dock(BOTTOM)
			recallButton:DockMargin(5,5,5,0)
			recallButton:SetTextColor(Color(255,255,255))
			recallButton:SetText("Recall")
			recallButton.DoClick = function()
				netstream.Start("nut_followerRecall", followerID)
			end
			recallButton.Paint = function(panel, w, h)
				local posX, posY = recallButton:GetPos()
		
				surface.SetDrawColor(Color(70, 80, 100, 220))
				surface.DrawRect(0, 0, w, h)
			end
		end
		
		y = y + 50
	end
end

function PANEL:OnRemove()
end
vgui.Register("nutFollowers", PANEL, "EditablePanel")

hook.Add("CreateMenuButtons", "nutFollowers", function(tabs)
	local client = LocalPlayer()
	local char = client:getChar()
	local followers = char:getData("fllw", {})
	if(!table.IsEmpty(followers)) then
		tabs["Followers"] = function(panel)
			panel:Add("nutFollowers")
		end
	end
end)