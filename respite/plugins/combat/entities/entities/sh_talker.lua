local PLUGIN = PLUGIN

PLUGIN.chatDelay = { min = .5, max = 1 }
PLUGIN.defaultDialogue = {
	npc = {
		["_start"] = "Hello.",
		["hi"] = "Hello.",
		--["!quest"] = "Take a look.",
		--["!vendor"] = "Take a look."
	},
	player = {
		["_quit"] = "Goodbye.",
		["hi"] = "Hello",
		--["!quest"] = "Quests",
		--["!vendor"] = "Trade?"
	},
}

--[[
function ENT:Use(activator)
	if(SERVER) then
		netstream.Start(activator, "nut_CDialogue", self)
	end
end
--]]

if(SERVER) then
	netstream.Hook("nut_CDialogueData", function(client, data)
		if (!client:IsAdmin()) then return end
			
		local entity = data[1]
		local dialogue = data[2]
		
		if (IsValid(entity)) then
			entity:setNetVar("dialogue", dialogue)

			client:notify("You have updated this talking npc's data.")
		end
	end)
else --client
	netstream.Hook("nut_CDialogue", function(data)
		if (IsValid(nut.gui.dialogue)) then
			nut.gui.dialogue:Remove()
			return
		end
		
		nut.gui.dialogue = vgui.Create("Nut_CDialogue")
		nut.gui.dialogue:Center()
		nut.gui.dialogue:SetEntity(data)
		
		if LocalPlayer():IsAdmin() then
			if (IsValid(nut.gui.edialogue)) then
				nut.gui.edialogue:Remove()
				return
			end
			
			nut.gui.edialogue = vgui.Create("Nut_CDialogueEditor")
			--nut.gui.edialogue:Center()
			nut.gui.edialogue:SetEntity(data)
		end
	end)
end