local PLUGIN = PLUGIN
PLUGIN.name = "Overhead Camera"
PLUGIN.author = " "
PLUGIN.desc = "Overhead camera combat thing."

--GENERAL
--party support
--swap through parties
--function to display abilities at the bottom
--movement from one square to the next
--generate squares (backend)
--AP things that stop you if you run out

--CAMERA
--camera follows player
--adjustable camera by mouse wheel and click and drag stuff
--enter camera mode and leave

--GUI
--display abilities at bottom
	--description boxes for them with stats
--hp/mp/ap above character or somewhere else
--party
--generate squares (visually)

--EXTRA
--AI for enemies
--abilities calculate damage automatically so you know what you're doing

--[[
	PLUGIN.combat[id] = {
		id = id,
		name = "Combat 1",
		entities = {

		},
		order = {
			[1] = "Adventurer",
			[2] = "Monster",
		},
		current = 1,
	}

--]]


if(SERVER) then
	--function ran at start of combat to set everything up
	function PLUGIN:combatStart()
		--create a combat object or table for this thing
			--give it a uniqueID so we can assign it to players or players to it
	end
	
	--adds a client if necessary
	function PLUGIN:combatEntAdd(client)
		--add them to the table
	end
	
	--removes a client if necessary
	function PLUGIN:combatEntRemove(client)
		--remove them from the table
	end
	
	--checks every client/entity in the combat and makes sure they're viable
	function PLUGIN:combatEnts()
		--check for leavers
	end
	
	--either figures out where to deploy players on a grid or lets them deploy themselves
	function PLUGIN:combatDeploy(client)
		--either initiate them selecting via gui or just throw them somewhere
	end
	
	--when someone does something
	function PLUGIN:combatAction(client, target)
		--target can be an entity or a position
	end

	--generates the grid
	function PLUGIN:gridGenerate()
		--simple array most likely
		--only put squares in places that are pathable
		
		--send info to clients involved so they can see it
	end
	
	--removes a specified grid so it no longer exists
	function PLUGIN:gridRemove()
	
	end
else --client

	--camera stuff
	function PLUGIN:CalcView(client, origin, angles, fov)
		if(!client.inCombat) then return end
	
		view.origin = origin
		view.angles = angles
	
		return view
	end
	
	local client, sx, sy, scrPos, marginx, marginy, x, y, teamColor, distance, factor, size, alpha
	local dimDistance = 2048
	function PLUGIN:HUDPaint()
		--[[
		client = LocalPlayer()
		
		if(true) then
		--if (client:IsAdmin() and client:GetMoveType() == MOVETYPE_NOCLIP and !client:InVehicle() and NUT_CVAR_ADMINESP:GetBool()) then
			
			sx, sy = surface.ScreenWidth(), surface.ScreenHeight()
			
			if((MANA and HP)) then
				for k, v in ipairs(player.GetAll()) do
					if (v == client) then continue end
				
					local pos = v:GetPos() + v:GetUp() * 80-- + v:GetRight() * 20
				
					scrPos = pos:ToScreen()
					x, y = scrPos.x, scrPos.y
					distance = client:GetPos():Distance(v:GetPos())
					factor = 1 - math.Clamp(distance/dimDistance, 0, 1)
					size = 16*factor
					alpha = math.Clamp(255*factor, 80, 255)
				
					if(HP[v]) then
						nut.util.drawText("(" .. HP[v][1] .. "/" ..HP[v][2].. ")", x, y, ColorAlpha(Color(200,20,20), alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha)
					end
					
					if(MANA[v]) then
						nut.util.drawText("(" .. MANA[v][1] .. "/" ..MANA[v][2].. ")", x, y + 15, ColorAlpha(Color(20,20,200), alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha)
					end
				end
			end
			
		end
		--]]
	end
	
	local function drawSquare(sPos, ePos)
		if (sPos and ePos) then
			local c1, c2, c3, c4
			--render.DrawLine(sPos, ePos, color_white)
			c1 = Vector(sPos[1], ePos[2], sPos[3])
			render.DrawLine(sPos, c1, color_white)
			c2 = Vector(ePos[1], sPos[2], sPos[3])
			render.DrawLine(sPos, c2, color_white)
			c3 = Vector(ePos[1], ePos[2], sPos[3])
			render.DrawLine(c3, c1, color_white)
			c4 = Vector(ePos[1], ePos[2], sPos[3])
			render.DrawLine(c3, c2, color_white)
		end
	end
	
	local squares = {
		--[[
		[1] = {
			s = Vector(-552.461670, 312.666168, -150.144653),
			e = Vector(-515.215271, 280.130615, -149.555908)
		},	
		--]]
		
		[1] = {
			s = Vector(0, 0, 0),
			e = Vector(50, 50, 0)
		},
	}
	
	local selectCircle = Material("sprites/sent_ball")
	function PLUGIN:PostDrawOpaqueRenderables()
		local client = LocalPlayer()
	
		--render.DrawWireframeSphere(LocalPlayer().drawTest, 10, 5, 5, Color( 255, 255, 255 ))
		
		if(client.ccAreaShow) then
			--render.SetMaterial(selectCircle)
			render.DrawWireframeSphere(client.ccAreaShow[1], client.ccAreaShow[2], 10, 10, Color(100, 100, 255, 255), true)
		end
		
		if(IsValid(client.ccSelect)) then
			render.SetMaterial(selectCircle)
			render.DrawQuadEasy(client.ccSelect:GetPos() + Vector(0,0,1), Vector(0,0,1), 32, 32, Color(0,100,0,200), (CurTime() * 50) % 360)
		end
	

	
		--[[
		for k, v in pairs(squares) do
			local sPos = v.s
			local ePos = v.e

			if (areaPoint.startVector and areaPoint.endVector) then
				sPos = areaPoint.startVector
				ePos = areaPoint.endVector
			elseif (areaPoint.startVector and !areaPoint.endVector) then
				sPos = areaPoint.startVector
				local trace = LocalPlayer():GetEyeTraceNoCursor()
				ePos = trace.HitPos
			end

			
			local startPos = sPos
			local endPos = ePos
			
			--draws a 10x10 grid of squares

			for i = 0, 9 do
				for j = 0, 9 do
					sPos = startPos + Vector(i * 50, j * 50, 0)
					ePos = endPos + Vector(i * 50, j * 50, 0)
					
					drawSquare(sPos, ePos)
				end
			end

			
			--drawing for spell radius, targets, etc
		end
		--]]
	end
end

--clones a target Cent
nut.command.add("combatcontext", {
	adminOnly = true,
	onRun = function(client, arguments)
		netstream.Start(client, "nut_ContextCombat")
	end
})