PLUGIN.name = "Logging"
PLUGIN.author = "Black Tea"
PLUGIN.desc = "You can modfiy the logging text/lists on this plugin."
 
if (SERVER) then
	nut.log.addType("chat", function(client, ...)
		local arg = {...}
		return (Format("[%s] %s: %s", arg[1], client:Name(), arg[2]))
	end)
	nut.log.addType("command", function(client, ...)
		local arg = {...}
		return (Format("%s used command '%s'", client:Name(), arg[1]))
	end)
	nut.log.addType("charLoad", function(client, ...)
		local arg = {...}
		return (Format("%s %s loaded the character #%s(%s)", client:steamName(), client:SteamID(), arg[1], arg[2]))
	end)
	nut.log.addType("charDelete", function(client, ...)
		local arg = {...}
		return (Format("%s(%s) deleted character (%s)", client:steamName(), client:SteamID(), arg[1]))
	end)
	nut.log.addType("itemUse", function(client, ...)
		local arg = {...}
		local item = arg[2]
		return (Format("%s tried '%s' to item '%s'(#%s)", client:Name(), arg[1], item.name, item.id))
	end)
	nut.log.addType("shipment", function(client, ...)
		local arg = {...}
		return (Format("%s took '%s' from the shipment", client:Name(), arg[1]))
	end)
	nut.log.addType("shipmentO", function(client, ...)
		local arg = {...}
		return (Format("%s ordered a shipment", client:Name()))
	end)
	nut.log.addType("buy", function(client, ...)
		local arg = {...}
		return (Format("%s purchased '%s' from the NPC", client:Name(), arg[1]))
	end)
	nut.log.addType("buydoor", function(client, ...)
		local arg = {...}
		return (Format("%s purchased the door", client:Name()))
	end)

	local L = Format

	function PLUGIN:CharacterLoaded(id)
		local character = nut.char.loaded[id]
		local client = character:getPlayer()

		--nut.log.add(client:steamName().." ("..client:SteamID()..") loaded character #"..id.." ("..character:getName()..")")
		nut.log.add(client, "charLoad", id, character:getName())
	end

	function PLUGIN:OnCharDelete(client, id)
		nut.log.add(client, "charDelete", id)
	end
	
	function PLUGIN:OnTakeShipmentItem(client, itemClass, amount)
		local itemTable = nut.item.list[itemClass]
		nut.log.add(client, "shipment", itemTable.name)
	end

	function PLUGIN:OnCreateShipment(client, shipmentEntity)
		nut.log.add(client, "shipmentO")
	end

	function PLUGIN:OnCharTradeVendor(client, vendor, x, y, invID, price, isSell)
	end

	local logInteractions = {
		["drop"] = true,
		["take"] = true,
		["equip"] = true,
		["unequip"] = true,
	}

	function PLUGIN:OnPlayerInteractItem(client, action, item)
		if (type(item) == "Entity") then
			if (IsValid(item)) then
				local entity = item
				local itemID = item.nutItemID
				item = nut.item.instances[itemID]
			else
				return
			end
		elseif (type(item) == "number") then
			item = nut.item.instances[item]
		end

		if (!item) then
			return
		end

		nut.log.add(client, "itemUse", action, item)
	end
	
	function PLUGIN:PlayerSpawnedProp(client, model, entity)
		nut.log.addRaw(client:GetName().. " spawned prop: " ..model)
	end
	
	function PLUGIN:PlayerDeath(victim, inflictor, attacker)
		if (victim:IsPlayer() and attacker) then
			if (attacker:IsWorld() or victim == attacker) then
				nut.log.addRaw(victim:Name().." ("..victim:SteamID()..")".. " has died")
			else
				local victimName = victim:Name().." ("..victim:SteamID()..")"

				if (attacker:IsPlayer()) then
					nut.log.addRaw(attacker:Name().. L(" killed %s with %s", victimName, attacker:GetActiveWeapon()))
				else
					nut.log.addRaw(L("%s killed %s with %s.", tostring(attacker), victimName, inflictor:GetClass()))
				end
			end
			
			local char = victim:getChar()
			if(char) then
				local ammoTable = char:getData("ammo")
				--this should print all the ammo the player lost on death for refunding purposes.
				if (ammoTable) then
					for k, v in pairs(ammoTable) do
						nut.log.addRaw("Ammo Type: " .. tostring(k) .. ", Amount: " .. v .. "(May not include mag)")
					end
				end
			end
		end
	end
end