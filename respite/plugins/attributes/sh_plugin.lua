PLUGIN.name = "Attributes"
PLUGIN.author = "Cheesenut"
PLUGIN.desc = "Adds attributes for characters."

nut.util.include("sh_commands.lua")

nut.config.add(
	"maxAttribs",
	30,
	"The total maximum amount of attribute points allowed.",
	nil,
	{
		data = {min = 1, max = 250},
		category = "characters"
	}
)

nut.char.registerVar("attribs", {
	field = "_attribs",
	default = {},
	isLocal = true,
	index = 4,
	onValidate = function(value, data, client)
		if (value != nil) then
			if (type(value) == "table") then
				local count = 0

				for k, v in pairs(value) do
					count = count + v
				end

				local points = hook.Run("GetStartAttribPoints", client, count)
					or nut.config.get("maxAttribs", 30)
				if (count > points) then
					return false, "unknownError"
				end
			else
				return false, "unknownError"
			end
		end
	end,
	shouldDisplay = function(panel) return table.Count(nut.attribs.list) > 0 end
})

if (SERVER) then
	function PLUGIN:PostPlayerLoadout(client)
		nut.attribs.setup(client)
	end

	function PLUGIN:OnCharAttribBoosted(client, character, attribID)
		local attribute = nut.attribs.list[attribID]
		if (attribute and isfunction(attribute.onSetup)) then
			attribute:onSetup(client, character:getAttrib(attribID, 0))
		end
	end
else
	function PLUGIN:CreateCharInfoText(panel, suppress)
		if (suppress and suppress.attrib) then return end
		panel.attribName = panel.info:Add("DLabel")
		panel.attribName:Dock(TOP)
		panel.attribName:SetFont("nutMediumFont")
		panel.attribName:SetTextColor(color_white)
		panel.attribName:SetExpensiveShadow(1, Color(0, 0, 0, 150))
		panel.attribName:DockMargin(0, 10, 0, 0)
		panel.attribName:SetText(L"attribs")

		panel.attribs = panel.info:Add("DScrollPanel")
		panel.attribs:Dock(FILL)
		panel.attribs:DockMargin(0, 10, 0, 0)
	end

	function PLUGIN:OnCharInfoSetup(panel)
		if (not IsValid(panel.attribs)) then return end
		local char = LocalPlayer():getChar()
		local boost = char:getBoosts()

		local bars = {}
		local level = 0
		for k, v in SortedPairsByMemberValue(nut.attribs.list, "name") do
			local attribBoost = 0
			if (boost[k]) then
				for _, bValue in pairs(boost[k]) do
					attribBoost = attribBoost + bValue
				end
			end

			local bar = panel.attribs:Add("nutAttribBar")
			bar:Dock(TOP)
			bar:DockMargin(0, 0, 0, 3)

			local attribValue = char:getAttrib(k, 0)
			if (attribBoost) then
				bar:setValue(attribValue - attribBoost or 0)
			else
				bar:setValue(attribValue)
			end

			local maximum = v.maxValue or nut.config.get("maxAttribs", 30)
			bar:setMax(maximum)
			
			if (!(LocalPlayer().canLevel and LocalPlayer():canLevel())) then
				bar:setReadOnly()
			else
				bar.sub:Remove()
				bar.levelup = true
				level = LocalPlayer():canLevel()
				bar.attrib = k
				
				bar.doChange = function()
					if ((bar.value == 0 and bar.pressing == -1) or (bar.value == bar.max and bar.pressing == 1)) then
						return
					end
					
					bar.nextPress = CurTime() + 0.2
					
					if (bar:onChanged(bar.pressing) != false) then
						bar.value = math.Clamp(bar.value + bar.pressing, 0, bar.max)
					end
					
					if(bar.levelup) then
						Derma_Query("Increase " ..v.name.. "?", "Confirmation", "Yes", function()
							netstream.Start("statIncrease", bar.attrib, bar.value)
							level = level - 1
							
							if(level < 1) then
								for k, v in pairs(bars) do
									v.pressing = false
									v.add:Remove()
								end
							end
							
							bar:setValue(bar.value)
							
							bar:setText(
								Format(
									"%s [%.1f/%.1f] (%.1f",
									L(v.name),
									bar.value,
									maximum,
									bar.value/maximum*100
								)
								.."%)"
							)
						end, "No", function()
							bar.value = bar.value - 1
						end)
					end
				end
			end
			
			bar:setText(
				Format(
					"%s [%.1f/%.1f] (%.1f",
					L(v.name),
					attribValue,
					maximum,
					attribValue/maximum*100
				)
				.."%)"
			)

			if (attribBoost) then
				bar:setBoost(attribBoost)
			end
			
			table.insert(bars, bar)
		end
	end
	function PLUGIN:ConfigureCharacterCreationSteps(panel)
		panel:addStep(vgui.Create("nutCharacterAttribs"), 99)
	end
end
