local PLUGIN = PLUGIN

local PANEL = {}
	function PANEL:Init()
		if (IsValid(nut.gui.actionL)) then
			nut.gui.actionL:Remove()
		end
		
		nut.gui.actionL = self
		
		self:SetSize(ScrW() * 0.3, ScrH() * 0.6)
		self:Center()
		self:SetTitle("")
		self:MakePopup()
		self:ShowCloseButton(true)
		
		local equipPanel = vgui.Create("nutWeaponList")
		equipPanel:MoveRightOf(self, 8)
		
		self.Paint = function(panel, w, h)
			--background image
			surface.SetDrawColor(Color(40, 40, 40, 255))
			surface.DrawRect(0, 0, w, h)
		end
		
		self.buttons = {}
		self.categories = {}
		self.labels = {}
		
		local inner = vgui.Create("DScrollPanel", self)
		inner:Dock(FILL)
		self.inner = inner
		
		--inner:SetVerticalScrollbarEnabled(false)
		local vBar = inner:GetVBar()
		function vBar:Paint(w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 100))
		end
		function vBar.btnUp:Paint(w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))
		end
		function vBar.btnDown:Paint(w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))
		end
		function vBar.btnGrip:Paint(w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))
		end
		
		local client = LocalPlayer()
		local ready = client:getNetVar("turnOverIcon")
		
		local closeButton = vgui.Create("DButton", self)
		closeButton:Dock(BOTTOM)
		closeButton:SetTextColor(Color(255,255,255))
		closeButton.Paint = function(panel, w, h)
			if(!ready) then
				surface.SetDrawColor(255,255,255)
			else
				surface.SetDrawColor(0,0,0)
			end
			
			surface.DrawOutlinedRect(0,0,w,h,1)
		end
		closeButton.DoClick = function()
			netstream.Start("nut_CSwepEndTurn")
			self:Close()
		end
		
		if(!ready) then
			closeButton:SetText("Finish Turn")
		else
			closeButton:SetText("Resume Turn")
		end
		
		local closeButton = vgui.Create("DButton", self)
		closeButton:SetPos(556, 0)
		closeButton:SetSize(20, 20)
		closeButton:SetTextColor(Color(255,255,255))
		closeButton:SetText("X")
		closeButton.Paint = function(panel, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))
		end
		closeButton.DoClick = function()
			self:Close()
		end
		
		self:loadActions()
	end
	
	local colors = {
		["Fire"] = Color(200,0,0),
		["Earth"] = Color(210,105,30),
		["Water"] = Color(0,0,200),
		["Lightning"] = Color(200,200,255),
		["Dark"] = Color(0,0,0),
		["Light"] = Color(255,255,255),
		["Universal"] = Color(200,200,200),
		
		["Martial"] = Color(180,180,180),
		
		--special
		["Chaos"] = Color(153,50,204),
		
		--other
		["Arcane"] = Color(128,0,128),
		["Disease"] = Color(173,255,47),
		["Direct"] = Color(255,255,255),
		["Poison"] = Color(0,255,0),
		
		--physical
		["Pierce"] = Color(180,180,180),
		["Slash"] = Color(180,180,180),
		["Crush"] = Color(180,180,180),
		["Siege"] = Color(180,180,180),
	}

	function PANEL:addActionButton(action)
		local categories = self.categories
		local inner = self.inner
	
		local textColor = Color(150,150,150,255)

		local actionData = {}
		if(action.uid) then
			actionData = ACTS.actions[action.uid] or {}
		end
		
		if(actionData.category) then
			if(!categories[actionData.category]) then
				categories[actionData.category] = true
				
				local catLabel = inner:Add("DLabel")
				catLabel:Dock(TOP)
				catLabel:SetTall(50)
				catLabel:DockMargin(8,8,8,8)
				catLabel:SetFont("nutMenuButtonLightFont")
				catLabel:SetText(" " ..actionData.category.. " ")
				
				catLabel.Paint = function(panel, w, h)
					local textSizeX, textSizeY = panel:GetTextSize()

					surface.SetDrawColor(Color(255, 255, 255, 255))
					surface.DrawLine(0, textSizeY, textSizeX, textSizeY)
				end
				
				self.labels[#self.labels+1] = catLabel
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
		
		if(actionData.weaponMult) then
			desc = desc.. "\nWeapon Damage Multiplier: " ..actionData.weaponMult.. "x."
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
	
		local button = inner:Add("DButton")
		button:Dock(TOP)
		button:DockMargin(2,2,2,2)
		
		button:SetFont("nutSmallFont")

		button:SetTextColor(textColor)
		button:SetText(action.name or actionData.name or "Unnamed Action")
		button:SetToolTip(desc)
		button.DoClick = function(panel)
			self:actionPress(panel)
		end
		button.Paint = function(panel, w, h)
			surface.SetDrawColor(Color(0, 0, 0, 220))
			surface.DrawRect(0, 0, w, h)
		end
		
		self.buttons[#self.buttons + 1] = button
	end
	
	--loads all the actions and category headers
	function PANEL:loadActions()
		--clears existing actions (so we can reload them)
		self.categories = {}
		self.buttons = {}
		self.inner:Clear()
	
		timer.Simple(0, function()
			--load default actions
			for k, action in pairs(self.actions) do
				if(action.category == "Default") then 
					self:addActionButton(action)
				end
			end
		
			--loads nondefault actions
			for k, action in SortedPairsByMemberValue(self.actions or {}, "category" or "") do
				if(action.category == "Default") then continue end
				
				self:addActionButton(action)
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
		end
	end
	
	function PANEL:OnRemove()
		if (IsValid(nut.gui.actionE)) then
			nut.gui.actionE:Remove()
		end
	end
	
	function PANEL:OnKeyCodePressed(key)
		if(key == KEY_R) then
			self:Remove()
		end
	end
vgui.Register("nutActionList", PANEL, "DFrame")

local PANEL = {}
	surface.CreateFont("nutWeaponListHeader", {
		font = "Type-Ra",
		size = ScreenScale(10),
		extended = true,
		weight = 200
	})

	function PANEL:Init()
		if (IsValid(nut.gui.actionE)) then
			nut.gui.actionE:Remove()
		end
		
		nut.gui.actionE = self
		
		self:SetSize(350, 400)
		self:Center()
		self:SetTitle("")
		--self:MakePopup()
		self:ShowCloseButton(false)
		
		self.Paint = function(panel, w, h)
			--background image
			surface.SetDrawColor(Color(40, 40, 40, 255))
			surface.DrawRect(0, 0, w, h)

			local header = "Equipment"
			surface.SetFont("nutWeaponListHeader")
			local sizeX, sizeY = surface.GetTextSize(header)

			surface.SetTextColor(255, 255, 255, 255 )
			surface.SetTextPos(w*0.5-sizeX*0.5, 4)
			surface.DrawText(header)
		end
		
		self.buttons = {}
		
		local inner = vgui.Create("DScrollPanel", self)
		inner:DockMargin(0, 16, 0, 0)
		inner:Dock(FILL)
		--inner:SetVerticalScrollbarEnabled(false)
		local vBar = inner:GetVBar()
		function vBar:Paint(w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 100))
		end
		function vBar.btnUp:Paint(w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))
		end
		function vBar.btnDown:Paint(w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))
		end
		function vBar.btnGrip:Paint(w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))
		end

		local function addEquipButton(item)
			local client = LocalPlayer()
		
			local textColor = Color(150,150,150,255)

			local name = item:getName() or item.name or "Unnamed Item"
			local desc = item:getDesc() or item.desc
		
			local button = inner:Add("DButton")
			button:Dock(TOP)
			button:DockMargin(2,2,2,2)
			
			button.item = item
			button.itemID = item.id
			button.invID = client:getChar():getInv():getID()
			
			button:SetFont("nutSmallFont")
			
			if(item:getData("equip")) then
				textColor = Color(100,100,200,255)
			else
				textColor = Color(255,255,255,255)
			end
			
			button:SetTextColor(textColor)
			button:SetText(name)
			button:SetToolTip(desc)
			button.DoClick = function()
				self:actionPress(button)
			end
			button.Paint = function(panel, w, h)
				surface.SetDrawColor(Color(0, 0, 0, 220))
				surface.DrawRect(0, 0, w, h)
			end
			
			self.buttons[#self.buttons + 1] = button	
		end		
		
		timer.Simple(0, function()
			local char = LocalPlayer():getChar()
			local inventory = char:getInv()
			for k, item in pairs(inventory:getItems() or {}) do
				--show equipment in this panel
				if(item.base == "base_equipment") then
					addEquipButton(item)
				end
			end
		end)	
	end
	
	function PANEL:actionPress(button)
		local item = button.item
		
		if(item) then
			if(item:getData("equip")) then
				netstream.Start("invAct", "EquipUn", button.itemID, button.invID)
			else
				netstream.Start("invAct", "Equip", button.itemID, button.invID)
			end
			
			--updates the text color if it has changed state
			timer.Simple(0, function()
				--reload actions on action list in case equipment makes any changes
				if(IsValid(nut.gui.actionL)) then
					nut.gui.actionL:loadActions()
				end
			
				if(item:getData("equip")) then
					button:SetTextColor(Color(100,100,200,255))
				else
					button:SetTextColor(Color(255,255,255,255))
				end
			end)
		end
	end
vgui.Register("nutWeaponList", PANEL, "DFrame")