PLUGIN.name = "Vehicle Ragdolling"
PLUGIN.author = "Chancer"
PLUGIN.desc = "When people get hit by a car, they just get knocked down."

function PLUGIN:EntityTakeDamage(target, dmginfo)
	if(target:IsPlayer()) then
		local inflictor = dmginfo:GetInflictor()

		if(IsValid(inflictor) and (inflictor:GetClass() == "gmod_sent_vehicle_fphysics_base" or inflictor:GetClass() == "gmod_sent_vehicle_fphysics_wheel")) then
			if(!IsValid(target:GetVehicle())) then
				dmginfo:ScaleDamage(0)
				if(!IsValid(target.nutRagdoll)) then
					target:setRagdolled(true, 5)
				end
			end
		end
	end
end

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