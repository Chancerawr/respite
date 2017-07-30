nut.command.add("chargivescrap", {
	syntax = "<string name> <string scrap> [number amount]",
	adminOnly = true,
	onRun = function(client, arguments)
		if (!arguments[2]) then
			return L("invalidArg", client, 2)
		end

		local target = nut.command.findPlayer(client, arguments[1])
		local amount = tonumber(arguments[3])
		
		if (IsValid(target) and target:getChar()) then
			local uniqueID = arguments[2]:lower()

			if (!nut.item.list[uniqueID]) then
				for k, v in SortedPairs(nut.item.list) do
					if (nut.util.stringMatches(v.name, uniqueID)) then
						uniqueID = k

						break
					end
				end
			end

			local inv = target:getChar():getInv()
			local succ, err = target:getChar():getInv():add(uniqueID, 1, {Amount = amount})

			if (succ) then
				target:notify("Item successfully created.")
				client:notify("Item successfully created.")
			else
				target:notify(tostring(succ))
				target:notify(tostring(err))
			end
		end
	end
})