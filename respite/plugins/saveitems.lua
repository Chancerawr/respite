PLUGIN.name = "Save Items"
PLUGIN.author = "Chessnut"
PLUGIN.desc = "Saves items that were dropped."

function PLUGIN:LoadData()
	local items = self:getData()

	if (items) then
		local idRange = {}
		local positions = {}
		local angles = {}

		for k, v in ipairs(items) do
			idRange[#idRange + 1] = v[1]
			positions[v[1]] = v[2]
			angles[v[1]] = v[3]
		end

		if (#idRange > 0) then
			local range = "("..table.concat(idRange, ", ")..")"

			if (hook.Run("ShouldDeleteSavedItems") == true) then
				-- don't spawn saved item and just delete them.
				nut.db.query("DELETE FROM nut_items WHERE _itemID IN " .. range)
				print("Server Deleted Server Items (does not includes Logical Items)")
				print(range)
			else
				nut.db.query("SELECT _itemID, _uniqueID, _data FROM nut_items WHERE _itemID IN "..range, function(data)
					if (data) then
						local loadedItems = {}

						for k, v in ipairs(data) do
							local itemID = tonumber(v._itemID)
							local data = util.JSONToTable(v._data or "[]")
							local uniqueID = v._uniqueID
							local itemTable = nut.item.list[uniqueID]
							local position = positions[itemID]
							
							if (itemTable and itemID) then
								local position = positions[itemID]
								local angle = angles[itemID] or AngleRand()
								local item = nut.item.new(uniqueID, itemID)
								item.data = data or {}
								
								item:spawn(position, angle).nutItemID = itemID

								item.invID = 0
								table.insert(loadedItems, item)
							end
						end

						hook.Run("OnSavedItemLoaded", loadedItems) -- when you have something in the dropped item.
					end
				end)
			end
		end
	end
end

function PLUGIN:SaveData()
	local items = {}

	for k, v in ipairs(ents.FindByClass("nut_item")) do
		if (v.nutItemID and !v.temp) then
			items[#items + 1] = {v.nutItemID, v:GetPos(), v:GetAngles()}
		end
	end

	self:setData(items)
end