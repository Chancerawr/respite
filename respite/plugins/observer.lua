PLUGIN.name = "Observer"
PLUGIN.author = "Chessnut"
PLUGIN.desc = "Adds on to the no-clip mode to prevent instrusion."

if (CLIENT) then
	-- Create a setting to see if the player will teleport back after noclipping.
	NUT_CVAR_OBSTPBACK = CreateClientConVar("nut_obstpback", 0, true, true)
	NUT_CVAR_ADMINESP = CreateClientConVar("nut_obsesp", 1, true, true)
	NUT_CVAR_ADMINESPC = CreateClientConVar("nut_obsespc", 1, true, true)
	NUT_CVAR_ADMINESPI = CreateClientConVar("nut_obsespi", 0, true, true)

	local client, sx, sy, scrPos, marginx, marginy, x, y, teamColor, distance, factor, size, alpha
	local dimDistance = 1024
	function PLUGIN:HUDPaint()
		client = LocalPlayer()
		
		if (client:IsAdmin() and client:GetMoveType() == MOVETYPE_NOCLIP and !client:InVehicle() and NUT_CVAR_ADMINESP:GetBool()) then
			sx, sy = surface.ScreenWidth(), surface.ScreenHeight()
			
			for k, v in ipairs(player.GetAll()) do
				if (v == client) then continue end

				scrPos = v:GetPos():ToScreen()
				marginx, marginy = sy*.1, sy*.1
				x, y = math.Clamp(scrPos.x, marginx, sx - marginx), math.Clamp(scrPos.y, marginy, sy - marginy)
				teamColor = team.GetColor(v:Team())
				distance = client:GetPos():Distance(v:GetPos())
				factor = 1 - math.Clamp(distance/dimDistance, 0, 1)
				size = math.max(10, 32*factor)
				alpha = math.Clamp(255*factor, 80, 255)

				surface.SetDrawColor(teamColor.r, teamColor.g, teamColor.b, alpha)
				surface.DrawLine(sx * 0.5, sy * 0.5, x, y)
				surface.DrawRect(x - size/2, y - size/2, size, size)

				nut.util.drawText(v:Name() .. "(" .. v:Health() .. ")", x, y - size, ColorAlpha(teamColor, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha)
				--nut.util.drawText(v:Health(), scrPos.x, scrPos.y + 15, Color(175,0,0, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha)
			end
			
			if(CMBT and NUT_CVAR_ADMINESPC:GetBool()) then
				for k, v in ipairs(ents.GetAll()) do
					if(!v.combat) then continue end
					if(v.espIgnore) then continue end
					
					scrPos = v:GetPos():ToScreen()
					marginx, marginy = sy*.1, sy*.1
					x, y = math.Clamp(scrPos.x, marginx, sx - marginx), math.Clamp(scrPos.y, marginy, sy - marginy)
					distance = client:GetPos():Distance(v:GetPos())
					factor = 1 - math.Clamp(distance/dimDistance, 0, 1)
					local teamColor = Color(190,50,50)
					
					size = math.max(10, 32*factor)
					alpha = math.Clamp(255*factor, 80, 255)

					nut.util.drawText(v:getNetVar("name", v.name) or v.PrintName, x, y - size, ColorAlpha(teamColor, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha)
					
					if(v:getNetVar("hit")) then
						nut.util.drawText("Hits: " ..v:getNetVar("hit", 0), x, y - size + 18, ColorAlpha(Color(200,20,20), alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha)
					end
				end
			end
			
			if(NUT_CVAR_ADMINESPI:GetBool()) then
				for k, v in pairs(ents.FindByClass("nut_item")) do
					local item = v:getItemTable()
					if(item) then
						scrPos = v:GetPos():ToScreen()
						marginx, marginy = sy*.1, sy*.1
						x, y = math.Clamp(scrPos.x, marginx, sx - marginx), math.Clamp(scrPos.y, marginy, sy - marginy)
						--teamColor = team.GetColor(v:Team())
						distance = client:GetPos():Distance(v:GetPos())
						factor = 1 - math.Clamp(distance/dimDistance, 0, 1)
						size = math.max(10, 32*factor)
						alpha = math.Clamp(255*factor, 80, 255)

						surface.SetDrawColor(Color(255,255,255))
						--surface.DrawLine(sx * 0.5, sy * 0.5, x, y)
						surface.DrawRect(x - size/2, y - size/2, size/2, size/2)

						nut.util.drawText(item.name or "Item", x, y - size, ColorAlpha(Color(255,255,255), alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha)
					end
				end
			end
		end
	end

	function PLUGIN:SetupQuickMenu(menu)
		if (LocalPlayer():IsAdmin()) then
			local buttonESP = menu:addCheck(L"toggleESP", function(panel, state)
				if (state) then
					RunConsoleCommand("nut_obsesp", "1")
				else
					RunConsoleCommand("nut_obsesp", "0")
				end
			end, NUT_CVAR_ADMINESP:GetBool())
			
			if(CMBT) then
				local buttonESPC = menu:addCheck("Toggle CEnt ESP", function(panel, state)
					if (state) then
						RunConsoleCommand("nut_obsespc", "1")
					else
						RunConsoleCommand("nut_obsespc", "0")
					end
				end, NUT_CVAR_ADMINESPC:GetBool())
			end

			local buttonESPC = menu:addCheck("Toggle Item ESP", function(panel, state)
				if (state) then
					RunConsoleCommand("nut_obsespi", "1")
				else
					RunConsoleCommand("nut_obsespi", "0")
				end
			end, NUT_CVAR_ADMINESPI:GetBool())

		
			local buttonTP = menu:addCheck(L"toggleObserverTP", function(panel, state)
				if (state) then
					RunConsoleCommand("nut_obstpback", "1")
				else
					RunConsoleCommand("nut_obstpback", "0")
				end
			end, NUT_CVAR_OBSTPBACK:GetBool())

			menu:addSpacer()
		end
	end
else
	function PLUGIN:PlayerNoClip(client, state)
		-- Observer mode is reserved for administrators.
		if (client:IsAdmin()) then
			-- Check if they are entering noclip.
			if (state) then
				-- Store their old position and looking		 at angle.
				client.nutObsData = {client:GetPos(), client:EyeAngles()}
				-- Hide them so they are not visible.
				client:SetNoDraw(true)
				client:SetNotSolid(true)
				client:DrawWorldModel(false)
				client:DrawShadow(false)
				-- Don't allow the player to get hurt.
				client:GodEnable()
				hook.Run("OnPlayerObserve", client, state)
			else
				if (client.nutObsData) then
					-- Move they player back if they want.
					if (client:GetInfoNum("nut_obstpback", 0) > 0) then
						local position, angles = client.nutObsData[1], client.nutObsData[2]

						-- Do it the next frame since the player can not be moved right now.
						timer.Simple(0, function()
							client:SetPos(position)
							client:SetEyeAngles(angles)
							-- Make sure they stay still when they get back.
							client:SetVelocity(Vector(0, 0, 0))
						end)
					end

					-- Delete the old data.
					client.nutObsData = nil
				end

				-- Make the player visible again.
				client:SetNoDraw(false)
				client:SetNotSolid(false)
				client:DrawWorldModel(true)
				client:DrawShadow(true)
				-- Let the player take damage again.
				client:GodDisable()
				hook.Run("OnPlayerObserve", client, state)
			end
		end
	end
end
