PLUGIN.name = "Death Screen"
PLUGIN.author = "Black Tea"
PLUGIN.desc = "'You have died' message."

if (CLIENT) then
	function PLUGIN:LoadFonts(font)
		surface.CreateFont("nutDeathFont", {
			font = "Type-Ra",
			size = 140,
			weight = 1000
		})
	end

	local owner, w, h, ceil, ft, clmp
	ceil = math.ceil
	clmp = math.Clamp
	local aprg, aprg2 = 0, 0
	w, h = ScrW(), ScrH()

	function PLUGIN:HUDPaint()
		owner = LocalPlayer()
		ft = FrameTime()

		if (owner:getChar()) then
			if (owner:Alive()) then
				if (aprg != 0) then
					aprg2 = clmp(aprg2 - ft*1.3, 0, 1)
					if (aprg2 == 0) then
						aprg = clmp(aprg - ft*.7, 0, 1)
					end
				end
			else
				if (aprg2 != 1) then
					aprg = clmp(aprg + ft*.5, 0, 1)
					if (aprg == 1) then
						aprg2 = clmp(aprg2 + ft*.4, 0, 1)
					end
				end
				
				--surface.SetDrawColor(0, 0, 0, ceil((aprg^.5) * 200))
				--surface.DrawRect(-1, -1, w+2, h+2)
				
				nut.util.drawBlurAt(0, 0, w, h, 10*aprg2)
				
				local death_color = {
					[ '$pp_colour_addr' ] = 0,
					[ '$pp_colour_addg' ] = 0,
					[ '$pp_colour_addb' ] = 0,
					[ '$pp_colour_brightness' ] = -0.3*aprg2,
					[ '$pp_colour_contrast' ] = 1,
					[ '$pp_colour_colour' ] = 1-aprg2,
					[ '$pp_colour_mulr' ] = 3*aprg2,
					[ '$pp_colour_mulg' ] = 0,
					[ '$pp_colour_mulb' ] = 0
				}
			
				DrawColorModify(death_color)
				
				if(aprg2==1) then
					local deathColor = Color(255,0,0)
					local posX, posY = w/2 + math.random(-3,3), h/2 + math.random(-1,1)
					local tx, ty = nut.util.drawText("DEATH", posX, posY, ColorAlpha(deathColor, aprg2 * 255 * math.Rand(0.5,0.6)), 1, 1, "nutDeathFont", aprg2 * 255)
					
					deathColor = Color(0,0,0)
					posX, posY = posX + math.random(-1,1), posY + math.random(-1,1)
					tx, ty = nut.util.drawText("DEATH", posX, posY, ColorAlpha(deathColor, aprg2 * 255 * math.Rand(0.5,0.6)), 1, 1, "nutDeathFont", aprg2 * 255)
				end
			end
		end

		if (IsValid(nut.char.gui) and nut.gui.char:IsVisible() or !owner:getChar()) then
			return
		end
	end
end
