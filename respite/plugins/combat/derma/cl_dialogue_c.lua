local PLUGIN = PLUGIN

surface.CreateFont( "Nut_NPCChatName",
{
	font = "Trebuchet MS",
	size = ScreenScale( 8 ),
	weight = 1000,
})

surface.CreateFont( "Nut_NPCChatSel",
{
	font = "Trebuchet MS",
	size = ScreenScale( 6 ),
	weight = 1000,
})

surface.CreateFont( "Nut_NPCChatText",
{
	font = "Tahoma",
	size = ScreenScale( 6 ),
	weight = 500,
})

local color_red = Color(255,0,0)
local color_white = Color(255,255,255)
local color_black = Color(0,0,0)


--[[
PLUGIN.defaultQuest = {
	npc = {
		["_start"] = ""
	},
	player = {
		["_quit"] = "Goodbye."
	},
}
--]]

if CLIENT then
	local PANEL = {}
	function PANEL:Init()
		local sh = ScrH()/1.5
		self:SetTitle( "Dialogue" )
		self:SetSize( sh*.8, sh )
		self.content = vgui.Create( "Panel", self )
		self.content:Dock( FILL )
		self.btnlist = {}
		self:MakePopup()
		self:Center()
		self.text = self.content:Add( "DPanel" )
		self.text:SetPos( 0, 0 )
		self.text:SetSize( self.content:GetWide(), self.content:GetTall()*.8 - 5 )
		self.dialouge = vgui.Create( "DScrollPanel", self.text )
		self.dialouge:DockMargin(10, 10, 10, 10)
		self.dialouge:Dock( FILL )
		self.dialouge.Paint = function() end
		self.select = self.content:Add( "DPanel" )
		self.select:SetPos( 0, self.content:GetTall()*.8 )
		self.select:SetSize( self.content:GetWide(), self.content:GetTall()*.2 )
		self.sdialouge = vgui.Create( "DScrollPanel", self.select )
		self.sdialouge:DockMargin(3, 3, 3, 3)
		self.sdialouge:Dock( FILL )
		self.sdialouge.Paint = function() end
	end
	
	function PANEL:SetEntity(ent)
		self.name = ent:Name()
		self.entity = ent
		self.dialogue = ent:getNetVar( "dialogue", PLUGIN.defaultDialogue )
		self:AddChat( self.name, self.dialogue.npc._start )
		self:AddSelection( self.dialogue.player )
	end
	
	function PANEL:AddSelection( tbl )	
		for k, v in pairs( tbl ) do
			local btn = self.sdialouge:Add( "DButton" )
			btn:SetFont( "Nut_NPCChatSel" )
			btn:SetTextColor( color_white )
			btn:SetText(v )
			btn:DockMargin(0, 0, 0, 0)
			btn:Dock(TOP)
			btn.DoClick = function()
				if k == "_quit" then self:Close() return end
				if self.talking then return end
				local dat = self.dialogue.npc[ k ]
				self:AddChat( LocalPlayer():Name(), v )
				self.talking = true
				if !( string.Left( k, 1 ) == "!" ) then
					timer.Simple( math.Rand( PLUGIN.chatDelay.min, PLUGIN.chatDelay.max ), function()
						if self:IsValid() then
							self.talking = false
							self:AddChat( self.name, self.dialogue.npc[k] )
						end
					end)
				else
					-- special dialogue hook.
					netstream.Start("nut_DialogueMessage", {name = self.name, request = k})
					
					self.talking = true
				end
			end
		end
	end
	
	function PANEL:AddName( str )
		local lab = self.dialouge:Add( "DLabel" )
		lab:SetFont( "Nut_NPCChatName" )
		lab:SetTextColor( color_white )
		lab:SetText(str )
		lab:SizeToContents()
		lab:DockMargin(3, 3, 3, 0)
		lab:Dock(TOP)
	end
	
	function PANEL:AddText( str )
		local lab = self.dialouge:Add( "DLabel" )
		lab:SetTextColor( color_white )
		lab:SetFont( "Nut_NPCChatText" )
		lab:SetText( str )
		lab:SetWrap( true )
		lab:DockMargin(10, 0, 3, 5)
		lab:Dock(TOP)
		lab:SetAutoStretchVertical( true )
	end
	
	function PANEL:AddCustomText( str, font, color )
		local lab = self.dialouge:Add( "DLabel" )
		lab:SetTextColor( color or color_white )
		lab:SetFont( font or "Nut_NPCChatText" )
		lab:SetText( str )
		lab:SetWrap( true )
		lab:DockMargin(10, 0, 3, 5)
		lab:Dock(TOP)
		lab:SetAutoStretchVertical( true )
	end
	
	function PANEL:AddChat( str1, str2 )
		self:AddName( str1 )
		self:AddText( str2 )
	end
	
	vgui.Register( "Nut_CDialogue", PANEL, "DFrame" )
end

local PANEL = {}

function PANEL:Init()
	self:MakePopup()
	--self:Center()
	local sh = ScrH()/1.5
	self:SetTitle( "Dialogue" )
	self:SetSize( sh*.8, sh )
	self:SetPos( 0, (ScrH()-sh)/2)
	--print( self:GetPos() )
	self.content = vgui.Create( "DPanel", self )
	self.content:Dock( FILL )
	self.btnlist = {}
	
	self.scroll = self.content:Add( "DScrollPanel" )
	self.scroll:Dock( FILL )
end

