local PLUGIN = PLUGIN

local PANEL = {}
	function PANEL:Init()
		if (IsValid(nut.gui.turnList)) then
			nut.gui.turnList:Remove()
		end
		
		--for scaling sizes of things based on resolution
		local scrModX, scrModY = ScrW()/1920, ScrH()/1080
		
		nut.gui.turnList = self
		
		local sizeX = 450*scrModX
		local sizeY = 600*scrModY
		
		self:SetSize(sizeX, sizeY)
		self:Center()
		self:SetTitle("Turns")
		self:MakePopup()
		self:ShowCloseButton(true)

		self.elements = {}

		self.Paint = function(panel, w, h)
			--background image
			surface.SetDrawColor(Color(40, 40, 40, 255))
			surface.DrawRect(0, 0, w, h)
		end
		
		self:Refresh()
	end
	
	--clears all of the buttons and stuff so we can refresh them
	function PANEL:ClearElements()
		for k, v in pairs(self.elements or {}) do
			if(IsValid(v)) then
				v:Remove()
			end
		end
	end
	
	function PANEL:OnRemove()
		self:ClearElements()

		if(IsValid(self.TeamMenu)) then
			self.TeamMenu:Remove()
		end
		
		if(IsValid(self.TurnListMenu)) then
			self.TurnListMenu:Remove()
		end
		
		if(IsValid(self.AIMenu)) then
			self.AIMenu:Remove()
		end
	end
	
	function PANEL:CreateButton(name, parent, doClick, doRightClick)
		--for scaling sizes of things based on resolution
		local scrModX, scrModY = ScrW()/1920, ScrH()/1080
	
		local buttonY = 30 * scrModY
	
		local button = vgui.Create("DButton", parent)
		button:SetText(name)
		button:SetFont("nutChatFont")
		button:SetTall(buttonY)
		button:Dock(TOP)
		button:DockMargin(0,0,0,4)
		
		button:SetTextColor(Color(255,255,255,255))
		
		button.Paint = function(panel, w, h)
			surface.SetDrawColor(Color(0, 0, 0, 220))
			surface.DrawRect(0, 0, w, h)
		end
		
		if(doClick) then
			button.DoClick = doClick
		end
		
		if(doRightClick) then
			button.DoRightClick = doRightClick
		end
		
		table.insert(self.elements, button)
	end
	
	function PANEL:TurnOrder(id)
		local client = LocalPlayer()
	
		--for scaling sizes of things based on resolution
		local scrModX, scrModY = ScrW()/1920, ScrH()/1080
	
		local scroll = self.scroll
	
		local data = PLUGIN.turns[id]
		if(data) then
			--panel showing the controllers of this turn based thing
			local turnSwep = client:GetWeapon("nut_turnswep")
			if(IsValid(turnSwep)) then
				turnSwep.turnID = id
			
				local height = 60
			
				local subPanel = scroll:Add("DPanel")
				subPanel:Dock(TOP)
				subPanel:DockMargin(0,0,0,4)

				--category header here
				local header = subPanel:Add("DLabel")
				header:SetText("CONTROLLERS")
				header:SetFont("nutChatFont")
				header:Dock(TOP)
				
				--leave/join buttons for controllers
				local controllers = PLUGIN:turnGetController(id)
				if(!controllers[client]) then
					self:CreateButton("Join Controllers", subPanel, function(this)
						netstream.Start("nut_turnControlJoin", id, client, teamID)
					end)
				else
					self:CreateButton("Leave Controllers", subPanel, function(this)
						netstream.Start("nut_turnControlLeave", id, client, teamID)
					end)
				end

				for entity, _ in pairs(controllers) do
					if(IsValid(entity)) then
						height = height + 34
					
						self:CreateButton(entity:Name(), subPanel, function(this)
							self:Refresh()
						end)
					end
				end

				height = height * scrModY
				
				subPanel:SetTall(height)
			end

			for teamID, teamName in pairs(data.order) do
				local entities = data.entities or {}
			
				local height = 60
			
				local subPanel = scroll:Add("DPanel")
				subPanel:Dock(TOP)
				subPanel:DockMargin(0,0,0,4)
			
				--team name header
				local header = subPanel:Add("DLabel")
				header:SetText(teamName)
				header:SetFont("nutChatFont")
				header:DockMargin(4,0,0,2)
				header:Dock(TOP)
				
				--team name header
				local AIButton = subPanel:Add("DButton")
				AIButton:SetText("AI")
				AIButton:SetFont("nutChatFont")
				AIButton:DockMargin(4,0,0,2)
				AIButton:SetWide(30)
				AIButton:Dock(RIGHT)
				AIButton.DoClick = function(this)
					self:AIPopup(entities, this, teamID)
				end

				--leave/join buttons for teams
				if(client:getTurnTeam() != teamID) then
					self:CreateButton("Join " ..teamName, subPanel, function(this)
						netstream.Start("nut_turnJoin", id, client, teamID)
					end)
				else
					self:CreateButton("Leave " ..teamName, subPanel, function(this)
						netstream.Start("nut_turnLeave", id, client, teamID)
					end)
				end

				for entity, team in pairs(entities) do
					if(!IsValid(entity)) then continue end
					if(teamID != team) then continue end
					
					--increase height of panel by how many buttons there are
					height = height + 34
					
					local name = (PLUGIN:canSeeEntityName(client, id) and entity:Name()) or "Anonymous"
					
					local AI
					local currentAI = entity:getNetVar("TurnAI")
					if(currentAI) then
						AI = PLUGIN.AITree[currentAI].name
					end
					
					if(AI and AI != "None") then
						name = name.. "[" ..AI.. "]"
					end
					
					self:CreateButton(name, subPanel, function(this) --left click
						if(!entity.combat) then return end
						--only CEnts for now
						
						self:AIPopup(entity, this)
					end, function(this) --right click
						netstream.Start("nut_turnLeave", id, entity, teamID)
					end)
				end
				
				height = height * scrModY
				
				subPanel:SetTall(height)
			end
		end
	end
	
	function PANEL:TurnList()
		local client = LocalPlayer()
	
		--for scaling sizes of things based on resolution
		local scrModX, scrModY = ScrW()/1920, ScrH()/1080
	
		local scroll = self.scroll

		for turnID, data in pairs(PLUGIN.turns or {}) do
			self:CreateButton(data.name or "Unnamed Turn Table", scroll, function(this)
				self.turnID = turnID
				self:Refresh()
			end)
		end
	end
	
	function PANEL:AIPopup(entity, button, teamID)
		if(IsValid(self.AIMenu)) then
			self.AIMenu:Remove()
		end
	
		--side panel
		local menu = vgui.Create("DFrame", self)
		menu:SetSize(200, 200)
		menu:SetTitle("")
		menu:MakePopup()
		menu:Center()
		menu:MoveLeftOf(self, 50)
		menu:ShowCloseButton(true)
		
		self.AIMenu = menu
		
		table.insert(self.elements, menu)
		
		local scroll = vgui.Create("DScrollPanel", menu)
		scroll:Dock(FILL)

		local name = "None"
		
		local selection = vgui.Create("DComboBox", scroll)
		
		selection:Dock(TOP)

		for k, v in pairs(PLUGIN.AITree) do
			selection:AddChoice(v.name, k)
		end
		
		if(!istable(entity)) then
			local currentAI = entity:getNetVar("TurnAI")
			if(currentAI) then
				name = PLUGIN.AITree[currentAI].name
			end

			selection:SetValue(name)
		end
		
		selection.OnSelect = function(this, data, name, id)
			if(istable(entity)) then
				local send = {}
				for k, v in pairs(entity) do
					if(v == teamID) then
						send[#send+1] = k
					end
				end
				
				entity = send
			end
		
			netstream.Start("nut_turnAISet", entity, id)
			
			self:Refresh()
		end
		
		local check = vgui.Create("DCheckBoxLabel", scroll)
		check:SetText("Death on 0 HP")
		check:Dock(TOP)
		check:SetChecked(false)
		
		if(!istable(entity)) then
			local auto = entity:getNetVar("autodeath")
			if(auto) then
				check:SetChecked(auto)
			end
		end

		check.OnChange = function(this, state)
			if(istable(entity)) then
				local send = {}
				for k, v in pairs(entity) do
					if(v == teamID) then
						send[#send+1] = k
					end
				end
				
				entity = send
			end
		
			netstream.Start("nut_turnDeathSet", entity, state)
		end
	end
	
	function PANEL:Refresh()
		self:ClearElements()
		
		--scorll panel that holds most of the things
		local scroll = vgui.Create("DScrollPanel", self)
		scroll:Dock(FILL)
		
		self.scroll = scroll

		local vBar = scroll:GetVBar()
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
		
		table.insert(self.elements, scroll)
		
		local turnID = self.turnID

		if(turnID) then
			self:TurnOrder(turnID)
		else
			self:TurnList()
		end
		
		--side panel
		local side = vgui.Create("DFrame", self)
		side:SetSize(200, 300)
		side:Center()
		side:SetTitle("")
		side:MakePopup()
		side:ShowCloseButton(true)
		side:MoveRightOf(self, 50)
		
		table.insert(self.elements, side)
		
		local scroll2 = vgui.Create("DScrollPanel", side)
		scroll2:Dock(FILL)

		if(turnID) then
			self:CreateButton("Back to List", scroll2, function(this)
				self.turnID = nil
				self:Refresh()
			end)
			
			self:CreateButton("Play Song", scroll2, function(this)
				local targets = {}
				
				local entities = PLUGIN.turns[turnID].entities or {}
				for k, v in pairs(entities) do 
					if(IsValid(k) and k:IsPlayer()) then 
						targets[#targets + 1] = k
					end
				end
				
				local controllers = PLUGIN.turns[turnID].controllers or {}
				for k, v in pairs(controllers) do 
					if(IsValid(k) and k:IsPlayer()) then 
						targets[#targets + 1] = k
					end
				end
				
				Derma_StringRequest("URL", "URL", "", function(text)
					netstream.Start("turn_mediaPlay", targets, text)
				end)
			end)
			
			self:CreateButton("Clear All", scroll2, function(this)
				Derma_Query("Clear Turn List?", "Confirm", "Yes", function()
					netstream.Start("nut_turnClear", turnID)
				end, "No")
			end)
			
			self:CreateButton("Add Team", scroll2, function(this)
				Derma_StringRequest("Team Name", "Adding Team", "", function(text)
					local data = {}
					
					local turnOrder = PLUGIN.turns[turnID]
					local order = turnOrder.order or {}
					
					order[#order+1] = text
					
					data.order = order
				
					self:UpdateTurn(turnID, data)
				end)
			end)

			self:CreateButton("Add Players", scroll2, function(this)
				self:TeamPopup()
			end)
			
			self:CreateButton("Reset Cooldowns", scroll2, function(this)
				netstream.Start("nut_turnCDReset", turnID)
			end)
			
			self:CreateButton("Next Turn", scroll2, function(this)
				netstream.Start("nut_turnNext", turnID)
			end)
		else
			self:CreateButton("New Turn Table", scroll2, function(this)
				self:TurnListPopup()
			end)
		end
	end
	
	function PANEL:TeamPopup(entities)
		if(IsValid(self.TeamMenu)) then
			self.TeamMenu:Remove()
		end
	
		local frame = vgui.Create("DFrame")
		frame:SetSize(400, 600)
		frame:Center()
		frame:SetTitle("Player List")
		frame:MakePopup()
		frame:ShowCloseButton(true)
		
		self.TeamMenu = frame
		
		local scroll = vgui.Create("DScrollPanel", frame)
		scroll:Dock(FILL)
		
		local turnData = PLUGIN.turns[self.turnID]

		for k, client in pairs(player.GetAll()) do
			local teamID = client:getTurnTeam() or 0
		
			local team = turnData.order[teamID]
		
			local button = vgui.Create("DButton", scroll)
			button:SetText(client:Name().. " " ..(team or "Unassigned"))
			button:Dock(TOP)
			button:DockMargin(2,2,2,2)
			
			button:SetFont("nutSmallFont")
			button:SetTextColor(Color(255,255,255,255))
			
			button.Paint = function(panel, w, h)
				surface.SetDrawColor(Color(0, 0, 0, 255))
				surface.DrawRect(0, 0, w, h)
			end
			
			button.DoClick = function(this)
				teamID = teamID + 1
				if(teamID > #turnData.order) then
					teamID = 0
				end
			
				if(teamID > 0) then
					netstream.Start("nut_turnJoin", self.turnID, client, teamID)
				else
					netstream.Start("nut_turnLeave", self.turnID, client)
				end
				
				team = turnData.order[teamID]
				this:SetText(client:Name().. " " ..(team or "Unassigned"))
			end	
		end
	end
	
	function PANEL:TurnListPopup()
		if(IsValid(self.TurnListMenu)) then
			self.TurnListMenu:Remove()
		end
	
		local frame = vgui.Create("DFrame")
		frame:SetSize(400, 600)
		frame:Center()
		frame:SetTitle("New Turn List")
		frame:MakePopup()
		frame:ShowCloseButton(true)
		
		self.TurnListMenu = frame
		
		local scroll = vgui.Create("DScrollPanel", frame)
		scroll:Dock(FILL)
		
		local turnNameL = scroll:Add("DLabel")
		turnNameL:Dock(TOP)
		turnNameL:SetTall(30)
		turnNameL:SetText("Turn List Name")
		
		local turnName = scroll:Add("DTextEntry")
		turnName:Dock(TOP)
		turnName:SetTall(30)
		turnName:SetText("")
		
		local turnListTeamL = scroll:Add("DLabel")
		turnListTeamL:Dock(TOP)
		turnListTeamL:SetTall(30)
		turnListTeamL:SetText("Teams")
		
		local turnTeam = scroll:Add("DPanel")
		turnTeam:Dock(TOP)
		turnTeam:SetTall(400)
		
		frame.teams = {}
		
		local teamButton = turnTeam:Add("DButton")
		teamButton:Dock(TOP)
		teamButton:SetText("Add Team")
		teamButton:SetTextColor(Color(255,255,255))
		teamButton.DoClick = function(this)
			Derma_StringRequest("New Team", "Set Team Name", "Enemy", function(text)
				if(text) then
					local newTeam = turnTeam:Add("DButton")
					newTeam:SetText(text)
					newTeam:SetTextColor(Color(255,255,255))
					newTeam:Dock(TOP)
					newTeam.DoClick = function(this)
						this:Remove()
						
						table.RemoveByValue(frame.teams, newTeam)
					end
					
					table.insert(frame.teams, newTeam)
				end
			end)
		end
		
		local doneButton = scroll:Add("DButton")
		doneButton:Dock(BOTTOM)
		doneButton:SetText("Done")
		doneButton:SetTextColor(Color(255,255,255))
		doneButton.DoClick = function(this)
			local data = {}
			
			data.name = turnName:GetText()
			
			data.order = {}
			
			for k, v in pairs(frame.teams) do
				data.order[#data.order+1] = v:GetText()
			end

			local id = #PLUGIN.turns+1

			self:CreateTurn(id, data)
			
			frame:Remove()
		end
	end
	
	function PANEL:CreateTurn(id, data)
		netstream.Start("nut_turnCreate", id, data)
	end
	
	function PANEL:UpdateTurn(id, data)
		local curData = PLUGIN.turns[id]
		
		if(data.order) then
			curData.order = data.order
		end
		
		if(data.name) then
			curData.name = data.name
		end
	
		netstream.Start("nut_turnCreate", id, curData)
	end
vgui.Register("nutTurnList", PANEL, "DFrame")

--context menu
list.Set(
	"DesktopWindows", 
	"CombatTurns",
	{
		title = "CombatTurns",
		icon = "icon16/arrow_refresh.png",
		width = 300,
		height = 170,
		onewindow = true,
		init = function(icon, panel)
			local client = LocalPlayer()

			local button = panel:Add("DButton")
			button:Dock(FILL)
			button:SetText("NEXT TURN")
			
			button.DoClick = function(this)
				local turnID = client:getTurnControlled()

				if(turnID) then
					netstream.Start("nut_turnNext", turnID)
				else
					nut.util.notify("You are not a turn controller")
				end
			end
		end
	}
)