local PLUGIN = PLUGIN
PLUGIN.name = "Character Notes"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Let's admins add notes to characters"

if(SERVER) then
	function PLUGIN:openNotes(client, target, edit)
		if(IsValid(target) and target:getChar()) then
			local charID = target:getChar():getID()
			
			local path = "nutscript/"..SCHEMA.folder.."/charnotes/" ..charID
		
			--this thing basically builds the panels
			local notes = {
				[1] = {
					name = "Miscellaneous", --name of panel
					data = file.Read(path.. ".txt") or "", --data displayed in the panel
					size = {400, 400},
					pos = {0.29, 0.5},
					saveFunc = "nut_charNoteSave",
				},
				[2] = {
					name = "Body",
					data = file.Read(path.. "I.txt") or "",
					size = {400, 400},
					pos = {0.5, 0.5},
					saveFunc = "nut_charNoteSaveI",
				},
				[3] = {
					name = "Effects",
					data = file.Read(path.. "E.txt") or "",
					size = {400, 400},
					pos = {0.4, 0.13},
					saveFunc = "nut_charNoteSaveE",
				},
			}

			--sends them gui thing
			netstream.Start(client, "nut_charNoteOpen", charID, notes, edit)
		end
	end
	
	function PLUGIN:LoadData()
		local path = "nutscript/"..SCHEMA.folder.."/charnotes/"
		if(!file.Exists(path, "DATA")) then
			file.CreateDir("nutscript/"..SCHEMA.folder.."/charnotes/")
		end
	end
	
	netstream.Hook("nut_charNoteSave", function(client, charID, notes)
		local path = "nutscript/"..SCHEMA.folder.."/charnotes/" ..charID.. ".txt"
		file.Write(path, notes)
	end)
	
	netstream.Hook("nut_charNoteSaveI", function(client, charID, notes)
		local path = "nutscript/"..SCHEMA.folder.."/charnotes/" ..charID.. "I.txt"
		file.Write(path, notes)
	end)
	
	netstream.Hook("nut_charNoteSaveE", function(client, charID, notes)
		local path = "nutscript/"..SCHEMA.folder.."/charnotes/" ..charID.. "E.txt"
		file.Write(path, notes)
	end)
