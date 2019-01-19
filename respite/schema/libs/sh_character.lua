nut.char = nut.char or {}
nut.char.loaded = nut.char.loaded or {}
nut.char.vars = nut.char.vars or {}
nut.char.cache = nut.char.cache or {}

nut.util.include("nutscript/gamemode/core/meta/sh_character.lua")

-- Registration of default variables go here.
do
	local gradient = nut.util.getMaterial("vgui/gradient-d")
	
	nut.char.registerVar("model", {
		field = "_model",
		default = "models/error.mdl",
		onSet = function(character, value)
			local client = character:getPlayer()

			if (IsValid(client) and client:getChar() == character) then
				client:SetModel(value)
			end

			character.vars.model = value
		end,
		onGet = function(character, default)
			return character.vars.model or default
		end,
		index = 3,
		onDisplay = function(panel, y)
			local scroll = panel:Add("DScrollPanel")
			scroll:SetSize(ScrW() * 0.3, 260)
			scroll:SetPos(0, y)

			local layout = scroll:Add("DIconLayout")
			layout:Dock(FILL)
			layout:SetSpaceX(1)
			layout:SetSpaceY(1)

			local faction = nut.faction.indices[panel.faction]
			local preview
			--local prevEnt
			
			local slider
			local bodyGroupSliders = {}
			
			if (faction) then
				for k, v in SortedPairs(faction.models) do
					local icon = layout:Add("SpawnIcon")
					icon:SetSize(64, 128)
					icon:InvalidateLayout(true)
					icon.DoClick = function(this)
						panel.payload.model = {k, nil, nil}
						
						if(!preview) then
							preview = panel:Add("DModelPanel")
							
							preview:SetPos(ScrW() * 0.3, y/5)			// Set the position
							preview:SetSize(ScrW() * 0.2, ScrH()/3)		// Set the size
							
							preview:SetModel(v)
						else
							preview:SetModel(v)
						end
						
						if(slider) then
							slider:Remove() --resets the slider.
						end
						
						if(bodyGroupSliders) then
							for k, v in pairs(bodyGroupSliders) do
								v:Remove() --resets all the group sliders
							end
						end
						
						prevEnt = preview:GetEntity()
						
						if(prevEnt) then
							if(faction.name == "Plastic") then
								prevEnt:SetMaterial("phoenix_storms/mrref2")
							end
						
							for k2, v in pairs(prevEnt:GetBodyGroups()) do
								if(v.id == 0) then --skips over a weird useless one
									continue
								end
							
								local tempSlide = panel:Add( "DNumSlider")
								tempSlide:SetPos(ScrW() * 0.335, y*1.4 + (k2-1)*35) --this is terrible.
								tempSlide:SetSize(ScrW() * 0.15, 50)
								tempSlide:SetText(v.name)
								tempSlide:SetMax(v.num) --max based on the models number of groups
								tempSlide:SetDecimals(0)
								function tempSlide:OnValueChanged(value)
									if(preview:GetEntity()) then
										prevEnt:SetBodygroup(v.id, tempSlide:GetValue())
										
										local groups = {}
										for k, v in pairs(prevEnt:GetBodyGroups()) do
											if(v.id == 0) then --skips over a weird useless one
												continue
											end
											
											groups[tostring(v.id)] = prevEnt:GetBodygroup(v.id)
										end
										
										panel.payload.model = {k, math.Round(slider:GetValue()), groups}
									end
								end
								
								bodyGroupSliders[k2] = tempSlide
							end
						
							slider = panel:Add( "DNumSlider")
							slider:SetPos(ScrW() * 0.335, y*1.4+20)	
							slider:SetSize(ScrW() * 0.15, 35)
							slider:SetText("Skin")
							slider:SetMax(prevEnt:SkinCount() - 1) --max based on the models number of skins
							slider:SetDecimals(0)
							function slider:OnValueChanged(value)
								if(preview:GetEntity()) then
									prevEnt:SetSkin(slider:GetValue())
									local groups = {}
									for k, v in pairs(prevEnt:GetBodyGroups()) do
										if(v.id == 0) then --skips over a weird useless one
											continue
										end
										
										groups[tostring(v.id)] = prevEnt:GetBodygroup(v.id)
									end
									
									panel.payload.model = {k, math.Round(slider:GetValue()), groups}
								end
							end
						end
					end
					icon.PaintOver = function(this, w, h)
						if (panel.payload.model and panel.payload.model[1] == k) then
							local color = nut.config.get("color", color_white)

							surface.SetDrawColor(color.r, color.g, color.b, 200)

							for i = 1, 3 do
								local i2 = i * 2

								surface.DrawOutlinedRect(i, i, w - i2, h - i2)
							end

							surface.SetDrawColor(color.r, color.g, color.b, 75)
							surface.SetMaterial(gradient)
							surface.DrawTexturedRect(0, 0, w, h)
						end
					end

					if (type(v) == "string") then
						icon:SetModel(v)
					else
						icon:SetModel(v[1], v[2] or 0, v[3])
					end
				end
			end

			return scroll
		end,
		onValidate = function(value, data)
			local faction = nut.faction.indices[data.faction]

			if (faction) then
				if(!data.model or !data.model[1] or !faction.models[data.model[1]]) then
					return false, "needModel"
				end
			else
				return false, "needModel"
			end
		end,
		onAdjust = function(client, data, value, newData)
			local faction = nut.faction.indices[data.faction]

			if (faction) then
				
				local model = faction.models[data.model[1]]
				
				if (type(model) == "string") then
					newData.data = newData.data or {}
					newData.model = model
					newData.data.skin = data.model[2]
					newData.data.groups = data.model[3]
				elseif (type(model) == "table") then
					newData.model = model[1]
					newData.data = newData.data or {}
					newData.data.skin = model[2] or 0
					newData.data.bodyGroups = model[3]
				end
			end
		end
	})
	
	nut.char.registerVar("attribs", {
		field = "_attribs",
		default = {},
		isLocal = true,
		index = 4,
		onDisplay = function(panel, y)
			local container = panel:Add("DPanel")
			container:SetPos(panel.lastX, y)
			container:SetWide(ScrW() * 0.25)

			local y2 = 0
			local total = 0
			local maximum = hook.Run("GetStartAttribPoints", LocalPlayer(), panel.payload) or nut.config.get("maxAttribs", 30)

			panel.payload.attribs = {}

			for k, v in SortedPairsByMemberValue(nut.attribs.list, "name") do
				panel.payload.attribs[k] = 0

				local bar = container:Add("nutAttribBar")
				bar:SetToolTip(v.desc)
				bar:setMax(maximum)
				bar:Dock(TOP)
				bar:DockMargin(2, 2, 2, 2)
				bar:setText(L(v.name))
				bar.onChanged = function(this, difference)
					if ((total + difference) > maximum) then
						return false
					end

					total = total + difference
					panel.payload.attribs[k] = panel.payload.attribs[k] + difference
				end

				if (v.noStartBonus) then
					bar:setReadOnly()
				end

				y2 = y2 + bar:GetTall() + 4
			end
			
			container:SetTall(y2)
			return container
		end,
		onValidate = function(value, data, client)
			if (value != nil) then
				if (type(value) == "table") then
					local count = 0

					for k, v in pairs(value) do
						count = count + v
					end

					if (count > (hook.Run("GetStartAttribPoints", client, count) or nut.config.get("maxAttribs", 30))) then
						return false, "unknownError"
					end
				else
					return false, "unknownError"
				end
			end
		end,
		shouldDisplay = function(panel) return table.Count(nut.attribs.list) > 0 end
	})
	
	nut.char.registerVar("traits", {
		field = "_traits",
		default = {},
		isLocal = true,
		onDisplay = function(panel, y)
			local container = panel:Add("DScrollPanel")
			container:SetPos(panel.lastX, y)
			container:SetWide(ScrW() * 0.25)

			local y2 = 0
			local total = 0
			local maximum = nut.config.get("maxTraits", 2) or hook.Run("GetStartTraitPoints", LocalPlayer(), panel.payload)

			panel.payload.traits = {}

			for k, v in SortedPairsByMemberValue(TRAITS.traits, "category") do
				if(v.ignore) then --exclude from char creation.
					continue
				end
			
				panel.payload.traits[k] = nil

				local bar = container:Add("nutAttribBar")
				bar:SetToolTip(v.desc)
				bar:setMax(1)
				bar:Dock(TOP)
				bar:DockMargin(2, 2, 2, 2)
				bar:setText(L(v.name))
				bar.onChanged = function(this, difference)
					if ((total + difference) > maximum) then
						return false
					end

					total = total + difference
				
					if(panel.payload.traits[k] == nil) then
						panel.payload.traits[k] = 1
					else
						panel.payload.traits[k] = nil
					end
				end

				y2 = y2 + bar:GetTall() + 4
			end

			container:SetTall(y2)
			return container
		end,
		onValidate = function(value, data, client)
			if (value != nil) then
				if (type(value) == "table") then
					local count = 0

					for k, v in pairs(value) do
						count = count + v
					end

					if (count > (hook.Run("GetStartTraitPoints", client, count) or nut.config.get("maxTraits", 5))) then
						return false, "unknownError"
					end
				else
					return false, "unknownError"
				end
			end
		end,
		onAdjust = function(client, data, value, newData)
			newData.data = newData.data or {}
			newData.data.traits = data.traits
		end,
		shouldDisplay = function(panel) return table.Count(TRAITS.traits) > 0 end
	})
end