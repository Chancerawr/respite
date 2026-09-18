local PLUGIN = PLUGIN

local PANEL = {}

AccessorFunc(PANEL, "m_bHangOpen", "HangOpen")

function PANEL:Init()
	--
	-- This makes it so that when you're hovering over this panel
	-- you can `click` on the world. Your viewmodel will aim etc.
	--
	self:SetWorldClicker(true) --doenst scale with calcview so might need to do it differently

	self.m_bHangOpen = false

	self:Dock(FILL)
end

function PANEL:Open()
	self:SetHangOpen( false )

	-- If the spawn menu is open, try to close it..
	if ( IsValid( g_SpawnMenu ) && g_SpawnMenu:IsVisible() ) then
		g_SpawnMenu:Close( true )
	end

	if ( self:IsVisible() ) then return end

	CloseDermaMenus()

	self:MakePopup()
	self:SetVisible(true)
	self:SetKeyboardInputEnabled(false)
	self:SetMouseInputEnabled(true)

	RestoreCursorPosition()

	self:InvalidateLayout(true)
end

function PANEL:Close( bSkipAnim )
	if (self:GetHangOpen()) then
		self:SetHangOpen( false )
		return
	end

	RememberCursorPosition()

	CloseDermaMenus()

	self:SetKeyboardInputEnabled(false)
	self:SetMouseInputEnabled(false)

	self:SetAlpha(255)
	self:SetVisible(false)
	self:RestoreControlPanel()
end

function PANEL:PerformLayout()
	if ( IsValid( spawnmenu.ActiveControlPanel() ) ) then
		spawnmenu.ActiveControlPanel():InvalidateLayout( true )

		local Tall = math.min( spawnmenu.ActiveControlPanel():GetTall() + 10, ScrH() * 0.8 )
		--if ( self.Canvas:GetTall() != Tall ) then self.Canvas:SetTall( Tall ) end
		--if ( self.Canvas:GetWide() != 320 ) then self.Canvas:SetWide( 320 ) end

		--self.Canvas:SetPos( ScrW() - self.Canvas:GetWide() - 50, ScrH() - 50 - Tall )
		--self.Canvas:InvalidateLayout( true )
	end
end

function PANEL:StartKeyFocus( pPanel )
	self:SetKeyboardInputEnabled( true )
	self:SetHangOpen(true)
end

function PANEL:EndKeyFocus( pPanel )
	self:SetKeyboardInputEnabled( false )
end

function PANEL:RestoreControlPanel()
	-- Restore the active panel
	if (!spawnmenu.ActiveControlPanel()) then return end
	if (!self.OldParent) then return end

	spawnmenu.ActiveControlPanel():SetParent(self.OldParent)
	spawnmenu.ActiveControlPanel():SetPos(self.OldPosX, self.OldPosY)

	self.OldParent = nil
end

function PANEL:Paint(w, h)
	local client = LocalPlayer()
	local alpha = 255
	
	local trace = LocalPlayer():GetEyeTrace()

	local entity = trace.Entity
	local selectedEnt = client.ccSelect

	local info
	if (entity and (entity.combat or entity:IsPlayer())) then
		info = entity:Name()
		
		--messages for control instructions
		if(IsValid(selectedEnt) and entity.actions) then
			--local action = selectedEnt.actions[selectedEnt.actCur or 1].name
		
			--nut.util.drawText("M1 to " ..action.. " " ..entity:Name().. ".", ScrW() * 0.5, ScrH() * 0.3 + 16, ColorAlpha(Color(255,50,50), alpha), 1, 1, "nutChatFontCombat", alpha * 1)
		end
		
		if(PLUGIN:isSelectable(client, entity)) then
			nut.util.drawText("M2 to select.", ScrW() * 0.5, ScrH() * 0.3 + 32, ColorAlpha(Color(255,50,50), alpha), 1, 1, "nutChatFontCombat", alpha * 1)
		end
	elseif(trace.HitPos) then
		if(IsValid(selectedEnt)) then
			local selected = selectedEnt:Name()
		
			if(selectedEnt.casting) then
				local action = selectedEnt.actions[selectedEnt.actCur or 1].name
			
				nut.util.drawText("M1 to " ..action.. " ground.", ScrW() * 0.5, ScrH() * 0.3 + 16, ColorAlpha(Color(255,50,50), alpha), 1, 1, "nutChatFontCombat", alpha * 1)
			else
				nut.util.drawText("M1 to move.", ScrW() * 0.5, ScrH() * 0.3 + 16, ColorAlpha(Color(255,50,50), alpha), 1, 1, "nutChatFontCombat", alpha * 1)
			end
			
			nut.util.drawText("M2 to deselect.", ScrW() * 0.5, ScrH() * 0.3 + 32, ColorAlpha(Color(255,50,50), alpha), 1, 1, "nutChatFontCombat", alpha * 1)
		end
	end

	if(info) then
		nut.util.drawText(info, ScrW() * 0.5, ScrH() * 0.3, ColorAlpha(Color(255,50,50), alpha), 1, 1, "nutChatFontCombat", alpha * 1)
	end
