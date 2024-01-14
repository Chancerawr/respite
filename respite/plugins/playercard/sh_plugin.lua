local PLUGIN = PLUGIN
PLUGIN.name = "Player Cards"
PLUGIN.author = " "
PLUGIN.desc = "Opens a menu upon pressing E on a player."

if(CLIENT) then
	function PLUGIN:PlayerBindPress(client, bind, pressed)
		bind = bind:lower()
		
		if (bind:find("use") and pressed) then
			local data = {}
				data.start = client:GetShootPos()
				data.endpos = data.start + client:GetAimVector()*96
				data.filter = client
			local trace = util.TraceLine(data)
			local entity = trace.Entity
			
			if (IsValid(client) and entity:IsPlayer()) then
				if (IsValid(nut.gui.menu)) then
					nut.gui.playerCard:remove()
				elseif (LocalPlayer():getChar()) then
					PLUGIN:openPlayerCard(entity)
				end
				
				return true
			end
		end
	end
	
	function PLUGIN:openPlayerCard(client)
		local playerCard = vgui.Create("nutPlayerCard")
		playerCard:SetPlayer(client)
	end
end