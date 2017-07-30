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

ITEM.functions.Sacrifice = {
	icon = "icon16/box.png",
	sound = "npc/barnacle/neck_snap2.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local position = client:getItemDropPos()
		local inventory = char:getInv()

		local potential = { --potential sacrifices
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
			"food_human_torso3",
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
			"j_monster_claw"
		}
		local sacrifice
		for k, v in pairs (potential) do
			local check = inventory:hasItem(v)
			if (check) then
				sacrifice = inventory:hasItem(v)
			end
		end
		
		if(!sacrifice) then
			client:notifyLocalized("You don't have anything to sacrifice!") return false
		end
		
		sacrifice:remove()

		local reward = math.random(math.random(0, math.floor(char:getAttrib("fortitude"))), 100) -- rolls from character's fortitude attribute to 100.
		if(reward < 5) then
			client:notifyLocalized("You receive nothing.")
		elseif (reward < 50) then
			client:notifyLocalized("You receive a bottle of pills for your sacrifice.")
			nut.item.spawn("drug_depress", position)
		elseif (reward < 65) then
			client:notifyLocalized("You receive a vial of cure for your sacrifice.")
			nut.item.spawn("cure", position)		
		elseif (reward < 75) then
			client:notifyLocalized("You receive a lamp?")
			nut.item.spawn("hl2_m_lamp_strange", position)
		elseif (reward < 80) then
			client:notifyLocalized("You receive a can of yams?")
			nut.item.spawn("food_yams", position)
		elseif (reward < 90) then
			client:notifyLocalized("You receive a baby doll.")
			nut.item.spawn("j_baby_doll", position)	
		elseif (reward < 95) then
			client:notifyLocalized("You receive a bottle of blue haze for your sacrifice.")
			nut.item.spawn("haze_bottled", position)
		elseif (reward <= 99) then
			client:notifyLocalized("You receive an enhanced chip for your sacrifice.")
			nut.item.spawn("cube_chip_enhanced", position)		
		elseif (reward == 100) then
			client:notifyLocalized("You feel like you've lost part of yourself.")	
			char:updateAttrib("fortitude", 1)
		end
		nut.log.add(client:Name().." used a sacrifical skull: \""..reward.."\"")
		return false
	end
}