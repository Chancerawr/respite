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
	ITEM.functionsD = NUT_ITEM_DEFAULT_FUNCTIONS --default functions
	ITEM.functionsB = baseTable.functions or {} --item base functions
	ITEM.functions = table.Copy(ITEM.functions or {}) --unique item functions

	if (not luaGenerated and path) then
		nut.util.include(path)
	end

	ITEM:onRegistered()

	local itemType = ITEM.uniqueID
	targetTable[itemType] = ITEM
	ITEM = nil

	return targetTable[itemType]
end

NUT_ITEM_DEFAULT_FUNCTIONS = {
	drop = {
		tip = "dropTip",
		icon = "icon16/world.png",
		onRun = function(item)
			local client = item.player
			item:removeFromInventory(true)
				:next(function() item:spawn(client) end)
			nut.log.add(item.player, "itemDrop", item.name, 1)

			return false
		end,
		onCanRun = function(item)
			return item.entity == nil
				and not IsValid(item.entity)
				and not item.noDrop
		end
	},
	take = {
		tip = "takeTip",
		icon = "icon16/box.png",
		onRun = function(item)
			local client = item.player
			local inventory = client:getChar():getInv()
			local entity = item.entity

			if (client.itemTakeTransaction and client.itemTakeTransactionTimeout > RealTime()) then
				return false
			end

			client.itemTakeTransaction = true 
			client.itemTakeTransactionTimeout = RealTime()

			if (not inventory) then return false end
			
			local d = deferred.new()

			inventory:add(item)
				:next(function(res)
					client.itemTakeTransaction = nil

					if (IsValid(entity)) then
						entity.nutIsSafe = true
						entity:Remove()
					end
					
					if (not IsValid(client)) then return end
					nut.log.add(client, "itemTake", item.name, 1)

					d:resolve()
				end)
				:catch(function(err)
					client.itemTakeTransaction = nil
					
					if(err == "noFit") then
						client:notify("This item can't fit in your inventory. (" ..item.width.. "x" ..item.height..  ")")
					else
						client:notifyLocalized(err)
					end
					
					--d:reject()
				end)

			return d 
		end,
		onCanRun = function(item)
			return IsValid(item.entity)
		end
	},
}