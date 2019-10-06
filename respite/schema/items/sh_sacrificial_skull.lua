ITEM.name = "Sacrificial Skull"
ITEM.uniqueID = "sacrificial_skull"
ITEM.model = "models/Gibs/hgibs.mdl"
ITEM.material = "models/effects/portalrift_sheet"
ITEM.desc = "It hungers for what was once alive."
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(0, 0, 0)

ITEM.iconCam = {
	pos = Vector(200, 0, 0),
	ang = Angle(180, -0, 180),
	fov = 2.5,
}

ITEM.functions.Sacrifice = {
	icon = "icon16/eye.png",
	sound = "npc/barnacle/neck_snap2.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()

		local potential = { --potential sacrifices
			"food_eye",
			"food_liver",
			"food_heart",
			"food_brain",
			"food_lung",
			"food_blood",
			"j_skull",
			"j_spine",
			"j_scapula",
			"j_rib",
			"j_monster_claw",		
			"food_human_arm1",
			"food_human_arm2",
			"food_human_arms",
			"food_human_foot",
			"food_human_hand",
			"food_human_meat",
			"food_monster_meat",
			"food_human_leg1",
			"food_human_leg2",
			"food_human_legs",
			"food_human_pelvis",
			"food_human_torso1",
			"food_human_torso2",
			"food_human_torso3"
		}
		local sacrifice
		for k, v in pairs (potential) do
			local check = inventory:getFirstItemOfType(v)
			if (check) then
				sacrifice = inventory:getFirstItemOfType(v)
			end
		end
		
		if(!sacrifice) then
			client:notify("You don't have anything to sacrifice!") return false
		end
		
		sacrifice:remove()

		client:notify("The skull accepts your sacrifice.")
		
		item:setData("producing", CurTime())
		timer.Simple(40, function()
			if(!IsValid(client)) then return false end
			
			item:setData("producing", nil)
		
			local position = client:getItemDropPos()
			nut.chat.send(client, "itclose", client:Name().. "'s sacrificial skull rattles gently.")
			
			local fort = math.Clamp(math.floor(char:getAttrib("fortitude")), 0, 100)
			local fortRan = math.random(0, fort)
			
			local reward = math.random(fortRan, 100) -- rolls from character's fortitude attribute to 100.
			local rewardI
			
			if(reward < 10) then
				client:notify("You receive an ailment.")
				
				local ails = {
					"fort_nost",
					"fort_pani",
					"fort_noia",
					"fort_para",
					"fort_insa",
					"fort_hall",
					"fort_migraine",
					"fort_headache",
					"fort_enrage",
					"fort_conf"
				}
				
				giveDisease(client, table.Random(ails))
			elseif (reward < 61) then
				client:notify("You receive a bottle of pills for your sacrifice.")
				rewardI = "drug_depress"
			elseif (reward < 74) then
				client:notify("You receive a vial of blight for your sacrifice.")
				rewardI = "blight"
			elseif (reward < 75) then
				client:notify("You receive a lamp?")
				rewardI = "hl2_m_lamp_strange"
			elseif (reward < 85) then
				client:notify("You receive a can of yams?")
				rewardI = "food_yams"
			elseif (reward < 95) then
				client:notify("You receive a baby doll.")
				rewardI = "j_baby_doll"				
			elseif (reward < 98) then
				client:notify("You receive a bottle of blood.")
				rewardI = "food_blood"
			elseif (reward < 99) then
				client:notify("You receive a bottle of blue haze for your sacrifice.")
				rewardI = "haze_bottled"
			elseif (reward == 99) then
				client:notify("You receive an enhanced chip for your sacrifice.")
				rewardI = "cube_chip_enhanced"		
			elseif (reward == 100) then
				client:notify("You feel like you've changed somehow.")	
				char:updateAttrib("fortitude", 0.5)

				nut.plugin.list["parts"]:partsAdd(client, math.random(1,5), "Blight")
			end
			
			if(rewardI) then
				nut.log.addRaw(client:Name().." used a sacrifical skull and received "..nut.item.list[rewardI].name..".")
			else
				nut.log.addRaw(client:Name().." used a sacrifical skull and rolled " ..reward)
			end
			
			if(rewardI) then
				if(!IsValid(item:getEntity())) then --checks if item is not on the ground
					inventory:addSmart(rewardI, 1, client:getItemDropPos())
				else --if the item it on the ground
					nut.item.spawn(rewardI, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the created item above the item
				end
			end
		end)
		
		return false
	end,
	onCanRun = function(item)
		local prodTime = 40
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
		nut.item.spawn("drug_venom", position)
		nut.item.spawn("drug_venom", position)

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces some strange vials.")

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
		desc = desc .. "\nThe skull is full."
	end
	
	return Format(desc)
end