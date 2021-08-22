local PLUGIN = PLUGIN
PLUGIN.name = "Bodygroup Menu"
PLUGIN.author = "Chancer"
PLUGIN.desc = "A menu that lets you change your own bodygroups"

nut.command.add("bodygroupmenu", {
	onRun = function(client, arguments)
		netstream.Start(client, "nut_bodygroupMenu")
	end
})
	
if(SERVER) then
	netstream.Hook("nut_bodygroupMenuF", function(client, groups)
		local char = client:getChar()
		local groupsData = char:getData("groups", {})
		
		for k, v in pairs(groups) do
			client:SetBodygroup(k, v)
			groupsData[k] = v
		end
		
		char:setData("groups", groupsData)
	end)
else
	netstream.Hook("nut_bodygroupMenu", function(groups)
		local client = LocalPlayer()
		local model = client:GetModel()
		local groups = client:GetBodyGroups()
		
		local iconFrame = vgui.Create("DFrame")
		iconFrame:SetSize(400, 400)
		iconFrame:Center()
		iconFrame:SetTitle("Model")
		iconFrame:MakePopup()
		
		local icon = iconFrame:Add("nutModelPanel")
		icon:Dock(FILL)
		icon:SetSize(400,400)
		icon:SetModel(model)
		function icon:LayoutEntity( Entity ) return end
		
		local bodygroupMenu = vgui.Create("DFrame")
		bodygroupMenu:SetSize(500, 400)
		bodygroupMenu:Center()
		bodygroupMenu:MoveRightOf(iconFrame, 4)
		bodygroupMenu:SetTitle("Bodygroups Menu")
		bodygroupMenu:MakePopup()

		local scroll = bodygroupMenu:Add("DScrollPanel")
		scroll:SetPos(10, 50)
		scroll:SetSize(500 - 10, 700 - 50 - 10)
		function scroll:Paint(w, h) end
		
		local iconEnt = icon:GetEntity()
		
		local newGroups = {}
		for k, bodygroup in pairs(groups) do
			local currentGroup = client:GetBodygroup(bodygroup.id) or 0
			iconEnt:SetBodygroup(bodygroup.id, currentGroup)
		
			local slider = scroll:Add("DNumSlider")
			slider:Dock(TOP)
			slider:SetSize(480, 40)
			slider:SetMin(0)
			slider:SetMax(bodygroup.num)
			slider:SetDecimals(0)
			slider:SetText(bodygroup.name)
			slider:SetValue(currentGroup)
			slider.OnValueChanged = function(panel, value)
				iconEnt:SetBodygroup(bodygroup.id, value)
				newGroups[bodygroup.id] = value
			end
		end
		
		local save = bodygroupMenu:Add("DButton")
		save:Dock(BOTTOM)
		save:SetSize(480, 40)
		save:SetPos(0, 400)
		save:SetText("Save")
		save.DoClick = function(panel)
			netstream.Start("nut_bodygroupMenuF", newGroups)
			bodygroupMenu:Close()
			iconFrame:Close()
		end
	end)
end