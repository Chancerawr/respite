local PLUGIN = PLUGIN

nut.config.add("stability", 10000, "The stability value.", nil, {
	data = {min = 0, max = 10000},
	category = "World"
})

function PLUGIN:GetStability()
	return nut.config.get("instability", 10000)
end

function PLUGIN:GetStabilityPercent()
	local stability = PLUGIN:GetStability()
	
	local percent = stability/100
	
	return percent
end

if(SERVER) then
	function PLUGIN:SetStability(new)
		nut.config.set("instability", new)
		
		return true
	end

	function PLUGIN:AddStability(new)
		local stability = PLUGIN:GetStability()
		stability = math.Clamp(stability + new, 0, 10000)

		PLUGIN:SetStability(stability)
	end
end