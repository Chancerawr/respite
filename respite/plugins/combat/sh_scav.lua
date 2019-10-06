local PLUGIN = PLUGIN

local function traitModify(client, command, rolled)
	local char = client:getChar()
	local charTraits = char:getData("traits", {}) --the traits the character has
	local traits = TRAITS.traits --data for all traits
	
	if(charTraits) then 
		for k, v in pairs(charTraits) do --go through all of char's traits
			local traitData = traits[k] --the actual info of the trait
			if(traitData and traitData.modifier and traitData.modifier[command]) then --if the trait has a modifier for this command
				rolled = rolled * traitData.modifier[command] --modify it
			end
		end
	end
	
	return rolled
end

local lootTable = {
	["garbage"] = {
		"hl2_m_rock",
		"hl2_m_stick",
		"hl2_m_branch",
		"j_old_shoe",
		"j_bananaskin",
		"j_empty_bread_box",
		"j_dollar",
		"j_bucket",
		"j_cereal_box",
		"j_empty_pill",
		"j_empty_bandage",
		"j_empty_beer",
		"j_empty_beer2",
		"j_empty_bleach",
		"j_empty_soda_can",
		"j_empty_soda2",
		"j_empty_soda1",
		"j_plastic_bag",
		"j_empty_chocolate_box",
		"j_used_first_aid_kit",
		"j_empty_juice_bottle",
		"j_empty_milk_carton",
		"j_empty_milk_jug",
		"j_empty_mountain_spring",
		"j_empty_mre",
		"j_empty_soda_bottle",
		"j_empty_takeout",
		"j_empty_vegetable_oil",
		"j_empty_vial",
		"j_empty_vodka",
		"j_empty_water",
		"j_empty_water_blood",
		"j_empty_whiskey",
		"j_empty_paint_can",
		"j_baby_doll",
		"j_empty_wine"
	},	
	["junk"] = {
		"j_blanket",
		"j_cactus_plant",
		"j_cigs",
		"j_cinder_block",
		"j_fire_extinguisher",
		"j_gear",
		"j_glasses",
		"j_goggles",
		"j_goggles2",
		"j_guitar",
		"j_headphones",
		"j_hula",
		"j_industrial_fan",
		"j_life_preserver",
		"j_meat_grinder",
		"j_computer_mouse",
		"j_paint_can",
		"j_painting1",
		"j_pickaxe_head",
		"j_picture_1",
		"j_picture_2",
		"j_picture_3",
		"j_picture_4",
		"j_picture_5",
		"j_pillow",
		"j_pliers",
		"j_old_rag",
		"j_soccerball",
		"j_syringe",
		"j_telephone",
		"j_tbrushes",
		"j_traffic_cone",
		"j_traffic_light",
		"j_tshirts",
		"j_stuffed_turtle",
		"j_broken_tv",
		"j_empty_gas_can",
		"j_dollar",
		"j_holster",
		"j_empty_mug",
		"j_empty_teapot",
		"j_family_picture",
		"j_paper_towels",
		"j_broken_receiver",
		"j_remote_control",
		"j_newspaper",
		"j_newspaper_stack",
		"j_map",
		"j_mounted_fish",
		"j_wall_light",
		"hl2_m_brokenbottle",
		"hl2_m_claypot",
		"hl2_m_fencepost",
		"hl2_m_hhradio",
		"hl2_m_keyboard",
		"hl2_m_steeringwheel",
		"hl2_m_valve",
		"hl2_m_weirdvase",
		"hl2_m_woodensign",
		"j_cards",
		"j_baseball_cap",
		"j_military_cap",
		"j_ushanka",
		"j_binoculars",
		"helmet_hard",
		"helmet_fire",
		"j_boonie",
		"j_beanie",
		"j_gloves",
		"armor_football",
		"plastic_core",
		"coin_10"
	},
	["food"] = {
		"food_water",
		"food_beans",
		"food_instant_potatoes",
		"food_canned_1",
		"food_tuna",
		"food_mre",
		"food_asparagus",
		"food_chicken",
		"food_chili",
		"food_corn",
		"food_mushrooms",
		"food_peaches",
		"food_pears",
		"food_peas",
		"food_ravioli",
		"food_sausage",
		"food_chickennoodle",
		"food_chowder",
		"food_spam",
		"food_tomatoes",
		"food_yams",
		"food_bread_box"
	},		
	["food2"] = {
		"food_soda_bottled",
		"food_water",
		"food_water_mountain",
		"food_chinese",
		"food_cereal",
		"food_chips",
		"food_chocolate",
		"food_egg",
		"food_fish",
		"food_fish2",
		"food_milk_carton",
		"food_milk_jug",
		"food_mre",
		"food_tea",
		"food_donut",
		"food_hamburger",
		"food_hotdog",
		"food_orange",
		"food_lemon",
		"food_potato",
		"food_pumpkin",
		"food_soda_blueberry",
		"food_soda_cherry",
		"food_soda_lemon",
		"food_melon",
		"food_apple",
		"food_banana"
	},	
	["resources"] = {
		"j_scrap_light",
		"j_scrap_nails",
		"j_scrap_cloth",
		"j_scrap_rubber",
		"j_scrap_glass",
		"j_scrap_metals",
		"j_scrap_wood",
		"j_scrap_plastics",
		"j_scrap_elecs",
		"j_scrap_elastic",
		"j_scrap_concrete",
		"j_scrap_adhesive",
		"j_scrap_screws",
		"j_scrap_battery",
		"coin_10"
	},	
	["resources2"] = {
		"j_scrap_adhesive",
		"j_scrap_screws",
		"j_scrap_chems"
	},
	["weapon"] = {
		"hl2_m_lamp",
		"flashlight",
		"hl2_m_bat",
		"hl2_m_bat_metal",
		"hl2_m_crowbar",
		"hl2_m_crowbar_alt",
		"j_monster_claw",
		"hl2_m_monstertalon",
		"hl2_m_frying_pan_alt",
		"melee_paddle",
		"hl2_m_pipe",
		"hl2_m_pot",
		"hl2_m_suitcase"
	},
	["weapon2"] = {
		"hl2_m_knife",
		"hl2_m_machate",
		"hl2_m_meathook",
		"hl2_m_pickaxe",
		"hl2_m_pickaxe_alt",
		"melee_pitchfork",
		"hl2_m_axe",
		"hl2_m_shovel",
		"hl2_m_shovel_alt",
		"hl2_m_lumberaxe",
		"melee_fireaxe"
	},	
	["tool"] = { --all scav kit items
		"hl2_m_wrench",
		"hl2_m_hammer",
		"j_drill",
		"j_power_saw"
	},	
	["med"] = {
		"medical_bandages",
		"medical_plastic",
		"drug_disinfectant",
		"drug_rubbingalcohol",
		"drug_antivenom",
		"drug_burnointment"
	},		
	["drug"] = {
		"drug_depress",
		"drug_psychotics",
		"drug_sleepingpills",
		"drug_venom"
	},	
	["med2"] = {
		"medical_bandages",
		"medical_gauze",
		"medical_kit",
		"medical_iv",
		"medical_suture",
		"medical_plastic",
		"drug_antibiotics",
		"drug_antivenom",
		"drug_burnointment",
		"drug_disinfectant",
		"drug_rubbingalcohol",
		"drug_painkillers",
		"drug_antipsychotics",
		"drug_antidepressants",
		"drug_steroid"
	},	
	["weird1"] = {
		"food_laugh",
		"food_madness",
		"food_yams_mysterious",
		"drug_nightmare",
		"medical_memory",
		"food_soda_cold"
	},
	["weird2"] = {
		"purifier_water_tablet",
		"salve_healing",
		"cube_chip_enhanced",
		"ammo_battery",
		"ammo_sawblade",
		"haze_bottled_blood",
		"haze_bottled",
		"haze_bottled_pink",
		"drug_energy",
		"food_apple_cursed",
		"potion_agility",
		"potion_strength",
		"potion_accuracy",
		"potion_endurance",
		"potion_luck",
		"potion_craftiness",
		"potion_perception",
		"potion_fortitude",
		"cube_dirt"
	}
}

