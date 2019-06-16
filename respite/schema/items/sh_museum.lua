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

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 6,
}

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
				memory = inventory:getFirstItemOfType(v)
				if (memory) then
					if (memory.uniqueID == "j_painting") then
						worth = 3
					elseif (string.find(memory.uniqueID, "picture")) then
						worth = 1
					end
					memory:remove()
					break
				end
			end
			
			if (!memory) then
				client:notifyLocalized("You don't have any usable pictures!") return false
			end	
			
			client:notifyLocalized("The museum has taken the item.")
			item:setData("producing", CurTime())
			timer.Simple(66, 
				function()
					if (item != nil) then
						local position = client:getItemDropPos()
					
						client:notifyLocalized("The museum has finished.")
						item:setData("producing", nil)

						local reward
						if(math.random(1,2) == 1) then --50/50 chance
							reward = "blight"
						else
							reward = "j_scrap_memory"
						end
						
						if(math.random(1,10) == 10) then --10% chance to get an ailment
							giveDisease(client, "fort_nost")
							client:notify("You feel nostalgic")
						end
						
						for i = 1, worth do
							if(!IsValid(item:getEntity())) then
								inventory:addSmart(reward, 1, position)
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
		local prodTime = 66
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

ITEM.functions.Battery = {
	name = "Charged Battery",
	icon = "icon16/asterisk_orange.png",
	sound = "ambient/energy/zap9.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local required = inventory:getFirstItemOfType("ammo_battery")
			
		required:remove()
		nut.item.spawn("drug_depress", position)
		nut.item.spawn("drug_depress", position)
		nut.item.spawn("drug_depress", position)
		nut.item.spawn("drug_depress", position)
		nut.item.spawn("drug_depress", position)

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces a few depressants.")

		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("ammo_battery") then 
			return false
		end
		
		return true
	end
}

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("producing", false)) then
		desc = desc .. "\nThe museum's colors are shifting slowly."
	end
	
	return Format(desc)
end