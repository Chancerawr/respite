PLUGIN.name = "Basic Viewbob"
PLUGIN.author = "AyyKyu"
PLUGIN.desc = "Adds a simple viewbob plugin."

if(CLIENT) then
	local step = 0
	local stepvalue = 0
	local enable = CreateClientConVar("nut_viewbob", 0, {FCVAR_CLIENTCMD_CAN_EXECUTE, FCVAR_ARCHIVE})
	local multiplier_walk_var = CreateClientConVar("nut_viewbob_mp_walk", 0.25, {FCVAR_CLIENTCMD_CAN_EXECUTE, FCVAR_ARCHIVE})
	local multiplier_crouch_var = CreateClientConVar("nut_viewbob_mp_crouch", 0.1, {FCVAR_CLIENTCMD_CAN_EXECUTE, FCVAR_ARCHIVE})
	local multiplier_sprint_var = CreateClientConVar("nut_viewbob_mp_sprint", 0.4, {FCVAR_CLIENTCMD_CAN_EXECUTE, FCVAR_ARCHIVE})

	function PLUGIN:SetupQuickMenu(menu)
		local button = menu:addCheck("Viewbob", function(panel, state)
			if (state) then
				RunConsoleCommand("nut_viewbob", "1")
			else
				RunConsoleCommand("nut_viewbob", "0")
			end
		end, enable:GetBool())
	end

	function PLUGIN:PlayerFootstep(client)
		local multiplier_walk = multiplier_walk_var:GetFloat()
		local multiplier_crouch = multiplier_crouch_var:GetFloat()
		local multiplier_sprint = multiplier_sprint_var:GetFloat()

		if enable:GetFloat() >= 1 then
			if step == 0 then 
				step = 1 
			else 
				step = 0 
			end
			
			if stepvalue == 0 then
				stepvalue = -1
			else
				stepvalue = 1
			end

			if client:KeyDown(IN_DUCK) then
				if client:KeyDown(IN_FORWARD) then
					client:ViewPunch(Angle(1.5 * multiplier_crouch, stepvalue * 0.75 * multiplier_crouch, stepvalue * 0.75 * multiplier_crouch))
				end

				if client:KeyDown(IN_BACK) then
					client:ViewPunch(Angle(-1.5 * multiplier_crouch, stepvalue * 0.75 * multiplier_crouch, stepvalue * 0.75 * multiplier_crouch))
				end

				if client:KeyDown(IN_MOVERIGHT) then
					client:ViewPunch(Angle(stepvalue * 0.75 * multiplier_crouch, stepvalue * 0.75 * multiplier_crouch, 1.5 * multiplier_crouch))
				end

				if client:KeyDown(IN_MOVELEFT) then
					client:ViewPunch(Angle(stepvalue * 0.75 * multiplier_crouch, stepvalue * 0.75 * multiplier_crouch, -1.5 * multiplier_crouch))
				end
			elseif client:KeyDown(IN_SPEED) then
				if client:KeyDown(IN_FORWARD) then
					client:ViewPunch(Angle(2.5 * multiplier_sprint, stepvalue * 1.25 * multiplier_sprint, stepvalue * 1.25 * multiplier_sprint))
				end

				if client:KeyDown(IN_BACK) then
					client:ViewPunch(Angle(-2.5 * multiplier_sprint, stepvalue * 1.25 * multiplier_sprint, stepvalue * 1.25 * multiplier_sprint))
				end

				if client:KeyDown(IN_MOVERIGHT) then
					client:ViewPunch(Angle(stepvalue * 1.25 * multiplier_sprint, stepvalue * 1.25 * multiplier_sprint, 2.5 * multiplier_sprint))
				end

				if client:KeyDown(IN_MOVELEFT) then
					client:ViewPunch(Angle(stepvalue * 1.25 * multiplier_sprint, stepvalue * 1.25 * multiplier_sprint, -2.5 * multiplier_sprint))
				end
			else
				if client:KeyDown(IN_FORWARD) then
					client:ViewPunch(Angle(0.5 * multiplier_walk, stepvalue * 0.25 * multiplier_walk, stepvalue * 0.25 * multiplier_walk))
				end

				if client:KeyDown(IN_BACK) then
					client:ViewPunch(Angle(-0.5 * multiplier_walk, stepvalue * 0.25 * multiplier_walk, stepvalue * 0.25 * multiplier_walk))
				end

				if client:KeyDown(IN_MOVERIGHT) then
					client:ViewPunch(Angle(stepvalue * 0.25 * multiplier_walk, stepvalue * 0.25 * multiplier_walk, 0.5 * multiplier_walk))
				end

				if client:KeyDown(IN_MOVELEFT) then
					client:ViewPunch(Angle(stepvalue * 0.25 * multiplier_walk, stepvalue * 0.25 * multiplier_walk, -0.5 * multiplier_walk))
				end
			end

			if client:KeyPressed(IN_JUMP) then
				client:ViewPunch(Angle(-5, stepvalue * 0.625, stepvalue * 0.625))
			end
		end
	end
end