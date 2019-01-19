PLUGIN.name = "Item Defense"
PLUGIN.author = "Chancer"
PLUGIN.desc = "When people get hit by a stray flying item, they won't take any damage."


function PLUGIN:EntityTakeDamage(target, dmginfo)
	if(target:IsPlayer()) then
		local inflictor = dmginfo:GetInflictor()

		if(IsValid(inflictor) and (inflictor:GetClass() == "nut_item")) then
			if(!IsValid(target:GetVehicle())) then
				dmginfo:ScaleDamage(0)
			end
		end
	end
end