local PLUGIN = PLUGIN

local PANEL = {}
	function PANEL:Init()
		if (IsValid(nut.gui.actionL)) then
			nut.gui.actionL:Remove()
		end
		
		nut.gui.actionL = self
		
		self:SetSize(ScrW() * 0.15, ScrH() * 0.3)
		self:Center()
		self:SetTitle("Actions")
		self:MakePopup()
		
		self.buttons = {}
		
		local inner = vgui.Create("DScrollPanel", self)
		inner:Dock(FILL)
		
		local colors = {
			["Default"] = Color(255,255,255),
			
			--[[
			["Fire"] = Color(200,0,0),
			["Shock"] = Color(200,200,255),
			
			["Blight"] = Color(0,0,0),
			["Shard"] = Color(255,255,255),
			["Ichor"] = Color(200,200,200),
			
			["Mental"] = Color(0,180,180),
			
			--physical
			["Pierce"] = Color(180,180,180),
			["Slash"] = Color(180,180,180),
			["Crush"] = Color(180,180,180),
			["Siege"] = Color(180,180,180),
			--]]
		}
		
		timer.Simple(0, function()
			--local customs = nut.plugin.list["spells"] and nut.plugin.list["spells"].spellList

			local categories = {}
			for k, action in SortedPairsByMemberValue(self.actions or {}, "category" or "") do
				local textColor = Color(150,150,150,255)

				--[[
				local actionInfo = {}
				if(v.special) then
					--actionInfo = customs[v.special] or SPLS.spells[v.special] or {}
					actionInfo = ACTS.actions[v.special] or {}
				end
				--]]
				local actionData = ACTS.actions[action.uid or -1] or {}
				
				if(actionData.category) then
					if(!categories[actionData.category]) then
						categories[actionData.category] = true
						
						local catLabel = inner:Add("DLabel")
						catLabel:Dock(TOP)
						catLabel:DockMargin(2,2,2,2)
						catLabel:SetText(actionData.category)
					end
				
					textColor = colors[actionData.category] or Color(255,255,255,255)
				end
				
				local desc
				if(actionData.desc) then
					desc = actionData.desc or ""
				else
					desc = ""
				end
			
				if(actionData.dmg and actionData.dmgT) then
					desc = desc.. "\nBase Damage: " ..actionData.dmg.. " " ..actionData.dmgT.. "."
				end		
				
				if(actionData.radius) then
					desc = desc.. "\nArea of Effect: " ..actionData.radius.. "."
				end
				
				if(actionData.CD) then
					desc = desc.. "\nCooldown: " ..actionData.CD.. " turns."
				end
				
				if(actionData.costAP) then
					desc = desc.. "\nAP Cost: " ..actionData.costAP.. "."
				end
			
				if(actionData.costHP) then
					desc = desc.. "\nHP Cost: " ..actionData.costHP.. "."
				end
				
				if(actionData.costMP) then
					desc = desc.. "\nMP Cost: " ..actionData.costMP.. "."
				end
				
				if(actionData.attribs) then
					desc = desc.. "\nScaling:"
					
					for attribName, attribMult in pairs(actionData.attribs) do
						desc = desc.. "\n   " ..((nut.attribs.list[attribName] and nut.attribs.list[attribName].name) or "Unknown").. ": " ..attribMult.. "x."
					end
				end
			
				local button = inner:Add("DButton")
				button:Dock(TOP)
				button:DockMargin(2,2,2,2)
				
				button:SetFont("nutSmallFont")
				
				button:SetTextColor(textColor)
				button:SetText(actionData.name or action.name or "Unnamed Action")
				button:SetToolTip(desc)
				button.DoClick = function()
					self:actionPress(button)
				end
				button.Paint = function(panel, w, h)
					surface.SetDrawColor(Color(70, 80, 100, 220))
					surface.DrawRect(0, 0, w, h)
				end
				
				self.buttons[#self.buttons + 1] = button				
			end
		end)		
	end
	
	function PANEL:actionPress(button)
		for k, v in pairs(self.buttons) do
			v.active = false
			v:SetTextColor(Color(255,255,255,255))
		end
		
		button:SetTextColor(Color(100,100,200,255))
		button.active = true
		
		if(self.actions and self.swep) then
			for k, v in pairs(self.actions) do
				if(v.name == button:GetText()) then
					self.swep:selectAction(k)
					break
				end
			end
		--[[
		elseif(self.entity) then
			for k, v in pairs(self.entity.actions) do
				if(v.name == button:GetText()) then
					self.entity.casting = true --might be temporary
					
					self.entity.actCur = k
					netstream.Start("ccActionSelect", self.entity, k)
				end
			end
		--]]
		end
	end
vgui.Register("nutActionList", PANEL, "DFrame")