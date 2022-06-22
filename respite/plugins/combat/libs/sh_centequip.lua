local PLUGIN = PLUGIN

nut.command.add("centequip", {
	adminOnly = true,
	syntax = "<string model>",
	onRun = function(client, arguments)	
		if(!arguments[1]) then
			client:notify("No model specified.")
			return false
		end
	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:EquipWeapon(arguments[1], arguments[2])
			
			client:notify("CEnt equipped.")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centequipitem", {
	adminOnly = true,
	onRun = function(client, arguments)		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			--sends them gui thing
			netstream.Start(client, "nut_centEquipMenu", entity)
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

if(SERVER) then
	netstream.Hook("nut_centEquip", function(client, entity, uniqueID)
		local itemTable = nut.item.list[uniqueID]
		
		if(itemTable) then
			entity:EquipWeapon(itemTable.model, itemTable.material)
		end
	end)
else --CLIENT
--this thing sucks and i hate gui and i'm too lazy to make it not suck
	netstream.Hook("nut_centEquipMenu", function(entity)		
		local frame = vgui.Create("DFrame")
		frame:SetTitle("CEnt Equipment")
		frame:SetSize(120, 100)
		frame:SetPos(ScrW() * 0.5, ScrH() * 0.5)
		frame:MakePopup()
		frame:ShowCloseButton(true)

		local scroll = vgui.Create("DScrollPanel", frame)
		scroll:Dock(FILL)
		
		local itemList = vgui.Create("DComboBox", scroll)
		itemList:SetPos(5, 30)
		itemList:SetSize(100, 20)
		itemList:SetValue("")
		
		for k, item in pairs(nut.item.list) do
			if(item.class) then
				itemList:AddChoice(item.name, item.uniqueID)
			end
		end
		
		itemList.OnSelect = function(self, index, value, uniqueID)
			netstream.Start("nut_centEquip", entity, uniqueID)
		end
	end)
end