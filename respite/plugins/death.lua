PLUGIN.name = "Death Screen"
PLUGIN.author = ""
PLUGIN.desc = "Small reworks to the death screen."

if(CLIENT) then
	local owner, w, h, ceil, ft, clmp
	ceil = math.ceil
	clmp = math.Clamp
	local aprg, aprg2 = 0, 0
	local w, h = ScrW(), ScrH()

	function nut.hud.drawDeath()
		owner = LocalPlayer()
		
		if (owner:getChar()) then
			if (owner:Alive()) then
				if (aprg != 0) then
					ft = FrameTime()
					aprg2 = clmp(aprg2 - ft*1.3, 0, 1)
					if (aprg2 == 0) then
						aprg = clmp(aprg - ft*.7, 0, 1)
					end
				end
			else
				if (aprg2 != 1) then
					ft = FrameTime()
					aprg = clmp(aprg + ft*.5, 0, 1)
					if (aprg == 1) then
						aprg2 = clmp(aprg2 + ft*.4, 0, 1)
					end
					
					surface.SetDrawColor(0, 0, 0, ceil((aprg^.5) * 100))
					surface.DrawRect(-1, -1, w+2, h+2)
				end
			end
		end

		if (IsValid(nut.char.gui) and nut.gui.char:IsVisible() or !owner:getChar()) then
			return
		end

		--[[
		surface.SetDrawColor(0, 0, 0, ceil((aprg^.5) * 255))
		surface.DrawRect(-1, -1, w+2, h+2)
		--]]
		
		--local tx, ty = nut.util.drawText(L"youreDead", w/2, h/2, ColorAlpha(color_white, aprg2 * 255), 1, 1, "nutDynFontMedium", aprg2 * 255)
	end
end