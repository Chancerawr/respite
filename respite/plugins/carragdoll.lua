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