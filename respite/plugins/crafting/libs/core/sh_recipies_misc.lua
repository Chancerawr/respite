--MISC
local PLUGIN = PLUGIN
//
RECIPE = {}
RECIPE.uid = "nut_radio_station"
RECIPE.name = "Stationary Radio"
RECIPE.category = "Communication"
RECIPE.model = "models/props_lab/citizenradio.mdl"
RECIPE.desc = "A stationary radio."
 
RECIPE.items = {
	["j_scrap_elecs"] = 6,
	["j_scrap_metals"] = 12,
	["j_scrap_adhesive"] = 2,
	["j_scrap_screws"] = 3,
	["cube_chip"] = 3
}
RECIPE.result = {
	["comm_radio_stationary"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_flashlight"
RECIPE.name = "Flashlight"
RECIPE.category = "Light Sources"
RECIPE.model = "models/warz/melee/flashlight.mdl"
RECIPE.desc = "A flashlight."
 
RECIPE.items = {
	["j_scrap_metals"] = 5,
	["j_scrap_battery"] = 2,
	["j_scrap_light"] = 1,
}
RECIPE.result = {
	["flashlight"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_radio"
RECIPE.name = "Handheld Radio"
RECIPE.category = "Communication"
RECIPE.model = "models/gibs/shield_scanner_gib1.mdl"
RECIPE.desc = "A handheld radio."
 
RECIPE.items = {
	["cube_chip"] = 2,
	["comm_signal"] = 1
}
RECIPE.result = {
	["comm_radio"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_radio_booster"
RECIPE.name = "Radio Booster"
RECIPE.category = "Communication"
RECIPE.model = "models/items/combine_rifle_cartridge01.mdl"
RECIPE.desc = "A useful piece of equipment that can be attached to radios to reduce or remove distortion."
 
RECIPE.items = {
	["cube_chip"] = 5,
	["j_scrap_elecs"] = 10,
	["j_scrap_metals"] = 5
}
RECIPE.result = {
	["radio_booster"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_lantern"
RECIPE.name = "Lantern"
RECIPE.category = "Light Sources"
RECIPE.model = "models/weapons/cof/w_lantern.mdl"
RECIPE.desc = "A lantern."
 
RECIPE.items = {
	["j_scrap_light"] = 1,
	["j_scrap_metals"] = 7,
	["j_scrap_adhesive"] = 2,
	["j_scrap_battery"] = 2,
	["cube_chip"] = 1
}
RECIPE.result = {
	["coflantern"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_pipe"
RECIPE.name = "Metal Pipe"
RECIPE.category = "Refined"
RECIPE.model = "models/props_canal/mattpipe.mdl"
RECIPE.desc = "A pipe made out of metal."
 
RECIPE.items = {
	["j_scrap_metals"] = 5
}
RECIPE.result = {
	["hl2_m_pipe"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cinderblock"
RECIPE.name = "Cinder Block"
RECIPE.category = "Refined"
RECIPE.model = "models/props_junk/cinderblock01a.mdl"
RECIPE.desc = "A heavy block of concrete."
 
RECIPE.items = {
	["j_scrap_concrete"] = 4
}
RECIPE.result = {
	["j_cinder_block"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_nails"
RECIPE.name = "Nails"
RECIPE.category = "Resources"
RECIPE.model = "models/props_junk/garbage_metalcan002a.mdl"
RECIPE.desc = "Nails made out of metal."
 
RECIPE.items = {
	["j_scrap_metals"] = 4
}
RECIPE.result = {
	["j_scrap_nails"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_orgconverter"
RECIPE.name = "Organic Converter"
RECIPE.category = "Machines"
RECIPE.model = "models/props_c17/grinderclamp01a.mdl"
RECIPE.desc = "A peculiar tool with a climb and a lever."
 
RECIPE.items = {
	["j_meat_grinder"] = 1,
	["blight"] = 2,
	["j_scrap_organic"] = 5
}
RECIPE.result = {
	["converter_meat"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_adhesive"
RECIPE.name = "Adhesive"
RECIPE.category = "Resources"
RECIPE.model = "models/props_lab/jar01a.mdl"
RECIPE.desc = "A resource used for crafting and other things."
 
RECIPE.items = {
	["j_scrap_organic"] = 5
}
RECIPE.result = {
	["j_scrap_adhesive"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_generator_repair"
RECIPE.name = "Generator Repair Kit"
RECIPE.category = "Machines"
RECIPE.model = "models/props_junk/cardboard_box003b.mdl"
RECIPE.desc = "A box full of expendable materials and tools. This is used to repair broken generators."
 
RECIPE.items = {
	["j_scrap_metals"] = 5,
	["j_scrap_screws"] = 2,
}
RECIPE.result = {
	["generator_repair"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_farm_potato"
RECIPE.name = "Farm - Potato"
RECIPE.category = "Farms"
RECIPE.model = "models/props_junk/terracotta01.mdl"
RECIPE.desc = "A strange pot, the dirt in it gives off a dim light."
 
RECIPE.items = {
	["j_scrap_plastics"] = 5,
	["j_scrap_organic"] = 5,
	["j_scrap_concrete"] = 2,	
	["food_potato"] = 1,
	["shard_dust"] = 1
}
RECIPE.result = {
	["farm_potato"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_farm_onion"
RECIPE.name = "Farm - Onion"
RECIPE.category = "Farms"
RECIPE.model = "models/props_junk/terracotta01.mdl"
RECIPE.desc = "A strange pot, the dirt in it gives off a dim light."
 
RECIPE.items = {
	["j_scrap_plastics"] = 5,
	["j_scrap_organic"] = 5,
	["j_scrap_concrete"] = 2,	
	["food_onion"] = 1,
	["shard_dust"] = 1
}
RECIPE.result = {
	["farm_onion"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_farm_apple"
RECIPE.name = "Farm - Apple"
RECIPE.category = "Farms"
RECIPE.model = "models/props_junk/terracotta01.mdl"
RECIPE.desc = "A strange pot, the dirt in it gives off a dim light."
 
RECIPE.items = {
	["j_scrap_plastics"] = 5,
	["j_scrap_organic"] = 5,
	["j_scrap_concrete"] = 2,	
	["food_apple"] = 1,
	["shard_dust"] = 1
}
RECIPE.result = {
	["farm_apple"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_farm_orange"
RECIPE.name = "Farm - Orange"
RECIPE.category = "Farms"
RECIPE.model = "models/props_junk/terracotta01.mdl"
RECIPE.desc = "A strange pot, the dirt in it gives off a dim light."
 
RECIPE.items = {
	["j_scrap_plastics"] = 5,
	["j_scrap_organic"] = 5,
	["j_scrap_concrete"] = 2,
	["food_orange"] = 1,
	["shard_dust"] = 1
}
RECIPE.result = {
	["farm_orange"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_farm_lemon"
RECIPE.name = "Farm - Lemon"
RECIPE.category = "Farms"
RECIPE.model = "models/props_junk/terracotta01.mdl"
RECIPE.desc = "A strange pot, the dirt in it gives off a dim light."
 
RECIPE.items = {
	["j_scrap_plastics"] = 5,
	["j_scrap_organic"] = 5,
	["j_scrap_concrete"] = 2,
	["food_lemon"] = 1,
	["shard_dust"] = 1
}
RECIPE.result = {
	["farm_lemon"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_farm_banana"
RECIPE.name = "Farm - Banana"
RECIPE.category = "Farms"
RECIPE.model = "models/props_junk/terracotta01.mdl"
RECIPE.desc = "A strange pot, the dirt in it gives off a dim light."
 
RECIPE.items = {
	["j_scrap_plastics"] = 5,
	["j_scrap_organic"] = 5,
	["j_scrap_concrete"] = 2,
	["food_banana"] = 1,
	["shard_dust"] = 1
}
RECIPE.result = {
	["farm_banana"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_farm_melon"
RECIPE.name = "Farm - Melon"
RECIPE.category = "Farms"
RECIPE.model = "models/props_junk/terracotta01.mdl"
RECIPE.desc = "A strange pot, the dirt in it gives off a dim light."
 
RECIPE.items = {
	["j_scrap_plastics"] = 8,
	["j_scrap_organic"] = 8,
	["j_scrap_concrete"] = 3,
	["food_melon"] = 1,
	["shard_dust"] = 1
}
RECIPE.result = {
	["farm_melon"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_farm_pumpkin"
RECIPE.name = "Farm - Pumpkin"
RECIPE.category = "Farms"
RECIPE.model = "models/props_junk/terracotta01.mdl"
RECIPE.desc = "A strange pot, the dirt in it gives off a dim light."
 
RECIPE.items = {
	["j_scrap_plastics"] = 8,
	["j_scrap_organic"] = 8,
	["j_scrap_concrete"] = 3,
	["food_pumpkin"] = 1,
	["shard_dust"] = 1
}
RECIPE.result = {
	["farm_pumpkin"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_farm_cactus"
RECIPE.name = "Farm - Cactus"
RECIPE.category = "Farms"
RECIPE.model = "models/props_junk/terracotta01.mdl"
RECIPE.desc = "A strange pot, the dirt in it gives off a dim light."
 
RECIPE.items = {
	["j_scrap_plastics"] = 5,
	["j_scrap_organic"] = 5,
	["j_scrap_concrete"] = 2,
	["j_cactus_plant"] = 1,
	["shard_dust"] = 1
}
RECIPE.result = {
	["farm_cactus"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_fishing_pole"
RECIPE.name = "Fishing Pole"
RECIPE.category = "Fishing"
RECIPE.model = "models/props_junk/harpoon002a.mdl"
RECIPE.desc = "A pole with a line and a reel attached to it."
 
RECIPE.items = {
	["j_scrap_cloth"] = 2,
	["j_scrap_wood"] = 5,
	["j_scrap_metals"] = 3,
	["j_scrap_adhesive"] = 1,
	["shard_dust"] = 1
}
RECIPE.result = {
	["fishing_pole"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_brewery"
RECIPE.name = "Brewery"
RECIPE.category = "Machines"
RECIPE.model = "models/props_c17/trappropeller_engine.mdl"
RECIPE.desc = "A large metallic object, it seems to have a chip slot and a circular hole."
 
RECIPE.items = {
	["hl2_m_pipe"] = 2,
	["j_scrap_plastics"] = 5,
	["j_scrap_metals"] = 5,
	["j_scrap_adhesive"] = 1,
	["cube_chip_enhanced"] = 1
}
RECIPE.result = {
	["brewery"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_yams_mysterious"
RECIPE.name = "Mysterious Yams"
RECIPE.category = "Mysterious"
RECIPE.model = "models/props_junk/garbage_metalcan001a.mdl"
RECIPE.desc = "???"
 
RECIPE.items = {
	["food_yams"] = 1,
	["j_scrap_memory"] = 10
}
RECIPE.result = {
	["food_yams_mysterious"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_salvager"
RECIPE.name = "Salvager Kit"
RECIPE.category = "Machines"
RECIPE.model = "models/props_c17/suitcase_passenger_physics.mdl"
RECIPE.desc = "A strange metallic device. It appears to be vibrating slightly."
 
RECIPE.items = {
	["blight"] = 2,
	["j_scrap_memory"] = 5,
	["j_scrap_metals"] = 10,
}
RECIPE.result = {
	["kit_salvager"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_hammer"
RECIPE.name = "Carpenter Hammer"
RECIPE.category = "Tools"
RECIPE.model = "models/warz/melee/hammer.mdl"
RECIPE.desc = "A tool used to apply blunt force."
 
RECIPE.items = {
	["j_scrap_metals"] = 5,
	["j_scrap_wood"] = 5
}
RECIPE.result = {
	["hl2_m_hammer"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_wrench"
RECIPE.name = "Wrench"
RECIPE.category = "Tools"
RECIPE.model = "models/warz/melee/wrench.mdl"
RECIPE.desc = "A useful metal tool."
 
RECIPE.items = {
	["j_scrap_metals"] = 8
}
RECIPE.result = {
	["hl2_m_wrench"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_generator_chip"
RECIPE.name = "Peculiar Generator"
RECIPE.category = "Machines"
RECIPE.model = "models/props_combine/combine_mine01.mdl"
RECIPE.desc = "A strange contraption, it seems to have some kind of small opening in the middle. Its center is raised above the ground slightly, and underneath it there is another small opening."
 
RECIPE.items = {
	["j_scrap_screws"] = 4,
	["j_scrap_adhesive"] = 2,
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 12,
	["cube_chip"] = 4
}
RECIPE.result = {
	["generator_chip"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cloth"
RECIPE.name = "Cloth"
RECIPE.category = "Resources"
RECIPE.model = "models/props_lab/box01a.mdl"
RECIPE.desc = "Makeshift cloth."
 
RECIPE.items = {
	["misc_paper"] = 2
}
RECIPE.result = {
	["j_scrap_cloth"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_paper"
RECIPE.name = "Paper"
RECIPE.category = "Miscellaneous"
RECIPE.model = "models/props_c17/paper01.mdl"
RECIPE.desc = "Makeshift paper."
 
RECIPE.items = {
	["j_scrap_cloth"] = 2
}
RECIPE.result = {
	["misc_paper"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_converter"
RECIPE.name = "Device - Converter"
RECIPE.category = "Machines"
RECIPE.model = "models/hunter/blocks/cube05x05x05.mdl"
RECIPE.desc = "A device capable of turning plastic food into regular food."
 
RECIPE.items = {
	["j_scrap_plastics"] = 12,
	["j_scrap_concrete"] = 5,
	["shard_dust"] = 1
}
RECIPE.result = {
	["converter"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_sacrificial_skull"
RECIPE.name = "Mysterious Skull"
RECIPE.category = "Mysterious"
RECIPE.model = "models/Gibs/HGIBS.mdl"
RECIPE.desc = "???"
 
RECIPE.items = {
	["blight"] = 5,
	["j_skull"] = 1
}
RECIPE.result = {
	["sacrificial_skull"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_comm_signal"
RECIPE.name = "Signalling Device"
RECIPE.category = "Communication"
RECIPE.model = "models/gibs/shield_scanner_gib1.mdl"
RECIPE.desc = "A device that allows you to send a simple signal to others far away."
 
RECIPE.items = {
	["j_scrap_elecs"] = 3,
	["j_scrap_metals"] = 5,
	["j_scrap_adhesive"] = 1,
	["j_scrap_screws"] = 1
}
RECIPE.result = {
	["comm_signal"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_skull"
RECIPE.name = "Skull"
RECIPE.category = "Miscellaneous"
RECIPE.model = "models/Gibs/hgibs.mdl"
RECIPE.desc = "A skull made out of other bones."
 
RECIPE.items = {
	["j_scrap_bone"] = 5
}
RECIPE.result = {
	["j_skull"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_plank"
RECIPE.name = "Wooden Plank"
RECIPE.category = "Refined"
RECIPE.model = "models/props_debris/wood_board04a.mdl"
RECIPE.desc = "A nice chunk of wood."
 
RECIPE.items = {
	["j_scrap_wood"] = 5
}
RECIPE.result = {
	["hl2_m_plank"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_fuel"
RECIPE.name = "Fuel"
RECIPE.category = "Refined"
RECIPE.model = "models/props_junk/gascan001a.mdl"
RECIPE.desc = "A can of fuel for anything that needs to be fueled."
 
RECIPE.items = {
	["j_scrap_chems"] = 5,
	["cube_chip"] = 1
}
RECIPE.result = {
	["j_fuel"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_mystery_box"
RECIPE.name = "Mystery Box"
RECIPE.category = "Mysterious"
RECIPE.model = "models/Items/item_item_crate.mdl"
RECIPE.desc = "???"
 
RECIPE.items = {
	["cube_chip"] = 3,
	["cube_chip_enhanced"] = 1,
	["j_scrap_wood"] = 10,
	["j_scrap_metals"] = 10,
}
RECIPE.result = {
	["mystery_box"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_shard"
RECIPE.name = "Shard"
RECIPE.category = "Mysterious"
RECIPE.model = "models/gibs/glass_shard04.mdl"
RECIPE.desc = "A peculiar crystalline shard, it emits a dim white light."
 
RECIPE.items = {
	["shard_dust"] = 6
}
RECIPE.result = {
	["shard"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_drill"
RECIPE.name = "Power Drill"
RECIPE.category = "Tools"
RECIPE.model = "models/warz/melee/powerdrill.mdl"
RECIPE.desc = "An electric drill. (This is not a weapon.)"
 
RECIPE.items = {
	["j_scrap_metals"] = 3,
	["j_scrap_plastics"] = 3,
	["j_scrap_elecs"] = 2,
	["j_scrap_screws"] = 2,
}
RECIPE.result = {
	["j_drill"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_saw"
RECIPE.name = "Power Saw"
RECIPE.category = "Tools"
RECIPE.model = "models/props/cs_militia/circularsaw01.mdl"
RECIPE.desc = "An electric saw, it won't work without electricity. (This is not a weapon.)"
 
RECIPE.items = {
	["j_scrap_metals"] = 5,
	["j_scrap_plastics"] = 3,
	["j_scrap_elecs"] = 2,
	["j_scrap_screws"] = 2
}
RECIPE.result = {
	["j_power_saw"] = 1
}
RECIPES:Register( RECIPE )

//
RECIPE = {}
RECIPE.uid = "nut_plastics"
RECIPE.name = "Plastic"
RECIPE.category = "Resources"
RECIPE.model = "models/props_wasteland/prison_toiletchunk01a.mdl"
RECIPE.desc = "A chunk of plastic."
 
RECIPE.items = {
	["medical_plastic"] = 1,
	["food_water_misc"] = 1
}
RECIPE.result = {
	["j_scrap_plastics"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_lightbulb"
RECIPE.name = "Light Bulb"
RECIPE.category = "Resources"
RECIPE.model = "models/props_lab/box01a.mdl"
RECIPE.desc = "A bulb that creates light when hooked to a power source."
 
RECIPE.items = {
	["j_scrap_elecs"] = 1,
	["j_scrap_glass"] = 2
}
RECIPE.result = {
	["j_scrap_light"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_binoculars"
RECIPE.name = "Binoculars"
RECIPE.category = "Miscellaneous"
RECIPE.model = "models/warz/items/binocs.mdl"
RECIPE.desc = "A pair of binoculars."
 
RECIPE.items = {
	["j_scrap_plastics"] = 5,
	["j_scrap_glass"] = 5
}
RECIPE.result = {
	["j_binoculars"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_nightmare"
RECIPE.name = "Nightmare"
RECIPE.category = "Mysterious"
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.desc = "???"
 
RECIPE.items = {
	["drug_sleepingpills"] = 2,
	["j_scrap_memory"] = 5
}
RECIPE.result = {
	["drug_nightmare"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_bars"
RECIPE.name = "Blackened Bars"
RECIPE.category = "Mysterious"
RECIPE.model = "models/props_trainstation/handrail_64decoration001a.mdl"
RECIPE.desc = "???"
 
RECIPE.items = {
	["sacrificial_skull"] = 2,
	["j_scrap_memory"] = 10
}
RECIPE.result = {
	["bars"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_bottle"
RECIPE.name = "Glass Bottle"
RECIPE.category = "Refined"
RECIPE.model = "models/props_trainstation/handrail_64decoration001a.mdl"
RECIPE.desc = "An empty glass bottle capable of containing liquids."
 
RECIPE.items = {
	["j_scrap_glass"] = 5
}
RECIPE.result = {
	["j_empty_water"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_teapot"
RECIPE.name = "TeaPot"
RECIPE.category = "Refined"
RECIPE.model = "models/props_interiors/pot01a.mdl"
RECIPE.desc = "An empty teapot."
 
RECIPE.items = {
	["j_scrap_metals"] = 3
}
RECIPE.result = {
	["j_empty_teapot"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_syringe"
RECIPE.name = "Glass Syringe"
RECIPE.category = "Refined"
RECIPE.model = "models/warz/items/syringe.mdl"
RECIPE.desc = "A simple pump consisting of a plunger that fits tightly in a tube."
 
RECIPE.items = {
	["j_scrap_glass"] = 3,
	["j_scrap_rubber"] = 1
}
RECIPE.result = {
	["j_syringe"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_paint"
RECIPE.name = "Paint"
RECIPE.category = "Refined"
RECIPE.model = "models/props_junk/metal_paintcan001a.mdl"
RECIPE.desc = "A can filled with paint."
 
RECIPE.items = {
	["j_scrap_chems"] = 2
}
RECIPE.result = {
	["j_paint_can"] = 1
}
RECIPES:Register( RECIPE )
//
local RECIPE = {}
RECIPE.uid = "nut_bleach"
RECIPE.name = "Bleach"
RECIPE.category = "Miscellaneous"
RECIPE.model = "models/props_junk/garbage_plasticbottle001a.mdl"
RECIPE.desc = "Cleaning solution often used for disinfecting surfaces."

RECIPE.items = {
	["j_scrap_chems"] = 2,
	["j_scrap_plastics"] = 1,
}
RECIPE.result = {
	["bleach"] = 1
}

RECIPES:Register(RECIPE)