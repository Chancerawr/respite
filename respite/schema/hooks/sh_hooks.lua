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

local playerMeta = FindMetaTable("Player")

-- Sends a Derma string request to the client.
function playerMeta:requestQuery(question, title, callback, default)
	local time = math.floor(os.time())

	self.nutStrReqs = self.nutStrReqs or {}
	self.nutStrReqs[time] = callback

	netstream.Start(self, "strQue", time, question, title, default)
end

function nut.item.register(uniqueID, baseID, isBaseItem, path, luaGenerated)
	assert(isstring(uniqueID), "uniqueID must be a string")

	local meta = nut.meta.item
	local baseTable = nut.item.base[baseID] or nut.meta.item
	if (baseID) then
		assert(baseTable, "Item "..uniqueID.." must non-existent base "..baseID)
	end
	local targetTable = (isBaseItem and nut.item.base or nut.item.list)
	
	ITEM = targetTable[uniqueID] or setmetatable({
		hooks = table.Copy(baseTable.hooks or {}),
		postHooks = table.Copy(baseTable.postHooks or {}),
		BaseClass = baseTable,
		__tostring = baseTable.__tostring,
	}, {
		__eq = baseTable.__eq,
		__tostring = baseTable.__tostring,
		__index = baseTable
	})

	ITEM.__tostring = baseTable.__tostring
	ITEM.desc = "noDesc"
	ITEM.uniqueID = uniqueID
	ITEM.base = baseID
	ITEM.isBase = isBaseItem
	ITEM.category = ITEM.category or "misc"

	--this right here is the only part I changed, it was causing some items to retain functions of items registered right before them
	--that was not something I wanted
	ITEM.functions = table.Copy(
		baseTable.functions or NUT_ITEM_DEFAULT_FUNCTIONS
	)

	if (not luaGenerated and path) then
		nut.util.include(path)
	end

	ITEM:onRegistered()

	local itemType = ITEM.uniqueID
	targetTable[itemType] = ITEM
	ITEM = nil

	return targetTable[itemType]
end