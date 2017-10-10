PLUGIN.name = "Zombie Money Drop"
PLUGIN.author = ""
PLUGIN.desc = "Zombies will drop money upon death (50%)."

--Borrowed some code from Halokiller38 in here.

function PLUGIN:OnNPCKilled(entity)
	local class = entity:GetClass()
	
	local position = entity:GetPos()
	
	if (class == "npc_zombie" or class == "npc_zombie_torso" or class == "npc_poisonzombie" or class == "npc_fastzombie" or class == "npc_fastzombie_torso") then
		local ran = math.random( 1, 10 )
		if (ran > 5) then
			nut.item.spawn("food_water", position)
		end
	end
	
	--[[
	if(class == "class_name) then
		local ran = math.random( 1, 10 )
		if (ran > 5) then
			nut.item.spawn("food_water", position)
		end
	end
	-]]
end

local PLUGIN = PLUGIN