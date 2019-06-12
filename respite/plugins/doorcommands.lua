local PLUGIN = PLUGIN
PLUGIN.name = "Extra Door Commands"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Some extra commands for the doors plugin."

--extra door commands
local function togLock(door, state)
	if (door:isDoor()) then
		local partner = door:getDoorPartner()

		if (state) then
			if (IsValid(partner)) then
				partner:Fire("lock")
			end

			door:Fire("lock")
			--door:EmitSound("doors/door_latch3.wav")
		else
			if (IsValid(partner)) then
				partner:Fire("unlock")
			end

			door:Fire("unlock")
			--door:EmitSound("doors/door_latch1.wav")
		end
	elseif (door:IsVehicle()) then
		if (state) then
			door:Fire("lock")
			self.Owner:EmitSound("doors/door_latch3.wav")
		else
			door:Fire("unlock")
			self.Owner:EmitSound("doors/door_latch1.wav")
		end
	end
end

nut.command.add("doorlock", {
	adminOnly = true,
	onRun = function(client, arguments)
		-- Get the door the player is looking at.
		local entity = client:GetEyeTrace().Entity

		-- Validate it is a door.
		if (IsValid(entity) and entity:isDoor()) then
			togLock(entity, true)

			-- Tell the player they locked the door
			client:notify("Door locked.")

		else
			-- Tell the player the door isn't valid.
			client:notify("dNotValid")
		end
	end
})

nut.command.add("doorunlock", {
	adminOnly = true,
	onRun = function(client, arguments)
		-- Get the door the player is looking at.
		local entity = client:GetEyeTrace().Entity

		-- Validate it is a door.
		if (IsValid(entity) and entity:isDoor()) then
			togLock(entity, false)

			-- Tell the player they locked the door
			client:notify("Door unlocked.")

		else
			-- Tell the player the door isn't valid.
			client:notifyLocalized("dNotValid")
		end
	end
})

nut.command.add("doorsethiddenall", {
	adminOnly = true,
	syntax = "<bool hidden>",
	onRun = function(client, arguments)
		for k, v in pairs(ents.GetAll()) do
			-- Validate it is a door.
			if (IsValid(v) and v:isDoor()) then
				local hidden = util.tobool(arguments[1] or true)

				v:setNetVar("hidden", hidden)
			
				nut.plugin.list["doors"]:callOnDoorChildren(v, function(child)
					child:setNetVar("hidden", hidden)
				end)

			end
		end

		client:notify("All doors have been hidden/unhidden.")
		
		nut.plugin.list["doors"]:SaveDoorData()
	end
})