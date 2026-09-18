local playerMeta = FindMetaTable("Player")

local PLUGIN = PLUGIN
PLUGIN.name = "Jobs"
PLUGIN.author = " "
PLUGIN.desc = "Jobs that people can have, and the systems that support them."

function playerMeta:GetJob()
	local char = self:getChar()
	local job = -1
	
	if(char) then
		job = char:getData("job", -1)
	end

	return job
end

function playerMeta:SetJob(newJob)
	local char = self:getChar()

	local oldJob = self:GetJob()
	if(oldJob) then
		hook.Run("nut_changeJob", self, newJob, oldJob)
	end
	
	char:setData("job", newJob)
end