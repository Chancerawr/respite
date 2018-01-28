local PLUGIN = PLUGIN

local RECIPE1 = {}
RECIPE1.uid = "nut_flare_red"
RECIPE1.name = "Flare - Red"
RECIPE1.category = "Light Sources"
RECIPE1.model = Model( "models/Items/grenadeAmmo.mdl" )
RECIPE1.desc = "A flare."
RECIPE1.noBlueprint = true
RECIPE1.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 10,
	["j_scrap_adhesive"] = 1,
}
RECIPE1.result = {
	["nut_flare"] = 1
}
RECIPES:Register( RECIPE1 )
//
local RECIPE2 = {}
RECIPE2.uid = "nut_glowstick_red"
RECIPE2.name = "Glowstick - Red"
RECIPE2.category = "Light Sources"
RECIPE2.model = Model( "models/glowstick/stick_red.mdl" )
RECIPE2.desc = "A glowstick."
RECIPE2.noBlueprint = true
RECIPE2.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_plastics"] = 10,
	["j_scrap_adhesive"] = 1,
}
RECIPE2.result = {
	["weapon_glowstick_red"] = 1
}
RECIPES:Register( RECIPE2 )
//
local RECIPE3 = {}
RECIPE3.uid = "nut_grenade_flash"
RECIPE3.name = "Flashbang"
RECIPE3.category = "Grenades"
RECIPE3.model = Model( "models/Items/grenadeAmmo.mdl" )
RECIPE3.desc = "A grenade used for stunning and disorienting those affected."
RECIPE3.noBlueprint = true
RECIPE3.items = {
	["j_scrap_chems"] = 2,
	["j_scrap_metals"] = 20,
	["j_scrap_adhesive"] = 2,
}
RECIPE3.result = {
	["nut_flashgrenade"] = 1
}
RECIPES:Register( RECIPE3 )
//
local RECIPE4 = {}
RECIPE4.uid = "nut_radio_station"
RECIPE4.name = "Stationary Radio"
RECIPE4.category = "Communication"
RECIPE4.model = Model( "models/props_lab/citizenradio.mdl" )
RECIPE4.desc = "A stationary radio."
RECIPE4.noBlueprint = true
RECIPE4.items = {
	["j_scrap_elecs"] = 12,
	["j_scrap_metals"] = 25,
	["j_scrap_adhesive"] = 5,
	["j_scrap_screws"] = 6,
	["cube_chip"] = 5
}
RECIPE4.result = {
	["comm_radio_stationary"] = 1
}
RECIPES:Register( RECIPE4 )
//
local RECIPE5 = {}
RECIPE5.uid = "nut_ziptie"
RECIPE5.name = "Zip Ties"
RECIPE5.category = "Miscellaneous"
RECIPE5.model = Model( "models/Items/CrossbowRounds.mdl" )
RECIPE5.desc = "Some zip ties."
RECIPE5.noBlueprint = true
RECIPE5.items = {
	["j_scrap_plastics"] = 10
}
RECIPE5.result = {
	["ziptie"] = 1
}
RECIPES:Register( RECIPE5 )
//
local RECIPE6 = {}
RECIPE6.uid = "nut_flashlight"
RECIPE6.name = "Flashlight"
RECIPE6.category = "Light Sources"
RECIPE6.model = Model( "models/warz/melee/flashlight.mdl" )
RECIPE6.desc = "A flashlight."
RECIPE6.noBlueprint = true
RECIPE6.items = {
	["j_scrap_metals"] = 14,
	["j_scrap_adhesive"] = 1,
	["j_scrap_battery"] = 2,
	["j_scrap_light"] = 1,
	["cube_chip"] = 1
}
RECIPE6.result = {
	["flashlight"] = 1
}
RECIPES:Register( RECIPE6 )
//
local RECIPE7 = {}
RECIPE7.uid = "nut_radio"
RECIPE7.name = "Handheld Radio"
RECIPE7.category = "Communication"
RECIPE7.model = Model( "models/gibs/shield_scanner_gib1.mdl" )
RECIPE7.desc = "A handheld radio."
RECIPE7.noBlueprint = true
RECIPE7.items = {
	["cube_chip"] = 5,
	["comm_signal"] = 1
}
RECIPE7.result = {
	["comm_radio"] = 1
}
RECIPES:Register( RECIPE7 )
//
local RECIPE8 = {}
RECIPE8.uid = "nut_grenade_smoke"
RECIPE8.name = "Smoke Grenade"
RECIPE8.category = "Grenades"
RECIPE8.model = Model( "models/Items/grenadeAmmo.mdl" )
RECIPE8.desc = "A smoke grenade."
RECIPE8.noBlueprint = true
RECIPE8.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 8,
	["j_scrap_adhesive"] = 2,
}
RECIPE8.result = {
	["nut_smokegrenade"] = 1
}
RECIPES:Register( RECIPE8 )
//
local RECIPE9 = {}
RECIPE9.uid = "nut_grenade_tear"
RECIPE9.name = "Tear Gas Grenade"
RECIPE9.category = "Grenades"
RECIPE9.model = Model( "models/Items/grenadeAmmo.mdl" )
RECIPE9.desc = "A tear gas grenade."
RECIPE9.noBlueprint = true
RECIPE9.items = {
	["j_scrap_chems"] = 5,
	["j_scrap_metals"] = 15,
	["j_scrap_adhesive"] = 2,
}
RECIPE9.result = {
	["nut_teargas"] = 1
}
RECIPES:Register( RECIPE9 )
//
local RECIPE10 = {}
RECIPE10.uid = "nut_grenade_frag"
RECIPE10.name = "Explosive Grenade"
RECIPE10.category = "Grenades"
RECIPE10.model = Model( "models/Items/grenadeAmmo.mdl" )
RECIPE10.desc = "An explosive grenade."
RECIPE10.noBlueprint = true
RECIPE10.items = {
	["j_scrap_chems"] = 10,
	["j_scrap_metals"] = 20,
	["j_scrap_adhesive"] = 10,
}
RECIPE10.result = {
	["nut_explosivegrenade"] = 1
}
RECIPES:Register( RECIPE10 )
//
local RECIPE11 = {}
RECIPE11.uid = "nut_bat_nailed"
RECIPE11.name = "Nailed Bat"
RECIPE11.category = "Weapons - Melee"
RECIPE11.model = Model( "models/warz/melee/baseballbat_spike.mdl" )
RECIPE11.desc = "A nailed bat."
RECIPE11.noBlueprint = true
RECIPE11.items = {
	["j_scrap_nails"] = 10,
	["hl2_m_bat"] = 1
}
RECIPE11.result = {
	["hl2_m_batnail"] = 1
}
RECIPES:Register( RECIPE11 )
//
local RECIPE12 = {}
RECIPE12.uid = "nut_lantern"
RECIPE12.name = "Lantern"
RECIPE12.category = "Light Sources"
RECIPE12.model = Model( "models/weapons/cof/w_lantern.mdl" )
RECIPE12.desc = "A lantern."
RECIPE12.noBlueprint = true
RECIPE12.items = {
	["j_scrap_light"] = 2,
	["j_scrap_metals"] = 15,
	["j_scrap_adhesive"] = 3,
	["j_scrap_battery"] = 5,
	["cube_chip"] = 2
}
RECIPE12.result = {
	["coflantern"] = 1
}
RECIPES:Register( RECIPE12 )
//
local RECIPE13 = {}
RECIPE13.uid = "nut_beacon_red"
RECIPE13.name = "Beacon - Red"
RECIPE13.category = "Light Sources"
RECIPE13.model = Model( "models/Items/grenadeammo.mdl" )
RECIPE13.desc = "A red beacon used for signalling or illumination."
RECIPE13.noBlueprint = true
RECIPE13.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 10,
	["j_scrap_adhesive"] = 1,
	["j_scrap_screws"] = 2
}
RECIPE13.result = {
	["nut_beacon"] = 1
}
RECIPES:Register( RECIPE13 )
//
local RECIPE14 = {}
RECIPE14.uid = "nut_grenade_molotov"
RECIPE14.name = "Molotov Cocktail"
RECIPE14.category = "Grenades"
RECIPE14.model = Model( "models/props_junk/garbage_glassbottle003a.mdl" )
RECIPE14.desc = "A molotov cocktail."
RECIPE14.noBlueprint = true
RECIPE14.items = {
	["j_scrap_chems"] = 2,
	["j_scrap_glass"] = 2,
	["j_scrap_cloth"] = 2
}
RECIPE14.result = {
	["molotov"] = 1
}
RECIPES:Register( RECIPE14 )
//
local RECIPE16 = {}
RECIPE16.uid = "nut_bandages"
RECIPE16.name = "Bandages"
RECIPE16.category = "Medical"
RECIPE16.model = Model( "models/props_lab/box01a.mdl" )
RECIPE16.desc = "A box of bandages."
RECIPE16.noBlueprint = true
RECIPE16.items = {
	["j_scrap_cloth"] = 8
}
RECIPE16.result = {
	["medical_bandages"] = 1
}
RECIPES:Register( RECIPE16 )
//
local RECIPE17 = {}
RECIPE17.uid = "nut_makeshift_spear"
RECIPE17.name = "Makeshift Spear"
RECIPE17.category = "Weapons - Melee"
RECIPE17.model = Model( "models/props_debris/wood_chunk03e.mdl" )
RECIPE17.desc = "A board with a sharpened piece of metal on it."
RECIPE17.noBlueprint = true
RECIPE17.items = {
	["j_scrap_metals"] = 5,
	["j_scrap_wood"] = 20
}
RECIPE17.result = {
	["hl2_m_makeshift_spear"] = 1
}
RECIPES:Register( RECIPE17 )
//
local RECIPE18 = {}
RECIPE18.uid = "nut_breach"
RECIPE18.name = "Explosive Breach"
RECIPE18.category = "Explosive"
RECIPE18.model = Model( "models/props_lab/powerbox02c.mdl" )
RECIPE18.desc = "An explosive device that can be used to blow open doors."
RECIPE18.noBlueprint = true
RECIPE18.items = {
	["j_scrap_metals"] = 10,
	["nut_explosivegrenade"] = 1
}
RECIPE18.result = {
	["breach"] = 1
}
RECIPES:Register( RECIPE18 )
//
local RECIPE19 = {}
RECIPE19.uid = "nut_ammo_919"
RECIPE19.name = "9x19mm Ammo"
RECIPE19.category = "Ammunition"
RECIPE19.model = Model( "models/Items/boxsrounds.mdl" )
RECIPE19.desc = "Makeshift 9x19mm Ammo suitable for a variety of firearms."
RECIPE19.noBlueprint = true
RECIPE19.items = {
	["j_scrap_metals"] = 10,
	["cube_chip"] = 2
}
RECIPE19.result = {
	["ammo_919"] = 1
}
RECIPES:Register( RECIPE19 )
//
local RECIPE20 = {}
RECIPE20.uid = "nut_ammo_45"
RECIPE20.name = ".45 ACP Ammo"
RECIPE20.category = "Ammunition"
RECIPE20.model = Model( "models/items/boxmrounds.mdl" )
RECIPE20.desc = "Makeshift .45 ACP ammo."
RECIPE20.noBlueprint = true
RECIPE20.items = {
	["j_scrap_metals"] = 12,
	["cube_chip"] = 2
}
RECIPE20.result = {
	["ammo_45"] = 1
}
RECIPES:Register( RECIPE20 )
//
local RECIPE21 = {}
RECIPE21.uid = "nut_ammo_40sw"
RECIPE21.name = ".40 S&W Ammo"
RECIPE21.category = "Ammunition"
RECIPE21.model = Model( "models/items/357ammo.mdl" )
RECIPE21.desc = "Makeshift .40 S&W ammo."
RECIPE21.noBlueprint = true
RECIPE21.items = {
	["j_scrap_metals"] = 10,
	["cube_chip"] = 2
}
RECIPE21.result = {
	["ammo_40sw"] = 1
}
RECIPES:Register( RECIPE21 )
//
local RECIPE22 = {}
RECIPE22.uid = "nut_ammo_5728"
RECIPE22.name = "5.7x28mm Ammo"
RECIPE22.category = "Ammunition"
RECIPE22.model = Model( "models/items/boxmrounds.mdl" )
RECIPE22.desc = "Makeshift 5.7x28mm ammo made from scrap materials."
RECIPE22.noBlueprint = true
RECIPE22.items = {
	["j_scrap_metals"] = 12,
	["cube_chip"] = 2
}
RECIPE22.result = {
	["ammo_5728"] = 1
}
RECIPES:Register( RECIPE22 )
//
local RECIPE23 = {}
RECIPE23.uid = "nut_ammo_357"
RECIPE23.name = ".357 Ammo"
RECIPE23.category = "Ammunition"
RECIPE23.model = Model( "models/items/357ammo.mdl" )
RECIPE23.desc = "Makeshift .357 rounds made from scrap materials."
RECIPE23.noBlueprint = true
RECIPE23.items = {
	["j_scrap_metals"] = 12,
	["cube_chip"] = 3
}
RECIPE23.result = {
	["ammo_357"] = 1
}
RECIPES:Register( RECIPE23 )
//
local RECIPE24 = {}
RECIPE24.uid = "nut_colt1911"
RECIPE24.name = "Makeshift Colt 1911"
RECIPE24.category = "Weapons"
RECIPE24.model = Model( "models/weapons/tfa_w_dmgf_co1911.mdl" )
RECIPE24.desc = "A pistol made out of scrap metal and other odds and ends."
RECIPE24.noBlueprint = true
RECIPE24.items = {
	["j_scrap_metals"] = 15,
	["j_scrap_rubber"] = 10,
	["j_scrap_plastics"] = 10,
	["j_scrap_screws"] = 5,
	["j_scrap_chems"] = 10,
	["cube_chip"] = 20
}
RECIPE24.result = {
	["tfa_colt1911_makeshift"] = 1
}
RECIPES:Register( RECIPE24 )
//
local RECIPE25 = {}
RECIPE25.uid = "nut_flashlight_shard"
RECIPE25.name = "Shardlight"
RECIPE25.category = "Light Sources"
RECIPE25.model = Model( "models/warz/melee/flashlight.mdl" )
RECIPE25.desc = "A flashlight that uses a shard as a power source, rather than a battery."
RECIPE25.noBlueprint = true
RECIPE25.items = {
	["j_scrap_metals"] = 6,
	["j_scrap_adhesive"] = 4,
	["shard_dust"] = 1
}
RECIPE25.result = {
	["flashlight_shard"] = 1
}
RECIPES:Register( RECIPE25 )
//
local RECIPE26 = {}
RECIPE26.uid = "nut_pipe"
RECIPE26.name = "Metal Pipe"
RECIPE26.category = "Refined"
RECIPE26.model = Model( "models/props_canal/mattpipe.mdl" )
RECIPE26.desc = "A pipe made out of metal."
RECIPE26.noBlueprint = true
RECIPE26.items = {
	["j_scrap_metals"] = 10
}
RECIPE26.result = {
	["hl2_m_pipe"] = 1
}
RECIPES:Register( RECIPE26 )
//
local RECIPE27 = {}
RECIPE27.uid = "nut_slamfire"
RECIPE27.name = "Slamfire Shotgun"
RECIPE27.category = "Weapons"
RECIPE27.model = Model( "models/props_lab/pipesystem01b.mdl" )
RECIPE27.desc = "A makeshift shotgun fashioned out of two pipes."
RECIPE27.noBlueprint = true
RECIPE27.items = {
	["hl2_m_pipe"] = 2,
	["j_scrap_adhesive"] = 2,
	["j_scrap_screws"] = 2,
	["cube_chip"] = 5	
}
RECIPE27.result = {
	["makeshift_slamfire"] = 1
}
RECIPES:Register( RECIPE27 )
//
local RECIPE28 = {}
RECIPE28.uid = "nut_makeshift_sword"
RECIPE28.name = "Makeshift Sword"
RECIPE28.category = "Weapons - Melee"
RECIPE28.model = Model( "models/props_debris/wood_chunk03e.mdl" )
RECIPE28.desc = "A hunk of sharpened scrap metal."
RECIPE28.noBlueprint = true
RECIPE28.items = {
	["j_scrap_metals"] = 25
}
RECIPE28.result = {
	["hl2_m_makeshift_sword"] = 1
}
RECIPES:Register( RECIPE28 )
//
local RECIPE29 = {}
RECIPE29.uid = "nut_makeshift_shiv_glass"
RECIPE29.name = "Glass Shiv"
RECIPE29.category = "Weapons - Melee"
RECIPE29.model = Model( "models/gibs/glass_shard04.mdl" )
RECIPE29.desc = "A shiv made out of broken glass."
RECIPE29.noBlueprint = true
RECIPE29.items = {
	["j_scrap_glass"] = 10
}
RECIPE29.result = {
	["hl2_m_glassshiv"] = 1
}
RECIPES:Register( RECIPE29 )
//
local RECIPE30 = {}
RECIPE30.uid = "nut_cr1ka"
RECIPE30.name = "CR-1KA"
RECIPE30.category = "Weapons"
RECIPE30.model = Model( "models/weapons/tfa_w_winchester_1873.mdl" )
RECIPE30.desc = "A makeshift rifle made out of scrap parts."
RECIPE30.noBlueprint = true
RECIPE30.items = {
	["j_scrap_screws"] = 3,
	["j_scrap_wood"] = 25,
	["j_scrap_metals"] = 25,
	["j_scrap_plastics"] = 8,
	["j_scrap_adhesive"] = 3,
	["j_scrap_chems"] = 2,
	["cube_chip"] = 8,	
	["comp_reinforced_barrel"] = 1
}
RECIPE30.result = {
	["tfa_cr1ka"] = 1
}
RECIPES:Register( RECIPE30 )
//
local RECIPE31 = {}
RECIPE31.uid = "nut_splint"
RECIPE31.name = "Makeshift Splint"
RECIPE31.category = "Medical"
RECIPE31.model = Model( "models/props_junk/wood_crate001a_chunk05.mdl" )
RECIPE31.desc = "A makeshift splint for medical use."
RECIPE31.noBlueprint = true
RECIPE31.items = {
	["j_scrap_wood"] = 10
}
RECIPE31.result = {
	["medical_splint"] = 1
}
RECIPES:Register( RECIPE31 )
//
local RECIPE32 = {}
RECIPE32.uid = "nut_ivbag"
RECIPE32.name = "Makeshift IV Bag"
RECIPE32.category = "Medical"
RECIPE32.model = Model( "models/props_junk/garbage_bag001a.mdl" )
RECIPE32.desc = "Fluids not included."
RECIPE32.noBlueprint = true
RECIPE32.items = {
	["j_scrap_plastics"] = 15,
	["j_scrap_adhesive"] = 2
}
RECIPE32.result = {
	["medical_iv"] = 1
}
RECIPES:Register( RECIPE32 )
//
local RECIPE33 = {}
RECIPE33.uid = "nut_gauze"
RECIPE33.name = "Gauze"
RECIPE33.category = "Medical"
RECIPE33.model = Model( "models/props_lab/box01a.mdl" )
RECIPE33.desc = "Some makeshift gauze."
RECIPE33.noBlueprint = true
RECIPE33.items = {
	["j_scrap_cloth"] = 20
}
RECIPE33.result = {
	["medical_gauze"] = 1
}
RECIPES:Register( RECIPE33 )
//
local RECIPE34 = {}
RECIPE34.uid = "nut_orgconverter"
RECIPE34.name = "Organic Converter"
RECIPE34.category = "Machines"
RECIPE34.model = Model( "models/props_c17/grinderclamp01a.mdl" )
RECIPE34.desc = "A peculiar tool with a climb and a lever."
RECIPE34.noBlueprint = true
RECIPE34.items = {
	["j_meat_grinder"] = 1,
	["cure"] = 10,
	["j_scrap_organic"] = 10
}
RECIPE34.result = {
	["converter_meat"] = 1
}
RECIPES:Register( RECIPE34 )
//
local RECIPE35 = {}
RECIPE35.uid = "nut_adhesive"
RECIPE35.name = "Adhesive"
RECIPE35.category = "Resources"
RECIPE35.model = Model( "models/props_lab/jar01a.mdl" )
RECIPE35.desc = "A resource used for crafting and other things."
RECIPE35.noBlueprint = true
RECIPE35.items = {
	["j_scrap_organic"] = 10
}
RECIPE35.result = {
	["j_scrap_adhesive"] = 1
}
RECIPES:Register( RECIPE35 )
//
local RECIPE36 = {}
RECIPE36.uid = "nut_cp1ka"
RECIPE36.name = "CP-1KA"
RECIPE36.category = "Weapons"
RECIPE36.model = Model( "models/weapons/tfa_w_dmgf_co1911.mdl" )
RECIPE36.desc = "A pistol made out of scrap parts."
RECIPE36.noBlueprint = true
RECIPE36.items = {
	["comp_firing_mechanism"] = 1,
	["j_scrap_screws"] = 2,
	["j_scrap_plastics"] = 10,
	["j_scrap_chems"] = 3,
	["j_scrap_metals"] = 25,
	["cube_chip"] = 6,
	["hl2_m_pipe"] = 1
}
RECIPE36.result = {
	["tfa_cp1ka"] = 1
}
RECIPES:Register( RECIPE36 )
//
local RECIPE37 = {}
RECIPE37.uid = "nut_crunt"
RECIPE37.name = "CR-UNT"
RECIPE37.category = "Weapons - Modifications"
RECIPE37.model = Model( "models/weapons/tfa_w_snip_m24_6.mdl" )
RECIPE37.desc = "A makeshift triple barrel bolt action shotgun looking to be built by retrofitting and installing new and more complex parts to the more common CR series rifle. Designed to help deal alot of damage to large creatures in one hit."
RECIPE37.noBlueprint = true
RECIPE37.items = {
	["tfa_cr1ka"] = 1,
	["j_scrap_screws"] = 2,
	["j_scrap_chems"] = 2,
	["j_scrap_metals"] = 15,
	["j_scrap_wood"] = 8,
	["j_scrap_plastics"] = 12,
	["cube_chip"] = 5,	
	["comp_reinforced_barrel"] = 2
}
RECIPE37.result = {
	["tfa_crunt"] = 1
}
RECIPES:Register( RECIPE37 )
//
local RECIPE38 = {}
RECIPE38.uid = "nut_cross"
RECIPE38.name = "CR-OSS"
RECIPE38.category = "Weapons - Modifications"
RECIPE38.model = Model( "models/weapons/tfa_w_snip_m24_6.mdl" )
RECIPE38.desc = "A rigid robust high calibre rifle looking to be built by retrofitting and installing new and more complex parts to the more common CR series rifle. Designed to deliver a single precise and accurate shot at range."
RECIPE38.noBlueprint = true
RECIPE38.items = {
	["tfa_cr2ka"] = 1,
	["j_scrap_adhesive"] = 2,
	["j_scrap_rubber"] = 8,
	["j_scrap_glass"] = 22,
	["j_scrap_chems"] = 6,
	["j_scrap_plastics"] = 8,
	["cube_chip"] = 5,	
	["comp_reinforced_barrel"] = 2
}
RECIPE38.result = {
	["tfa_cross"] = 1
}
RECIPES:Register( RECIPE38 )
//
local RECIPE39 = {}
RECIPE39.uid = "nut_cr3st"
RECIPE39.name = "CR-3ST"
RECIPE39.category = "Weapons"
RECIPE39.model = Model( "models/weapons/tfa_w_g2_contender.mdl" )
RECIPE39.desc = "A compact makeshift break action single shot shotgun built from various scrap parts. Designed to give someone a compact package capable of delivering a fair kick in a stand-off situation."
RECIPE39.noBlueprint = true
RECIPE39.items = {
	["j_scrap_rubber"] = 4,
	["comp_firing_mechanism"] = 1,
	["j_scrap_plastics"] = 6,
	["j_scrap_chems"] = 3,
	["j_scrap_metals"] = 25,
	["j_scrap_wood"] = 25,
	["cube_chip"] = 8,
	["hl2_m_pipe"] = 1
}
RECIPE39.result = {
	["tfa_cr3st"] = 1
}
RECIPES:Register( RECIPE39 )
//
local RECIPE40 = {}
RECIPE40.uid = "nut_crude"
RECIPE40.name = "CR-UDE"
RECIPE40.category = "Weapons"
RECIPE40.model = Model( "models/weapons/tfa_w_colt_python.mdl" )
RECIPE40.desc = "A three round revolver made from various scrap parts. What looked like the hammer at first glance would turn out to be some strange rudimentary safety lever."
RECIPE40.noBlueprint = true
RECIPE40.items = {
	["j_scrap_rubber"] = 4,
	["comp_firing_mechanism"] = 1,
	["j_scrap_metals"] = 10,
	["j_scrap_wood"] = 8,
	["cube_chip"] = 5,
	["hl2_m_pipe"] = 1
}
RECIPE40.result = {
	["tfa_crude"] = 1
}
RECIPES:Register( RECIPE40 )
//
local RECIPE41 = {}
RECIPE41.uid = "nut_antidepressants"
RECIPE41.name = "Antidepressants"
RECIPE41.category = "Medical"
RECIPE41.model = Model( "models/props_lab/jar01b.mdl" )
RECIPE41.desc = "A small bottle filled with some pills."
RECIPE41.noBlueprint = true
RECIPE41.items = {
	["drug_depress"] = 1,
	["cure"] = 1
}
RECIPE41.result = {
	["drug_antidepressants"] = 1
}
RECIPES:Register( RECIPE41 )
//
local RECIPE42 = {}
RECIPE42.uid = "nut_ammo_12g"
RECIPE42.name = "12 Gauge Shells"
RECIPE42.category = "Ammunition"
RECIPE42.model = Model( "models/Items/boxbuckshot.mdl" )
RECIPE42.desc = "Makeshift 12 gauge shells made of scrap materials."
RECIPE42.noBlueprint = true
RECIPE42.items = {
	["j_scrap_metals"] = 20,
	["cube_chip"] = 4
}
RECIPE42.result = {
	["ammo_12g"] = 1
}
RECIPES:Register( RECIPE42 )
//
local RECIPE43 = {}
RECIPE43.uid = "nut_cr3s7"
RECIPE43.name = "CR-3S7"
RECIPE43.category = "Weapons - Modifications"
RECIPE43.model = Model( "models/weapons/tfa_w_g2_contender.mdl" )
RECIPE43.desc = "A makeshift break action single shot shotgun with a long barrel and stock built from various scrap parts. Appears to be based off the much more compact CR-3ST."
RECIPE43.noBlueprint = true
RECIPE43.items = {
	["j_scrap_chems"] = 2,
	["j_scrap_wood"] = 16,
	["cube_chip"] = 8,
	["tfa_cr3st"] = 1,
	["comp_reinforced_barrel"] = 1
}
RECIPE43.result = {
	["tfa_cr3s7"] = 1
}
RECIPES:Register( RECIPE43 )
//
local RECIPE44 = {}
RECIPE44.uid = "nut_cp1ko"
RECIPE44.name = "CP-1KO"
RECIPE44.category = "Weapons - Modifications"
RECIPE44.model = Model( "models/weapons/tfa_w_dmgf_co1911.mdl" )
RECIPE44.desc = "High capacity low calibre select fire pistol made from various scrap parts. Appears to be derived from the CP-1KA model."
RECIPE44.noBlueprint = true
RECIPE44.items = {
	["j_scrap_plastics"] = 4,
	["comp_firing_mechanism"] = 1,
	["cube_chip"] = 10,
	["tfa_cp1ka"] = 1,
	["comp_reinforced_barrel"] = 1
}
RECIPE44.result = {
	["tfa_cp1ko"] = 1
}
RECIPES:Register( RECIPE44 )
//
local RECIPE45 = {}
RECIPE45.uid = "nut_cr3s750"
RECIPE45.name = "CR-3S7-50"
RECIPE45.category = "Weapons - Modifications"
RECIPE45.model = Model( "models/weapons/tfa_w_g2_contender.mdl" )
RECIPE45.desc = "A makeshift break action single shot .50 BMG hunting rifle with a long barrel and stock built from various scrap parts. Appears to be based off the much more compact CR-3ST."
RECIPE45.noBlueprint = true
RECIPE45.items = {
	["j_scrap_plastics"] = 4,
	["j_scrap_chems"] = 8,
	["j_scrap_metals"] = 8,
	["j_scrap_wood"] = 16,
	["cube_chip"] = 12,
	["tfa_cr3st"] = 1,
	["comp_reinforced_barrel"] = 2
}
RECIPE45.result = {
	["tfa_cr3s750"] = 1
}
RECIPES:Register( RECIPE45 )
//
local RECIPE46 = {}
RECIPE46.uid = "nut_cp1ks"
RECIPE46.name = "CP-1KS"
RECIPE46.category = "Weapons"
RECIPE46.model = Model( "models/weapons/tfa_w_hk_mp5.mdl" )
RECIPE46.desc = "A fully automatic sub-machinegun made out of various scrap parts. Even with the thick forward grip on this gun, you can feel the barrel heating up after firing for extended periods of time."
RECIPE46.noBlueprint = true
RECIPE46.items = {
	["j_scrap_rubber"] = 6,
	["j_scrap_adhesive"] = 5,
	["j_scrap_screws"] = 8,
	["j_scrap_plastics"] = 25,
	["j_scrap_chems"] = 8,
	["j_scrap_metals"] = 25,
	["j_scrap_wood"] = 6,
	["cube_chip"] = 10,
	["hl2_m_pipe"] = 1
}
RECIPE46.result = {
	["tfa_cp1ks"] = 1
}
RECIPES:Register( RECIPE46 )
//
local RECIPE47 = {}
RECIPE47.uid = "nut_cp1cs"
RECIPE47.name = "CP-1CS"
RECIPE47.category = "Weapons - Modifications"
RECIPE47.model = Model( "models/weapons/tfa_w_hk_mp5.mdl" )
RECIPE47.desc = "A fully automatic sub-machinegun made out of various scrap parts. This variant has an extended barrel and a stock."
RECIPE47.noBlueprint = true
RECIPE47.items = {
	["j_scrap_rubber"] = 2,
	["j_scrap_chems"] = 12,
	["j_scrap_wood"] = 12,
	["cube_chip"] = 16,
	["tfa_cp1ks"] = 1,
	["comp_firing_mechanism"] = 1,
	["hl2_m_pipe"] = 1
}
RECIPE47.result = {
	["tfa_cp1cs"] = 1
}
RECIPES:Register( RECIPE47 )
//
local RECIPE47 = {}
RECIPE47.uid = "nut_grenade_haze"
RECIPE47.name = "Blue Haze Grenade"
RECIPE47.category = "Grenades"
RECIPE47.model = Model( "models/Items/grenadeammo.mdl" )
RECIPE47.desc = "A haze grenade that disorients those caught in its fumes."
RECIPE47.noBlueprint = true
RECIPE47.items = {
	["haze_bottled"] = 2,
	["j_scrap_metals"] = 10,
	["cube_chip"] = 5
}
RECIPE47.result = {
	["nut_haze"] = 1
}
RECIPES:Register( RECIPE47 )
//
local RECIPE48 = {}
RECIPE48.uid = "nut_chip_pouch"
RECIPE48.name = "Chip Pouch"
RECIPE48.category = "Machines"
RECIPE48.model = Model( "models/props_junk/garbage_bag001a.mdl" )
RECIPE48.desc = "A small sack, it has many slots within it. It can hold 25 chips."
RECIPE48.noBlueprint = true
RECIPE48.items = {
	["j_scrap_cloth"] = 10,
	["cube_chip_enhanced"] = 1
}
RECIPE48.result = {
	["cube_chip_pouch"] = 1
}
RECIPES:Register( RECIPE48 )
//
local RECIPE49 = {}
RECIPE49.uid = "nut_generator_repair"
RECIPE49.name = "Generator Repair Kit"
RECIPE49.category = "Machines"
RECIPE49.model = Model( "models/props_junk/cardboard_box003b.mdl" )
RECIPE49.desc = "A box full of expendable materials and tools. This is used to repair broken generators."
RECIPE49.noBlueprint = true
RECIPE49.items = {
	["j_scrap_metals"] = 15,
	["j_scrap_screws"] = 4,
	["j_scrap_chems"] = 2
}
RECIPE49.result = {
	["generator_repair"] = 1
}
RECIPES:Register( RECIPE49 )
//
local RECIPE50 = {}
RECIPE50.uid = "nut_farm_potato"
RECIPE50.name = "Farm - Potato"
RECIPE50.category = "Farms"
RECIPE50.model = Model( "models/props_junk/terracotta01.mdl" )
RECIPE50.desc = "A strange pot, the dirt in it gives off a dim light."
RECIPE50.noBlueprint = true
RECIPE50.items = {
	["j_scrap_plastics"] = 10,
	["j_scrap_organic"] = 10,
	["j_scrap_concrete"] = 5,	
	["food_potato"] = 2,
	["shard_dust"] = 1
}
RECIPE50.result = {
	["farm_potato"] = 1
}
RECIPES:Register( RECIPE50 )
//
local RECIPE51 = {}
RECIPE51.uid = "nut_farm_apple"
RECIPE51.name = "Farm - Apple"
RECIPE51.category = "Farms"
RECIPE51.model = Model( "models/props_junk/terracotta01.mdl" )
RECIPE51.desc = "A strange pot, the dirt in it gives off a dim light."
RECIPE51.noBlueprint = true
RECIPE51.items = {
	["j_scrap_plastics"] = 10,
	["j_scrap_organic"] = 10,
	["j_scrap_concrete"] = 5,	
	["food_apple"] = 2,
	["shard_dust"] = 1
}
RECIPE51.result = {
	["farm_apple"] = 1
}
RECIPES:Register( RECIPE51 )
//
local RECIPE52 = {}
RECIPE52.uid = "nut_farm_orange"
RECIPE52.name = "Farm - Orange"
RECIPE52.category = "Farms"
RECIPE52.model = Model( "models/props_junk/terracotta01.mdl" )
RECIPE52.desc = "A strange pot, the dirt in it gives off a dim light."
RECIPE52.noBlueprint = true
RECIPE52.items = {
	["j_scrap_plastics"] = 10,
	["j_scrap_organic"] = 10,
	["j_scrap_concrete"] = 5,	
	["food_orange"] = 2,
	["shard_dust"] = 1
}
RECIPE52.result = {
	["farm_orange"] = 1
}
RECIPES:Register( RECIPE52 )
//
local RECIPE53 = {}
RECIPE53.uid = "nut_farm_lemon"
RECIPE53.name = "Farm - Lemon"
RECIPE53.category = "Farms"
RECIPE53.model = Model( "models/props_junk/terracotta01.mdl" )
RECIPE53.desc = "A strange pot, the dirt in it gives off a dim light."
RECIPE53.noBlueprint = true
RECIPE53.items = {
	["j_scrap_plastics"] = 10,
	["j_scrap_organic"] = 10,
	["j_scrap_concrete"] = 5,	
	["food_lemon"] = 2,
	["shard_dust"] = 1
}
RECIPE53.result = {
	["farm_lemon"] = 1
}
RECIPES:Register( RECIPE53 )
//
local RECIPE54 = {}
RECIPE54.uid = "nut_farm_banana"
RECIPE54.name = "Farm - Banana"
RECIPE54.category = "Farms"
RECIPE54.model = Model( "models/props_junk/terracotta01.mdl" )
RECIPE54.desc = "A strange pot, the dirt in it gives off a dim light."
RECIPE54.noBlueprint = true
RECIPE54.items = {
	["j_scrap_plastics"] = 10,
	["j_scrap_organic"] = 10,
	["j_scrap_concrete"] = 5,
	["food_banana"] = 2,
	["shard_dust"] = 1
}
RECIPE54.result = {
	["farm_banana"] = 1
}
RECIPES:Register( RECIPE54 )
//
local RECIPE55 = {}
RECIPE55.uid = "nut_farm_melon"
RECIPE55.name = "Farm - Melon"
RECIPE55.category = "Farms"
RECIPE55.model = Model( "models/props_junk/terracotta01.mdl" )
RECIPE55.desc = "A strange pot, the dirt in it gives off a dim light."
RECIPE55.noBlueprint = true
RECIPE55.items = {
	["j_scrap_plastics"] = 20,
	["j_scrap_organic"] = 20,
	["j_scrap_concrete"] = 5,
	["food_melon"] = 1,
	["shard_dust"] = 2
}
RECIPE55.result = {
	["farm_melon"] = 1
}
RECIPES:Register( RECIPE55 )
//
local RECIPE56 = {}
RECIPE56.uid = "nut_farm_pumpkin"
RECIPE56.name = "Farm - Pumpkin"
RECIPE56.category = "Farms"
RECIPE56.model = Model( "models/props_junk/terracotta01.mdl" )
RECIPE56.desc = "A strange pot, the dirt in it gives off a dim light."
RECIPE56.noBlueprint = true
RECIPE56.items = {
	["j_scrap_plastics"] = 20,
	["j_scrap_organic"] = 20,
	["j_scrap_concrete"] = 5,
	["food_pumpkin"] = 1,
	["shard_dust"] = 2
}
RECIPE56.result = {
	["farm_pumpkin"] = 1
}
RECIPES:Register( RECIPE56 )
//
local RECIPE57 = {}
RECIPE57.uid = "nut_fishing_pole"
RECIPE57.name = "Fishing Pole"
RECIPE57.category = "Fishing"
RECIPE57.model = Model( "models/props_junk/harpoon002a.mdl" )
RECIPE57.desc = "A pole with a line and a reel attached to it."
RECIPE57.noBlueprint = true
RECIPE57.items = {
	["j_scrap_cloth"] = 5,
	["j_scrap_wood"] = 10,
	["j_scrap_metals"] = 5,
	["j_scrap_adhesive"] = 2,
	["shard_dust"] = 1
}
RECIPE57.result = {
	["fishing_pole"] = 1
}
RECIPES:Register( RECIPE57 )
//
local RECIPE58 = {}
RECIPE58.uid = "nut_brewery"
RECIPE58.name = "Brewery"
RECIPE58.category = "Machines"
RECIPE58.model = Model( "models/props_c17/trappropeller_engine.mdl" )
RECIPE58.desc = "A large metallic object, it seems to have a chip slot and a circular hole."
RECIPE58.noBlueprint = true
RECIPE58.items = {
	["hl2_m_pipe"] = 4,
	["j_scrap_plastics"] = 10,
	["j_scrap_metals"] = 10,
	["j_scrap_adhesive"] = 2,
	["cube_chip_enhanced"] = 1
}
RECIPE58.result = {
	["brewery"] = 1
}
RECIPES:Register( RECIPE58 )
//
local RECIPE59 = {}
RECIPE59.uid = "nut_disinfectant"
RECIPE59.name = "Disinfectant"
RECIPE59.category = "Medical"
RECIPE59.model = Model( "models/props_junk/glassjug01.mdl" )
RECIPE59.desc = "A bottle filled with some kind of disinfectant."
RECIPE59.noBlueprint = true
RECIPE59.items = {
	["j_scrap_chems"] = 5,
	["food_water"] = 1,
	["drug_depress"] = 2
}
RECIPE59.result = {
	["drug_disinfectant"] = 1
}
RECIPES:Register( RECIPE59 )
//
local RECIPE60 = {}
RECIPE60.uid = "nut_burnointment"
RECIPE60.name = "Burn Ointment"
RECIPE60.category = "Medical"
RECIPE60.model = Model( "models/props_junk/glassjug01.mdl" )
RECIPE60.desc = "A bottle filled with burn ointment."
RECIPE60.noBlueprint = true
RECIPE60.items = {
	["j_scrap_chems"] = 2,
	["food_water"] = 1,
	["drug_depress"] = 2
}
RECIPE60.result = {
	["drug_burnointment"] = 1
}
RECIPES:Register( RECIPE60 )
//
local RECIPE61 = {}
RECIPE61.uid = "nut_painkillers"
RECIPE61.name = "Painkillers"
RECIPE61.category = "Medical"
RECIPE61.model = Model( "models/props_lab/jar01b.mdl" )
RECIPE61.desc = "A small bottle filled with some pills."
RECIPE61.noBlueprint = true
RECIPE61.items = {
	["j_scrap_chems"] = 3,
	["food_water"] = 1,
	["drug_depress"] = 3
}
RECIPE61.result = {
	["drug_painkillers"] = 1
}
RECIPES:Register( RECIPE61 )
//
local RECIPE62 = {}
RECIPE62.uid = "nut_sleepingpills"
RECIPE62.name = "Sleeping Pills"
RECIPE62.category = "Medical"
RECIPE62.model = Model( "models/props_lab/jar01b.mdl" )
RECIPE62.desc = "A small bottle filled with some pills."
RECIPE62.noBlueprint = true
RECIPE62.items = {
	["j_scrap_chems"] = 2,
	["food_water"] = 1,
	["drug_depress"] = 2
}
RECIPE62.result = {
	["drug_sleepingpills"] = 1
}
RECIPES:Register( RECIPE62 )
//
local RECIPE63 = {}
RECIPE63.uid = "nut_rubbingalcohol"
RECIPE63.name = "Rubbing Alcohol"
RECIPE63.category = "Medical"
RECIPE63.model = Model( "models/props_junk/glassjug01.mdl" )
RECIPE63.desc = "A bottle filled with rubbing alcohol."
RECIPE63.noBlueprint = true
RECIPE63.items = {
	["j_scrap_chems"] = 2,
	["food_water"] = 1,
	["drug_depress"] = 2
}
RECIPE63.result = {
	["drug_rubbingalcohol"] = 1
}
RECIPES:Register( RECIPE63 )
//
local RECIPE64 = {}
RECIPE64.uid = "nut_steroid"
RECIPE64.name = "Steroid"
RECIPE64.category = "Medical"
RECIPE64.model = Model( "models/props_lab/jar01b.mdl" )
RECIPE64.desc = "A bottle filled with medical steroids."
RECIPE64.noBlueprint = true
RECIPE64.items = {
	["j_scrap_chems"] = 3,
	["food_water"] = 2,
	["drug_depress"] = 2
}
RECIPE64.result = {
	["drug_steroid"] = 1
}
RECIPES:Register( RECIPE64 )
//
local RECIPE65 = {}
RECIPE65.uid = "nut_antibiotics"
RECIPE65.name = "Antibiotics"
RECIPE65.category = "Medical"
RECIPE65.model = Model( "models/healthvial.mdl" )
RECIPE65.desc = "A bottle filled with antibiotics."
RECIPE65.noBlueprint = true
RECIPE65.items = {
	["j_scrap_chems"] = 4,
	["food_water"] = 2,
	["drug_depress"] = 3
}
RECIPE65.result = {
	["drug_antibiotics"] = 1
}
RECIPES:Register( RECIPE65 )
//
local RECIPE66 = {}
RECIPE66.uid = "nut_purification_tablet"
RECIPE66.name = "Water Purification Tablet"
RECIPE66.category = "Medical"
RECIPE66.model = Model( "models/gibs/metal_gib4.mdl" )
RECIPE66.desc = "A small tablet, it says 'PURIFY' on the side of it."
RECIPE66.noBlueprint = true
RECIPE66.items = {
	["j_scrap_metals"] = 4,
	["drug_depress"] = 1
}
RECIPE66.result = {
	["purifier_water_tablet"] = 1
}
RECIPES:Register( RECIPE66 )
//
local RECIPE67 = {}
RECIPE67.uid = "nut_yams_mysterious"
RECIPE67.name = "Mysterious Yams"
RECIPE67.category = "Mysterious"
RECIPE67.model = Model( "models/props_junk/garbage_metalcan001a.mdl" )
RECIPE67.desc = "???"
RECIPE67.noBlueprint = true
RECIPE67.items = {
	["food_yams"] = 4,
	["j_scrap_memory"] = 1
}
RECIPE67.result = {
	["food_yams_mysterious"] = 1
}
RECIPES:Register( RECIPE67 )
//
local RECIPE68 = {}
RECIPE68.uid = "nut_medicalkit"
RECIPE68.name = "First-Aid Kit"
RECIPE68.category = "Medical"
RECIPE68.model = Model( "models/items/healthkit.mdl" )
RECIPE68.desc = "A standard medical kit used to apply first aid."
RECIPE68.noBlueprint = true
RECIPE68.items = {
	["j_scrap_plastics"] = 10,
	["j_scrap_chems"] = 2,
	["j_scrap_adhesive"] = 2,
	["medical_bandages"] = 2,
	["medical_gauze"] = 1
}
RECIPE68.result = {
	["medical_kit"] = 1
}
RECIPES:Register( RECIPE68 )
//
local RECIPE69 = {}
RECIPE69.uid = "nut_salvager"
RECIPE69.name = "Salvager Kit"
RECIPE69.category = "Machines"
RECIPE69.model = Model( "models/props_c17/suitcase_passenger_physics.mdl" )
RECIPE69.desc = "A strange metallic device. It appears to be vibrating slightly."
RECIPE69.noBlueprint = true
RECIPE69.items = {
	["cure"] = 5,
	["hl2_m_wrench"] = 1,
	["j_drill"] = 1,
	["j_power_saw"] = 1,
	["hl2_m_hammer"] = 1
}
RECIPE69.result = {
	["kit_salvager"] = 1
}
RECIPES:Register( RECIPE69 )
//
local RECIPE70 = {}
RECIPE70.uid = "nut_hammer"
RECIPE70.name = "Carpenter Hammer"
RECIPE70.category = "Tools"
RECIPE70.model = Model( "models/warz/melee/hammer.mdl" )
RECIPE70.desc = "A tool used to apply blunt force."
RECIPE70.noBlueprint = true
RECIPE70.items = {
	["j_scrap_metals"] = 10,
	["j_scrap_wood"] = 10
}
RECIPE70.result = {
	["hl2_m_hammer"] = 1
}
RECIPES:Register( RECIPE70 )
//
local RECIPE71 = {}
RECIPE71.uid = "nut_wrench"
RECIPE71.name = "Wrench"
RECIPE71.category = "Tools"
RECIPE71.model = Model( "models/warz/melee/wrench.mdl" )
RECIPE71.desc = "A useful metal tool."
RECIPE71.noBlueprint = true
RECIPE71.items = {
	["j_scrap_metals"] = 15
}
RECIPE71.result = {
	["hl2_m_wrench"] = 1
}
RECIPES:Register( RECIPE71 )
//
local RECIPE72 = {}
RECIPE72.uid = "nut_cr33k"
RECIPE72.name = "CR-33K"
RECIPE72.category = "Weapons"
RECIPE72.model = Model( "models/weapons/tfa_w_dmg_vikhr.mdl" )
RECIPE72.desc = "A fully automatic assault rifle made out of various scrap parts. Has no real stock and is a real pain to control even with a lower rate of fire, but atleast offers. high capacity automatic rifle fire."
RECIPE72.noBlueprint = true
RECIPE72.items = {
	["j_scrap_screws"] = 2,
	["j_scrap_rubber"] = 8,
	["j_scrap_adhesive"] = 6,
	["j_scrap_chems"] = 6,
	["j_scrap_metals"] = 25,
	["j_scrap_plastics"] = 25,
	["j_scrap_wood"] = 25,
	["comp_reinforced_barrel"] = 2,
	["cube_chip"] = 10,
}
RECIPE72.result = {
	["tfa_cr33k"] = 1
}
RECIPES:Register( RECIPE72 )
//
local RECIPE73 = {}
RECIPE73.uid = "nut_cr33D"
RECIPE73.name = "CR-33D"
RECIPE73.category = "Weapons - Modifications"
RECIPE73.model = Model( "models/weapons/tfa_w_dmg_vikhr.mdl" )
RECIPE73.desc = "A fully automatic assault rifle made out of various scrap parts. This variant has an extended barrel and a full stock."
RECIPE73.noBlueprint = true
RECIPE73.items = {
	["j_scrap_rubber"] = 6,
	["j_scrap_chems"] = 10,
	["j_scrap_metals"] = 8,
	["j_scrap_wood"] = 15,
	["tfa_cr33k"] = 1,
	["comp_reinforced_barrel"] = 2,
	["cube_chip"] = 18
}
RECIPE73.result = {
	["tfa_cr33d"] = 1
}
RECIPES:Register( RECIPE73 )
//
local RECIPE74 = {}
RECIPE74.uid = "nut_cr0ck"
RECIPE74.name = "CR-0CK"
RECIPE74.category = "Weapons"
RECIPE74.model = Model( "models/weapons/tfa_w_fg42.mdl" )
RECIPE74.desc = "Semi automatic rifle made from various scrap parts. A true example of what can be achieved solely by putting your mind and efforts into junk firearms."
RECIPE74.noBlueprint = true
RECIPE74.items = {
	["j_scrap_screws"] = 2,
	["j_scrap_rubber"] = 10,
	["j_scrap_adhesive"] = 6,
	["j_scrap_chems"] = 8,
	["j_scrap_metals"] = 22,
	["j_scrap_plastics"] = 22,
	["j_scrap_wood"] = 24,
	["comp_reinforced_barrel"] = 2,
	["cube_chip"] = 10
}
RECIPE74.result = {
	["tfa_cr0ck"] = 1
}
RECIPES:Register( RECIPE74 )
//
local RECIPE75 = {}
RECIPE75.uid = "nut_cr0c5"
RECIPE75.name = "CR-0C5"
RECIPE75.category = "Weapons - Modifications"
RECIPE75.model = Model( "models/weapons/tfa_w_fg42.mdl" )
RECIPE75.desc = "Semi automatic rifle made from various scrap parts. A true example of what can be achieved solely by putting your mind and efforts into junk firearms. This one has an extended barrel and a stock."
RECIPE75.noBlueprint = true
RECIPE75.items = {
	["j_scrap_rubber"] = 4,
	["j_scrap_adhesive"] = 8,
	["j_scrap_chems"] = 14,
	["j_scrap_wood"] = 14,
	["comp_reinforced_barrel"] = 2,
	["tfa_cr0ck"] = 1,
	["cube_chip"] = 16
}
RECIPE75.result = {
	["tfa_cr0c5"] = 1
}
RECIPES:Register( RECIPE75 )
//
local RECIPE76 = {}
RECIPE76.uid = "nut_generator_chip"
RECIPE76.name = "Peculiar Generator"
RECIPE76.category = "Machines"
RECIPE76.model = Model( "models/props_combine/combine_mine01.mdl" )
RECIPE76.desc = "A strange contraption, it seems to have some kind of small opening in the middle. Its center is raised above the ground slightly, and underneath it there is another small opening."
RECIPE76.noBlueprint = true
RECIPE76.items = {
	["j_scrap_screws"] = 10,
	["j_scrap_adhesive"] = 10,
	["j_scrap_chems"] = 6,
	["j_scrap_metals"] = 25,
	["j_scrap_plastics"] = 25,
	["cube_chip_enhanced"] = 1
}
RECIPE76.result = {
	["generator_chip"] = 1
}
RECIPES:Register( RECIPE76 )
//
local RECIPE77 = {}
RECIPE77.uid = "nut_cloth"
RECIPE77.name = "Cloth"
RECIPE77.category = "Resources"
RECIPE77.model = Model( "models/props_c17/paper01.mdl" )
RECIPE77.desc = "Makeshift cloth."
RECIPE77.noBlueprint = true
RECIPE77.items = {
	["misc_paper"] = 2
}
RECIPE77.result = {
	["j_scrap_cloth"] = 1
}
RECIPES:Register( RECIPE77 )
//
local RECIPE78 = {}
RECIPE78.uid = "nut_converter"
RECIPE78.name = "Device - Converter"
RECIPE78.category = "Machines"
RECIPE78.model = Model( "models/hunter/blocks/cube05x05x05.mdl" )
RECIPE78.desc = "A device capable of turning plastic food into regular food."
RECIPE78.noBlueprint = true
RECIPE78.items = {
	["j_scrap_plastics"] = 25,
	["j_scrap_concrete"] = 10,
	["shard_dust"] = 1
}
RECIPE78.result = {
	["converter"] = 1
}
RECIPES:Register( RECIPE78 )
//
local RECIPE79 = {}
RECIPE79.uid = "nut_sacrificial_skull"
RECIPE79.name = "Mysterious Skull"
RECIPE79.category = "Mysterious"
RECIPE79.model = Model( "models/Gibs/HGIBS.mdl" )
RECIPE79.desc = "???"
RECIPE79.noBlueprint = true
RECIPE79.items = {
	["cure"] = 10,
	["j_skull"] = 1
}
RECIPE79.result = {
	["sacrificial_skull"] = 1
}
RECIPES:Register( RECIPE79 )
//
local RECIPE80 = {}
RECIPE80.uid = "nut_comm_signal"
RECIPE80.name = "Signalling Device"
RECIPE80.category = "Communication"
RECIPE80.model = Model( "models/gibs/shield_scanner_gib1.mdl" )
RECIPE80.desc = "A device that allows you to send a simple signal to others far away."
RECIPE80.noBlueprint = true
RECIPE80.items = {
	["j_scrap_elecs"] = 6,
	["j_scrap_metals"] = 10,
	["j_scrap_adhesive"] = 1,
	["j_scrap_screws"] = 2
}
RECIPE80.result = {
	["comm_signal"] = 1
}
RECIPES:Register( RECIPE80 )
//
local RECIPE81 = {}
RECIPE81.uid = "nut_cr3t3"
RECIPE81.name = "CR-3T3"
RECIPE81.category = "Weapons"
RECIPE81.model = Model( "models/weapons/tfa_w_mossberg_590.mdl" )
RECIPE81.desc = "A pump action rifle that fires custom caseless custom concrete slug rounds. More than a strange design, and while it's not entirely apparent how it might work it makes for a fair rifle with cheap albeit heavy ammo."
RECIPE81.noBlueprint = true
RECIPE81.items = {
	["comp_weapons_cpu_basic"] = 1,
	["j_scrap_rubber"] = 6,
	["j_scrap_metals"] = 25,
	["j_scrap_wood"] = 10,
	["comp_reinforced_barrel"] = 2,
	["j_scrap_chems"] = 6,
	["cube_chip"] = 10
}
RECIPE81.result = {
	["tfa_cr3t3"] = 1
}
RECIPES:Register( RECIPE81 )
//
local RECIPE82 = {}
RECIPE82.uid = "nut_ammo_concrete"
RECIPE82.name = "Concrete Slugs"
RECIPE82.category = "Ammunition"
RECIPE82.model = Model( "models/Items/boxbuckshot.mdl" )
RECIPE82.desc = "Makeshift slugs made out of concrete."
RECIPE82.noBlueprint = true
RECIPE82.items = {
	["j_scrap_concrete"] = 10,
	["cube_chip"] = 1
}
RECIPE82.result = {
	["ammo_concrete"] = 1
}
RECIPES:Register( RECIPE82 )
//
local RECIPE83 = {}
RECIPE83.uid = "nut_cr2ka"
RECIPE83.name = "CR-2KA"
RECIPE83.category = "Weapons - Modifications"
RECIPE83.model = Model( "models/weapons/tfa_w_winchester_1873.mdl" )
RECIPE83.desc = "A makeshift bolt action rifle assembled from various scraps. It'd be a simple design, however a few nods from a serious designer are left in its construction.\nThis particular variant has a full length barrel."
RECIPE83.noBlueprint = true
RECIPE83.items = {
	["tfa_cr1ka"] = 1,
	["j_scrap_wood"] = 4,
	["j_scrap_metals"] = 8,
	["j_scrap_plastics"] = 6,
	["comp_reinforced_barrel"] = 1,
	["cube_chip"] = 8
}
RECIPE83.result = {
	["tfa_cr2ka"] = 1
}
RECIPES:Register( RECIPE83 )
//
local RECIPE84 = {}
RECIPE84.uid = "nut_cp1kh"
RECIPE84.name = "CP-1KH"
RECIPE84.category = "Weapons - Modifications"
RECIPE84.model = Model( "models/weapons/tfa_w_dmgf_co1911.mdl" )
RECIPE84.desc = "High capacity low calibre pistol made out of various pieces of scrap. This one has a suppressor attached."
RECIPE84.noBlueprint = true
RECIPE84.items = {
	["tfa_cp1ka"] = 1,
	["j_scrap_screws"] = 4,
	["j_scrap_metals"] = 8,
	["j_scrap_plastics"] = 4,
	["j_scrap_chems"] = 5,
	["j_scrap_adhesive"] = 4,
	["comp_reinforced_barrel"] = 1,
	["cube_chip"] = 10
}
RECIPE84.result = {
	["tfa_cp1kh"] = 1
}
RECIPES:Register( RECIPE84 )
//
local RECIPE85 = {}
RECIPE85.uid = "nut_cp1kx"
RECIPE85.name = "CP-1KX"
RECIPE85.category = "Weapons - Modifications"
RECIPE85.model = Model( "models/weapons/tfa_w_dmgf_co1911.mdl" )
RECIPE85.desc = "High capacity low calibre select fire pistol made from various scrap parts. This is the suppressed variant of the CP-1K0."
RECIPE85.noBlueprint = true
RECIPE85.items = {
	["tfa_cp1ko"] = 1,
	["j_scrap_screws"] = 5,
	["j_scrap_metals"] = 10,
	["j_scrap_plastics"] = 4,
	["j_scrap_chems"] = 5,
	["j_scrap_adhesive"] = 5,
	["comp_reinforced_barrel"] = 1,
	["cube_chip"] = 10
}
RECIPE85.result = {
	["tfa_cp1kx"] = 1
}
RECIPES:Register( RECIPE85 )
//
local RECIPE86 = {}
RECIPE86.uid = "nut_cp1ch"
RECIPE86.name = "CP-1CH"
RECIPE86.category = "Weapons - Modifications"
RECIPE86.model = Model( "models/weapons/tfa_w_hk_mp5.mdl" )
RECIPE86.desc = "A fully automatic sub-machinegun made out of various scrap parts. This variant has an extended built in suppressor barrel and a stock."
RECIPE86.noBlueprint = true
RECIPE86.items = {
	["tfa_cp1cs"] = 1,
	["j_scrap_screws"] = 6,
	["j_scrap_rubber"] = 8,
	["j_scrap_metals"] = 20,
	["j_scrap_chems"] = 9,
	["j_scrap_adhesive"] = 4,
	["comp_reinforced_barrel"] = 1,
	["cube_chip"] = 16
}
RECIPE86.result = {
	["tfa_cp1ch"] = 1
}
RECIPES:Register( RECIPE86 )
//
local RECIPE87 = {}
RECIPE87.uid = "nut_skull"
RECIPE87.name = "Skull"
RECIPE87.category = "Miscellaneous"
RECIPE87.model = Model( "models/Gibs/hgibs.mdl" )
RECIPE87.desc = "A skull made out of other bones."
RECIPE87.noBlueprint = true
RECIPE87.items = {
	["j_scrap_bone"] = 15
}
RECIPE87.result = {
	["j_skull"] = 1
}
RECIPES:Register( RECIPE87 )
//
local RECIPE88 = {}
RECIPE88.uid = "nut_plank"
RECIPE88.name = "Wooden Plank"
RECIPE88.category = "Refined"
RECIPE88.model = Model( "models/props_debris/wood_board04a.mdl" )
RECIPE88.desc = "A nice chunk of wood."
RECIPE88.noBlueprint = true
RECIPE88.items = {
	["j_scrap_wood"] = 10
}
RECIPE88.result = {
	["hl2_m_plank"] = 1
}
RECIPES:Register( RECIPE88 )
//
local RECIPE89 = {}
RECIPE89.uid = "nut_ammo_sawblade"
RECIPE89.name = "Sawblade"
RECIPE89.category = "Ammunition"
RECIPE89.model = Model( "models/props_junk/sawblade001a.mdl" )
RECIPE89.desc = "A single, small sawblade."
RECIPE89.noBlueprint = true
RECIPE89.items = {
	["j_scrap_metals"] = 10,
	["cube_chip"] = 1
}
RECIPE89.result = {
	["ammo_sawblade"] = 1
}
RECIPES:Register( RECIPE89 )
//
local RECIPE90 = {}
RECIPE90.uid = "nut_meat_stew"
RECIPE90.name = "Meaty Stew"
RECIPE90.category = "Cooking"
RECIPE90.model = Model( "models/props/cs_militia/paintbucket01.mdl" )
RECIPE90.desc = "A big bucket of meaty stew."
RECIPE90.noBlueprint = true
RECIPE90.items = {
	["food_monster_meat"] = 5,
	["cube_chip"] = 1
}
RECIPE90.result = {
	["food_meat_stew"] = 1
}
RECIPES:Register( RECIPE90 )
//
local RECIPE91 = {}
RECIPE91.uid = "nut_crass"
RECIPE91.name = "CR-ASS"
RECIPE91.category = "Weapons"
RECIPE91.model = Model( "models/weapons/tfa_w_pp19_bizon.mdl" )
RECIPE91.desc = "A makeshift saw-blade launcher made out of various scrap parts. While the ammo can be costly the ability to retrieve it can make a single disc worth a theoretically unlimited amount of kills."
RECIPE91.noBlueprint = true
RECIPE91.items = {
	["comp_firing_mechanism"] = 3,
	["j_scrap_rubber"] = 12,
	["comp_weapons_cpu_basic"] = 1,
	["comp_reinforced_barrel"] = 2,
	["cube_chip"] = 10
}
RECIPE91.result = {
	["tfa_crass"] = 1
}
RECIPES:Register( RECIPE91 )
//
local RECIPE92 = {}
RECIPE92.uid = "nut_cp1kl"
RECIPE92.name = "CP-1KL"
RECIPE92.category = "Weapons - Modifications"
RECIPE92.model = Model( "models/weapons/tfa_w_dmgf_co1911.mdl" )
RECIPE92.desc = "Low capacity high calibre pistol with an extended barrel made out of various pieces of scrap."
RECIPE92.noBlueprint = true
RECIPE92.items = {
	["comp_firing_mechanism"] = 1,
	["j_scrap_plastics"] = 12,
	["j_scrap_chems"] = 10,
	["comp_reinforced_barrel"] = 1,
	["tfa_cp1ka"] = 1,
	["cube_chip"] = 10
}
RECIPE92.result = {
	["tfa_cp1kl"] = 1
}
RECIPES:Register( RECIPE92 )
//
local RECIPE93 = {}
RECIPE93.uid = "nut_cp1km"
RECIPE93.name = "CP-1KM"
RECIPE93.category = "Weapons - Modifications"
RECIPE93.model = Model( "models/weapons/tfa_w_dmgf_co1911.mdl" )
RECIPE93.desc = "Low capacity high calibre pistol with an extended barrel made out of various pieces of scrap. This one has an integral suppressor built into it."
RECIPE93.noBlueprint = true
RECIPE93.items = {
	["j_scrap_screws"] = 4,
	["j_scrap_metals"] = 20,
	["j_scrap_plastics"] = 4,
	["j_scrap_adhesive"] = 4,
	["j_scrap_chems"] = 7,
	["comp_reinforced_barrel"] = 1,
	["tfa_cp1kl"] = 1,
	["cube_chip"] = 10
}
RECIPE93.result = {
	["tfa_cp1km"] = 1
}
RECIPES:Register( RECIPE93 )
//
local RECIPE94 = {}
RECIPE94.uid = "nut_medicalkitrefill"
RECIPE94.name = "Refill First-Aid Kit"
RECIPE94.category = "Medical"
RECIPE94.model = Model( "models/items/healthkit.mdl" )
RECIPE94.desc = "Refill an empty first aid kit with new supplies."
RECIPE94.noBlueprint = true
RECIPE94.items = {
	["j_used_first_aid_kit"] = 1,
	["j_scrap_chems"] = 2,
	["j_scrap_adhesive"] = 2,
	["medical_bandages"] = 2,
	["medical_gauze"] = 1
}
RECIPE94.result = {
	["medical_kit"] = 1
}
RECIPES:Register( RECIPE94 )
//
local RECIPE95 = {}
RECIPE95.uid = "nut_fuel"
RECIPE95.name = "Fuel"
RECIPE95.category = "Refined"
RECIPE95.model = Model( "models/props_junk/gascan001a.mdl" )
RECIPE95.desc = "A can of fuel for anything that needs to be fueled."
RECIPE95.noBlueprint = true
RECIPE95.items = {
	["j_scrap_chems"] = 10,
	["cube_chip"] = 2
}
RECIPE95.result = {
	["j_gas_can"] = 1
}
RECIPES:Register( RECIPE95 )
//
local RECIPE96 = {}
RECIPE96.uid = "nut_chafe"
RECIPE96.name = "CH-AFE"
RECIPE96.category = "Weapons"
RECIPE96.model = Model( "models/weapons/w_rocket_launcher.mdl" )
RECIPE96.desc = "A janky flamethrower that looks like a set of pipes tubes and steel cannisters connected and reinforced with bits of scrap.\nRequires both the weapon mounted tank and an external tank connected by a thick boost hose to run.\nRequires fuel to use."
RECIPE96.noBlueprint = true
RECIPE96.items = {
	["ziptie"] = 4,
	["j_syringe"] = 1,
	["comp_fuel_tank"] = 1,
	["j_scrap_screws"] = 10,
	["j_scrap_rubber"] = 25,
	["j_scrap_metals"] = 25,
	["j_scrap_plastics"] = 25,
	["j_scrap_glass"] = 8,
	["j_scrap_elecs"] = 6,
	["j_scrap_adhesive"] = 6,
	["hl2_m_pipe"] = 3,
	["cube_chip"] = 8
}
RECIPE96.result = {
	["tfa_chafe"] = 1
}
RECIPES:Register( RECIPE96 )
//
local RECIPE97 = {}
RECIPE97.uid = "nut_fuel_tank"
RECIPE97.name = "Fuel Tank"
RECIPE97.category = "Components"
RECIPE97.model = Model( "models/props_junk/gascan001a.mdl" )
RECIPE97.desc = "A container that can be used to hold dangerous materials in all sorts of situations. It is resistant to most physical attacks. Firearms may penetrate it."
RECIPE97.noBlueprint = true
RECIPE97.items = {
	["j_scrap_screws"] = 6,
	["j_scrap_metals"] = 15,
	["j_scrap_plastics"] = 25,
	["j_scrap_adhesive"] = 9,
	["j_scrap_chems"] = 25,
	["cube_chip"] = 15
}
RECIPE97.result = {
	["comp_fuel_tank"] = 1
}
RECIPES:Register( RECIPE97 )
//
local RECIPE98 = {}
RECIPE98.uid = "nut_firing_mechanism"
RECIPE98.name = "Makeshift Firing Mechanism"
RECIPE98.category = "Components"
RECIPE98.model = Model( "models/warz/items/syringe.mdl" )
RECIPE98.desc = "A makeshift firing mechanism useful for creating simple weaponry."
RECIPE98.noBlueprint = true
RECIPE98.items = {
	["j_scrap_screws"] = 3,
	["j_scrap_metals"] = 9,
	["j_scrap_adhesive"] = 3,
	["j_scrap_chems"] = 2,
	["cube_chip"] = 2
}
RECIPE98.result = {
	["comp_firing_mechanism"] = 1
}
RECIPES:Register( RECIPE98 )
//
local RECIPE99 = {}
RECIPE99.uid = "nut_mystery_box"
RECIPE99.name = "Mystery Box"
RECIPE99.category = "Mysterious"
RECIPE99.model = Model( "models/Items/item_item_crate.mdl" )
RECIPE99.desc = "???"
RECIPE99.noBlueprint = true
RECIPE99.items = {
	["cube_chip"] = 10,
	["cube_chip_enhanced"] = 1,
	["j_scrap_wood"] = 25,
	["j_scrap_metals"] = 25
}
RECIPE99.result = {
	["mystery_box"] = 1
}
RECIPES:Register( RECIPE99 )
//
local RECIPE100 = {}
RECIPE100.uid = "nut_antipsychotics"
RECIPE100.name = "Antipsychotics"
RECIPE100.category = "Medical"
RECIPE100.model = Model( "models/props_junk/glassjug01.mdl" )
RECIPE100.desc = "A bottle filled with numerous pills."
RECIPE100.noBlueprint = true
RECIPE100.items = {
	["drug_psychotics"] = 1,
	["cure"] = 1
}
RECIPE100.result = {
	["drug_antipsychotics"] = 1
}
RECIPES:Register( RECIPE100 )
//
local RECIPE101 = {}
RECIPE101.uid = "nut_reinforced_barrel"
RECIPE101.name = "Reinforced Barrel"
RECIPE101.category = "Components"
RECIPE101.model = Model( "models/props_canal/mattpipe.mdl" )
RECIPE101.desc = "A makeshift gun barrel made out of scrap."
RECIPE101.noBlueprint = true
RECIPE101.items = {
	["cube_chip"] = 2,
	["hl2_m_pipe"] = 2,
	["j_scrap_chems"] = 2,
	["j_scrap_adhesive"] = 1,
	["j_scrap_screws"] = 4
}
RECIPE101.result = {
	["comp_reinforced_barrel"] = 1
}
RECIPES:Register( RECIPE101 )
//
local RECIPE102 = {}
RECIPE102.uid = "nut_weapons_cpu_basic"
RECIPE102.name = "Basic Weapons CPU"
RECIPE102.category = "Components"
RECIPE102.model = Model( "models/props/cs_office/computer_caseb_p5b.mdl" )
RECIPE102.desc = "A makeshift weapons CPU for simple calculations."
RECIPE102.noBlueprint = true
RECIPE102.items = {
	["cube_chip"] = 2,
	["j_scrap_elecs"] = 25,
	["j_scrap_plastics"] = 18,
	["j_scrap_battery"] = 4,
	["j_scrap_screws"] = 3
}
RECIPE102.result = {
	["comp_weapons_cpu_basic"] = 1
}
RECIPES:Register( RECIPE102 )
//
local RECIPE103 = {}
RECIPE103.uid = "nut_ch43t"
RECIPE103.name = "CH-34T"
RECIPE103.category = "Weapons"
RECIPE103.model = Model( "models/weapons/tfa_w_magpul_pdr.mdl" )
RECIPE103.desc = "Heavy bullpup concrete slug carbine. Hits hard with heavy concrete slug rounds, but useless at longer range as the heavy rounds have a lot of drop."
RECIPE103.noBlueprint = true
RECIPE103.items = {
	["j_scrap_concrete"] = 8,
	["j_scrap_metals"] = 25,
	["j_scrap_chems"] = 25,
	["j_scrap_adhesive"] = 12,
	["cube_chip"] = 8,
	["comp_reinforced_barrel"] = 1,
	["comp_weapons_cpu_basic"] = 1,
	["comp_firing_mechanism"] = 1,
	["j_scrap_screws"] = 8
}
RECIPE103.result = {
	["tfa_ch34t"] = 1
}
RECIPES:Register( RECIPE103 )
//
local RECIPE104 = {}
RECIPE104.uid = "nut_bat_homerunaway"
RECIPE104.name = "Home Run-Away"
RECIPE104.category = "Weapons - Melee"
RECIPE104.model = Model( "models/warz/melee/baseballbat.mdl" )
RECIPE104.desc = "A makeshift melee weapon made out of a baseball bat and a sawblade."
RECIPE104.noBlueprint = true
RECIPE104.items = {
	["j_scrap_adhesive"] = 4,
	["cube_chip"] = 2,
	["ammo_sawblade"] = 1,
	["hl2_m_bat"] = 1
}
RECIPE104.result = {
	["hl2_m_homerunaway"] = 1
}
RECIPES:Register( RECIPE104 )
//
local RECIPE105 = {}
RECIPE105.uid = "nut_gearmace"
RECIPE105.name = "Gear Mace"
RECIPE105.category = "Weapons - Melee"
RECIPE105.model = Model( "models/props_vehicles/carparts_muffler01a.mdl" )
RECIPE105.desc = "A makeshift weapon made out of a gear and car parts."
RECIPE105.noBlueprint = true
RECIPE105.items = {
	["j_scrap_adhesive"] = 5,
	["cube_chip"] = 2,
	["j_gear"] = 1,
	["j_car_muffler"] = 1
}
RECIPE105.result = {
	["hl2_m_gearmace"] = 1
}
RECIPES:Register( RECIPE105 )
//
local RECIPE106 = {}
RECIPE106.uid = "nut_makeshift_glaive"
RECIPE106.name = "Makeshift Glaive"
RECIPE106.category = "Weapons - Melee"
RECIPE106.model = Model( "models/props_c17/signpole001.mdl" )
RECIPE106.desc = "A makeshift glaive made out of multiple pieces of scrap."
RECIPE106.noBlueprint = true
RECIPE106.items = {
	["j_scrap_adhesive"] = 6,
	["j_scrap_metals"] = 20,
	["cube_chip"] = 4,
	["hl2_m_pole"] = 1,
	["hl2_m_machate"] = 1
}
RECIPE106.result = {
	["hl2_m_makeshift_glaive"] = 1
}
RECIPES:Register( RECIPE106 )
//
local RECIPE107 = {}
RECIPE107.uid = "nut_bone_shiv"
RECIPE107.name = "Bone Shiv"
RECIPE107.category = "Weapons - Melee"
RECIPE107.model = Model( "models/gibs/hgibs_scapula.mdl" )
RECIPE107.desc = "A makeshift shiv made out of bones."
RECIPE107.noBlueprint = true
RECIPE107.items = {
	["j_scrap_bone"] = 15,
	["j_scrap_adhesive"] = 2,
}
RECIPE107.result = {
	["hl2_m_boneshiv"] = 1
}
RECIPES:Register( RECIPE107 )
//
local RECIPE108 = {}
RECIPE108.uid = "nut_bone_cudgel"
RECIPE108.name = "Bone Cudgel"
RECIPE108.category = "Weapons - Melee"
RECIPE108.model = Model( "models/gibs/hgibs_spine.mdl" )
RECIPE108.desc = "A makeshift cudgel made out of bones."
RECIPE108.noBlueprint = true
RECIPE108.items = {
	["j_scrap_bone"] = 30,
	["j_scrap_adhesive"] = 3,
	["cube_chip"] = 1,
}
RECIPE108.result = {
	["hl2_m_bonecudgel"] = 1
}
RECIPES:Register( RECIPE108 )
//
local RECIPE109 = {}
RECIPE109.uid = "nut_ammo_44"
RECIPE109.name = ".44 Ammo"
RECIPE109.category = "Ammunition"
RECIPE109.model = Model( "models/items/357ammo.mdl" )
RECIPE109.desc = "Makeshift .44 ammo made of scrap materials."
RECIPE109.noBlueprint = true
RECIPE109.items = {
	["j_scrap_metals"] = 15,
	["cube_chip"] = 3
}
RECIPE109.result = {
	["ammo_44"] = 1
}
RECIPES:Register( RECIPE109 )
//
local RECIPE110 = {}
RECIPE110.uid = "nut_ammo_50ae"
RECIPE110.name = ".50 AE Ammo"
RECIPE110.category = "Ammunition"
RECIPE110.model = Model( "models/items/357ammo.mdl" )
RECIPE110.desc = "Makeshift .50 AE ammo made of scrap materials."
RECIPE110.noBlueprint = true
RECIPE110.items = {
	["j_scrap_metals"] = 15,
	["cube_chip"] = 4
}
RECIPE110.result = {
	["ammo_50ae"] = 1
}
RECIPES:Register( RECIPE110 )
//
local RECIPE111 = {}
RECIPE111.uid = "nut_ammo_500"
RECIPE111.name = ".500 Ammo"
RECIPE111.category = "Ammunition"
RECIPE111.model = Model( "models/items/357ammo.mdl" )
RECIPE111.desc = "Makeshift .500 ammo made of scrap materials."
RECIPE111.noBlueprint = true
RECIPE111.items = {
	["j_scrap_metals"] = 20,
	["cube_chip"] = 4
}
RECIPE111.result = {
	["ammo_500"] = 1
}
RECIPES:Register( RECIPE111 )
//
local RECIPE112 = {}
RECIPE112.uid = "nut_ammo_4570"
RECIPE112.name = ".45-70 Ammo"
RECIPE112.category = "Ammunition"
RECIPE112.model = Model( "models/items/sniper_round_box.mdl" )
RECIPE112.desc = "Makeshift .45-70 ammo made of scrap materials."
RECIPE112.noBlueprint = true
RECIPE112.items = {
	["j_scrap_metals"] = 22,
	["cube_chip"] = 4
}
RECIPE112.result = {
	["ammo_4570"] = 1
}
RECIPES:Register( RECIPE112 )
//
local RECIPE113 = {}
RECIPE113.uid = "nut_ammo_54539"
RECIPE113.name = "5.45x39mm Ammo"
RECIPE113.category = "Ammunition"
RECIPE113.model = Model( "models/items/boxmrounds.mdl" )
RECIPE113.desc = "Makeshift 5.45x39mm ammo made of scrap materials."
RECIPE113.noBlueprint = true
RECIPE113.items = {
	["j_scrap_metals"] = 20,
	["cube_chip"] = 5
}
RECIPE113.result = {
	["ammo_54539"] = 1
}
RECIPES:Register( RECIPE113 )
//
local RECIPE114 = {}
RECIPE114.uid = "nut_ammo_55645"
RECIPE114.name = "5.56x45mm Ammo"
RECIPE114.category = "Ammunition"
RECIPE114.model = Model( "models/items/boxmrounds.mdl" )
RECIPE114.desc = "Makeshift 5.56x45mm ammo made of scrap materials."
RECIPE114.noBlueprint = true
RECIPE114.items = {
	["j_scrap_metals"] = 20,
	["cube_chip"] = 5
}
RECIPE114.result = {
	["ammo_55645"] = 1
}
RECIPES:Register( RECIPE114 )
//
local RECIPE115 = {}
RECIPE115.uid = "nut_ammo_76239"
RECIPE115.name = "7.62x39mm Ammo"
RECIPE115.category = "Ammunition"
RECIPE115.model = Model( "models/items/boxmrounds.mdl" )
RECIPE115.desc = "Makeshift 7.62x39mm ammo made of scrap materials."
RECIPE115.noBlueprint = true
RECIPE115.items = {
	["j_scrap_metals"] = 22,
	["cube_chip"] = 5
}
RECIPE115.result = {
	["ammo_76239"] = 1
}
RECIPES:Register( RECIPE115 )
//
local RECIPE116 = {}
RECIPE116.uid = "nut_ammo_939"
RECIPE116.name = "9x39mm Ammo"
RECIPE116.category = "Ammunition"
RECIPE116.model = Model( "models/items/boxmrounds.mdl" )
RECIPE116.desc = "Makeshift 9x39mm ammo made of scrap materials."
RECIPE116.noBlueprint = true
RECIPE116.items = {
	["j_scrap_metals"] = 25,
	["cube_chip"] = 5
}
RECIPE116.result = {
	["ammo_939"] = 1
}
RECIPES:Register( RECIPE116 )
//
local RECIPE117 = {}
RECIPE117.uid = "nut_ammo_76251"
RECIPE117.name = "7.62x51mm Ammo"
RECIPE117.category = "Ammunition"
RECIPE117.model = Model( "models/items/boxmrounds.mdl" )
RECIPE117.desc = "Makeshift 7.62x51mm ammo made of scrap materials."
RECIPE117.noBlueprint = true
RECIPE117.items = {
	["j_scrap_metals"] = 25,
	["cube_chip"] = 6
}
RECIPE117.result = {
	["ammo_76251"] = 1
}
RECIPES:Register( RECIPE117 )
//
local RECIPE118 = {}
RECIPE118.uid = "nut_ammo_76254"
RECIPE118.name = "7.62x54mm Ammo"
RECIPE118.category = "Ammunition"
RECIPE118.model = Model( "models/items/boxmrounds.mdl" )
RECIPE118.desc = "Makeshift 7.62x54mm ammo made of scrap materials."
RECIPE118.noBlueprint = true
RECIPE118.items = {
	["j_scrap_metals"] = 25,
	["cube_chip"] = 6
}
RECIPE118.result = {
	["ammo_76254"] = 1
}
RECIPES:Register( RECIPE118 )
//
local RECIPE119 = {}
RECIPE119.uid = "nut_ammo_3006"
RECIPE119.name = ".30-06 Ammo"
RECIPE119.category = "Ammunition"
RECIPE119.model = Model( "models/items/boxmrounds.mdl" )
RECIPE119.desc = "Makeshift .30-06 ammo made of scrap materials."
RECIPE119.noBlueprint = true
RECIPE119.items = {
	["j_scrap_metals"] = 20,
	["cube_chip"] = 7
}
RECIPE119.result = {
	["ammo_3006"] = 1
}
RECIPES:Register( RECIPE119 )
//
local RECIPE120 = {}
RECIPE120.uid = "nut_ammo_338"
RECIPE120.name = ".338 LM Ammo"
RECIPE120.category = "Ammunition"
RECIPE120.model = Model( "models/items/sniper_round_box.mdl" )
RECIPE120.desc = "Makeshift .338 LM ammo made of scrap materials."
RECIPE120.noBlueprint = true
RECIPE120.items = {
	["j_scrap_metals"] = 25,
	["cube_chip"] = 7
}
RECIPE120.result = {
	["ammo_338"] = 1
}
RECIPES:Register( RECIPE120 )
//
local RECIPE121 = {}
RECIPE121.uid = "nut_ammo_408"
RECIPE121.name = ".408 Cheytac Ammo"
RECIPE121.category = "Ammunition"
RECIPE121.model = Model( "models/items/sniper_round_box.mdl" )
RECIPE121.desc = "Makeshift .408 Cheytac ammo made of scrap materials."
RECIPE121.noBlueprint = true
RECIPE121.items = {
	["j_scrap_metals"] = 20,
	["cube_chip"] = 8
}
RECIPE121.result = {
	["ammo_408"] = 1
}
RECIPES:Register( RECIPE121 )
//
local RECIPE122 = {}
RECIPE122.uid = "nut_ammo_50bmg"
RECIPE122.name = ".50 BMG Ammo"
RECIPE122.category = "Ammunition"
RECIPE122.model = Model( "models/items/sniper_round_box.mdl" )
RECIPE122.desc = "Makeshift .50 BMG ammo made of scrap materials."
RECIPE122.noBlueprint = true
RECIPE122.items = {
	["j_scrap_metals"] = 25,
	["cube_chip"] = 8
}
RECIPE122.result = {
	["ammo_50bmg"] = 1
}
RECIPES:Register( RECIPE122 )
//
local RECIPE123 = {}
RECIPE123.uid = "nut_backpack"
RECIPE123.name = "Backpack"
RECIPE123.category = "Storage"
RECIPE123.model = Model( "models/warz/largebackpack.mdl" )
RECIPE123.desc = "Makeshift backpack made out of cloth."
RECIPE123.noBlueprint = true
RECIPE123.items = {
	["j_scrap_cloth"] = 35
}
RECIPE123.result = {
	["pack"] = 1
}
RECIPES:Register( RECIPE123 )
//
local RECIPE124 = {}
RECIPE124.uid = "nut_backpack_alice"
RECIPE124.name = "ALICE Pack"
RECIPE124.category = "Storage"
RECIPE124.model = Model( "models/warz/alicebackpack.mdl" )
RECIPE124.desc = "Makeshift ALICE pack made out of cloth and other materials."
RECIPE124.noBlueprint = true
RECIPE124.items = {
	["j_scrap_cloth"] = 50,
	["cube_chip"] = 5,
}
RECIPE124.result = {
	["pack_alice"] = 1
}
RECIPES:Register( RECIPE124 )
//
local RECIPE125 = {}
RECIPE125.uid = "nut_briefcase"
RECIPE125.name = "Briefcase"
RECIPE125.category = "Storage"
RECIPE125.model = Model( "models/props_c17/briefcase001a.mdl" )
RECIPE125.desc = "A makeshift carrying bag, it's not too big."
RECIPE125.noBlueprint = true
RECIPE125.items = {
	["j_scrap_cloth"] = 20
}
RECIPE125.result = {
	["stor_briefcase"] = 1
}
RECIPES:Register( RECIPE125 )
//
local RECIPE126 = {}
RECIPE126.uid = "nut_backpack_enhanced"
RECIPE126.name = "Enhanced Backpack"
RECIPE126.category = "Storage"
RECIPE126.model = Model( "models/warz/alicebackpack.mdl" )
RECIPE126.desc = "Light as a feather, no matter what you put into it."
RECIPE126.noBlueprint = true
RECIPE126.items = {
	["j_scrap_cloth"] = 100,
	["cube_chip"] = 10,
	["cube_chip_enhanced"] = 1
}
RECIPE126.result = {
	["pack_enhanced"] = 1
}
RECIPES:Register( RECIPE126 )
//
local RECIPE127 = {}
RECIPE127.uid = "nut_antivenom"
RECIPE127.name = "Antivenom"
RECIPE127.category = "Medical"
RECIPE127.model = Model( "models/props_lab/jar01b.mdl" )
RECIPE127.desc = "A small bottle filled with some sort of liquid."
RECIPE127.noBlueprint = true
RECIPE127.items = {
	["drug_venom"] = 1,
	["cure"] = 1
}
RECIPE127.result = {
	["drug_antivenom"] = 1
}
RECIPES:Register( RECIPE127 )
//
local RECIPE128 = {}
RECIPE128.uid = "nut_psychotics"
RECIPE128.name = "Psychotics"
RECIPE128.category = "Medical"
RECIPE128.model = Model( "models/props_lab/jar01b.mdl" )
RECIPE128.desc = "A bottle filled with numerous pills."
RECIPE128.noBlueprint = true
RECIPE128.items = {
	["drug_depress"] = 3,
	["j_scrap_chems"] = 5,
	["food_water"] = 1
}
RECIPE128.result = {
	["drug_psychotics"] = 1
}
RECIPES:Register( RECIPE128 )
//
local RECIPE129 = {}
RECIPE129.uid = "nut_venom"
RECIPE129.name = "Venom"
RECIPE129.category = "Medical"
RECIPE129.model = Model( "models/props_lab/jar01b.mdl" )
RECIPE129.desc = "A bottle filled with some sort of liquid."
RECIPE129.noBlueprint = true
RECIPE129.items = {
	["drug_depress"] = 2,
	["j_scrap_chems"] = 6,
	["food_water"] = 1
}
RECIPE129.result = {
	["drug_venom"] = 1
}
RECIPES:Register( RECIPE129 )
//
local RECIPE130 = {}
RECIPE130.uid = "nut_drug_energy"
RECIPE130.name = "Energy Pills"
RECIPE130.category = "Medical"
RECIPE130.model = Model( "models/props_lab/jar01b.mdl" )
RECIPE130.desc = "A bottle filled with some sort of vibrating pills."
RECIPE130.noBlueprint = true
RECIPE130.items = {
	["drug_antidepressants"] = 2,
	["haze_bottled"] = 1,
	["food_water"] = 1
}
RECIPE130.result = {
	["drug_energy"] = 1
}
RECIPES:Register( RECIPE130 )
//
local RECIPE131 = {}
RECIPE131.uid = "nut_cpr05"
RECIPE131.name = "CP-R05"
RECIPE131.category = "Weapons"
RECIPE131.model = Model( "models/weapons/tfa_w_hk45c.mdl" )
RECIPE131.desc = "Classy professional looking scrap pistol. Boasts decent controllability for damage although lacking in magazine size.\nThis weapon utilizes .40 S&W rounds."
RECIPE131.noBlueprint = true
RECIPE131.items = {
	["j_scrap_screws"] = 6,
	["j_scrap_metals"] = 25,
	["j_scrap_plastics"] = 12,
	["j_scrap_adhesive"] = 4,
	["j_scrap_chems"] = 3,
	["j_scrap_wood"] = 8,
	["comp_reinforced_barrel"] = 1,
	["hl2_m_pipe"] = 1,
	["cube_chip"] = 8
}
RECIPE131.result = {
	["tfa_cpr05"] = 1
}
RECIPES:Register( RECIPE131 )
//
local RECIPE132 = {}
RECIPE132.uid = "nut_cpr06"
RECIPE132.name = "CR-R06"
RECIPE132.category = "Weapons - Modifications"
RECIPE132.model = Model( "models/weapons/tfa_w_hk45c.mdl" )
RECIPE132.desc = "Classy professional looking scrap pistol. Boasts decent controllability for damage although lacking in magazine size. This one has a suppressor.\nThis weapon utilizes .40 S&W rounds."
RECIPE132.noBlueprint = true
RECIPE132.items = {
	["tfa_cpr05"] = 1,
	["comp_suppressor_pistol"] = 1,
	["cube_chip"] = 10
}
RECIPE132.result = {
	["tfa_cpr06"] = 1
}
RECIPES:Register( RECIPE132 )
//
local RECIPE133 = {}
RECIPE133.uid = "nut_cpr07"
RECIPE133.name = "CR-R07"
RECIPE133.category = "Weapons - Modifications"
RECIPE133.model = Model( "models/weapons/tfa_w_hk45c.mdl" )
RECIPE133.desc = "Classy professional looking scrap pistol. Boasts decent controllability for damage although lacking in magazine size. This one has an experimental recoil management system installed.\nThis weapon utilizes .40 S&W rounds."
RECIPE133.noBlueprint = true
RECIPE133.items = {
	["tfa_cpr05"] = 1,
	["comp_weapons_cpu_basic"] = 1,
	["comp_firing_mechanism"] = 2,
	["j_scrap_battery"] = 4,
	["cube_chip"] = 10
}
RECIPE133.result = {
	["tfa_cpr07"] = 1
}
RECIPES:Register( RECIPE133 )
//
local RECIPE134 = {}
RECIPE134.uid = "nut_cpr08"
RECIPE134.name = "CR-R08"
RECIPE134.category = "Weapons - Modifications"
RECIPE134.model = Model( "models/weapons/tfa_w_hk45c.mdl" )
RECIPE134.desc = "Classy professional looking scrap pistol. Boasts decent controllability for damage although lacking in magazine size. This one has an experimental recoil management system installed and a suppressor.\nThis weapon utilizes .40 S&W rounds."
RECIPE134.noBlueprint = true
RECIPE134.items = {
	["tfa_cpr07"] = 1,
	["comp_suppressor_pistol"] = 1,
	["cube_chip"] = 10
}
RECIPE134.result = {
	["tfa_cpr08"] = 1
}
RECIPES:Register( RECIPE134 )
//
local RECIPE135 = {}
RECIPE135.uid = "nut_cpr09"
RECIPE135.name = "CR-R09"
RECIPE135.category = "Weapons - Modifications"
RECIPE135.model = Model( "models/weapons/tfa_w_hk45c.mdl" )
RECIPE135.desc = "Classy professional looking scrap pistol. Boasts decent controllability for damage although lacking in magazine size.\nThis one has an experimental recoil management system installed aswell as a special 'super-essor' that hides muzzleflash entirely at the cost of giving a tracer-like effect to all rounds.\nThis weapon utilizes .40 S&W rounds."
RECIPE135.noBlueprint = true
RECIPE135.items = {
	["tfa_cpr08"] = 1,
	["comp_weapons_cpu_basic"] = 1,
	["comp_suppressor_pistol"] = 1,
	["j_scrap_battery"] = 6,
	["cube_chip"] = 10
}
RECIPE135.result = {
	["tfa_cpr09"] = 1
}
RECIPES:Register( RECIPE135 )
//
local RECIPE136 = {}
RECIPE136.uid = "nut_suppressor_pistol"
RECIPE136.name = "Pistol Suppressor"
RECIPE136.category = "Components"
RECIPE136.model = Model( "models/weapons/tfa_w_hk45c.mdl" )
RECIPE136.desc = "A makeshift firearm suppressor fit for a pistol."
RECIPE136.noBlueprint = true
RECIPE136.items = {
	["j_scrap_screws"] = 4,
	["j_scrap_adhesive"] = 3,
	["j_scrap_chems"] = 8,
	["j_scrap_plastics"] = 25,
	["comp_reinforced_barrel"] = 1,
	["cube_chip"] = 4
}
RECIPE136.result = {
	["comp_suppressor_pistol"] = 1
}
RECIPES:Register( RECIPE136 )
//
local RECIPE137 = {}
RECIPE137.uid = "nut_medical_plastic"
RECIPE137.name = "Plastic Dust"
RECIPE137.category = "Medical"
RECIPE137.model = Model( "models/props_lab/box01a.mdl" )
RECIPE137.desc = "A small box filled with some sort of plasic dust."
RECIPE137.noBlueprint = true
RECIPE137.items = {
	["j_scrap_plastics"] = 10
}
RECIPE137.result = {
	["medical_plastic"] = 1
}
RECIPES:Register( RECIPE137 )
//
local RECIPE138 = {}
RECIPE138.uid = "nut_ammo_battery"
RECIPE138.name = "Charged Battery"
RECIPE138.category = "Ammunition"
RECIPE138.model = Model( "models/items/battery.mdl" )
RECIPE138.desc = "A single, seemingly enhanced battery."
RECIPE138.noBlueprint = true
RECIPE138.items = {
	["j_scrap_battery"] = 6,
	["cube_chip"] = 2
}
RECIPE138.result = {
	["ammo_battery"] = 1
}
RECIPES:Register( RECIPE138 )
//
local RECIPE139 = {}
RECIPE139.uid = "nut_ammo_rpg"
RECIPE139.name = "Makeshift Rocket"
RECIPE139.category = "Ammunition"
RECIPE139.model = Model( "models/weapons/w_missile_closed.mdl" )
RECIPE139.desc = "A single, makeshift rocket."
RECIPE139.noBlueprint = true
RECIPE139.items = {
	["j_scrap_adhesive"] = 10,
	["j_scrap_metals"] = 20,
	["j_scrap_chems"] = 10,
	["nut_explosivegrenade"] = 1
}
RECIPE139.result = {
	["ammo_rpg"] = 1
}
RECIPES:Register( RECIPE139 )
//
local RECIPE140 = {}
RECIPE140.uid = "nut_ammo_crossbow"
RECIPE140.name = "Makeshift Bolts"
RECIPE140.category = "Ammunition"
RECIPE140.model = Model( "models/crossbow_bolt.mdl" )
RECIPE140.desc = "Five makeshift bolts."
RECIPE140.noBlueprint = true
RECIPE140.items = {
	["j_scrap_metals"] = 5,
	["j_scrap_wood"] = 10,
	["j_scrap_cloth"] = 5
}
RECIPE140.result = {
	["ammo_xbow"] = 1
}
RECIPES:Register( RECIPE140 )
//
local RECIPE141 = {}
RECIPE141.uid = "nut_ch4rm"
RECIPE141.name = "CH-4RM"
RECIPE141.category = "Weapons"
RECIPE141.model = Model( "models/weapons/w_crossbow.mdl" )
RECIPE141.desc = "Makeshift power single ultra-cam compound crossbow featuring an automatic draw system. It's a wonder how most of the wooden arrows survive being fired from this thing."
RECIPE141.noBlueprint = true
RECIPE141.items = {
	["j_scrap_adhesive"] = 5,
	["j_scrap_metals"] = 25,
	["j_scrap_elastic"] = 25,
	["j_scrap_screws"] = 8,
	["j_scrap_elecs"] = 10,
	["j_scrap_battery"] = 4
}
RECIPE141.result = {
	["tfa_ch4rm"] = 1
}
RECIPES:Register( RECIPE141 )
//
local RECIPE142 = {}
RECIPE142.uid = "nut_chalk"
RECIPE142.name = "CH-ALK"
RECIPE142.category = "Weapons"
RECIPE142.model = Model( "models/weapons/tfa_w_usas_12.mdl" )
RECIPE142.desc = "Looks like an I-beam that someone decided to use as a base for their highschool science fair project. Awkward to hold, but doesn't recoil like your typical conventional rifle.\nThis weapon utilizes batteries."
RECIPE142.noBlueprint = true
RECIPE142.items = {
	["comp_firing_mechanism"] = 2,
	["comp_weapons_cpu_basic"] = 5,
	["j_scrap_screws"] = 18,
	["j_scrap_metals"] = 25,
	["j_scrap_plastics"] = 25,
	["j_scrap_rubber"] = 25,
	["j_scrap_adhesive"] = 22,
	["j_scrap_chems"] = 18,
	["j_scrap_elecs"] = 25,
	["cube_chip"] = 25,
	["ammo_battery"] = 8
}
RECIPE142.result = {
	["tfa_chalk"] = 1
}
RECIPES:Register( RECIPE142 )
//
local RECIPE143 = {}
RECIPE143.uid = "nut_ch3m0"
RECIPE143.name = "CH-3M0"
RECIPE143.category = "Weapons"
RECIPE143.model = Model( "models/weapons/tfa_w_striker_12g.mdl" )
RECIPE143.desc = "Makeshift grenade launcher made out of various scrap parts. Munitions are loaded into an internal cylindrical magazine.\nThis weapon utilizes explosive grenades."
RECIPE143.noBlueprint = true
RECIPE143.items = {
	["comp_firing_mechanism"] = 3,
	["comp_reinforced_barrel"] = 7,
	["j_scrap_screws"] = 18,
	["j_scrap_metals"] = 25,
	["j_scrap_plastics"] = 18,
	["j_scrap_adhesive"] = 15,
	["j_scrap_chems"] = 25,
	["cube_chip"] = 25
}
RECIPE143.result = {
	["tfa_ch3m0"] = 1
}
RECIPES:Register( RECIPE143 )
//
local RECIPE144 = {}
RECIPE144.uid = "nut_bone_rattle"
RECIPE144.name = "Bone Rattle"
RECIPE144.category = "Weapons - Melee"
RECIPE144.model = Model( "models/gibs/hgibs_spine.mdl" )
RECIPE144.desc = "A makeshift cudgel made out of bones, it's kind of puny."
RECIPE144.noBlueprint = true
RECIPE144.items = {
	["j_scrap_bone"] = 10,
	["j_scrap_adhesive"] = 1
}
RECIPE144.result = {
	["hl2_m_bonerattle"] = 1
}
RECIPES:Register( RECIPE144 )
//
local RECIPE145 = {}
RECIPE145.uid = "nut_cr3s750fe"
RECIPE145.name = "CR-3S7-50-FE"
RECIPE145.category = "Weapons - Modifications"
RECIPE145.model = Model( "models/weapons/tfa_w_g2_contender.mdl" )
RECIPE145.desc = "A makeshift break action single shot .50 BMG hunting rifle with a long barrel and stock built from various scrap parts. Appears to be based off the much more compact CR-3ST. Sporting an 'FE' custom scope."
RECIPE145.noBlueprint = true
RECIPE145.items = {
	["tfa_cr3s750"] = 1,
	["hl2_m_pipe"] = 2,
	["j_scrap_screws"] = 12,
	["j_scrap_glass"] = 40,
	["j_scrap_plastics"] = 28,
	["j_scrap_adhesive"] = 4,
	["j_scrap_chems"] = 2,
	["cube_chip"] = 10
}
RECIPE145.result = {
	["tfa_cr3s750fe"] = 1
}
RECIPES:Register( RECIPE145 )
//
local RECIPE146 = {}
RECIPE146.uid = "nut_criss"
RECIPE146.name = "CR-ISS"
RECIPE146.category = "Weapons - Modifications"
RECIPE146.model = Model( "models/weapons/tfa_w_snip_m24_6.mdl" )
RECIPE146.desc = "A modified CR-OSS with internals reworked, streamlined, and made less finicky to allow installation for a specially made three round magazine."
RECIPE146.noBlueprint = true
RECIPE146.items = {
	["tfa_cross"] = 1,
	["j_scrap_screws"] = 6,
	["j_scrap_rubber"] = 20,
	["j_scrap_chems"] = 6,
	["j_scrap_plastics"] = 14,
	["j_scrap_adhesive"] = 4,
	["cube_chip"] = 15,	
	["comp_firing_mechanism"] = 3
}
RECIPE146.result = {
	["tfa_criss"] = 1
}
RECIPES:Register( RECIPE146 )
//
local RECIPE147 = {}
RECIPE147.uid = "nut_cpunk"
RECIPE147.name = "CP-UNK"
RECIPE147.category = "Weapons"
RECIPE147.model = Model( "models/weapons/tfa_w_sw_model_500.mdl" )
RECIPE147.desc = "Cheap scrap concrete slug pistol. Utilizes a special case device when loading that gets more out of the ammo permitted by its breach loaded design. One handing normally will more than likely break your wrist."
RECIPE147.noBlueprint = true
RECIPE147.items = {
	["j_scrap_rubber"] = 4,
	["comp_firing_mechanism"] = 1,
	["j_scrap_metals"] = 10,
	["j_scrap_wood"] = 8,
	["cube_chip"] = 5,
	["hl2_m_pipe"] = 1
}
RECIPE147.result = {
	["tfa_cpunk"] = 1
}
RECIPES:Register( RECIPE147 )
//
local RECIPE148 = {}
RECIPE148.uid = "nut_shard"
RECIPE148.name = "Shard"
RECIPE148.category = "Mysterious"
RECIPE148.model = Model( "models/gibs/glass_shard04.mdl" )
RECIPE148.desc = "A peculiar crystalline shard, it emits a dim white light."
RECIPE148.noBlueprint = true
RECIPE148.items = {
	["shard_dust"] = 6
}
RECIPE148.result = {
	["shard"] = 1
}
RECIPES:Register( RECIPE148 )
//
local RECIPE149 = {}
RECIPE149.uid = "nut_suture"
RECIPE149.name = "Makeshift Suture Kit"
RECIPE149.category = "Medical"
RECIPE149.model = Model( "models/props_lab/box01a.mdl" )
RECIPE149.desc = "A small box filled tools and sutures."
RECIPE149.noBlueprint = true
RECIPE149.items = {
	["j_scrap_plastics"] = 15,
	["j_scrap_cloth"] = 15,
	["j_scrap_metals"] = 10
}
RECIPE149.result = {
	["medical_suture"] = 1
}
RECIPES:Register( RECIPE149 )
//
local RECIPE150 = {}
RECIPE150.uid = "nut_drill"
RECIPE150.name = "Power Drill"
RECIPE150.category = "Tools"
RECIPE150.model = Model( "models/warz/melee/powerdrill.mdl" )
RECIPE150.desc = "An electric drill. (This is not a weapon.)"
RECIPE150.noBlueprint = true
RECIPE150.items = {
	["j_scrap_metals"] = 5,
	["j_scrap_plastics"] = 5,
	["j_scrap_elecs"] = 3,
	["j_scrap_chems"] = 2
}
RECIPE150.result = {
	["j_drill"] = 1
}
RECIPES:Register( RECIPE150 )
//
local RECIPE151 = {}
RECIPE151.uid = "nut_saw"
RECIPE151.name = "Power Saw"
RECIPE151.category = "Tools"
RECIPE151.model = Model( "models/props/cs_militia/circularsaw01.mdl" )
RECIPE151.desc = "An electric saw, it won't work without electricity. (This is not a weapon.)"
RECIPE151.noBlueprint = true
RECIPE151.items = {
	["j_scrap_metals"] = 10,
	["j_scrap_plastics"] = 5,
	["j_scrap_elecs"] = 4,
	["j_scrap_chems"] = 2
}
RECIPE151.result = {
	["j_power_saw"] = 1
}
RECIPES:Register( RECIPE151 )
//
local RECIPE152 = {}
RECIPE152.uid = "nut_bandages_memory"
RECIPE152.name = "Memory Wraps"
RECIPE152.category = "Medical"
RECIPE152.model = Model( "models/props_lab/box01a.mdl" )
RECIPE152.desc = "A small box filled with some strange wrappings.\nThese wrappings help deal with numbness caused by blight damage."
RECIPE152.noBlueprint = true
RECIPE152.items = {
	["medical_bandages"] = 2,
	["j_scrap_memory"] = 2
}
RECIPE152.result = {
	["medical_memory"] = 1
}
RECIPES:Register( RECIPE152 )
//
local RECIPE153 = {}
RECIPE153.uid = "nut_plastics"
RECIPE153.name = "Plastic"
RECIPE153.category = "Resources"
RECIPE153.model = Model( "models/props_wasteland/prison_toiletchunk01a.mdl" )
RECIPE153.desc = "A chunk of plastic."
RECIPE153.noBlueprint = true
RECIPE153.items = {
	["medical_plastic"] = 1
}
RECIPE153.result = {
	["j_scrap_plastics"] = 1
}
RECIPES:Register( RECIPE153 )
//
local RECIPE154 = {}
RECIPE154.uid = "nut_rebar_club"
RECIPE154.name = "Rebar Club"
RECIPE154.category = "Weapons - Melee"
RECIPE154.model = Model( "models/props_debris/rebar003b_48.mdl" )
RECIPE154.desc = "A spike of rebar with a chunk of concrete on it."
RECIPE154.noBlueprint = true
RECIPE154.items = {
	["j_scrap_concrete"] = 20,
	["j_scrap_metals"] = 10
}
RECIPE154.result = {
	["hl2_m_rebar"] = 1
}
RECIPES:Register( RECIPE154 )
//
local RECIPE155 = {}
RECIPE155.uid = "nut_farm_cactus"
RECIPE155.name = "Farm - Cactus"
RECIPE155.category = "Farms"
RECIPE155.model = Model( "models/props_junk/terracotta01.mdl" )
RECIPE155.desc = "A strange pot, the dirt in it gives off a dim light."
RECIPE155.noBlueprint = true
RECIPE155.items = {
	["j_scrap_plastics"] = 10,
	["j_scrap_organic"] = 10,
	["j_scrap_concrete"] = 5,	
	["j_cactus_plant"] = 2,
	["shard_dust"] = 1
}
RECIPE155.result = {
	["farm_cactus"] = 1
}
RECIPES:Register( RECIPE155 )
//
local RECIPE156 = {}
RECIPE156.uid = "nut_sledgehammer"
RECIPE156.name = "Makeshift Sledgehammer"
RECIPE156.category = "Weapons - Melee"
RECIPE156.model = Model( "models/props_debris/wood_board02a.mdl" )
RECIPE156.desc = "A large hammer usually used to distribute force over a wide area."
RECIPE156.noBlueprint = true
RECIPE156.items = {
	["j_scrap_concrete"] = 20,
	["j_scrap_wood"] = 15
}
RECIPE156.result = {
	["hl2_m_sledgehammer"] = 1
}
RECIPES:Register( RECIPE156 )
//