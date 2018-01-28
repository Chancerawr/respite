local PANEL = {}
	function PANEL:Init()
		self:MakePopup()
		self:SetSize(ScrW(), ScrH())
		
		notices = {}
		
		self:SetSkin("glass")
		
		main = self:Add("DPanel")
			main:SetSize(768, 512)
			main:Center()
			main:SetPaintBackground(false)
			main:DockPadding(0, 12, 0, 12)
			main:DockMargin(0, 0, 0, 0)
			
			s1 = main:Add("DPanel")
				s1:SetSize(768 / 3, 488)
				s1:Dock(LEFT)
				s1:DockPadding(5, 0, 5, 0)
				s1:SetPaintBackground(false)
				
			s2 = main:Add("DPanel")
				s2:SetSize((768 / 3) * 2, 488)
				s2:Dock(LEFT)
				s2:DockPadding(5, 0, 5, 0)
				s2:SetPaintBackground(false)
							
		exitButton = self:Add("DButton")
			exitButton:SetSize(768, 24)
			exitButton:SetText("Exit")
			
			local x, y = main:GetPos()
			exitButton:SetPos(x, y + 512 + 12)
			
			exitButton.DoClick = function(this)
				self:panelExit()
			end;
			
		title = self:Add("DLabel")
			title:SetSize(768, 48)
			title:SetText("Notice Board")
			title:SetPos(x, y - (35 + 12))
			title:SetFont("deepfusionIntro")
			title:SetContentAlignment(5)
		
		self:SetAlpha(0)
		s1:SetAlpha(0)
		s2:SetAlpha(0)
		title:SetAlpha(0)
		exitButton:SetAlpha(0)
		self:AlphaTo(255, 0.5, 0, function()
			title:AlphaTo(255, 0.6)
			exitButton:AlphaTo(255, 0.6)
			s1:AlphaTo(255, 0.3, 0, function()
				s2:AlphaTo(255, 0.3)
			end)
		end)
	end;
	
	function PANEL:loadText(index)
		s2:AlphaTo(0, 0.3, 0, function()
			s2:Clear()
			noticeText = s2:Add("DLabel")
				noticeText:Dock(FILL)
				noticeText:SetWrap(true)
				noticeText:SetFont("nutscriptUI")
				noticeText:SetTextColor(Color(255, 255, 255))
				if(notices[index]) then
					noticeText:SetText(notices[index]["text"])
				end
				noticeText:SetContentAlignment(7)
			removeText = s2:Add("DButton")
				removeText:Dock(BOTTOM)
				removeText:SetHeight(24)
				removeText:SetText("Remove Notice")
				removeText:SetDisabled(true)
				removeText.DoClick = function()
					Derma_Query("Are you sure you want to remove this notice? (This cannot be undone!)", "Are You Sure?", "Yes", function()
						table.remove(notices, index)
						netstream.Start("noticeRemoveEntry", index)
						
						s2:AlphaTo(0, 0.3)
						s1:AlphaTo(0, 0.3, 0, function()
							print(notices)
							if(notices and table.Count(notices)) then
								print(table.Count(notices))
							end
							self:populate()
							--s2:Clear()
							s2:AlphaTo(255, 0.3)
							s1:AlphaTo(255, 0.3)
						end)
					end, "No")
				end;
			editText = s2:Add("DButton")
				editText:Dock(BOTTOM)
				editText:SetHeight(24)
				editText:DockMargin(0, 12, 0, 12)
				editText:SetText("Edit Notice")
				editText.DoClick = function()
					self:editText(index)
				end;
				editText:SetDisabled(true)
			if(notices[index]) then
				local noticeOwner = notices[index]["owner"]
			end
			if ((noticeOwner and LocalPlayer():getChar():getID() == noticeOwner) or LocalPlayer():IsAdmin()) then
				editText:SetDisabled(false)
				removeText:SetDisabled(false)
			end;
			s2:AlphaTo(255, 0.3)
		end)
	end;
	
	function PANEL:editText(index)
		s2:AlphaTo(0, 0.3, 0, function()
			s2:Clear()
			noticeEdit = s2:Add("DTextEntry")
				noticeEdit:Dock(FILL)
				noticeEdit:SetMultiline(true)
				noticeEdit:SetFont("nutscriptUI")
				if(notices[index]) then
					noticeEdit:SetText(notices[index]["text"])
				end
			saveText = s2:Add("DButton")
				saveText:Dock(BOTTOM)
				saveText:SetHeight(24)
				saveText:SetText("Save Notice")
				saveText:DockMargin(0, 12, 0, 0)
				saveText.DoClick = function()
					if(notices[index]) then
						notices[index]["text"] = noticeEdit:GetText()
						netstream.Start("noticeUpdateEntry", index, noticeEdit:GetText(), LocalPlayer():getChar():getID(), notices[index]["label"])
					end
					self:loadText(index)
					--netstream.Start("noticeUpdateEntry", index, noticeEdit:GetText(), LocalPlayer():getChar():getID(), notices[index]["label"])
					self:populate()
				end;
			s2:AlphaTo(255, 0.3)
		end)
	end;
	
	function PANEL:populate(data)
		s1:Clear()
		s2:Clear()
		
		notices = data or {}
		
		noticeList = s1:Add("DScrollPanel")
			noticeList:Dock(FILL)
			noticeList:DockMargin(0, 0, 0, 12)
			
		newNotice = s1:Add("DButton")
			newNotice:Dock(BOTTOM)
			newNotice:SetText("New Notice")
			newNotice.DoClick = function()
				Derma_StringRequest("Notice Name", "What would you like to label your notice?", "", function(titleLabel)
					if (string.len(titleLabel) < 6) then return end;
					if (!LocalPlayer():IsAdmin()) then netstream.Start("noticeTakePaper") end;
					table.insert(notices, {owner = LocalPlayer():getChar():getID(), label = titleLabel, text = ""})
					self:populate(notices)
					self:editText(#notices)
				end)
			end;
			
			if (LocalPlayer():getChar():getInv():hasItem("paper")) then
				newNotice:SetText("New Notice (Consumes one paper)")
			elseif (LocalPlayer():IsAdmin()) then
				newNotice:SetText("New Notice")
			else
				newNotice:SetDisabled(true)
				newNotice:SetText("New Notice (Requires one paper)")
			end;
		
		for i, v in ipairs(notices) do
			local noticeButton = noticeList:Add("DButton")
				noticeButton:Dock(TOP)
				noticeButton:DockMargin(0, 0, 0, 12)
				noticeButton:SetText(v["label"])
				noticeButton.DoClick = function()
					self:loadText(i)
				end;
		end;
	end;
	
	function PANEL:panelExit()
		exitButton:SetDisabled(true)
		exitButton:AlphaTo(0, 0.6)
		title:AlphaTo(0, 0.6)
		if (IsValid(model)) then model:Remove() end;
		s2:AlphaTo(0, 0.3, 0, function()
			s1:AlphaTo(0, 0.3, 0, function()
				self:AlphaTo(0, 0.5, 0, function() 
					self:Remove()
				end)
			end)
		end)
	end;
	
	function PANEL:Paint(w, h)
		nut.util.drawBlur(self, 5)
		surface.SetDrawColor(10, 10, 10, 150)
		surface.DrawRect(0, 0, w, h)
		surface.DrawRect(0, (ScrH() * 0.5) - 256, w, 512)
	end;
	
vgui.Register("noticeBoard", PANEL, "EditablePanel")