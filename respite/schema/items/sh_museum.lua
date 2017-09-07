ITEM.name = "Museum"
ITEM.uniqueID = "museum"
ITEM.model = "models/props_combine/breenglobe.mdl"
ITEM.material = "models/effects/portalrift_sheet"
ITEM.desc = "A strange shifting object, it reminds you of home somehow."
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(0, 0, 0)
ITEM.data = { producing2 = 0 }

ITEM.functions.Acquire = {
	icon = "icon16/photo.png",
	sound = "ambient/materials/footsteps_wood2.wav",
	onRun = function(item)
			local client = item.player
			local inventory = client:getChar():getInv()
			
			local memories = {
				"j_picture_1",
				"j_picture_2",
				"j_picture_3",
				"j_picture_4",
				"j_picture_5",
				"j_painting1",
				"j_family_picture",
				"j_baby_doll",
				"j_stuffed_turtle",
				"j_soccerball",
				"hl2_m_lamp_strange"
			}
			
			local memory
			local worth = 1
			
			for k, v in pairs (memories) do
				memory = inventory:hasItem(v)
				if (memory) then
					if (memory.uniqueID == "j_painting") then
						worth = 3
					elseif (memory.uniqueID == "j_painting") then
						worth = 2
					end
					memory:remove()
					break
				end
			end
			
			if (!memory) then
				client:notifyLocalized("You don't have any usable pictures!") return false
			end	
			
			client:notifyLocalized("The museum has taken the item.")
			item:setData("producing2", CurTime())
			timer.Simple(66, 
				function()
					if (item != nil) then
						client:notifyLocalized("The museum has finished.")
						item:setData("producing2", 0)
						local position = client:getItemDropPos()
						--if (!IsValid(item:getEntity())) then
						local reward
						if(math.random(0,9) == 9) then --10% chance to give memory
							reward = "j_scrap_memory"
						else
							reward = "cure"
						end
						for i = 1, worth do
							if(!IsValid(item:getEntity())) then
								if(!inventory:add(reward)) then --if the inventory has space, put it in the inventory
									nut.item.spawn(reward, position) --if not, drop it on the ground
								end
							else
								nut.item.spawn(reward, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the reward item above the entity
							end
						end
					end
				end
			)
			
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local endTime = item:getData("producing2") + 66
		if (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) then
			return true 
		else
			return false
		end
	end
}