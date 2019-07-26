nut.command.add("roll", {
	syntax = "[number maximum]",
	onRun = function(client, arguments)
		local rolled = math.random(0, math.min(tonumber(arguments[1]) or 100, 100))
		nut.log.add(client:Name().." rolled \""..rolled.."\"")	
		nut.chat.send(client, "roll", rolled)
	end
})

nut.command.add("fallover", {
	syntax = "[number time]",
	onRun = function(client, arguments)
		local time = tonumber(arguments[1])

		if (time and !isnumber(time)) then
			time = 5
		end

		if (time and time > 0) then
			time = math.Clamp(time, 1, 60)
		else
			time = nil
		end

		if (!IsValid(client.nutRagdoll)) then
			client:setRagdolled(true, time)
		end
	end
})

nut.command.add("chargiveitem", {
	adminOnly = true,
	syntax = "<string name> <string item> <integer amount>",
	onRun = function(client, arguments)
		if (!arguments[2]) then
			return L("invalidArg", client, 2)
		end

		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target) and target:getChar()) then
			local uniqueID = arguments[2]:lower()
			local amount = tonumber(arguments[3])

			if (!nut.item.list[uniqueID]) then
				for k, v in SortedPairs(nut.item.list) do
					if (nut.util.stringMatches(v.name, uniqueID)) then
						uniqueID = k

						break
					end
				end
			end

			if (arguments[3] and arguments[3] != "") then
				if (!amount) then
					return L("invalidArg", client, 3)
				end
			end

			local notified
			for i = 1, (amount or 1) do
				target:getChar():getInv():add(uniqueID)
					:next(function(res)
						if(!notified) then
							if (IsValid(target)) then
								target:notifyLocalized("itemCreated", nut.item.list[uniqueID].name)
							end
							
							if (IsValid(client) and client ~= target) then
								client:notifyLocalized("itemCreated", nut.item.list[uniqueID].name)
							end
							
							notified = true
						end
					end)
					:catch(function(err)
						if (IsValid(client)) then
							client:notifyLocalized(err)
						end
					end)
			end
		end
	end
})

nut.command.add("givemoney", {
	syntax = "<number amount>",
	onRun = function(client, arguments)
		local number = tonumber(arguments[1])
		number = number or 0
		local amount = math.floor(number)

		if (!amount or !isnumber(amount) or amount <= 0) then
			return L("invalidArg", client, 1)
		end

		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector()*96
			data.filter = client
		local target = util.TraceLine(data).Entity

		if (IsValid(target) and target:IsPlayer() and target:getChar()) then
			amount = math.Round(amount)

			if (!client:getChar():hasMoney(amount)) then
				return
			end

			target:getChar():giveMoney(amount)
			client:getChar():takeMoney(amount)

			target:notifyLocalized("moneyTaken", nut.currency.get(amount))
			client:notifyLocalized("moneyGiven", nut.currency.get(amount))

			client:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_ITEM_PLACE, true)
		end
	end
})

nut.command.add("plasticdust", {
	onRun = function(client, arguments)
		local char = client:getChar()
		if(char:getFaction() != FACTION_PLASTIC) then
			client:notify("Only Plastics can do this.")
			return false
		end

		local lastDust = char:getData("lastDust")
			
		if(!lastDust) then
			char:setData("lastDust", 0)
			lastDust = 0
		end
		
		if(lastDust and math.abs(tonumber(lastDust) - tonumber(os.date("%d"))) >= 3) then -- harvest once every 3 days.
			char:setData("lastDust", os.date("%d"))
			nut.item.spawn("medical_plastic", client:getItemDropPos())
			client:notify("You have harvested plastic dust from yourself.")
		else
			client:notify("You can only harvest plastic from yourself once every 3 days.")
		end
	end
})

--People abused this too much so I got rid of it.
--[[
nut.command.add("ammoeject", {
	syntax = "[num amount]",
	onRun = function(client, arguments)
	
		local char = client:getChar()
		local inv = char:getInv()
		local wep = client:GetActiveWeapon()
		local ammoType = wep:GetPrimaryAmmoType()
		local ammo = client:GetAmmoCount( ammoType )
		if (arguments[1] and tonumber(arguments[1]) < ammo) then
			ammo = tonumber(arguments[1])
		end
		ammoType = game.GetAmmoName(ammoType)

		if (ammo > 0) then
			client:SetAmmo(client:GetAmmoCount( ammoType ) - ammo, ammoType)
			if(!inv:add("ammo_generic", 1, { am = ammoType, amt = ammo, customName = ammoType .. " Box"})) then
				nut.item.spawn("ammo_generic", client:getItemDropPos(),
					function(item2)
						item2:setData("am", ammoType)
						item2:setData("amt", ammo)
						item2:setData("customName", ammoType .. " Box")
					end
				)
			end
			
			local plugin = nut.plugin.list["ammosave"]
			if(client and client:getChar()) then
				local ammoTable = {}
				
				for k, v in ipairs(plugin.ammoList) do
					local ammo = client:GetAmmoCount(v)
					--print(v .. ammo)
					
					if (ammo > 0) then
						ammoTable[v] = ammo
					end
				end
				client:getChar():setData("ammo", ammoTable)
			end
			
		else
			client:notify("You don't have any ammo to eject!")
			return false
		end
	end
})
--]]