end

--
-- Note here: EditablePanel is important! Child panels won't be able to get
-- keyboard input if it's a DPanel or a Panel. You need to either have an EditablePanel
-- or a DFrame (which is derived from EditablePanel) as your first panel attached to the system.
--
vgui.Register( "ContextCombat", PANEL, "EditablePanel" )

function PLUGIN:CreateContextCombat()
	--if ( !hook.Run( "ContextMenuEnabled" ) ) then return end

	if (IsValid(nut.gui.cc)) then
		PLUGIN:CloseCombatContext()
	end
	
	local client = LocalPlayer()
	
	gui.EnableScreenClicker(true)

	nut.gui.cc = vgui.Create("ContextCombat")

	if (!IsValid(nut.gui.cc)) then return end

	nut.gui.cc.OnMousePressed = function(panel, code)
		local trace = LocalPlayer():GetEyeTrace()
	
		local entity = trace.Entity
		local selectedEnt = client.ccSelect
		
		if(code == MOUSE_LEFT and IsValid(selectedEnt)) then --left click does actions or moves
			if(selectedEnt) then
				if(selectedEnt.casting) then --for casting on the ground and stuff like that
					hook.Run("ccAction", panel, selectedEnt, entity, trace.HitPos)
					
					selectedEnt.casting = nil
					netstream.Start("ccActionSelect", selectedEnt, 1)
				elseif(entity.combat) then
					hook.Run("ccAction", panel, selectedEnt, entity, trace.HitPos)
				else
					hook.Run("ccMove", panel, selectedEnt, trace.HitPos)
				end
			end
		end		
		
		if(code == MOUSE_RIGHT and PLUGIN:isSelectable(client, entity)) then --select
			hook.Run("ccSelect", panel, entity, trace, client.ccSelect)
		
			client.ccSelect = entity
			
			nut.util.notify("You have selected " ..entity:Name().. ".")
		elseif(code == MOUSE_RIGHT) then --deselect
			client.ccSelect = nil
		end
		
		--hook.Run("GUIMousePressed", code, gui.ScreenToVector(gui.MousePos()))
	end
	
	nut.gui.cc.OnMouseReleased = function(panel, code)
		--hook.Run("GUIMouseReleased", code, gui.ScreenToVector(gui.MousePos()))
	end
end

function PLUGIN:CloseCombatContext()
	if(LocalPlayer():IsWorldClicking()) then
		gui.EnableScreenClicker(false)
	end

	nut.gui.cc:Remove()
end

netstream.Hook("nut_ContextCombat", function()
	PLUGIN:CreateContextCombat()
end)

--clientside
function PLUGIN:PlayerBindPress(client, bind, pressed)
	if(IsValid(nut.gui.cc)) then
		bind = bind:lower()
		
		if ((bind:find("+menu")) and pressed) then --q menu
			gui.EnableScreenClicker(false) --escape from clicky clicky
			PLUGIN:CloseCombatContext()
		end
		
		if(bind:find("reload")) then
			if(IsValid(client.ccSelect)) then
				PLUGIN:ccActionSelect(panel, client.ccSelect)
			end
		end
	end
end

--[[
function GM:OnContextMenuOpen()
	-- Let the gamemode decide whether we should open or not..
	if ( !hook.Call( "ContextMenuOpen", self ) ) then return end

	if ( IsValid( g_ContextMenu ) && !g_ContextMenu:IsVisible() ) then
		g_ContextMenu:Open()
		menubar.ParentTo( g_ContextMenu )
	end

	hook.Call( "ContextMenuOpened", self )
end
--]]

--[[
function GM:OnContextMenuClose()
	if ( IsValid( g_ContextMenu ) ) then g_ContextMenu:Close() end
	hook.Call( "ContextMenuClosed", self )
end
--]]

--[[
local PANEL = {}
	function PANEL:Init()
		if (IsValid(nut.gui.combatHUD)) then
			nut.gui.combatHUD:Remove()
		end
		
		nut.gui.combatHUD = self
	end
vgui.Register("nutCombatHUD", PANEL, "DFrame")
--]]