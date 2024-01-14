function PLUGIN:KeyPress(client, key)
	if (key == IN_SCORE) then
		--[[
		timer.Create("nutToggleRaise"..client:SteamID(), 1, 1, function()
			if (IsValid(client)) then
				
			end
		end)
		--]]
		
		client:toggleWepRaised()
	end
end

function PLUGIN:PlayerSwitchWeapon(client, oldWeapon, newWeapon)
	client:setWepRaised(false)
end
