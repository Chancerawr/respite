local PLUGIN = PLUGIN
PLUGIN.name = "Writing Paper"
PLUGIN.author = "Black Tea"
PLUGIN.desc = "Write something on it."

local playerMeta = FindMetaTable("Player")

if SERVER then
	netstream.Hook( "Nut_SubmitNote", function( client, data )
		local text = data[1]
		local ent = data[2]
		local note = ents.GetByIndex( ent )
		if note:IsValid() then
			note:setNetVar( "text", text )
		end
		
		PLUGIN:SavePaper()
		
		nut.log.addRaw(client:Name() .. " wrote " .. data[1])
	end)

	function playerMeta:OpenNote( text, entity, private )
		netstream.Start( self, "Nut_PushNote", {text, entity:EntIndex(), private})
	end
	
	function PLUGIN:LoadData()
		local restored = self:getData()

		if (restored) then
			for k, v in pairs(restored) do
				local position = v.position
				local angles = v.angles
				local private = v.private
				local text = v.text
				local owner = v.owner
				local material = v.material
				local color = v.color

				local entity = ents.Create("nut_paper")
				if(IsValid(entity)) then
					entity:SetPos(position)
					entity:SetAngles(angles)
					entity:Spawn()
					entity:Activate()
					entity:setNetVar("private", private)
					entity:setNetVar("text", text)
					entity:setNetVar("owner", owner)
					
					if(material) then
						entity:SetMaterial(material)
					end
					
					if(color) then
						entity:SetColor(Color(color.r,color.g,color.b))
					end
					
					if(v.frozen != nil) then --freezes the paper if it was frozen before
						entity:GetPhysicsObject():EnableMotion(v.frozen)
					end
				end
			end
		end
	end
	
	function PLUGIN:SaveData()
	end

	function PLUGIN:SavePaper()
		local data = {}

		for k, v in ipairs(ents.FindByClass("nut_paper")) do

			local frozeCheck = v:GetPhysicsObject():IsMotionEnabled() --checks whether the paper is frozen
			
			data[#data + 1] = {
				position = v:GetPos(),
				angles = v:GetAngles(),
				private = v:getNetVar("private"),
				text = v:getNetVar("text"),
				owner = v:getNetVar("owner"),
				frozen = frozeCheck,
				material = v:GetMaterial(),
				color = v:GetColor(),
			}
		end

		self:setData(data)
	end
	
end

if CLIENT then
	function PLUGIN:ShouldDrawTargetEntity(entity)
		if (entity:GetClass() == "nut_paper") then
			return true
		end
	end

	function PLUGIN:DrawTargetID(entity, x, y, alpha)
		if (entity:GetClass() == "nut_paper") then
			local color = Color(255,255,255,255)

			nut.util.drawText(x, y, L"note_name", color)
				y = y + nut.config.targetTall
				local text = L"note_desc"
			nut.util.drawText(x, y, text, Color(255, 255, 255, alpha))
		end
	end
	
	function nut_OpenNote( text, entity, private )
		if note then note:Remove(); note=nil end
		note = vgui.Create("DFrame")
		note:SetSize(ScrW()*0.3, ScrH()*0.7)
		note:Center()
		note:SetTitle("")
		note:ShowCloseButton(false)
		note:MakePopup()
		note.text = text
		note.Paint = function()
			surface.SetDrawColor(245, 245, 245)
			surface.DrawRect( 0, 22, note:GetWide(), note:GetTall() -22-30  ) 
		end
		
		function note:viewmode()
			if note.editor then
			note.text = note.editor:GetValue()
			note.editor:Remove() note.editor = nil end
			note.viewer = vgui.Create( "RichText", note )
			note.viewer:SetPos( 2, 26 )
			note.viewer:SetSize( note:GetWide()-4, note:GetTall()-28-30)
			timer.Simple( 0.05, function()
				note.viewer:SetFontInternal( "nutBigFont" )
				note.viewer:InsertColorChange(0, 0, 0, 255)
				note.viewer:AppendText(note.text)
			end)
		end
		
		function note:editmode()
			if note.viewer then note.viewer:Remove() note.viewer = nil end
			if note.close then note.edited = true; note.close:SetText( L"Submit" ) end
			note.editor = vgui.Create( "DTextEntry", note )
			note.editor:SetPos( 2, 26 )
			note.editor:SetSize( note:GetWide()-4, note:GetTall()-28-30)
			note.editor:SetFont( "nutBigFont" )
			note.editor:SetMultiline( true )
			note.editor:SetText( note.text )
			note.editor:SetAllowNonAsciiCharacters( true )
			note.editor:SetVerticalScrollbarEnabled(true)
		end
		note:viewmode()
		
		local noteent = ents.GetByIndex( entity )
		if( !private or ( private and noteent:getNetVar( "owner" ) == LocalPlayer():SteamID() ) ) then
			note.edit = vgui.Create( "DButton", note )
			note.edit:SetSize( 148, 20 )
			note.edit:SetPos( 0, note:GetTall()-28 )
			note.edit:SetText( L"Edit" )
			note.edit.view = true
			note.edit:SetTextColor(color_white)
			note.edit.DoClick = function()
				if note.edit.view then
					note.edit:SetText( L"View" )
					note.edit.view = false
					note:editmode()
				else
					note.edit:SetText( L"Edit" )
					note.edit.view = true
					note:viewmode()
				end
			end
		end
		
		note.close = vgui.Create( "DButton", note )
		note.close:SetSize( 148, 20 )
		note.close:SetPos( 151, note:GetTall()-28 )
		note.close:SetText( L"Close" )
		note.close:SetTextColor(color_white)
		note.close.DoClick = function()
			if note.edited then --submit edited texts.
				local go
				if note.editor then
					go = note.editor:GetValue()
				else
					go = note.text
				end
				nut_SubmitNote( go, entity )
			end
			note:Remove()
			note = nil 
		end
	end
	
	function nut_SubmitNote( text, entity )
		netstream.Start("Nut_SubmitNote", {text, entity})
	end
	
	netstream.Hook( "Nut_PushNote", function( data )
		local text = data[1]
		local ent = data[2]
		local private = data[3]
		nut_OpenNote( text, ent, private )
	end)
end