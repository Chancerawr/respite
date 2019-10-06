PLUGIN.name = "Hell Hole"
PLUGIN.author = "Ported to NS by Chancer."
PLUGIN.desc = "Source: https://steamcommunity.com/sharedfiles/filedetails/?id=1709312961"

nut.command.add("hellholetarg", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client
		
		if(target) then
			target:Freeze()
			
			local ED = EffectData()
			ED:SetEntity(target)
			util.Effect('hell_hole', ED)
			target:ConCommand("hellend")
			timer.Simple(0.5, function()
				local npcs = {}
				for k, v in pairs(ents.GetAll()) do
					if(v.chance) then
						npcs[#npcs + 1] = v
					end
				end
				
				local npc = table.Random(npcs)
			
				if(npc) then
					SafeRemoveEntity(npc)
					target:SetPos(npc:GetPos())
				else
					target:Kill()
				end
			end)
		else
			client:notify("Invalid target")
		end
	end
})

nut.command.add("hellhole", {
	adminOnly = true,
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
		
		local ED = EffectData()
		ED:SetOrigin(hitpos)
		ED:SetAngles(Angle(0,0,0))
		util.Effect('hell_hole', ED)
		
		timer.Simple(2, function()
			
			local demon = ents.Create("nz_demon")
			demon:SetMaterial("models/flesh")
			demon:SetColor(Color(120, 50, 50, 255))
			demon:SetPos(hitpos)
			demon:Spawn()
		
			local positions = {
				(hitpos + demon:GetRight() * 50),
				(hitpos - demon:GetRight() * 50),
				(hitpos + demon:GetForward() * 50),
				(hitpos - demon:GetForward() * 50),
			}
					
			for k, v in pairs(positions) do
				timer.Simple((math.random(1,20) * 0.1), function()
					local extra = ents.Create("nz_demon")
					extra:SetMaterial("models/flesh")
					extra:SetColor(Color(120, 50, 50, 255))
					extra:SetPos(v)
					extra:Spawn()
				end)
			end
		end)
	end
})