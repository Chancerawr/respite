local PLUGIN = PLUGIN

local PANEL = {}
	function PANEL:Init()
		if (IsValid(nut.gui.turnList)) then
			nut.gui.turnList:Remove()
		end
		
		nut.gui.turnList = self
		
		self:SetSize(450, 600)
		self:Center()
		self:SetTitle("Turns")
		self:MakePopup()
		self:ShowCloseButton(true)

		local scroll = vgui.Create("DScrollPanel", self)
		scroll:Dock(FILL)
		
		--main stuff
		local turnID
		
		timer.Simple(0, function()
			turnID = self.id
		
			if(!turnID) then
				self:turnChoose(scroll)
			else
				self:turnID(scroll, turnID)
			end
		end)
		
		--side panel
		local frame = vgui.Create("DFrame", self)
		frame:SetSize(150, 300)
		frame:Center()
		frame:SetTitle("")
		frame:MakePopup()
		frame:ShowCloseButton(true)
		frame:MoveRightOf(self, 50)
		
		local scroll2 = vgui.Create("DScrollPanel", frame)
		scroll2:Dock(FILL)
		
		local newB = vgui.Create("DButton", scroll2)
		newB:SetText("New Turn Table")
		newB:Dock(TOP)
		
		newB:SetTextColor(Color(255,255,255,255))
		newB.Paint = function(panel, w, h)
			surface.SetDrawColor(Color(70, 80, 100, 220))
			surface.DrawRect(0, 0, w, h)
		end
		
		newB.DoClick = function()
			nut.util.notify("This isn't done yet.")

			frame:Remove()
		end
		
		local selectB = vgui.Create("DButton", scroll2)
		selectB:SetText("Select Turn Table")
		selectB:Dock(TOP)
		
		selectB:SetTextColor(Color(255,255,255,255))
		selectB.Paint = function(panel, w, h)
			surface.SetDrawColor(Color(70, 80, 100, 220))
			surface.DrawRect(0, 0, w, h)
		end
		
		selectB.DoClick = function()
			self:turnChoose(scroll)
			
			frame:Remove()
		end
		
		local nextB = vgui.Create("DButton", scroll2)
		nextB:SetText("Next Turn")
		nextB:Dock(TOP)
		
		nextB:SetTextColor(Color(255,255,255,255))
		nextB.Paint = function(panel, w, h)
			surface.SetDrawColor(Color(70, 80, 100, 220))
			surface.DrawRect(0, 0, w, h)
		end
		
		nextB.DoClick = function()
			netstream.Start("nutTurnNext", turnID)
		end
	end
	
	function PANEL:turnID(scroll, turnID)
		local turnTable = PLUGIN.turns[turnID]
	
		if(turnTable) then
			local entities = turnTable.entities
			for entity, team in pairs(entities or {}) do
				if(!IsValid(entity)) then continue end
			
				local name = vgui.Create("DButton", scroll)
				name:SetText(entity:Name().. ": " ..team)
				name:SetToolTip("Click to remove.")
				name:Dock(TOP)
				name:SetHeight(32)
				
				name.DoClick = function() --remove from turns
					PLUGIN:turnRemove(turnID, entity)
					netstream.Start("nutTurnRemove", turnID, entity) --networks the removal
					name:Remove()
					
					nut.util.notify(entity:Name().. " removed from turn system.")
					--self:menuTurnDetails(scroll, client)
				end
				
				name:SetTextColor(Color(255,255,255,255))
				name.Paint = function(panel, w, h)
					surface.SetDrawColor(Color(70, 80, 100, 220))
					surface.DrawRect(0, 4, w, h-8)
				end
			end
		end
	end
	
	function PANEL:turnChoose(scroll)
		local turns = PLUGIN.turns
	
		if(turns) then
			for k, v in pairs(turns) do
				local name = vgui.Create("DButton", scroll)
				name:SetText(v.name)
				name:SetToolTip((table.Count(v.entities) or 0).. " entities in this turn system.")
				name:Dock(TOP)
				name:SetHeight(32)
				
				name.DoClick = function()
					nut.util.notify(v.name.. " selected.")
					netstream.Start("nutTurnTblS", self.swep, k)
					
					self:Remove()
				end
				
				name:SetTextColor(Color(255,255,255,255))
				name.Paint = function(panel, w, h)
					surface.SetDrawColor(Color(70, 80, 100, 220))
					surface.DrawRect(0, 4, w, h-8)
				end
			end
		end
	end
	
	function PANEL:menuTurnDetails(panel, client)
		--[[
		local frame = vgui.Create("DFrame")
		frame:SetSize(300, 600)
		frame:Center()
		frame:SetTitle("Test")
		frame:MakePopup()
		frame:ShowCloseButton(true)
		frame:MoveRightOf(panel, 324)
		
		local scroll = vgui.Create("DScrollPanel", frame)
		scroll:Dock(FILL)
		
		local button = vgui.Create("DButton", scroll)
		button:SetText("Add to Player")
		button:Dock(TOP)
		
		button:SetTextColor(Color(255,255,255,255))
		button.Paint = function(panel, w, h)
			surface.SetDrawColor(Color(70, 80, 100, 220))
			surface.DrawRect(0, 0, w, h)
		end
		
		button.DoClick = function()
			local data = {}
			--data.id = spell._uid
			
			--netstream.Start("nutS_give", data)
			frame:Remove()
		end

		local button = vgui.Create("DButton", scroll)
		button:SetText("Edit Spell")
		button:Dock(TOP)
		
		button:SetTextColor(Color(255,255,255,255))
		button.Paint = function(panel, w, h)
			surface.SetDrawColor(Color(70, 80, 100, 220))
			surface.DrawRect(0, 0, w, h)
		end
		
		button.DoClick = function()
			local data = {}
			data.id = spell._uid
			
			--netstream.Start("nutS_editS", data)
			frame:Remove()
		end

		--]]
	end	
vgui.Register("nutTurnList", PANEL, "DFrame")

--[[
hook.Add("CreateMenuButtons", "nutTurnList", function(tabs)
	tabs["Actions"] = function(panel)
		panel:Add("nutSpellList")
	end
end)
--]]