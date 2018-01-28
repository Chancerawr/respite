NUT_CVAR_CHATALT = CreateClientConVar("nut_chatalt", 1, true, true)

function SCHEMA:SetupQuickMenu(menu)	 
	  	  local button = menu:addCheck("Alternate Chat", function(panel, state)
				if (state) then
					RunConsoleCommand("nut_chatalt", "1")
				else
					RunConsoleCommand("nut_chatalt", "0")
				end
			end, NUT_CVAR_CHATALT:GetBool())
			
	  menu:addSpacer()
end