function PANEL:SetEntity( entity )
	self.entity = entity

	local dialogue = entity:getNetVar( "dialogue", PLUGIN.defaultDialogue )
	local info = self.scroll:Add("DLabel")
	info:SetText("Left Click: Set UID, Right Click: Set Dialogue")
	info:DockMargin(3, 3, 3, 3)
	info:Dock(TOP)
	info:SetTextColor(color_white)
	info:SetFont("Default")
	info:SizeToContents()
	
	--- NPC dialogue
	local npcd = self.scroll:Add("DLabel")
	npcd:SetText("NPC Dialogues")
	npcd:DockMargin(3, 3, 3, 3)
	npcd:Dock(TOP)
	npcd:SetTextColor(color_white)
	--npcd:SetFont("nut_ScoreTeamFont")
	npcd:SizeToContents()
	self.npcd = self.scroll:Add( "DListView" )
	self.npcd:SetPos( 0, 0 )
	self.npcd:SetSize( self.content:GetWide(), self.content:GetTall() )
	self.npcd:AddColumn("Unique ID")
	self.npcd:AddColumn("Dialogue")
	self.npcd.OnClickLine = function( p, l, s )				
		local menu = DermaMenu()
		menu:AddOption( "Write Unique ID", function()
			if l.uid == "_start" then return end
			Derma_StringRequest( "Write Unique ID", "Write Unique ID what you want to assign", l.uid, function( text )
				l:SetValue(1,  text or l.uid)
				l.uid = text
			end )
		end):SetImage("icon16/textfield_key.png")
		menu:AddOption( "Write Dialogue", function()
			Derma_StringRequest( "Write Dialogue", "Write Dialogue what you want to assign", l.text, function( text )
				l:SetValue(2,  text or l.text)
				l.text = text
			end )
		end):SetImage("icon16/textfield_rename.png")
		menu:AddOption( "Delete Line", function()
			if l.uid == "_start" then return end
			l:Remove()
			self.npcd.l = nil
		end):SetImage("icon16/textfield_delete.png")
		menu:AddOption( "Add New Line", function()	
			local line = self.npcd:AddLine( "uniqueid", "Sample Dialogue.")
		end):SetImage("icon16/textfield_add.png")
		menu:Open()
	end
	self.npcd:Dock( TOP )
	self.npcd:SetTall( 150 )
	
	--- Player dialogue
	local playerd = self.scroll:Add("DLabel")
	playerd:SetText("Player Dialogues")
	playerd:DockMargin(3, 3, 3, 3)
	playerd:Dock(TOP)
	playerd:SetTextColor(color_white)
	--playerd:SetFont("nut_ScoreTeamFont")
	playerd:SizeToContents()
	self.plyd = self.scroll:Add( "DListView" )
	self.plyd:SetPos( 0, 0 )
	self.plyd:SetSize( self.content:GetWide(), self.content:GetTall() )
	self.plyd:AddColumn("Unique ID")
	self.plyd:AddColumn("Dialogue")
	self.plyd.OnClickLine = function( p, l, s )
		local menu = DermaMenu()
		menu:AddOption( "Write Unique ID", function()
			if l.uid == "_quit" then return end
			Derma_StringRequest( "Write Unique ID", "Write Unique ID what you want to assign", l.uid, function( text )
				l:SetValue(1,  text or l.uid)
				l.uid = text
			end )
		end):SetImage("icon16/textfield_key.png")
		menu:AddOption( "Write Dialogue", function()
			Derma_StringRequest( "Write Dialogue", "Write Dialouge what you want to assign", l.text, function( text )
				l:SetValue(2,  text or l.text)
				l.text = text
			end )
		end):SetImage("icon16/textfield_rename.png")
		menu:AddOption( "Delete Line", function()
			if l.uid == "_quit" then return end
			l:Remove()
			self.plyd.l = nil
		end):SetImage("icon16/textfield_delete.png")
		menu:AddOption( "Add New Line", function()	
			local line = self.plyd:AddLine( "uniqueid", "Sample Dialogue.")
		end):SetImage("icon16/textfield_add.png")
		menu:Open()
	end
	self.plyd:Dock( TOP )
	self.plyd:SetTall( 150 )
	
	for k, v in pairs( dialogue.npc ) do
		local line = self.npcd:AddLine( k, v )
		line.text = v
		line.uid = k 
	end
	
	for k, v in pairs( dialogue.player ) do
		local line = self.plyd:AddLine( k, v )
		line.text = v
		line.uid = k
	end
	
	-- Save button.
	self.save = self:Add("DButton")
	self.save:Dock(BOTTOM)
	self.save:DockMargin(0, 5, 0, 0)
	self.save:SetText("Save")
	self.save.DoClick = function()
		self:TalkerSave()
	end
end

function PANEL:TalkerSave()
	local entity = self.entity

	if (IsValid(entity) and (self.nextSend or 0) < CurTime()) then
		self.nextSend = CurTime() + 1
		local dialogue = {
			npc = {},
			player = {},
		}
		
		for k, v in pairs(self.npcd:GetLines()) do
			if v:IsValid() then
				dialogue.npc[v.uid] = v.text
			end
		end
		
		for k, v in pairs(self.plyd:GetLines()) do
			if v:IsValid() then
				dialogue.player[v.uid] = v.text
			end
		end
		
		netstream.Start("nut_CDialogueData", {entity, dialogue})
		self:Close()
	end
end

vgui.Register( "Nut_CDialogueEditor", PANEL, "DFrame" )