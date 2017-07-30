local flesh = {
	[MAT_FLESH] = 1,
	[MAT_ALIENFLESH] = 0,
	[MAT_BLOODYFLESH] = 1,
	[70] = 1,
}

local metal = {
	[MAT_METAL] = 1,
	[MAT_VENT] = 1,
	[MAT_GRATE] = 1,
}

function SCHEMA:EntityFireBullets(ent, bulletTable)
	local oldCallback = bulletTable.Callback

	bulletTable.Callback = function(client, trace, dmgInfo)
		if (oldCallback) then
			oldCallback(client, trace, dmgInfo)
		end
		
		if (trace) then
           if (metal[trace.MatType]) then
				local e = EffectData()
				e:SetOrigin(trace.HitPos)
				e:SetNormal(trace.HitNormal)
				e:SetScale(math.Rand(.1, .3))
				e:SetOrigin(trace.HitPos + VectorRand() * 1)
				util.Effect("btMetal", e)
			else
				local e = EffectData()
				e:SetOrigin(trace.HitPos)
				e:SetNormal(trace.HitNormal)
				e:SetScale(math.Rand(.1, .3))
				util.Effect( "btImpact", e )
			end
		end
	end

	return true
end

local TOOL_SAFE = {}
TOOL_SAFE["lamp"] = true
TOOL_SAFE["camera"] = true

local TOOL_DANGEROUS = {}
TOOL_DANGEROUS["dynamite"] = true
TOOL_DANGEROUS["balloon"] = true
TOOL_DANGEROUS["witchergate"] = true
TOOL_DANGEROUS["streamradio"] = true
TOOL_DANGEROUS["tesla"] = true
TOOL_DANGEROUS["permaall"] = true

function SCHEMA:CanTool(client, trace, tool)
	if (client:IsAdmin() or client:getChar():hasFlags('T')) then
		return true
	end

	if (TOOL_DANGEROUS[tool]) then
		return false
	end
	
	local entity = trace.Entity

	if (IsValid(entity)) then
		if (TOOL_SAFE[tool]) then
			return true
		end
	else
		return true
	end

	return false
end