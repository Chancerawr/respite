local PLUGIN = PLUGIN
--this changes how items are initialized to a somewhat more complex way
--also requires edits to cl_inventory in derma.

local playerMeta = FindMetaTable("Player")

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

if(SERVER) then
	local ITEM = nut.meta.item
	function ITEM:interact(action, client, entity, data)
		assert(
			type(client) == "Player" and IsValid(client),
			"Item action cannot be performed without a player"
		)

		local canInteract, reason =
			hook.Run("CanPlayerInteractItem", client, action, self, data)
		if (canInteract == false) then
			if (reason) then 
				client:notifyLocalized(reason)
			end

			return false
		end

		local oldPlayer, oldEntity = self.player, self.entity

		self.player = client
		self.entity = entity

		local callback = self.functions[action] or self.functionsD[action] or self.functionsB[action]
		if (not callback) then
			self.player = oldPlayer
			self.entity = oldEntity
			return false
		end

		canInteract = isfunction(callback.onCanRun)
			and not callback.onCanRun(self, data)
			or true
		if (not canInteract) then
			self.player = oldPlayer
			self.entity = oldEntity
			return false
		end

		local result
		-- TODO: better solution for hooking onto these - something like mixins?
		if (isfunction(self.hooks[action])) then
			result = self.hooks[action](self, data)
		end
		if (result == nil and isfunction(callback.onRun)) then
			result = callback.onRun(self, data)
		end
		if (self.postHooks[action]) then
			-- Posthooks shouldn't override the result from onRun
			self.postHooks[action](self, result, data)
		end
		hook.Run("OnPlayerInteractItem", client, action, self, result, data)

		if (result ~= false and not deferred.isPromise(result)) then
			if (IsValid(entity)) then
				entity:Remove()
			else
				self:remove()
			end
		end

		self.player = oldPlayer
		self.entity = oldEntity
		return true
	end
else
	-- Called when use has been pressed on an item.
	function PLUGIN:ItemShowEntityMenu(entity)
		timer.Simple(0, function() --timer prevents GM hook from overwriting this one
			if(!entity) then return end
		
			for k, v in ipairs(nut.menu.list) do
				if (v.entity == entity) then
					table.remove(nut.menu.list, k)
				end
			end

			local options = {}
			
			local itemTable = entity and entity:getItemTable()
			if (!itemTable) then return end -- MARK: This is the where error came from.

			local function callback(index)
				if (IsValid(entity)) then
					netstream.Start("invAct", index, entity)
				end
			end

			itemTable.player = LocalPlayer()
			itemTable.entity = entity

			if (input.IsShiftDown()) then
				callback("take") 
			end

			local itemFunctions = {}
			
			for k, v in pairs(itemTable.functionsB) do
				itemFunctions[k] = v
			end
			
			for k, v in pairs(itemTable.functions) do
				itemFunctions[k] = v
			end
			
			for k, v in pairs(itemTable.functionsD) do
				itemFunctions[k] = v
			end

			for k, v in SortedPairs(itemFunctions) do
				if (k == "combine") then continue end -- yeah, noob protection

				if (isfunction(v.onCanRun)) then
					if (not v.onCanRun(itemTable)) then
						continue
					end
				end

				options[L(v.name or k)] = function()
					local send = true

					if (v.onClick) then
						send = v.onClick(itemTable)
					end

					if (v.sound) then
						surface.PlaySound(v.sound)
					end

					if (send != false) then
						callback(k)
					end
				end
			end

			if (table.Count(options) > 0) then
				entity.nutMenuIndex = nut.menu.add(options, entity)
			end

			itemTable.player = nil
			itemTable.entity = nil
		end)
	end
end