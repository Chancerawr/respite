local PANEL = {}
	local gradient = surface.GetTextureID("vgui/gradient-u")
	local gradient2 = surface.GetTextureID("vgui/gradient-d")

	function PANEL:Init()
		local fadeSpeed = 1

		if (IsValid(nut.gui.loading)) then
			nut.gui.loading:Remove()
		end

		if (!nut.localData.intro) then
			timer.Simple(0.1, function()
				vgui.Create("nutIntro", self)
			end)
		else
			self:playMusic()
		end

		if (IsValid(nut.gui.char) or (LocalPlayer().getChar and LocalPlayer():getChar())) then
			nut.gui.char:Remove()
			fadeSpeed = 0.3
		end

		nut.gui.char = self

		self:Dock(FILL)
		self:MakePopup()
		self:Center()
		self:ParentToHUD()
		
		self.darkness = self:Add("DPanel")
		self.darkness:Dock(FILL)
		self.darkness.Paint = function(this, w, h)
			surface.SetDrawColor(0, 0, 0)
			surface.DrawRect(0, 0, w, h)
		end
		self.darkness:SetZPos(99)

		self.title = self:Add("DLabel")
		self.title:SetContentAlignment(5)
		self.title:SetPos(0, 64)
		self.title:SetSize(ScrW(), 64)
		self.title:SetFont("nutTitleFont")
		self.title:SetText("")
		self.title:SizeToContentsY()
		self.title:SetTextColor(color_white)
		self.title:SetZPos(100)
		self.title:SetAlpha(0)
		self.title:AlphaTo(255, fadeSpeed, 3 * fadeSpeed, function()
			self.darkness:AlphaTo(0, 2 * fadeSpeed, 0, function()
				self.darkness:SetZPos(-99)
			end)
		end)
		self.title:SetExpensiveShadow(2, Color(0, 0, 0, 200))
		
		self.schemaLogo = self:Add("DHTML")
		self.schemaLogo:SetSize(ScrW(), ScrH())
		self.schemaLogo:SetPos(ScrW() * 0.30, 25)
		self.schemaLogo:SetZPos(-197)
		self.schemaLogo:OpenURL("http://i.imgur.com/xihenMy.png")
		
		--[[
		self.background = self:Add("DHTML")
		self.background:SetSize(ScrW(), ScrH())
		self.background:SetPos(0, 0)
		self.background:SetZPos(-300)
		self.background:OpenURL("https://i.imgur.com/inVWfQz.jpg")
		--]]
		
		self.subTitle = self:Add("DLabel")
		self.subTitle:SetContentAlignment(5)
		self.subTitle:MoveBelow(self.title, 0)
		self.subTitle:SetSize(ScrW(), 64)
		self.subTitle:SetFont("nutSubTitleFont")
		self.subTitle:SetText("")
		self.subTitle:SizeToContentsY()
		self.subTitle:SetTextColor(color_white)
		self.subTitle:SetAlpha(0)
		self.subTitle:AlphaTo(255, 4 * fadeSpeed, 3 * fadeSpeed)
		self.subTitle:SetExpensiveShadow(2, Color(0, 0, 0, 200))

		self.icon = self:Add("DHTML")
		self.icon:SetPos(ScrW() - 96, 8)
		self.icon:SetSize(86, 86)
		self.icon:SetHTML([[
			<html>
				<body style="margin: 0; padding: 0; overflow: hidden;">
					<img src="]]..nut.config.get("logo", "http://nutscript.rocks/nutscript.png")..[[" width="86" height="86" />
				</body>
			</html>
		]])
		self.icon:SetToolTip(nut.config.get("logoURL", "http://nutscript.rocks"))
	
		self.icon.click = self.icon:Add("DButton")
		self.icon.click:Dock(FILL)
		self.icon.click.DoClick = function(this)
			gui.OpenURL(nut.config.get("logoURL", "http://nutscript.rocks"))
		end
		self.icon.click:SetAlpha(0)
		self.icon:SetAlpha(150)

		local x, y = ScrW() * 0.25, ScrH() * 0.8
		local i = 1
		
		self.buttons = {}
		surface.SetFont("nutMenuButtonFontNew")
		
		local function AddMenuLabel(text, callback, isLast, noTranslation, parent)
			parent = parent or self
			
			local label = parent:Add("nutMenuButton")
			if(text == "return" or text == "leave") then
				label:SetPos(ScrW() * 0.8, y)
			else
				label:SetPos(x, y)
			end
			
			label:setText(text, noTranslation)
			label:SetAlpha(0)
			label:AlphaTo(255, 0.3, (fadeSpeed * 6) + 0.15 * i, function()
				if (isLast) then
					fadeSpeed = 0
				end
			end)
			
			if (callback) then
				label.DoClick = function(this)
					if (this:GetAlpha() == 255 and callback) then
						callback(this)
					end
				end
			end
			
			i = i + 0.33
			--y = y + label:GetTall() + 16
			x = x + label:GetWide() + 16
			
			self.buttons[#self.buttons + 1] = label
			return label
		end

		local function ClearAllButtons(callback)
			x, y = ScrW() * 0.1, ScrH() * 0.2

			local i = 1
			local max = table.Count(self.buttons)

			for k, v in pairs(self.buttons) do
				local reachedMax = i == max

				v:AlphaTo(0, 0.3, 0.15 * i, function()
					if (reachedMax and callback) then
						callback()
					end

					v.noClick = true
					v:Remove()
				end)

				i = i + 1
			end

			self.buttons = {}
		end

		self.fadePanels = {}

		local CreateMainButtons

		local function CreateReturnButton()
			AddMenuLabel("Return", function()
				if (IsValid(self.creation) and self.creation.creating) then
					return
				end

				self.setupCharList = nil

				for k, v in pairs(self.fadePanels) do
					if (IsValid(v)) then
						v:AlphaTo(0, 0.25, 0, function()
							v:Remove()
						end)
					end
				end
				
				
				self.fadePanels = {}
				ClearAllButtons(CreateMainButtons)
				x, y = ScrW() * 0.25, ScrH() * 0.8
			end)
		end

		function CreateMainButtons()
		
			local bar = self:Add("nutMenuBar")
			bar:SetPos(0, ScrH() - (ScrH() / 4.75))
			bar:SetSize(ScrW(), ScrH() / 12)
			self.buttons[#self.buttons + 1] = bar		
		
		--	self.bar = self:Add("nutMenuBar")
		--	self.bar:SetPos(0, ScrH() - (ScrH() / 4.75))
		--	self.bar:SetSize(ScrW(), ScrH() / 12)

			local count = 0

			for k, v in pairs(nut.faction.teams) do
				if (nut.faction.hasWhitelist(v.index)) then
					count = count + 1
				end
			end

			if (count > 0 and #nut.characters < nut.config.get("maxChars", 5) and hook.Run("ShouldMenuButtonShow", "create") != false) then
				AddMenuLabel("Create New Character", function()
					ClearAllButtons(function()
						CreateReturnButton()

						local fadedIn = false

						for k, v in SortedPairs(nut.faction.teams) do
							if (nut.faction.hasWhitelist(v.index)) then
								AddMenuLabel(L(v.name), function()
									if (!self.creation or self.creation.faction != v.index) then
										self.creation = self:Add("nutCharCreate")
										self.creation:SetAlpha(fadedIn and 255 or 0)
										self.creation:setUp(v.index)
										self.creation:AlphaTo(255, 0.5, 0)
										
										self.fadePanels[#self.fadePanels + 1] = self.creation
										self.fadePanels[#self.fadePanels + 1] = self.attribs
	
										self.finish = self:Add("nutMenuButton")
										self.finish:SetPos(ScrW() * 0.47, ScrH() * 0.3 + 16)
										self.finish:setText("finish")
										self.finish:MoveBelow(self.creation, 4)
										self.finish.DoClick = function(this)
											if (!self.creation.creating) then
												local payload = {}
	
												for k, v in SortedPairsByMemberValue(nut.char.vars, "index") do
													local value = self.creation.payload[k]
	
													if (!v.noDisplay or v.onValidate) then
														if (v.onValidate) then
															local result = {v.onValidate(value, self.creation.payload, LocalPlayer())}
	
															if (result[1] == false) then
																self.creation.notice:setType(1)
																self.creation.notice:setText(L(unpack(result, 2)).."!")
	
																return
															end
														end
	
														payload[k] = value
													end
												end
	
												self.creation.notice:setType(6)
												self.creation.notice:setText(L"creating")
												self.creation.creating = true
												self.finish:AlphaTo(0, 0.5, 0)
	
												netstream.Hook("charAuthed", function(fault, ...)
													timer.Remove("nutCharTimeout")
	
													if (type(fault) == "string") then
														self.creation.notice:setType(1)
														self.creation.notice:setText(L(fault, ...))
														self.creation.creating = nil
														self.finish:AlphaTo(255, 0.5, 0)
	
														return
													end
	
													if (type(fault) == "table") then
														nut.characters = fault
													end
	
													for k, v in pairs(self.fadePanels) do
														if (IsValid(v)) then
															v:AlphaTo(0, 0.25, 0, function()
																v:Remove()
															end)
														end
													end
	
													self.fadePanels = {}
													ClearAllButtons(CreateMainButtons)												
												end)
	
												timer.Create("nutCharTimeout", 20, 1, function()
													if (IsValid(self.creation) and self.creation.creating) then
														self.creation.notice:setType(1)
														self.creation.notice:setText(L"unknownError")
														self.creation.creating = nil
														self.finish:AlphaTo(255, 0.5, 0)
													end
												end)
	
												netstream.Start("charCreate", payload)
											end
										end
	
										self.fadePanels[#self.fadePanels + 1] = self.finish
										
										fadedIn = true
									end
								end)
							end
						end
					end)
				end)
			end

			if (#nut.characters > 0 and hook.Run("ShouldMenuButtonShow", "load") != false) then
				AddMenuLabel("Continue Story", function()
					ClearAllButtons(function()
						CreateReturnButton()

						local lastButton
						local id
						local width = 128

						self.charList = self:Add("DScrollPanel")
						self.charList:SetPos(x, y)
						self.charList:SetTall(ScrH() * 0.5)
						self.charList:SetAlpha(0)

						self.fadePanels[#self.fadePanels + 1] = self.charList

						self.model = self:Add("nutModelPanel")
						self.model:SetPos(ScrW() * 0.35, ScrH() * 0.2 + 16)
						self.model:MoveBelow(self.subTitle, 64)
						self.model:SetSize(ScrW() * 0.3, ScrH() * 0.7)
						self.model:SetModel("models/error.mdl")
						self.model:SetFOV(49)
						self.model:SetAlpha(0)
						self.model:AlphaTo(255, 0.5, 0)
						self.model.PaintModel = self.model.Paint
						self.model.Paint = function(this, w, h)
							local color = self.model.teamColor or color_black

							-- surface.SetDrawColor(color.r, color.g, color.b, 0)
							-- surface.SetTexture(gradient2)
							-- surface.DrawTexturedRect(0, 0, w, h)

							this:PaintModel(w, h)
						end
						self.fadePanels[#self.fadePanels + 1] = self.model

						self.choose = self.model:Add("nutMenuButton")
						self.choose:SetWide(self.model:GetWide() * 0.45)
						self.choose:setText("choose")
						self.choose:Dock(LEFT)
						self.choose.DoClick = function()
							if ((self.nextUse or 0) < CurTime()) then
								self.nextUse = CurTime() + 1
							else
								return
							end

							local status, result = hook.Run("CanPlayerUseChar", client, nut.char.loaded[id])

							if (status == false) then
								if (result:sub(1, 1) == "@") then
									nut.util.notifyLocalized(result:sub(2))
								else
									nut.util.notify(result)
								end

								return
							end

							if (!self.choosing and id) then
								self.choosing = true
								self.darkness:SetZPos(999)
								self.darkness:AlphaTo(255, 1, 0, function()
									self:Remove()

									local darkness = vgui.Create("DPanel")
									darkness:SetZPos(999)
									darkness:SetSize(ScrW(), ScrH())
									darkness.Paint = function(this, w, h)
										surface.SetDrawColor(0, 0, 0)
										surface.DrawRect(0, 0, w, h)
									end

									local curChar = LocalPlayer():getChar() and LocalPlayer():getChar():getID()

									netstream.Hook("charLoaded", function()
										if (IsValid(darkness)) then
											darkness:AlphaTo(0, 5, 0.5, function()
												darkness:Remove()
											end)
										end

										if (curChar != id) then
											hook.Run("CharacterLoaded", nut.char.loaded[id])
										end
									end)

									netstream.Start("charChoose", id)
								end)
							end
						end

						self.delete = self.model:Add("nutMenuButton")
						self.delete:SetWide(self.model:GetWide() * 0.45)
						self.delete:setText("delete")
						self.delete:Dock(RIGHT)
						self.delete.DoClick = function()
							local menu = DermaMenu()
								local confirm = menu:AddSubMenu(L("delConfirm", nut.char.loaded[id]:getName()))
								confirm:AddOption(L"no"):SetImage("icon16/cross.png")
								confirm:AddOption(L"yes", function()
									netstream.Start("charDel", id)
								end):SetImage("icon16/tick.png")
							menu:Open()
						end

						self.characters = {}

						local function SetupCharacter(character)
							if (id != character:getID()) then
								self.model:SetModel(character:getModel())
								if (character:getFaction() == FACTION_PLASTIC) then
									self.model.Entity:SetMaterial("phoenix_storms/mrref2")
								end
								self.model.teamColor = team.GetColor(character:getFaction())

								if (IsValid(self.model.Entity)) then
									self.model.Entity:SetSkin(character:getData("skin", 0))

									local groups = character:getData("groups", {})

									for k, v in pairs(groups) do
										self.model.Entity:SetBodygroup(k, v)
									end
								end
								
								id = character:getID()
							end
						end

						local function SetupCharList()
							local first = true

							self.charList:Clear()
							self.charList:AlphaTo(255, 0.5, 0.5)

							for k, v in ipairs(nut.characters) do
								local character = nut.char.loaded[v]

								if (character) then
									local label = self.charList:Add("nutMenuButton")
									label:setText(character:getName(), true)
									label:Dock(TOP)
									label:DockMargin(0, 0, 0, 4)
									label.DoClick = function(this)
										if (IsValid(lastButton)) then
											lastButton.color = nil
											lastButton:SetTextColor(color_white)
										end

										lastButton = this
										this.color = nut.config.get("color")
										SetupCharacter(character)
									end

									if (first) then
										SetupCharacter(character)
										label.color = nut.config.get("color")
										lastButton = label
										first = nil
									end

									if (label:GetWide() > width) then
										width = label:GetWide() + 8
										self.charList:SetWide(width)
									end

									self.characters[#self.characters + 1] = {label = label, id = character:getID()}
								end
							end
						end

						SetupCharList()

						function self:setupCharList()
							if (#nut.characters == 0) then
								if (IsValid(self.creation) and self.creation.creating) then
									return
								end

								self.setupCharList = nil

								for k, v in pairs(self.fadePanels) do
									if (IsValid(v)) then
										v:AlphaTo(0, 0.25, 0, function()
											v:Remove()
										end)
									end
								end

								self.fadePanels = {}
								ClearAllButtons(CreateMainButtons)

								return
							end

							SetupCharList()
						end
					end)
				end)
			end

			local hasCharacter = LocalPlayer().getChar and LocalPlayer():getChar()

			--testing a thing here
			local totalWidth = -16
			for k, v in pairs(self.buttons) do
				if(v:GetWide() != ScrW()) then
					totalWidth = totalWidth + v:GetWide() + 16
				end
			end
			
			local newX = ScrW() * 0.5 - (totalWidth / 2)
			
			for k, v in pairs(self.buttons) do
				if(v:GetWide() != ScrW()) then
					v:SetPos(newX, y)
					newX = newX + v:GetWide() + 16
				end
			end
			
			
			if (hook.Run("ShouldMenuButtonShow", "leave") != false) then
				AddMenuLabel(hasCharacter and "return" or "leave", function()
					if (!hasCharacter) then
						if (self.darkness:GetAlpha() == 0) then
							self.title:SetZPos(-99)
							self.darkness:SetZPos(99)
							self.darkness:AlphaTo(255, 1.25, 0, function()
								timer.Simple(0.5, function()
									RunConsoleCommand("disconnect")
								end)
							end)
						end
					else
						self:AlphaTo(0, 0.5, 0, function()
							self:Remove()
							if (OPENNEXT) then
								vgui.Create("nutCharMenu")
							end
						end)
					end
				end, true)
			end
		end

		CreateMainButtons()
	end
	
	function PANEL:Think()
		if (input.IsKeyDown(KEY_F1) and LocalPlayer():getChar() and !self.choosing) then
			self:Remove()
		end
	end
	
	function PANEL:playMusic()
		if (nut.menuMusic) then
			nut.menuMusic:Stop()
			nut.menuMusic = nil
		end

		timer.Remove("nutMusicFader")

		local source = nut.config.get("music", ""):lower()

		if (source:find("%S")) then
			local function callback(music, errorID, fault)
				if (music) then
					music:SetVolume(0.2)

					nut.menuMusic = music
					nut.menuMusic:Play()
				else
					MsgC(Color(255, 50, 50), errorID.." ")
					MsgC(color_white, fault.."\n")
				end
			end

			if (source:find("http")) then
				sound.PlayURL(source, "noplay", callback)
			else
				sound.PlayFile("sound/"..source, "noplay", callback)
			end
		end

		for k, v in ipairs(engine.GetAddons()) do
			if (v.wsid == "207739713" and v.mounted) then
				return
			end
		end

		Derma_Query(L"contentWarning", L"contentTitle", L"yes", function()
			gui.OpenURL("http://steamcommunity.com/sharedfiles/filedetails/?id=207739713")
		end, L"no")
	end

	function PANEL:OnRemove()
		if (nut.menuMusic) then
			local fraction = 1
			local start, finish = RealTime(), RealTime() + 6

			timer.Create("nutMusicFader", 0.1, 0, function()
				if (nut.menuMusic) then
					fraction = 1 - math.TimeFraction(start, finish, RealTime())
					nut.menuMusic:SetVolume(fraction * 0.05)

					if (fraction <= 0) then
						nut.menuMusic:Stop()
						nut.menuMusic = nil

						timer.Remove("nutMusicFader")
					end
				else
					timer.Remove("nutMusicFader")
				end
			end)
		end
	end

	function PANEL:Paint(w, h)
		surface.SetDrawColor(0, 0, 0, 235)
		surface.SetTexture(gradient)
		surface.DrawTexturedRect(0, 0, w, h)
	end
vgui.Register("nutCharMenu", PANEL, "EditablePanel")

hook.Add("CreateMenuButtons", "nutCharButton", function(tabs)
	tabs["characters"] = function(panel)
		nut.gui.menu:Remove()
		vgui.Create("nutCharMenu")
	end
end)


local barPanel = {}
	function barPanel:Init()
		self:SetColor(Color( 50, 50, 50, 200 ))
		self:SetDrawBackground(true)
		self:SetTextColor(Color(255,255,255,0))
		self:SetText("")
	end

vgui.Register("nutMenuBar", barPanel, "DButton")