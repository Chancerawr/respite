local PLUGIN = PLUGIN
PLUGIN.name = "Death Screen"
PLUGIN.author = "Black Tea"
PLUGIN.desc = "'You have died' message."

if(SERVER) then
	local dmgMsgs = {
		[DMG_DROWN or 0] = "DROWNED", --drowning
		[DMG_BLAST or 0] = "SHATTERED", --explosion
		[DMG_BLAST_SURFACE or 0] = "SHATTERED", --explosion (kinda)
		[DMG_FALL or 0] = "SPLATTERED", -- fall damage
		[DMG_SLASH or 0] = "EVISCERATED", --melee weapons, npcs
		[DMG_CRUSH or 0] = "BROKEN", --physics, npcs
		[DMG_CLUB or 0] = "BLUDGEONED", --melee weapons, npcs
		[DMG_BULLET or 0] = "EXECUTED", --guns
		[DMG_BUCKSHOT or 0] = "SHREDDED", --shotguns
		[DMG_SNIPER or 0] = "ASSASSINATED", --snipers
		[DMG_ACID or 0] = "LIQUIFIED", --map stuff
		[DMG_PLASMA or 0] = "VAPORIZED", --map stuff
		[DMG_ENERGYBEAM or 0] = "VAPORIZED", --map stuff
		[DMG_DISSOLVE or 0] = "VAPORIZED", --dissolves player (i think)
		[DMG_BURN or 0] = "INCINERATED", --fire damage
		[DMG_SLOWBURN or 0] = "COOKED", --fire damage?
		[DMG_SHOCK or 0] = "ELECTROCUTED", --electric
		[DMG_VEHICLE or 0] = "SPLATTERED", --vehicle running into
		[DMG_SONIC or 0] = "SHATTERED", --rollermine
		[DMG_POISON or 0] = "POISONED", --poison (headcrab, antlion)
		[DMG_PARALYZE or 0] = "POISONED", --poison
		[DMG_RADIATION or 0] = "IRRADIATED", --radiation
		[DMG_NEVERGIB or 0] = "PIERCED", --crossbow bolts
		[DMG_MISSILEDEFENSE or 0] = "ERADICATED", --npc_combinegunship
		[DMG_DIRECT or 0] = "ERASED", --damage that avoids modification
	}

	function PLUGIN:DoPlayerDeath(client, attacker, dmginfo)
		local deathMsg = "DEATH"

		local dmgType = dmginfo:GetDamageType()
		if(dmgType) then
			deathMsg = dmgMsgs[dmgType] or "DEATH"
		end
	
		client:setNetVar("deathMsg", deathMsg)
	end

else --CLIENT
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
	local deathColor

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
				
				death_color = {
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
				
				--surface.SetDrawColor(0, 0, 0, ceil((aprg^.5) * 200))
				--surface.DrawRect(-1, -1, w+2, h+2)
				
				nut.util.drawBlurAt(0, 0, w, h, 10*aprg2)
			
				DrawColorModify(death_color)
				
				local deathText = owner:getNetVar("deathMsg", "DEATH")

				if(aprg2==1) then
					local deathColor = Color(255,0,0)
					local posX, posY = w/2 + math.random(-3,3), h/2 + math.random(-1,1)
					local tx, ty = nut.util.drawText(deathText, posX, posY, ColorAlpha(deathColor, aprg2 * 255 * math.Rand(0.5,0.6)), 1, 1, "nutDeathFont", aprg2 * 255)
					
					deathColor = Color(0,0,0)
					posX, posY = posX + math.random(-1,1), posY + math.random(-1,1)
					tx, ty = nut.util.drawText(deathText, posX, posY, ColorAlpha(deathColor, aprg2 * 255 * math.Rand(0.5,0.6)), 1, 1, "nutDeathFont", aprg2 * 255)
				end
			end
		end

		if (IsValid(nut.char.gui) and nut.gui.char:IsVisible() or !owner:getChar()) then
			return
		end
	end
end