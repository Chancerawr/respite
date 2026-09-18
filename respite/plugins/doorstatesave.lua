local PLUGIN = PLUGIN
PLUGIN.name = "Door State Saver"
PLUGIN.author = " "
PLUGIN.desc = "Saves the state of doors (open, locked, etc)"

local doors = {
	["func_door"] = true,
	["prop_door_rotating"] = true,
}

--checks if something is a door or not
function PLUGIN:isDoor(entity)
	if(!entity) then return false end
	if(!IsValid(entity)) then return false end

	local className = entity:GetClass()

	if (doors[className]) then
		return true
	elseif(string.find(className, "door")) then
		return true
	end
	
	return false
end

function PLUGIN:SaveDoors()
	local data = {}

	for k, entity in ipairs(ents.GetAll()) do 
		if(PLUGIN:isDoor(entity)) then
			local open = false
			local locked = false
			local angle

			local className = entity:GetClass()

			if(entity:GetInternalVariable("m_bLocked")) then
				locked = true
			end

			if(className == "func_door" and entity:GetInternalVariable("m_toggle_state") == 0) then
				open = true
			elseif(className == "prop_door_rotating" and entity:GetInternalVariable("m_eDoorState") != 0) then
				angle = entity:GetAngles()

				open = true
			end
			
			data[#data+1] = {
				id = entity:MapCreationID(), 
				open = open, 
				locked = locked,
				angle = angle,
			}
		end
	end
	
	self:setData(data)
end

function PLUGIN:LoadDoors()
	local data = self:getData()
	if(data) then
		for k, v in ipairs(data) do
			local ID, open, locked = data[1], data[2], data[3]
		
			local door = ents.GetMapCreatedEntity(v.id)
			if(!IsValid(door)) then continue end
		
			if(v.locked) then
				door:Fire("lock")
			else
				door:Fire("unlock")
			end
			
			if(v.open) then
				local keyvalues = door:GetKeyValues()

				if(door:GetClass() == "prop_door_rotating") then	
					if(v.angle) then
						door:SetAngles(v.angle)
					else
						door:Fire("open")
					end
				end
			else
				door:Fire("Close")
			end
		end
	end
end

function PLUGIN:SaveData()
	pcall(function()
		PLUGIN:SaveDoors()
	end)
end

function PLUGIN:LoadData()
	pcall(function()
		PLUGIN:LoadDoors()
	end)
end

nut.command.add("doorstatesave", {
	adminOnly = true,
	onRun = function(client)
		if SERVER then
			PLUGIN:SaveDoors()
			
			client:notify("Door states saved.")
		end
	end
})

--[[
hook.Add("VOTV_Save", "SaveDoors", function()
	VOTV:SaveDoors()
end)

hook.Add("VOTV_Load", "LoadDoors", function()
	VOTV:LoadDoors()
end)
--]]