function lootRoll(roll)
	local item = "food_banana"
	
	if(roll < 10) then
		item = table.Random(lootTable["garbage"])
	elseif(roll < 20) then
		local ran = math.random(1,2)
		if(ran == 1) then
			item = table.Random(lootTable["garbage"])
		else
			item = table.Random(lootTable["junk"])
		end
	elseif(roll < 30) then
		local ran = math.random(1,2)
		if(ran == 1) then
			item = table.Random(lootTable["junk"])
		else
			item = table.Random(lootTable["food"])
		end
	elseif(roll < 40) then
		local ran = math.random(1,2)
		if(ran == 1) then
			item = table.Random(lootTable["junk"])
		else
			item = table.Random(lootTable["food"])
		end
	elseif(roll < 50) then
		local ran = math.random(1,3)
		if(ran == 1) then
			item = table.Random(lootTable["resources"])
		elseif(ran == 2) then
			item = table.Random(lootTable["food"])
		else
			item = table.Random(lootTable["drug"])
		end
	elseif(roll < 60) then
		local ran = math.random(1,4)
		if(ran == 1) then
			item = table.Random(lootTable["resources"])
		elseif(ran == 2) then
			item = table.Random(lootTable["med"])
		elseif(ran == 3) then
			item = table.Random(lootTable["weapon"])
		else
			item = table.Random(lootTable["tool"])
		end
	elseif(roll < 70) then
		local ran = math.random(1,5)
		if(ran == 1) then
			item = table.Random(lootTable["resources"])
		elseif(ran == 2) then
			item = table.Random(lootTable["food2"])
		elseif(ran == 2) then
			item = table.Random(lootTable["med"])
		elseif(ran == 3) then
			item = table.Random(lootTable["tool"])
		elseif(ran == 4) then
			item = table.Random(lootTable["weapon"])
		else
			item = "blight"
		end
	elseif(roll < 80) then
		local ran = math.random(1,5)
		if(ran == 1) then
			item = table.Random(lootTable["resources2"])
		elseif(ran == 2) then
			item = table.Random(lootTable["food2"])
		elseif(ran == 2) then
			item = table.Random(lootTable["med2"])
		elseif(ran == 3) then
			item = table.Random(lootTable["tool"])
		elseif(ran == 4) then
			item = table.Random(lootTable["weapon"])
		else
			item = "blight"
		end
	elseif(roll < 90) then
		local ran = math.random(1,5)
		if(ran == 1) then
			item = table.Random(lootTable["resources2"])
		elseif(ran == 2) then
			item = table.Random(lootTable["med2"])
		elseif(ran == 4) then
			item = table.Random(lootTable["tool"])
		elseif(ran == 3) then
			item = table.Random(lootTable["weapon2"])
		end
	elseif(roll < 100) then
		local ran = math.random(1,4)
		if(ran == 1) then
			item = table.Random(lootTable["resources2"])
		elseif(ran == 2) then
			item = table.Random(lootTable["med2"])
		elseif(ran == 3) then
			item = table.Random(lootTable["weapon2"])
		else
			item = table.Random(lootTable["tool"])
		end
	elseif(roll < 101 and roll > 99) then
		local ran = math.random(1,3)
		if(ran == 1) then
			item = "shard_dust"
		elseif(ran == 2) then
			item = "cube_chip_memory"
		else
			item = "cube_chip_enhanced"
		end
	elseif(roll < 110) then
		item = table.Random(lootTable["weird1"])
	elseif(roll < 500) then
		item = table.Random(lootTable["weird2"])
	end

	return item
