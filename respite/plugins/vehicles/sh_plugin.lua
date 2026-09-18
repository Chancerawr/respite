local PLUGIN = PLUGIN
PLUGIN.name = "Vehicles"
PLUGIN.author = ""
PLUGIN.desc = "Items that spawn and store vehicles."

--makes it so wheels dont hit items, stops them from getting stuck on stupid stuff
function PLUGIN:ShouldCollide(ent1, ent2)	
	if(IsValid(ent1) and IsValid(ent2)) then
		local class2 = ent2:GetClass()
		if(ent1:GetClass() == "nut_item" and (class2 == "gmod_sent_vehicle_fphysics_wheel" or class2 == "gmod_sent_vehicle_fphysics_base")) then
			return false
		end
	end

	-- We must call this because anything else should return true.
	return true
end