else
	--this thing sucks and i hate gui and i'm too lazy to make it not suck
	netstream.Hook("nut_charNoteOpen", function(charID, notes, edit)
		for k, v in pairs(notes) do			
			local noteFrame = vgui.Create("DFrame")
			noteFrame:SetTitle(v.name)
			noteFrame:SetSize(v.size[1] or 400, v.size[2] or 400)
			noteFrame:SetPos(ScrW() * (v.pos[1] or 0.5), ScrH() * (v.pos[2] or 0.5))
			noteFrame:MakePopup()
			noteFrame:ShowCloseButton(true)

			local scroll = vgui.Create("DScrollPanel", noteFrame)
			scroll:Dock(FILL)
		
			local notesGUI = vgui.Create("DTextEntry", scroll)
			notesGUI:DockMargin(0, 8, 0, 0)
			notesGUI:SetSize(160, ScrH() * 0.2)
			notesGUI:Dock(FILL)
			notesGUI:SetFont("nutCharSubTitleFont")
			notesGUI:SetTextColor(Color(255,255,255))
			notesGUI:SetVerticalScrollbarEnabled(true)
			notesGUI:SetText(v.data or "")
			notesGUI:SetPaintBackground(false)
			notesGUI:SetWrap(true)
			notesGUI:SetMultiline(true)
			notesGUI:SetEditable(true)

			if(edit) then
				local notesGUIB = vgui.Create("DButton", noteFrame)
				notesGUIB:SetText("Save")
				notesGUIB:SetSize(20, 100)
				notesGUIB:Dock(BOTTOM)
				notesGUIB.DoClick = function()
					netstream.Start(v.saveFunc, charID, notesGUI:GetText())
					
					noteFrame:Remove()
				end
				notesGUIB.Paint = function(self, w, h)
					surface.SetDrawColor(Color(20, 20, 20, 255))
					surface.DrawRect(0, 0, w, h)
				end
			else
				--notesGUI:SetEditable(false)
				notesGUI:SetEnabled(false)
			end
		end
	
		--[[
		local noteFrame = vgui.Create("DFrame")
		noteFrame:SetTitle("Miscellaneous")
		noteFrame:SetSize(400, 400)
		noteFrame:SetPos(ScrW() * 0.5 - 400, ScrH() * 0.5)
		--noteFrame:Center()
		noteFrame:MakePopup()
		noteFrame:ShowCloseButton(true)

		local scroll = vgui.Create("DScrollPanel", noteFrame)
		scroll:Dock(FILL)
	
		local notesGUI = vgui.Create("DTextEntry", scroll)
		notesGUI:DockMargin(0, 8, 0, 0)
		notesGUI:SetSize(160, ScrH() * 0.2)
		notesGUI:Dock(FILL)
		notesGUI:SetFont("nutCharSubTitleFont")
		notesGUI:SetTextColor(Color(255,255,255))
		notesGUI:SetVerticalScrollbarEnabled(true)
		notesGUI:SetText(notes[1] or "")
		notesGUI:SetPaintBackground(false)
		notesGUI:SetWrap(true)
		notesGUI:SetMultiline(true)
		notesGUI:SetEditable(true)

		if(edit) then
			local notesGUIB = vgui.Create("DButton", noteFrame)
			notesGUIB:SetText("Save")
			notesGUIB:SetSize(20, 100)
			--notesGUIB:SetPos(ScrW() * 0.5, ScrH() * 0.6)
			notesGUIB:Dock(BOTTOM)
			notesGUIB.DoClick = function()
				netstream.Start("nut_charNoteSave", charID, notesGUI:GetText())
				
				noteFrame:Remove()
			end
			notesGUIB.Paint = function(self, w, h)
				surface.SetDrawColor(Color(20, 20, 20, 255))
				surface.DrawRect(0, 0, w, h)
			end
		else
			--notesGUI:SetEditable(false)
			notesGUI:SetEnabled(false)
		end
		
		local noteIFrame = vgui.Create("DFrame")
		noteIFrame:SetTitle("Injuries")
		noteIFrame:SetSize(400, 400)
		noteIFrame:SetPos(ScrW() * 0.5, ScrH() * 0.5)
		--noteIFrame:Center()
		noteIFrame:MakePopup()
		noteIFrame:ShowCloseButton(true)

		local scroll = vgui.Create("DScrollPanel", noteIFrame)
		scroll:Dock(FILL)
	
		local notesIGUI = vgui.Create("DTextEntry", scroll)
		notesIGUI:DockMargin(0, 8, 0, 0)
		notesIGUI:SetSize(160, ScrH() * 0.2)
		notesIGUI:Dock(FILL)
		notesIGUI:SetFont("nutCharSubTitleFont")
		notesIGUI:SetTextColor(Color(255,255,255))
		notesIGUI:SetVerticalScrollbarEnabled(true)
		notesIGUI:SetText(notes[2] or "")
		notesIGUI:SetPaintBackground(false)
		notesIGUI:SetWrap(true)
		notesIGUI:SetMultiline(true)
		notesIGUI:SetEditable(true)

		if(edit) then
			local notesIGUIB = vgui.Create("DButton", noteIFrame)
			notesIGUIB:SetText("Save")
			notesIGUIB:SetSize(20, 100)
			--notesIGUIB:SetPos(ScrW() * 0.5, ScrH() * 0.6)
			notesIGUIB:Dock(BOTTOM)
			notesIGUIB.DoClick = function()
				netstream.Start("nut_charNoteSaveI", charID, notesIGUI:GetText())
				
				noteIFrame:Remove()
			end
			notesIGUIB.Paint = function(self, w, h)
				surface.SetDrawColor(Color(20, 20, 20, 255))
				surface.DrawRect(0, 0, w, h)
			end
		else
			--notesIGUI:SetEditable(false)
			notesIGUI:SetEnabled(false)
		end
		
		local noteEFrame = vgui.Create("DFrame")
		noteEFrame:SetTitle("Effects")
		noteEFrame:SetSize(400, 400)
		noteEFrame:SetPos(ScrW() * 0.5 - 200, ScrH() * 0.5 - 400)
		--noteEFrame:Center()
		noteEFrame:MakePopup()
		noteEFrame:ShowCloseButton(true)

		local scroll = vgui.Create("DScrollPanel", noteEFrame)
		scroll:Dock(FILL)
	
		local notesEGUI = vgui.Create("DTextEntry", scroll)
		notesEGUI:DockMargin(0, 8, 0, 0)
		notesEGUI:SetSize(160, ScrH() * 0.2)
		notesEGUI:Dock(FILL)
		notesEGUI:SetFont("nutCharSubTitleFont")
		notesEGUI:SetTextColor(Color(255,255,255))
		notesEGUI:SetVerticalScrollbarEnabled(true)
		notesEGUI:SetText(notes[3] or "")
		notesEGUI:SetPaintBackground(false)
		notesEGUI:SetWrap(true)
		notesEGUI:SetMultiline(true)
		notesEGUI:SetEditable(true)

		if(edit) then
			local notesEGUIB = vgui.Create("DButton", noteEFrame)
			notesEGUIB:SetText("Save")
			notesEGUIB:SetSize(20, 100)
			--notesEGUIB:SetPos(ScrW() * 0.5, ScrH() * 0.6)
			notesEGUIB:Dock(BOTTOM)
			notesEGUIB.DoClick = function()
				netstream.Start("nut_charNoteSaveE", charID, notesEGUI:GetText())
				
				noteEFrame:Remove()
			end
			notesEGUIB.Paint = function(self, w, h)
				surface.SetDrawColor(Color(20, 20, 20, 255))
				surface.DrawRect(0, 0, w, h)
			end
		else
			--notesEGUI:SetEditable(false)
			notesEGUI:SetEnabled(false)
		end
		--]]
	end)
end

nut.command.add("viewnotes", {
	onRun = function(client, arguments)
		PLUGIN:openNotes(client, client, false)
	end
})

nut.command.add("adminnotes", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])	
		if(target) then
			PLUGIN:openNotes(client, target, true)
		end
	end
})