local PLUGIN = PLUGIN
PLUGIN.name = "Event Log"
PLUGIN.author = ""
PLUGIN.desc = "Lets admins edit a public event log that anyone can read. Useful for noting important events, quests, or whatever else you want, I don't make the rules."

if(SERVER) then
	function PLUGIN:openLog(client, edit)
		local path = "nutscript/"..SCHEMA.folder.."/eventlog.txt"
	
		--this thing basically builds the panels
		local eventLog = {
			name = "Event Log", --name of panel
			data = file.Read(path) or "", --data displayed in the panel
			size = {400, 830},
			pos = {0.15, 0.16},
			saveFunc = "nut_eventLogSave",
		}

		--sends them gui thing
		netstream.Start(client, "nut_eventLogOpen", eventLog, edit)
	end
	
	function PLUGIN:LoadData()
	end
	
	netstream.Hook("nut_eventLogSave", function(client, eventLog)
		local path = "nutscript/"..SCHEMA.folder.."/eventlog.txt"
		file.Write(path, eventLog)
	end)
else
	--this thing sucks and i hate gui and i'm too lazy to make it not suck
	netstream.Hook("nut_eventLogOpen", function(eventLog, edit)
		local data = eventLog.data

		local noteFrame = vgui.Create("DFrame")
		noteFrame:SetTitle(eventLog.name)
		noteFrame:SetSize(eventLog.size[1] or 400, eventLog.size[2] or 400)
		noteFrame:SetPos(ScrW() * (eventLog.pos[1] or 0.5), ScrH() * (eventLog.pos[2] or 0.5))
		noteFrame:MakePopup()
		noteFrame:ShowCloseButton(true)

		noteFrame.Paint = function(panel, w, h)
			--background image
			surface.SetDrawColor(Color(40, 40, 40, 255))
			surface.DrawRect(0, 0, w, h)
		end

		local scroll = vgui.Create("DPanel", noteFrame)
		scroll:Dock(FILL)
		
		local closeButton = vgui.Create("DButton", noteFrame)
		closeButton:SetPos(556, 0)
		closeButton:SetSize(20, 20)
		closeButton:SetTextColor(Color(255,255,255))
		closeButton:SetText("X")
		closeButton.Paint = function(panel, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))
		end
		closeButton.DoClick = function()
			noteFrame:Close()
		end
	
		local notesGUI = vgui.Create("DTextEntry", scroll)
		notesGUI:DockMargin(0, 8, 0, 0)
		notesGUI:SetSize(160, ScrH() * 0.700)
		notesGUI:Dock(TOP)
		notesGUI:SetFont("nutCharSubTitleFont")
		notesGUI:SetTextColor(Color(255,255,255))
		notesGUI:SetVerticalScrollbarEnabled(true)
		notesGUI:SetText(data or "")
		notesGUI:SetPaintBackground(false)
		notesGUI:SetWrap(true)
		notesGUI:SetMultiline(true)
		notesGUI:SetEditable(true)
		notesGUI:SetUpdateOnType(false)

		if(edit) then
			local notesGUIB = vgui.Create("DButton", noteFrame)
			notesGUIB:SetText("Save")
			notesGUIB:SetSize(20, 60)
			notesGUIB:Dock(BOTTOM)
			notesGUIB.DoClick = function()
				netstream.Start(eventLog.saveFunc, notesGUI:GetText())
				
				noteFrame:Remove()
			end
			notesGUIB.Paint = function(self, w, h)
				surface.SetDrawColor(Color(20, 20, 20, 255))
				surface.DrawRect(0, 0, w, h)
			end
		else
			notesGUI:SetEnabled(false)
		end
	end)
end

nut.command.add("questlog", {
	onRun = function(client, arguments)
		PLUGIN:openLog(client, false)
	end
})

nut.command.add("editquestlog", {
	adminOnly = true,
	onRun = function(client, arguments)
		PLUGIN:openLog(client, true)
	end
})