end

nut.command.add("scavenge", {
	syntax = "<Roleplay scavenging before using this>",
	onRun = function(client, arguments)
		local char = client:getChar()
		local luckroll = math.random(0, math.Clamp(char:getAttrib("luck", 0), 0, 100))
		local rolled = math.random(luckroll, 100)

		rolled = traitModify(client, "scavenge", rolled) --trait modifier
		
		local lastScav = char:getData("ScavD", 0) --the last day that they scavenged
		local scavNum = char:getData("Scavs", 0) --number of times they've scavenged
		
		if(lastScav != tonumber(os.date("%d"))) then --once per day.		
			local position = client:getItemDropPos()
		
			char:setData("ScavD", lastScav - 1)
			
			local foundItem = lootRoll(rolled)
			
			nut.item.spawn(foundItem, position)
			
			local niceName = nut.item.list[foundItem].name
			if(niceName) then
				client:notifyLocalized("You have found a " .. niceName .. ".")
				
				nut.log.addRaw(client:Name().." rolled \""..rolled.."\" and received a " ..niceName.. ".", 2)		
				nut.chat.send(client, "scavenge", rolled)
			end
			
			if(scavNum < 3) then
				char:setData("Scavs", char:getData("Scavs", 0) + 1)
			else
				char:setData("Scavs", 0)
				char:setData("ScavD", tonumber(os.date("%d"))) --they scavenged today
			end
		else
			client:notifyLocalized("You can only scavenge four times every day.")
		end
	end
})
