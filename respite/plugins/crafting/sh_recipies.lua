local PLUGIN = PLUGIN

local RECIPE = {}
RECIPE.uid = "nut_flare_red"
RECIPE.name = "Flare - Red"
RECIPE.category = "Light Sources"
RECIPE.model = "models/Items/grenadeAmmo.mdl"
RECIPE.desc = "A flare."
 
RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 10,
	["j_scrap_adhesive"] = 1,
}
RECIPE.result = {
	["nut_flare"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_glowstick_red"
RECIPE.name = "Glowstick - Red"
RECIPE.category = "Light Sources"
RECIPE.model = "models/glowstick/stick_red.mdl"
RECIPE.desc = "A glowstick."
 
RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_plastics"] = 10,
	["j_scrap_adhesive"] = 1,
}
RECIPE.result = {
	["weapon_glowstick_red"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_grenade_flash"
RECIPE.name = "Flash Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeAmmo.mdl"
RECIPE.desc = "A grenade used for stunning and disorienting those affected."
 
RECIPE.items = {
	["j_scrap_chems"] = 2,
	["j_scrap_metals"] = 20,
	["j_scrap_adhesive"] = 2
}
RECIPE.result = {
	["nut_flashgrenade"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_grenade_dark"
RECIPE.name = "Dark Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeammo.mdl"
RECIPE.desc = "A grenade that will temporarily prevent all light from entering an area."
 
RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 20,
	["j_scrap_adhesive"] = 2,
	["blight"] = 4
}
RECIPE.result = {
	["nut_darkgrenade"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_radio_station"
RECIPE.name = "Stationary Radio"
RECIPE.category = "Communication"
RECIPE.model = "models/props_lab/citizenradio.mdl"
RECIPE.desc = "A stationary radio."
 
RECIPE.items = {
	["j_scrap_elecs"] = 12,
	["j_scrap_metals"] = 25,
	["j_scrap_adhesive"] = 5,
	["j_scrap_screws"] = 6,
	["cube_chip"] = 5
}
RECIPE.result = {
	["comm_radio_stationary"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ziptie"
RECIPE.name = "Zip Ties"
RECIPE.category = "Miscellaneous"
RECIPE.model = "models/Items/CrossbowRounds.mdl"
RECIPE.desc = "Some zip ties."
 
RECIPE.items = {
	["j_scrap_plastics"] = 10
}
RECIPE.result = {
	["ziptie"] = 1
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
	["cube_chip"] = 5,
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
	["cube_chip"] = 10,
	["j_scrap_elecs"] = 20,
	["j_scrap_metals"] = 10
}
RECIPE.result = {
	["radio_booster"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_grenade_smoke"
RECIPE.name = "Smoke Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeAmmo.mdl"
RECIPE.desc = "A smoke grenade."
 
RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 8,
	["j_scrap_adhesive"] = 2,
}
RECIPE.result = {
	["nut_smokegrenade"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_grenade_tear"
RECIPE.name = "Tear Gas Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeAmmo.mdl"
RECIPE.desc = "A tear gas grenade."
 
RECIPE.items = {
	["j_scrap_chems"] = 5,
	["j_scrap_metals"] = 15,
	["j_scrap_adhesive"] = 2,
}
RECIPE.result = {
	["nut_teargas"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_grenade_frag"
RECIPE.name = "Explosive Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeAmmo.mdl"
RECIPE.desc = "An explosive grenade."
 
RECIPE.items = {
	["j_scrap_chems"] = 10,
	["j_scrap_metals"] = 20,
	["j_scrap_adhesive"] = 10,
}
RECIPE.result = {
	["nut_explosivegrenade"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_bat_nailed"
RECIPE.name = "Nailed Bat"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/warz/melee/baseballbat_spike.mdl"
RECIPE.desc = "A nailed bat."
 
RECIPE.items = {
	["j_scrap_nails"] = 10,
	["hl2_m_bat"] = 1
}
RECIPE.result = {
	["melee_bat_nail"] = 1
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
	["j_scrap_light"] = 2,
	["j_scrap_metals"] = 15,
	["j_scrap_adhesive"] = 5,
	["j_scrap_battery"] = 5,
	["cube_chip"] = 2
}
RECIPE.result = {
	["coflantern"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_beacon_red"
RECIPE.name = "Beacon - Red"
RECIPE.category = "Light Sources"
RECIPE.model = "models/Items/grenadeammo.mdl"
RECIPE.desc = "A red beacon used for signalling or illumination."
 
RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 10,
	["j_scrap_adhesive"] = 1,
	["j_scrap_screws"] = 2
}
RECIPE.result = {
	["nut_beacon"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_grenade_molotov"
RECIPE.name = "Molotov Cocktail"
RECIPE.category = "Grenades"
RECIPE.model = "models/props_junk/garbage_glassbottle003a.mdl"
RECIPE.desc = "A molotov cocktail."
 
RECIPE.items = {
	["j_scrap_chems"] = 2,
	["j_scrap_glass"] = 2,
	["j_scrap_cloth"] = 2
}
RECIPE.result = {
	["molotov"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_bandages"
RECIPE.name = "Bandages"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/box01a.mdl"
RECIPE.desc = "A box of bandages."
 
RECIPE.items = {
	["j_scrap_cloth"] = 8
}
RECIPE.result = {
	["medical_bandages"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_makeshift_spear"
RECIPE.name = "Makeshift Spear"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/props_debris/wood_chunk03e.mdl"
RECIPE.desc = "A board with a sharpened piece of metal on it."
 
RECIPE.items = {
	["j_scrap_metals"] = 5,
	["j_scrap_wood"] = 20
}
RECIPE.result = {
	["hl2_m_makeshift_spear"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_breach"
RECIPE.name = "Explosive Breach"
RECIPE.category = "Explosive"
RECIPE.model = "models/props_lab/powerbox02c.mdl"
RECIPE.desc = "An explosive device that can be used to blow open doors."
 
RECIPE.items = {
	["j_scrap_metals"] = 10,
	["nut_explosivegrenade"] = 1
}
RECIPE.result = {
	["breach"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_919"
RECIPE.name = "9x19mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/Items/boxsrounds.mdl"
RECIPE.desc = "Makeshift 9x19mm ammo made from scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 12,
	["cube_chip"] = 2
}
RECIPE.result = {
	["ammo_919"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_22lr"
RECIPE.name = ".22 LR Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/Items/boxsrounds.mdl"
RECIPE.desc = "Makeshift .22 LR Ammo made from scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 12,
	["cube_chip"] = 1
}
RECIPE.result = {
	["ammo_22lr"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_45"
RECIPE.name = ".45 ACP Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift .45 ACP ammo made from scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 14,
	["cube_chip"] = 2
}
RECIPE.result = {
	["ammo_45"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_40sw"
RECIPE.name = ".40 S&W Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/357ammo.mdl"
RECIPE.desc = "Makeshift .40 S&W ammo made from scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 12,
	["cube_chip"] = 2
}
RECIPE.result = {
	["ammo_40sw"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_5728"
RECIPE.name = "5.7x28mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift 5.7x28mm ammo made from scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 14,
	["cube_chip"] = 2
}
RECIPE.result = {
	["ammo_5728"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_357"
RECIPE.name = ".357 Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/357ammo.mdl"
RECIPE.desc = "Makeshift .357 rounds made from scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 14,
	["cube_chip"] = 3
}
RECIPE.result = {
	["ammo_357"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_colt1911"
RECIPE.name = "Makeshift Colt 1911"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_dmgf_co1911.mdl"
RECIPE.desc = "A pistol made out of scrap metal and other odds and ends."
 
RECIPE.items = {
	["j_scrap_metals"] = 15,
	["j_scrap_rubber"] = 10,
	["j_scrap_plastics"] = 10,
	["j_scrap_screws"] = 5,
	["j_scrap_chems"] = 10,
	["cube_chip"] = 20
}
RECIPE.result = {
	["tfa_colt1911_makeshift"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_flashlight_shard"
RECIPE.name = "Shardlight"
RECIPE.category = "Light Sources"
RECIPE.model = "models/warz/melee/flashlight.mdl"
RECIPE.desc = "A flashlight that uses a shard as a power source, rather than a battery."
 
RECIPE.items = {
	["j_scrap_metals"] = 8,
	["j_scrap_adhesive"] = 6,
	["shard_dust"] = 1
}
RECIPE.result = {
	["flashlight_shard"] = 1
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
	["j_scrap_metals"] = 10
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
	["j_scrap_concrete"] = 7
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
RECIPE.uid = "nut_slamfire"
RECIPE.name = "Slamfire Shotgun"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/props_lab/pipesystem01b.mdl"
RECIPE.desc = "A makeshift shotgun fashioned out of two pipes."
 
RECIPE.items = {
	["hl2_m_pipe"] = 2,
	["j_scrap_adhesive"] = 6,
	["j_scrap_screws"] = 2,
	["cube_chip"] = 5	
}
RECIPE.result = {
	["makeshift_slamfire"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_makeshift_sword"
RECIPE.name = "Makeshift Sword"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/props_debris/wood_chunk03e.mdl"
RECIPE.desc = "A hunk of sharpened scrap metal."
 
RECIPE.items = {
	["j_scrap_metals"] = 25
}
RECIPE.result = {
	["hl2_m_makeshift_sword"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_makeshift_sword_trap"
RECIPE.name = "Trap-scrap Sword"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/props_c17/trappropeller_blade.mdl"
RECIPE.desc = "A hunk of sharpened scrap metal."
 
RECIPE.items = {
	["j_scrap_metals"] = 70,
	["j_scrap_adhesive"] = 20
}
RECIPE.result = {
	["hl2_m_trapscrap"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_makeshift_shiv_glass"
RECIPE.name = "Glass Shiv"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/gibs/glass_shard04.mdl"
RECIPE.desc = "A shiv made out of broken glass."
 
RECIPE.items = {
	["j_scrap_glass"] = 10
}
RECIPE.result = {
	["hl2_m_glassshiv"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr1ka"
RECIPE.name = "CR-1KA"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_winchester_1873.mdl"
RECIPE.desc = "A makeshift bolt action rifle assembled from various scraps.\nIt'd be a simple design, however a few nods from a serious designer are left in its construction.\nThis particular variant has a shorter barrel.\nThis weapon utilizes 7.62x51mm rounds."
 
RECIPE.items = {
	["j_scrap_screws"] = 3,
	["j_scrap_wood"] = 25,
	["j_scrap_metals"] = 25,
	["j_scrap_plastics"] = 8,
	["j_scrap_adhesive"] = 3,
	["j_scrap_chems"] = 2,
	["cube_chip"] = 8,	
	["comp_reinforced_barrel"] = 1
}
RECIPE.result = {
	["tfa_cr1ka"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr1kb"
RECIPE.name = "CR-1KB"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_winchester_1873.mdl"
RECIPE.desc = "A makeshift bolt action rifle assembled from various scraps.\nIt'd be a simple design, however a few nods from a serious designer are left in its construction.\nThis particular variant has a shorter barrel.\nThis weapon utilizes 7.62x51mm rounds."
 
RECIPE.items = {
	["j_scrap_screws"] = 3,
	["j_scrap_wood"] = 25,
	["j_scrap_metals"] = 50,
	["j_scrap_plastics"] = 8,
	["j_scrap_adhesive"] = 3,
	["j_scrap_chems"] = 2,
	["cube_chip"] = 8,	
	["comp_reinforced_barrel"] = 1
}
RECIPE.result = {
	["tfa_cr1kb"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr1fa"
RECIPE.name = "CR-1FA"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_winchester_1873.mdl"
RECIPE.desc = "A makeshift bolt action rifle assembled from various scraps.\nIt'd be a simple design, however a few nods from a serious designer are left in its construction.\nThis particular variant has a shorter barrel and a short butt-stock.\nThis weapon utilizes 7.62x51mm rounds."
 
RECIPE.items = {
	["j_scrap_screws"] = 3,
	["j_scrap_wood"] = 25,
	["j_scrap_metals"] = 50,
	["j_scrap_plastics"] = 8,
	["j_scrap_adhesive"] = 3,
	["j_scrap_chems"] = 2,
	["cube_chip"] = 8,	
	["comp_reinforced_barrel"] = 1
}
RECIPE.result = {
	["tfa_cr1fa"] = 1
}
RECIPES:Register( RECIPE )//
RECIPE = {}
RECIPE.uid = "nut_cr1fb"
RECIPE.name = "CR-1FB"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_winchester_1873.mdl"
RECIPE.desc = "A makeshift bolt action rifle assembled from various scraps.\nIt'd be a simple design, however a few nods from a serious designer are left in its construction.\nThis particular variant has a shorter barrel and a short butt-stock.\nThis weapon utilizes 7.62x51mm rounds."
 
RECIPE.items = {
	["j_scrap_screws"] = 3,
	["j_scrap_wood"] = 25,
	["j_scrap_metals"] = 75,
	["j_scrap_plastics"] = 8,
	["j_scrap_adhesive"] = 3,
	["j_scrap_chems"] = 2,
	["cube_chip"] = 8,	
	["comp_reinforced_barrel"] = 1
}
RECIPE.result = {
	["tfa_cr1fb"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr2fa"
RECIPE.name = "CR-2FA"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_winchester_1873.mdl"
RECIPE.desc = "A makeshift bolt action rifle assembled from various scraps.\nIt'd be a simple design, however a few nods from a serious designer are left in its construction.\nThis particular variant has a full length barrel and a short butt-stock.\nThis weapon utilizes 7.62x51mm rounds."
 
RECIPE.items = {
	["tfa_cr1fa"] = 1,
	["j_scrap_wood"] = 4,
	["j_scrap_metals"] = 8,
	["j_scrap_plastics"] = 6,
	["comp_reinforced_barrel"] = 1,
	["cube_chip"] = 8
}
RECIPE.result = {
	["tfa_cr2fa"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr2fb"
RECIPE.name = "CR-2FB"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_winchester_1873.mdl"
RECIPE.desc = "A makeshift bolt action rifle assembled from various scraps.\nIt'd be a simple design, however a few nods from a serious designer are left in its construction.\nThis particular variant has a full length barrel, short butt-stock and a proper magazine feed.\nThis weapon utilizes 7.62x51mm rounds."
 
RECIPE.items = {
	["tfa_cr1fb"] = 1,
	["j_scrap_wood"] = 4,
	["j_scrap_metals"] = 8,
	["j_scrap_plastics"] = 6,
	["comp_reinforced_barrel"] = 1,
	["cube_chip"] = 8
}
RECIPE.result = {
	["tfa_cr2fb"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_splint"
RECIPE.name = "Makeshift Splint"
RECIPE.category = "Medical"
RECIPE.model = "models/props_junk/wood_crate001a_chunk05.mdl"
RECIPE.desc = "A makeshift splint for medical use."
 
RECIPE.items = {
	["j_scrap_wood"] = 10
}
RECIPE.result = {
	["medical_splint"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ivbag"
RECIPE.name = "Makeshift IV Bag"
RECIPE.category = "Medical"
RECIPE.model = "models/props_junk/garbage_bag001a.mdl"
RECIPE.desc = "Fluids not included."
 
RECIPE.items = {
	["j_scrap_plastics"] = 15,
	["j_scrap_adhesive"] = 1
}
RECIPE.result = {
	["medical_iv"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_gauze"
RECIPE.name = "Gauze"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/box01a.mdl"
RECIPE.desc = "Some makeshift gauze."
 
RECIPE.items = {
	["j_scrap_cloth"] = 20
}
RECIPE.result = {
	["medical_gauze"] = 1
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
	["blight"] = 5,
	["j_scrap_organic"] = 10
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
	["j_scrap_organic"] = 15
}
RECIPE.result = {
	["j_scrap_adhesive"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_nailgun"
RECIPE.name = "Makeshift Nailgun"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/warz/melee/nailgun.mdl"
RECIPE.desc = "A modified nailgun that can be used as a silent, very painful weapon.\nThis weapon utilizes nails."
 
RECIPE.items = {
	["j_scrap_screws"] = 2,
	["j_scrap_adhesive"] = 5,
	["j_scrap_metals"] = 20,
	["cube_chip"] = 6,
	["j_nailgun"] = 1
}
RECIPE.result = {
	["tfa_wasteland_nailgun"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cp1ka"
RECIPE.name = "CP-1KA"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_dmgf_co1911.mdl"
RECIPE.desc = "A pistol made out of scrap parts."
 
RECIPE.items = {
	["comp_firing_mechanism"] = 1,
	["j_scrap_screws"] = 2,
	["j_scrap_plastics"] = 10,
	["j_scrap_chems"] = 3,
	["j_scrap_metals"] = 25,
	["cube_chip"] = 6,
	["hl2_m_pipe"] = 1
}
RECIPE.result = {
	["tfa_cp1ka"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_crunt"
RECIPE.name = "CR-UNT"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_winchester_1873.mdl"
RECIPE.desc = "A makeshift triple barrel bolt action shotgun looking to be built by retrofitting and installing new and more complex parts to the more common CR series rifle. Designed to help deal alot of damage to large creatures in one hit."
 
RECIPE.items = {
	["tfa_cr1ka"] = 1,
	["j_scrap_screws"] = 2,
	["j_scrap_chems"] = 2,
	["j_scrap_metals"] = 15,
	["j_scrap_wood"] = 8,
	["j_scrap_plastics"] = 12,
	["cube_chip"] = 5,	
	["comp_reinforced_barrel"] = 2
}
RECIPE.result = {
	["tfa_crunt"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cross"
RECIPE.name = "CR-OSS"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_snip_m24_6.mdl"
RECIPE.desc = "A rigid robust high calibre rifle looking to be built by retrofitting and installing new and more complex parts to the more common CR series rifle. Designed to deliver a single precise and accurate shot at range."
 
RECIPE.items = {
	["tfa_cr2ka"] = 1,
	["j_scrap_adhesive"] = 4,
	["j_scrap_rubber"] = 8,
	["j_scrap_glass"] = 22,
	["j_scrap_chems"] = 6,
	["j_scrap_plastics"] = 8,
	["cube_chip"] = 5,	
	["comp_reinforced_barrel"] = 2
}
RECIPE.result = {
	["tfa_cross"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr3st"
RECIPE.name = "CR-3ST"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_g2_contender.mdl"
RECIPE.desc = "A compact makeshift break action single shot shotgun built from various scrap parts. Designed to give someone a compact package capable of delivering a fair kick in a stand-off situation."
 
RECIPE.items = {
	["j_scrap_rubber"] = 4,
	["comp_firing_mechanism"] = 1,
	["j_scrap_plastics"] = 6,
	["j_scrap_chems"] = 3,
	["j_scrap_metals"] = 25,
	["j_scrap_wood"] = 25,
	["cube_chip"] = 8,
	["hl2_m_pipe"] = 1
}
RECIPE.result = {
	["tfa_cr3st"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_crude"
RECIPE.name = "CR-UDE"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_colt_python.mdl"
RECIPE.desc = "A three round revolver made from various scrap parts. What looked like the hammer at first glance would turn out to be some strange rudimentary safety lever."
 
RECIPE.items = {
	["j_scrap_rubber"] = 4,
	["comp_firing_mechanism"] = 1,
	["j_scrap_metals"] = 10,
	["j_scrap_wood"] = 8,
	["cube_chip"] = 5,
	["hl2_m_pipe"] = 1
}
RECIPE.result = {
	["tfa_crude"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_antidepressants"
RECIPE.name = "Antidepressants"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.desc = "A small bottle filled with some pills."
 
RECIPE.items = {
	["drug_depress"] = 1,
	["blight"] = 1
}
RECIPE.result = {
	["drug_antidepressants"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_12g"
RECIPE.name = "12 Gauge Shells"
RECIPE.category = "Ammunition"
RECIPE.model = "models/Items/boxbuckshot.mdl"
RECIPE.desc = "Makeshift 12 gauge shells made of scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 22,
	["cube_chip"] = 4
}
RECIPE.result = {
	["ammo_12g"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr3s7"
RECIPE.name = "CR-3S7"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_g2_contender.mdl"
RECIPE.desc = "A makeshift break action single shot shotgun with a long barrel and stock built from various scrap parts. Appears to be based off the much more compact CR-3ST."
 
RECIPE.items = {
	["j_scrap_chems"] = 2,
	["j_scrap_wood"] = 16,
	["cube_chip"] = 8,
	["tfa_cr3st"] = 1,
	["comp_reinforced_barrel"] = 1
}
RECIPE.result = {
	["tfa_cr3s7"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cp1ko"
RECIPE.name = "CP-1KO"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_dmgf_co1911.mdl"
RECIPE.desc = "High capacity low calibre select fire pistol made from various scrap parts. Appears to be derived from the CP-1KA model."
 
RECIPE.items = {
	["j_scrap_plastics"] = 4,
	["comp_firing_mechanism"] = 1,
	["cube_chip"] = 10,
	["tfa_cp1ka"] = 1,
	["comp_reinforced_barrel"] = 1
}
RECIPE.result = {
	["tfa_cp1ko"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr3s750"
RECIPE.name = "CR-3S7-50"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_g2_contender.mdl"
RECIPE.desc = "A makeshift break action single shot .50 BMG hunting rifle with a long barrel and stock built from various scrap parts. Appears to be based off the much more compact CR-3ST."
 
RECIPE.items = {
	["j_scrap_plastics"] = 4,
	["j_scrap_chems"] = 8,
	["j_scrap_metals"] = 8,
	["j_scrap_wood"] = 16,
	["cube_chip"] = 12,
	["tfa_cr3st"] = 1,
	["comp_reinforced_barrel"] = 2
}
RECIPE.result = {
	["tfa_cr3s750"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cp1ks"
RECIPE.name = "CP-1KS"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_hk_mp5.mdl"
RECIPE.desc = "A fully automatic sub-machinegun made out of various scrap parts. Even with the thick forward grip on this gun, you can feel the barrel heating up after firing for extended periods of time."
 
RECIPE.items = {
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
RECIPE.result = {
	["tfa_cp1ks"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cp1cs"
RECIPE.name = "CP-1CS"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_hk_mp5.mdl"
RECIPE.desc = "A fully automatic sub-machinegun made out of various scrap parts. This variant has an extended barrel and a stock."
 
RECIPE.items = {
	["j_scrap_rubber"] = 2,
	["j_scrap_chems"] = 12,
	["j_scrap_wood"] = 12,
	["cube_chip"] = 16,
	["tfa_cp1ks"] = 1,
	["comp_firing_mechanism"] = 1,
	["hl2_m_pipe"] = 1
}
RECIPE.result = {
	["tfa_cp1cs"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_grenade_haze"
RECIPE.name = "Blue Haze Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeammo.mdl"
RECIPE.desc = "A haze grenade that disorients those caught in its fumes."
 
RECIPE.items = {
	["haze_bottled"] = 2,
	["j_scrap_metals"] = 10,
	["cube_chip"] = 5
}
RECIPE.result = {
	["nut_haze"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_chip_pouch"
RECIPE.name = "Chip Pouch"
RECIPE.category = "Machines"
RECIPE.model = "models/props_junk/garbage_bag001a.mdl"
RECIPE.desc = "A small sack, it has many slots within it. It can hold 25 chips."
 
RECIPE.items = {
	["j_scrap_cloth"] = 10,
	["cube_chip_enhanced"] = 1
}
RECIPE.result = {
	["cube_chip_pouch"] = 1
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
	["j_scrap_metals"] = 15,
	["j_scrap_screws"] = 4,
	["j_scrap_chems"] = 2
}
RECIPE.result = {
	["generator_repair"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_repair"
RECIPE.name = "Small Repair Kit"
RECIPE.category = "Machines"
RECIPE.model = "models/props_junk/cardboard_box004a.mdl"
RECIPE.desc = "A small box filled with miscellaneous metals, disposable tools, and other odds and ends."
 
RECIPE.items = {
	["j_scrap_metals"] = 10,
	["j_scrap_screws"] = 2
}
RECIPE.result = {
	["repair_kit"] = 1
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
	["j_scrap_plastics"] = 10,
	["j_scrap_organic"] = 10,
	["j_scrap_concrete"] = 5,	
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
	["j_scrap_plastics"] = 10,
	["j_scrap_organic"] = 10,
	["j_scrap_concrete"] = 5,	
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
	["j_scrap_plastics"] = 10,
	["j_scrap_organic"] = 10,
	["j_scrap_concrete"] = 5,	
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
	["j_scrap_plastics"] = 10,
	["j_scrap_organic"] = 10,
	["j_scrap_concrete"] = 5,	
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
	["j_scrap_plastics"] = 10,
	["j_scrap_organic"] = 10,
	["j_scrap_concrete"] = 5,	
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
	["j_scrap_plastics"] = 10,
	["j_scrap_organic"] = 10,
	["j_scrap_concrete"] = 5,
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
	["j_scrap_plastics"] = 20,
	["j_scrap_organic"] = 20,
	["j_scrap_concrete"] = 5,
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
	["j_scrap_plastics"] = 20,
	["j_scrap_organic"] = 20,
	["j_scrap_concrete"] = 5,
	["food_pumpkin"] = 1,
	["shard_dust"] = 1
}
RECIPE.result = {
	["farm_pumpkin"] = 1
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
	["j_scrap_cloth"] = 5,
	["j_scrap_wood"] = 10,
	["j_scrap_metals"] = 5,
	["j_scrap_adhesive"] = 2,
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
	["hl2_m_pipe"] = 4,
	["j_scrap_plastics"] = 10,
	["j_scrap_metals"] = 10,
	["j_scrap_adhesive"] = 2,
	["cube_chip_enhanced"] = 1
}
RECIPE.result = {
	["brewery"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_disinfectant"
RECIPE.name = "Disinfectant"
RECIPE.category = "Medical"
RECIPE.model = "models/props_junk/glassjug01.mdl"
RECIPE.desc = "A bottle filled with some kind of disinfectant."
 
RECIPE.items = {
	["j_scrap_chems"] = 3,
	["food_water"] = 1,
	["drug_depress"] = 2
}
RECIPE.result = {
	["drug_disinfectant"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_burnointment"
RECIPE.name = "Burn Ointment"
RECIPE.category = "Medical"
RECIPE.model = "models/props_junk/glassjug01.mdl"
RECIPE.desc = "A bottle filled with burn ointment."
 
RECIPE.items = {
	["j_scrap_chems"] = 2,
	["food_water"] = 1,
	["drug_depress"] = 2
}
RECIPE.result = {
	["drug_burnointment"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_painkillers"
RECIPE.name = "Painkillers"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.desc = "A small bottle filled with some pills."
 
RECIPE.items = {
	["j_scrap_chems"] = 3,
	["food_water"] = 1,
	["drug_depress"] = 3
}
RECIPE.result = {
	["drug_painkillers"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_sleepingpills"
RECIPE.name = "Sleeping Pills"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.desc = "A small bottle filled with some pills."
 
RECIPE.items = {
	["j_scrap_chems"] = 1,
	["food_water"] = 1,
	["drug_depress"] = 2
}
RECIPE.result = {
	["drug_sleepingpills"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_rubbingalcohol"
RECIPE.name = "Rubbing Alcohol"
RECIPE.category = "Medical"
RECIPE.model = "models/props_junk/glassjug01.mdl"
RECIPE.desc = "A bottle filled with rubbing alcohol."
 
RECIPE.items = {
	["j_scrap_chems"] = 1,
	["food_water"] = 1,
	["drug_depress"] = 2
}
RECIPE.result = {
	["drug_rubbingalcohol"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_steroid"
RECIPE.name = "Steroid"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.desc = "A bottle filled with medical steroids."
 
RECIPE.items = {
	["j_scrap_chems"] = 2,
	["food_water"] = 2,
	["drug_depress"] = 2
}
RECIPE.result = {
	["drug_steroid"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_antibiotics"
RECIPE.name = "Antibiotics"
RECIPE.category = "Medical"
RECIPE.model = "models/healthvial.mdl"
RECIPE.desc = "A bottle filled with antibiotics."
 
RECIPE.items = {
	["j_scrap_chems"] = 3,
	["food_water"] = 2,
	["drug_depress"] = 3
}
RECIPE.result = {
	["drug_antibiotics"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_purification_tablet"
RECIPE.name = "Water Purification Tablet"
RECIPE.category = "Medical"
RECIPE.model = "models/gibs/metal_gib4.mdl"
RECIPE.desc = "A small tablet, it says 'PURIFY' on the side of it."
 
RECIPE.items = {
	["j_scrap_metals"] = 4,
	["drug_depress"] = 1
}
RECIPE.result = {
	["purifier_water_tablet"] = 1
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
	["food_yams"] = 4,
	["j_scrap_memory"] = 1
}
RECIPE.result = {
	["food_yams_mysterious"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_medicalkit"
RECIPE.name = "First-Aid Kit"
RECIPE.category = "Medical"
RECIPE.model = "models/items/healthkit.mdl"
RECIPE.desc = "A standard medical kit used to apply first aid."
 
RECIPE.items = {
	["j_scrap_plastics"] = 10,
	["j_scrap_chems"] = 2,
	["j_scrap_adhesive"] = 1,
	["medical_bandages"] = 2,
	["medical_gauze"] = 1
}
RECIPE.result = {
	["medical_kit"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_medicalkit_plastic"
RECIPE.name = "Plastic Aid Kit"
RECIPE.category = "Medical"
RECIPE.model = "models/items/healthkit.mdl"
RECIPE.desc = "A standard medical kit used to apply first aid."
 
RECIPE.items = {
	["j_scrap_plastics"] = 50,
	["food_water_misc"] = 2,
}
RECIPE.result = {
	["first_aid_plastic"] = 1
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
	["blight"] = 5,
	["hl2_m_wrench"] = 1,
	["j_drill"] = 1,
	["j_power_saw"] = 1,
	["hl2_m_hammer"] = 1
}
RECIPE.result = {
	["kit_salvager"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_turret_kit"
RECIPE.name = "Sentry Kit"
RECIPE.category = "Machines"
RECIPE.model = "models/props_c17/suitcase_passenger_physics.mdl"
RECIPE.desc = "A metallic kit, it has spaces on the inside to fit the various parts of a sentry turret."
 
RECIPE.items = {
	["j_scrap_idea"] = 2,
	["j_scrap_elecs"] = 20,
	["j_scrap_screws"] = 10,
	["j_scrap_chems"] = 10,
	["cube_chip_enhanced"] = 1,
	["charged_cube"] = 1
}
RECIPE.result = {
	["kit_sentry"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_hammer"
RECIPE.name = "Carpenter Hammer"
RECIPE.category = "Tools"
RECIPE.model = "models/warz/melee/hammer.mdl"
RECIPE.desc = "A tool used to apply blunt force."
 
RECIPE.items = {
	["j_scrap_metals"] = 10,
	["j_scrap_wood"] = 10
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
	["j_scrap_metals"] = 15
}
RECIPE.result = {
	["hl2_m_wrench"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr33k"
RECIPE.name = "CR-33K"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_dmg_vikhr.mdl"
RECIPE.desc = "A fully automatic assault rifle made out of various scrap parts. Has no real stock and is a real pain to control even with a lower rate of fire, but atleast offers. high capacity automatic rifle fire."
 
RECIPE.items = {
	["j_scrap_screws"] = 2,
	["j_scrap_rubber"] = 8,
	["j_scrap_adhesive"] = 10,
	["j_scrap_chems"] = 6,
	["j_scrap_metals"] = 25,
	["j_scrap_plastics"] = 25,
	["j_scrap_wood"] = 25,
	["comp_reinforced_barrel"] = 2,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_cr33k"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr33m"
RECIPE.name = "CR-33M"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_dmg_vikhr.mdl"
RECIPE.desc = "A fully automatic assault rifle made out of various scrap parts. This variant has a special 100rd magazine, heavy barrel to compensate and heavier recoil management systems.\nThis weapon utilizes 5.56x45mm rounds."
 
RECIPE.items = {
	["tfa_cr33d"] = 1,
	["j_scrap_screws"] = 5,
	["j_scrap_rubber"] = 6,
	["j_scrap_metals"] = 25,
	["j_scrap_adhesive"] = 10,
	["j_scrap_chems"] = 12,
	["comp_weapons_cpu_basic"] = 1,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_cr33m"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr33p"
RECIPE.name = "CR-33P"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_dmg_vikhr.mdl"
RECIPE.desc = "A fully automatic assault rifle made out of various scrap parts. This variant features a super fast two round burst mode, higher overall RPM and a non magnified optic.\nThis weapon utilizes 5.56x45mm rounds."
 
RECIPE.items = {
	["tfa_cr33d"] = 1,
	["j_scrap_screws"] = 5,
	["j_scrap_rubber"] = 6,
	["j_scrap_metals"] = 12,
	["j_scrap_adhesive"] = 10,
	["j_scrap_chems"] = 12,
	["comp_weapons_cpu_basic"] = 2,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_cr33p"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr33D"
RECIPE.name = "CR-33D"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_dmg_vikhr.mdl"
RECIPE.desc = "A fully automatic assault rifle made out of various scrap parts. This variant has an extended barrel and a full stock."
 
RECIPE.items = {
	["j_scrap_rubber"] = 6,
	["j_scrap_chems"] = 10,
	["j_scrap_metals"] = 8,
	["j_scrap_wood"] = 15,
	["tfa_cr33k"] = 1,
	["comp_reinforced_barrel"] = 2,
	["cube_chip"] = 18
}
RECIPE.result = {
	["tfa_cr33d"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr0ck"
RECIPE.name = "CR-0CK"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_fg42.mdl"
RECIPE.desc = "Semi automatic rifle made from various scrap parts. A true example of what can be achieved solely by putting your mind and efforts into junk firearms."
 
RECIPE.items = {
	["j_scrap_screws"] = 2,
	["j_scrap_rubber"] = 10,
	["j_scrap_adhesive"] = 10,
	["j_scrap_chems"] = 8,
	["j_scrap_metals"] = 22,
	["j_scrap_plastics"] = 22,
	["j_scrap_wood"] = 24,
	["comp_reinforced_barrel"] = 2,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_cr0ck"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr1ck"
RECIPE.name = "CR-1CK"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_fg42.mdl"
RECIPE.desc = "Fully automatic carbine variant of the CR-0CK. Features a high firerate, and then an experimental motorized burst mode with an even higher firerate. No, we're not joking.\nThis weapon utilizes 5.56x39mm rounds."
 
RECIPE.items = {
	["tfa_cr0ck"] = 1,
	["comp_firing_mechanism"] = 4,
	["ammo_battery"] = 5,
	["comp_weapons_cpu_basic"] = 4,
	["comp_reinforced_barrel"] = 2,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_cr1ck"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr4ck"
RECIPE.name = "CR-4CK"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_fg42.mdl"
RECIPE.desc = "Fully automatic shotgun variant of the CR-0CK. Features a high firerate, then an experimental two shell burst mode with an even higher firerate. No, we're not joking.\nThis weapon utilizes 12 gauge shells."
 
RECIPE.items = {
	["tfa_cr0ck"] = 1,
	["comp_firing_mechanism"] = 4,
	["ammo_battery"] = 5,
	["comp_weapons_cpu_basic"] = 4,
	["comp_reinforced_barrel"] = 2,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_cr4ck"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr0c5"
RECIPE.name = "CR-0C5"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_fg42.mdl"
RECIPE.desc = "Semi automatic rifle made from various scrap parts. A true example of what can be achieved solely by putting your mind and efforts into junk firearms. This one has an extended barrel and a stock."
 
RECIPE.items = {
	["j_scrap_rubber"] = 4,
	["j_scrap_adhesive"] = 12,
	["j_scrap_chems"] = 14,
	["j_scrap_wood"] = 14,
	["comp_reinforced_barrel"] = 2,
	["tfa_cr0ck"] = 1,
	["cube_chip"] = 16
}
RECIPE.result = {
	["tfa_cr0c5"] = 1
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
	["j_scrap_screws"] = 10,
	["j_scrap_adhesive"] = 10,
	["j_scrap_chems"] = 6,
	["j_scrap_metals"] = 25,
	["j_scrap_plastics"] = 25,
	["cube_chip_enhanced"] = 1
}
RECIPE.result = {
	["generator_chip"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_sentry"
RECIPE.name = "Makeshift Sentry"
RECIPE.category = "Machines"
RECIPE.model = "models/combine_turrets/floor_turret.mdl"
RECIPE.desc = "An automated turret that fires based on movement."
 
RECIPE.items = {
	["ammo_919"] = 4,
	["j_scrap_elecs"] = 50,
	["j_scrap_metals"] = 75,
	["j_scrap_screws"] = 15,
	["charged_cube"] = 1,
	["cube_chip"] = 10,
}
RECIPE.result = {
	["sentry"] = 1
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
	["j_scrap_cloth"] = 3
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
	["j_scrap_plastics"] = 25,
	["j_scrap_concrete"] = 10,
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
	["blight"] = 10,
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
	["j_scrap_elecs"] = 6,
	["j_scrap_metals"] = 10,
	["j_scrap_adhesive"] = 1,
	["j_scrap_screws"] = 2
}
RECIPE.result = {
	["comm_signal"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr3t3"
RECIPE.name = "CR-3T3"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_mossberg_590.mdl"
RECIPE.desc = "A pump action rifle that fires custom caseless custom concrete slug rounds. More than a strange design, and while it's not entirely apparent how it might work it makes for a fair rifle with cheap albeit heavy ammo."
 
RECIPE.items = {
	["comp_weapons_cpu_basic"] = 1,
	["j_scrap_rubber"] = 6,
	["j_scrap_metals"] = 25,
	["j_scrap_wood"] = 10,
	["comp_reinforced_barrel"] = 2,
	["j_scrap_chems"] = 6,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_cr3t3"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_concrete"
RECIPE.name = "Concrete Slugs"
RECIPE.category = "Ammunition"
RECIPE.model = "models/Items/boxbuckshot.mdl"
RECIPE.desc = "Makeshift slugs made out of concrete."
 
RECIPE.items = {
	["j_scrap_concrete"] = 12,
	["cube_chip"] = 1
}
RECIPE.result = {
	["ammo_concrete"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr2ka"
RECIPE.name = "CR-2KA"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_winchester_1873.mdl"
RECIPE.desc = "A makeshift bolt action rifle assembled from various scraps. It'd be a simple design, however a few nods from a serious designer are left in its construction.\nThis particular variant has a full length barrel."
 
RECIPE.items = {
	["tfa_cr1ka"] = 1,
	["j_scrap_wood"] = 4,
	["j_scrap_metals"] = 8,
	["j_scrap_plastics"] = 6,
	["comp_reinforced_barrel"] = 1,
	["cube_chip"] = 8
}
RECIPE.result = {
	["tfa_cr2ka"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr2kb"
RECIPE.name = "CR-2KB"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_winchester_1873.mdl"
RECIPE.desc = "A makeshift bolt action rifle assembled from various scraps. It'd be a simple design, however a few nods from a serious designer are left in its construction.\nThis particular variant has a full length barrel."
 
RECIPE.items = {
	["tfa_cr1kb"] = 1,
	["j_scrap_wood"] = 4,
	["j_scrap_metals"] = 8,
	["j_scrap_plastics"] = 6,
	["comp_reinforced_barrel"] = 1,
	["cube_chip"] = 8
}
RECIPE.result = {
	["tfa_cr2kb"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cp1kh"
RECIPE.name = "CP-1KH"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_dmgf_co1911.mdl"
RECIPE.desc = "High capacity low calibre pistol made out of various pieces of scrap. This one has a suppressor attached."
 
RECIPE.items = {
	["tfa_cp1ka"] = 1,
	["j_scrap_screws"] = 4,
	["j_scrap_metals"] = 8,
	["j_scrap_plastics"] = 4,
	["j_scrap_chems"] = 5,
	["j_scrap_adhesive"] = 4,
	["comp_reinforced_barrel"] = 1,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_cp1kh"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cp1kx"
RECIPE.name = "CP-1KX"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_dmgf_co1911.mdl"
RECIPE.desc = "High capacity low calibre select fire pistol made from various scrap parts. This is the suppressed variant of the CP-1K0."
 
RECIPE.items = {
	["tfa_cp1ko"] = 1,
	["j_scrap_screws"] = 5,
	["j_scrap_metals"] = 10,
	["j_scrap_plastics"] = 4,
	["j_scrap_chems"] = 5,
	["j_scrap_adhesive"] = 5,
	["comp_reinforced_barrel"] = 1,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_cp1kx"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cp1ch"
RECIPE.name = "CP-1CH"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_hk_mp5.mdl"
RECIPE.desc = "A fully automatic sub-machinegun made out of various scrap parts. This variant has an extended built in suppressor barrel and a stock."
 
RECIPE.items = {
	["tfa_cp1cs"] = 1,
	["j_scrap_screws"] = 6,
	["j_scrap_rubber"] = 8,
	["j_scrap_metals"] = 20,
	["j_scrap_chems"] = 9,
	["j_scrap_adhesive"] = 4,
	["comp_reinforced_barrel"] = 1,
	["cube_chip"] = 16
}
RECIPE.result = {
	["tfa_cp1ch"] = 1
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
	["j_scrap_bone"] = 15
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
	["j_scrap_wood"] = 10
}
RECIPE.result = {
	["hl2_m_plank"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_sawblade"
RECIPE.name = "Sawblade"
RECIPE.category = "Ammunition"
RECIPE.model = "models/props_junk/sawblade001a.mdl"
RECIPE.desc = "A single, small sawblade."
 
RECIPE.items = {
	["j_scrap_metals"] = 10,
	["cube_chip"] = 1
}
RECIPE.result = {
	["ammo_sawblade"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_meat_stew"
RECIPE.name = "Meaty Stew"
RECIPE.category = "Food"
RECIPE.model = "models/props/cs_militia/paintbucket01.mdl"
RECIPE.desc = "A big bucket of meaty stew."
 
RECIPE.items = {
	["food_monster_meat"] = 5,
	["cube_chip"] = 1
}
RECIPE.result = {
	["food_meat_stew"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cheese"
RECIPE.name = "Cheese"
RECIPE.category = "Food"
RECIPE.model = "models/hunter/triangles/025x025.mdl"
RECIPE.desc = "A large hunk of cheese."
 
RECIPE.items = {
	["j_scrap_organic"] = 2,
	["food_milk_carton"] = 1
}
RECIPE.result = {
	["food_cheese"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cheese_wheel"
RECIPE.name = "Cheese Wheel"
RECIPE.category = "Food"
RECIPE.model = "models/hunter/plates/plate05x05_rounded.mdl"
RECIPE.desc = "A large wheel of cheese."
 
RECIPE.items = {
	["j_scrap_organic"] = 6,
	["food_milk_jug"] = 1
}
RECIPE.result = {
	["food_cheese_wheel"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_pickles"
RECIPE.name = "Pickles"
RECIPE.category = "Food"
RECIPE.model = "models/props_lab/jar01a.mdl"
RECIPE.desc = "A jar filled with pickles."
 
RECIPE.items = {
	["j_scrap_organic"] = 10,
	["j_scrap_glass"] = 5
}
RECIPE.result = {
	["food_pickles"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_chips"
RECIPE.name = "Potato Chips"
RECIPE.category = "Food"
RECIPE.model = "models/props_junk/garbage_bag001a.mdl"
RECIPE.desc = "A sealed plastic bag filled with semi-crushed potato chips."
 
RECIPE.items = {
	["food_potato"] = 2
}
RECIPE.result = {
	["food_chips"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_crass"
RECIPE.name = "CR-ASS"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_pp19_bizon.mdl"
RECIPE.desc = "A makeshift saw-blade launcher made out of various scrap parts. While the ammo can be costly the ability to retrieve it can make a single disc worth a theoretically unlimited amount of kills."
 
RECIPE.items = {
	["comp_firing_mechanism"] = 3,
	["j_scrap_rubber"] = 12,
	["comp_weapons_cpu_basic"] = 1,
	["comp_reinforced_barrel"] = 2,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_crass"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cp1kl"
RECIPE.name = "CP-1KL"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_dmgf_co1911.mdl"
RECIPE.desc = "Low capacity high calibre pistol with an extended barrel made out of various pieces of scrap."
 
RECIPE.items = {
	["comp_firing_mechanism"] = 1,
	["j_scrap_plastics"] = 12,
	["j_scrap_chems"] = 10,
	["comp_reinforced_barrel"] = 1,
	["tfa_cp1ka"] = 1,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_cp1kl"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cp1km"
RECIPE.name = "CP-1KM"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_dmgf_co1911.mdl"
RECIPE.desc = "Low capacity high calibre pistol with an extended barrel made out of various pieces of scrap. This one has an integral suppressor built into it."
 
RECIPE.items = {
	["j_scrap_screws"] = 4,
	["j_scrap_metals"] = 20,
	["j_scrap_plastics"] = 4,
	["j_scrap_adhesive"] = 4,
	["j_scrap_chems"] = 7,
	["comp_reinforced_barrel"] = 1,
	["tfa_cp1kl"] = 1,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_cp1km"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_medicalkitrefill"
RECIPE.name = "Refill First-Aid Kit"
RECIPE.category = "Medical"
RECIPE.model = "models/items/healthkit.mdl"
RECIPE.desc = "Refill an empty first aid kit with new supplies."
 
RECIPE.items = {
	["j_used_first_aid_kit"] = 1,
	["j_scrap_chems"] = 2,
	["j_scrap_adhesive"] = 2,
	["medical_bandages"] = 2,
	["medical_gauze"] = 1
}
RECIPE.result = {
	["medical_kit"] = 1
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
	["j_scrap_chems"] = 12,
	["cube_chip"] = 4
}
RECIPE.result = {
	["j_fuel"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_chafe"
RECIPE.name = "CH-AFE"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/w_rocket_launcher.mdl"
RECIPE.desc = "A janky flamethrower that looks like a set of pipes tubes and steel cannisters connected and reinforced with bits of scrap.\nRequires both the weapon mounted tank and an external tank connected by a thick boost hose to run.\nRequires fuel to use."
 
RECIPE.items = {
	["ziptie"] = 4,
	["j_syringe"] = 1,
	["comp_fuel_tank"] = 1,
	["j_scrap_screws"] = 10,
	["j_scrap_rubber"] = 25,
	["j_scrap_metals"] = 25,
	["j_scrap_plastics"] = 25,
	["j_scrap_glass"] = 8,
	["j_scrap_elecs"] = 6,
	["j_scrap_adhesive"] = 10,
	["hl2_m_pipe"] = 3,
	["cube_chip"] = 8
}
RECIPE.result = {
	["tfa_chafe"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ch3ck"
RECIPE.name = "CH-3CK"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/mechanics/solid_steel/box_beam_4.mdl"
RECIPE.desc = "Makeshift rocket-launcher. While it seems simple in core design, the munitions are probably the expensive piece. Rumoured to be named after what you should do prior to firing lest you want to blow yourself up.\nThis weapon utilizes rockets."
 
RECIPE.items = {
	["comp_firing_mechanism"] = 4,
	["comp_reinforced_barrel"] = 4,
	["j_scrap_chems"] = 40,
	["j_scrap_rubber"] = 14,
	["j_scrap_adhesive"] = 12,
	["j_scrap_screws"] = 20,
	["j_scrap_metals"] = 25,
	["cube_chip"] = 25
}
RECIPE.result = {
	["tfa_ch3ck"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_fuel_tank"
RECIPE.name = "Fuel Tank"
RECIPE.category = "Components"
RECIPE.model = "models/props_junk/gascan001a.mdl"
RECIPE.desc = "A container that can be used to hold dangerous materials in all sorts of situations. It is resistant to most physical attacks. Firearms may penetrate it."
 
RECIPE.items = {
	["j_scrap_screws"] = 6,
	["j_scrap_metals"] = 15,
	["j_scrap_plastics"] = 25,
	["j_scrap_adhesive"] = 9,
	["j_scrap_chems"] = 25,
	["cube_chip"] = 15
}
RECIPE.result = {
	["comp_fuel_tank"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_firing_mechanism"
RECIPE.name = "Makeshift Firing Mechanism"
RECIPE.category = "Components"
RECIPE.model = "models/warz/items/syringe.mdl"
RECIPE.desc = "A makeshift firing mechanism useful for creating simple weaponry."
 
RECIPE.items = {
	["j_scrap_screws"] = 3,
	["j_scrap_metals"] = 9,
	["j_scrap_adhesive"] = 4,
	["j_scrap_chems"] = 2,
	["cube_chip"] = 2
}
RECIPE.result = {
	["comp_firing_mechanism"] = 1
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
	["cube_chip"] = 5,
	["cube_chip_enhanced"] = 1,
	["j_scrap_wood"] = 15,
	["j_scrap_metals"] = 15
}
RECIPE.result = {
	["mystery_box"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_antipsychotics"
RECIPE.name = "Antipsychotics"
RECIPE.category = "Medical"
RECIPE.model = "models/props_junk/glassjug01.mdl"
RECIPE.desc = "A bottle filled with numerous pills."
 
RECIPE.items = {
	["drug_psychotics"] = 1,
	["blight"] = 1
}
RECIPE.result = {
	["drug_antipsychotics"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_reinforced_barrel"
RECIPE.name = "Reinforced Barrel"
RECIPE.category = "Components"
RECIPE.model = "models/props_canal/mattpipe.mdl"
RECIPE.desc = "A makeshift gun barrel made out of scrap."
 
RECIPE.items = {
	["cube_chip"] = 2,
	["hl2_m_pipe"] = 2,
	["j_scrap_chems"] = 2,
	["j_scrap_adhesive"] = 1,
	["j_scrap_screws"] = 4
}
RECIPE.result = {
	["comp_reinforced_barrel"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_weapons_cpu_basic"
RECIPE.name = "Basic Weapons CPU"
RECIPE.category = "Components"
RECIPE.model = "models/props/cs_office/computer_caseb_p5b.mdl"
RECIPE.desc = "A makeshift weapons CPU for simple calculations."
 
RECIPE.items = {
	["cube_chip"] = 2,
	["j_scrap_elecs"] = 25,
	["j_scrap_plastics"] = 18,
	["j_scrap_battery"] = 4,
	["j_scrap_screws"] = 3
}
RECIPE.result = {
	["comp_weapons_cpu_basic"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ch43t"
RECIPE.name = "CH-34T"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_magpul_pdr.mdl"
RECIPE.desc = "Heavy bullpup concrete slug carbine. Hits hard with heavy concrete slug rounds, but useless at longer range as the heavy rounds have a lot of drop."
 
RECIPE.items = {
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
RECIPE.result = {
	["tfa_ch34t"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_bat_homerunaway"
RECIPE.name = "Home Run-Away"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/warz/melee/baseballbat.mdl"
RECIPE.desc = "A makeshift melee weapon made out of a baseball bat and a sawblade."
 
RECIPE.items = {
	["j_scrap_adhesive"] = 4,
	["cube_chip"] = 2,
	["ammo_sawblade"] = 1,
	["hl2_m_bat"] = 1
}
RECIPE.result = {
	["hl2_m_homerunaway"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_gearmace"
RECIPE.name = "Gear Mace"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/props_vehicles/carparts_muffler01a.mdl"
RECIPE.desc = "A makeshift weapon made out of a gear and car parts."
 
RECIPE.items = {
	["j_scrap_adhesive"] = 5,
	["cube_chip"] = 2,
	["j_gear"] = 1,
	["j_car_muffler"] = 1
}
RECIPE.result = {
	["hl2_m_gearmace"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_makeshift_glaive"
RECIPE.name = "Makeshift Glaive"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/props_c17/signpole001.mdl"
RECIPE.desc = "A makeshift glaive made out of multiple pieces of scrap."
 
RECIPE.items = {
	["j_scrap_adhesive"] = 6,
	["j_scrap_metals"] = 20,
	["cube_chip"] = 4,
	["hl2_m_pole"] = 1,
	["hl2_m_machate"] = 1
}
RECIPE.result = {
	["hl2_m_makeshift_glaive"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_machete"
RECIPE.name = "Makeshift Machete"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/warz/melee/machete.mdl"
RECIPE.desc = "A sharp tool made out of metal, used for slicing."
 
RECIPE.items = {
	["j_scrap_adhesive"] = 4,
	["j_scrap_metals"] = 10,
	["cube_chip"] = 2,
	["hl2_m_shiv_metal"] = 1,
}
RECIPE.result = {
	["hl2_m_machate"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_pole_metal"
RECIPE.name = "Metal Pole"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/props_c17/signpole001.mdl"
RECIPE.desc = "A long metallic pole, it is very heavy."
 
RECIPE.items = {
	["j_scrap_metals"] = 25
}
RECIPE.result = {
	["hl2_m_pole"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_harpoon"
RECIPE.name = "Harpoon"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/props_junk/harpoon002a.mdl"
RECIPE.desc = "A long spear-like instrument."
 
RECIPE.items = {
	["hl2_m_pole"] = 1,
	["j_scrap_metals"] = 15
}
RECIPE.result = {
	["hl2_m_harpoon"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_pole_wood"
RECIPE.name = "Wooden Pole"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/props_c17/signpole001.mdl"
RECIPE.desc = "A long wooden pole. Great for cracking people over the head."
 
RECIPE.items = {
	["j_scrap_wood"] = 25
}
RECIPE.result = {
	["hl2_m_woodenpole"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_bone_shiv"
RECIPE.name = "Bone Shiv"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/gibs/hgibs_scapula.mdl"
RECIPE.desc = "A makeshift shiv made out of bones."
 
RECIPE.items = {
	["j_scrap_bone"] = 15,
	["j_scrap_adhesive"] = 1,
}
RECIPE.result = {
	["hl2_m_boneshiv"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_bone_cudgel"
RECIPE.name = "Bone Cudgel"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/gibs/hgibs_spine.mdl"
RECIPE.desc = "A makeshift cudgel made out of bones."
 
RECIPE.items = {
	["j_scrap_bone"] = 30,
	["j_scrap_adhesive"] = 2,
	["cube_chip"] = 1,
}
RECIPE.result = {
	["hl2_m_bonecudgel"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_44"
RECIPE.name = ".44 Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/357ammo.mdl"
RECIPE.desc = "Makeshift .44 ammo made of scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 17,
	["cube_chip"] = 3
}
RECIPE.result = {
	["ammo_44"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_50ae"
RECIPE.name = ".50 AE Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/357ammo.mdl"
RECIPE.desc = "Makeshift .50 AE ammo made of scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 17,
	["cube_chip"] = 4
}
RECIPE.result = {
	["ammo_50ae"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_500"
RECIPE.name = ".500 Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/357ammo.mdl"
RECIPE.desc = "Makeshift .500 ammo made of scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 22,
	["cube_chip"] = 4
}
RECIPE.result = {
	["ammo_500"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_4570"
RECIPE.name = ".45-70 Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/sniper_round_box.mdl"
RECIPE.desc = "Makeshift .45-70 ammo made of scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 24,
	["cube_chip"] = 4
}
RECIPE.result = {
	["ammo_4570"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_4570_big"
RECIPE.name = "Large .45-70 Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/sniper_round_box.mdl"
RECIPE.desc = "Makeshift .45-70 ammo made of scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 50,
	["cube_chip"] = 8
}
RECIPE.result = {
	["ammo_4570_big"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_54539"
RECIPE.name = "5.45x39mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift 5.45x39mm ammo made of scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 22,
	["cube_chip"] = 5
}
RECIPE.result = {
	["ammo_54539"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_55645"
RECIPE.name = "5.56x45mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift 5.56x45mm ammo made of scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 22,
	["cube_chip"] = 5
}
RECIPE.result = {
	["ammo_55645"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_55639"
RECIPE.name = "5.56x39mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift 5.56x39mm ammo made of scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 20,
	["cube_chip"] = 5
}
RECIPE.result = {
	["ammo_55639"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_76239"
RECIPE.name = "7.62x39mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift 7.62x39mm ammo made of scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 24,
	["cube_chip"] = 5
}
RECIPE.result = {
	["ammo_76239"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_939"
RECIPE.name = "9x39mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift 9x39mm ammo made of scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 25,
	["cube_chip"] = 5
}
RECIPE.result = {
	["ammo_939"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_76251"
RECIPE.name = "7.62x51mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift 7.62x51mm ammo made of scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 25,
	["cube_chip"] = 6
}
RECIPE.result = {
	["ammo_76251"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_76254"
RECIPE.name = "7.62x54mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift 7.62x54mm ammo made of scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 25,
	["cube_chip"] = 6
}
RECIPE.result = {
	["ammo_76254"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_3006"
RECIPE.name = ".30-06 Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift .30-06 ammo made of scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 22,
	["cube_chip"] = 7
}
RECIPE.result = {
	["ammo_3006"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_338"
RECIPE.name = ".338 LM Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/sniper_round_box.mdl"
RECIPE.desc = "Makeshift .338 LM ammo made of scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 25,
	["cube_chip"] = 7
}
RECIPE.result = {
	["ammo_338"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_408"
RECIPE.name = ".408 Cheytac Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/sniper_round_box.mdl"
RECIPE.desc = "Makeshift .408 Cheytac ammo made of scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 22,
	["cube_chip"] = 8
}
RECIPE.result = {
	["ammo_408"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_50bmg"
RECIPE.name = ".50 BMG Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/sniper_round_box.mdl"
RECIPE.desc = "Makeshift .50 BMG ammo made of scrap materials."
 
RECIPE.items = {
	["j_scrap_metals"] = 25,
	["cube_chip"] = 8
}
RECIPE.result = {
	["ammo_50bmg"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_backpack"
RECIPE.name = "Backpack"
RECIPE.category = "Storage"
RECIPE.model = "models/warz/largebackpack.mdl"
RECIPE.desc = "Makeshift backpack made out of cloth."
 
RECIPE.items = {
	["j_scrap_cloth"] = 35
}
RECIPE.result = {
	["pack"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_backpack_alice"
RECIPE.name = "ALICE Pack"
RECIPE.category = "Storage"
RECIPE.model = "models/warz/alicebackpack.mdl"
RECIPE.desc = "Makeshift ALICE pack made out of cloth and other materials."
 
RECIPE.items = {
	["j_scrap_cloth"] = 50,
	["cube_chip"] = 5,
}
RECIPE.result = {
	["pack_alice"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_briefcase"
RECIPE.name = "Briefcase"
RECIPE.category = "Storage"
RECIPE.model = "models/props_c17/briefcase001a.mdl"
RECIPE.desc = "A makeshift carrying bag, it's not too big."
 
RECIPE.items = {
	["j_scrap_cloth"] = 20
}
RECIPE.result = {
	["stor_briefcase"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_suitcase"
RECIPE.name = "Suitcase"
RECIPE.category = "Storage"
RECIPE.model = "models/props_c17/suitcase_passenger_physics.mdl"
RECIPE.desc = "A small brown suitcase for extra storage."
 
RECIPE.items = {
	["j_scrap_cloth"] = 30,
	["j_scrap_wood"] = 5
}
RECIPE.result = {
	["stor_suitcase"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_backpack_enhanced"
RECIPE.name = "Enhanced Backpack"
RECIPE.category = "Storage"
RECIPE.model = "models/warz/alicebackpack.mdl"
RECIPE.desc = "Light as a feather, no matter what you put into it."
 
RECIPE.items = {
	["j_scrap_cloth"] = 100,
	["cube_chip"] = 10,
	["cube_chip_enhanced"] = 2
}
RECIPE.result = {
	["pack_enhanced"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_antivenom"
RECIPE.name = "Antivenom"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.desc = "A small bottle filled with some sort of liquid."
 
RECIPE.items = {
	["drug_venom"] = 1,
	["blight"] = 1
}
RECIPE.result = {
	["drug_antivenom"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_psychotics"
RECIPE.name = "Psychotics"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.desc = "A bottle filled with numerous pills."
 
RECIPE.items = {
	["drug_depress"] = 3,
	["j_scrap_chems"] = 5,
	["food_water"] = 1
}
RECIPE.result = {
	["drug_psychotics"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_venom"
RECIPE.name = "Venom"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.desc = "A bottle filled with some sort of liquid."
 
RECIPE.items = {
	["drug_depress"] = 2,
	["j_scrap_chems"] = 6,
	["food_water"] = 1
}
RECIPE.result = {
	["drug_venom"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_drug_energy"
RECIPE.name = "Energy Pills"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.desc = "A bottle filled with some sort of vibrating pills."
 
RECIPE.items = {
	["drug_antidepressants"] = 2,
	["haze_bottled"] = 1,
	["food_water"] = 1
}
RECIPE.result = {
	["drug_energy"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cpr05"
RECIPE.name = "CP-R05"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_hk45c.mdl"
RECIPE.desc = "Classy professional looking scrap pistol. Boasts decent controllability for damage although lacking in magazine size.\nThis weapon utilizes .40 S&W rounds."
 
RECIPE.items = {
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
RECIPE.result = {
	["tfa_cpr05"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cpr06"
RECIPE.name = "CR-R06"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_hk45c.mdl"
RECIPE.desc = "Classy professional looking scrap pistol. Boasts decent controllability for damage although lacking in magazine size. This one has a suppressor.\nThis weapon utilizes .40 S&W rounds."
 
RECIPE.items = {
	["tfa_cpr05"] = 1,
	["comp_suppressor_pistol"] = 1,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_cpr06"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cpr07"
RECIPE.name = "CR-R07"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_hk45c.mdl"
RECIPE.desc = "Classy professional looking scrap pistol. Boasts decent controllability for damage although lacking in magazine size. This one has an experimental recoil management system installed.\nThis weapon utilizes .40 S&W rounds."
 
RECIPE.items = {
	["tfa_cpr05"] = 1,
	["comp_weapons_cpu_basic"] = 1,
	["comp_firing_mechanism"] = 2,
	["j_scrap_battery"] = 4,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_cpr07"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cpr08"
RECIPE.name = "CR-R08"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_hk45c.mdl"
RECIPE.desc = "Classy professional looking scrap pistol. Boasts decent controllability for damage although lacking in magazine size. This one has an experimental recoil management system installed and a suppressor.\nThis weapon utilizes .40 S&W rounds."
 
RECIPE.items = {
	["tfa_cpr07"] = 1,
	["comp_suppressor_pistol"] = 1,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_cpr08"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cpr09"
RECIPE.name = "CR-R09"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_hk45c.mdl"
RECIPE.desc = "Classy professional looking scrap pistol. Boasts decent controllability for damage although lacking in magazine size.\nThis one has an experimental recoil management system installed aswell as a special 'super-essor' that hides muzzleflash entirely at the cost of giving a tracer-like effect to all rounds.\nThis weapon utilizes .40 S&W rounds."
 
RECIPE.items = {
	["tfa_cpr08"] = 1,
	["comp_weapons_cpu_basic"] = 1,
	["comp_suppressor_pistol"] = 1,
	["j_scrap_battery"] = 6,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_cpr09"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_suppressor_pistol"
RECIPE.name = "Pistol Suppressor"
RECIPE.category = "Components"
RECIPE.model = "models/weapons/tfa_w_hk45c.mdl"
RECIPE.desc = "A makeshift firearm suppressor fit for a pistol."
 
RECIPE.items = {
	["j_scrap_screws"] = 4,
	["j_scrap_adhesive"] = 3,
	["j_scrap_chems"] = 8,
	["j_scrap_plastics"] = 25,
	["comp_reinforced_barrel"] = 1,
	["cube_chip"] = 4
}
RECIPE.result = {
	["comp_suppressor_pistol"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_medical_plastic"
RECIPE.name = "Plastic Dust"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/box01a.mdl"
RECIPE.desc = "A small box filled with some sort of plasic dust."
 
RECIPE.items = {
	["j_scrap_plastics"] = 7
}
RECIPE.result = {
	["medical_plastic"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_battery"
RECIPE.name = "Charged Battery"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/battery.mdl"
RECIPE.desc = "A single, seemingly enhanced battery."
 
RECIPE.items = {
	["j_scrap_battery"] = 4,
	["cube_chip"] = 2
}
RECIPE.result = {
	["ammo_battery"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_rpg"
RECIPE.name = "Makeshift Rocket"
RECIPE.category = "Ammunition"
RECIPE.model = "models/weapons/w_missile_closed.mdl"
RECIPE.desc = "A single, makeshift rocket."
 
RECIPE.items = {
	["j_scrap_adhesive"] = 10,
	["j_scrap_metals"] = 25,
	["j_scrap_chems"] = 10,
	["nut_explosivegrenade"] = 1
}
RECIPE.result = {
	["ammo_rpg"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_crossbow"
RECIPE.name = "Makeshift Bolts"
RECIPE.category = "Ammunition"
RECIPE.model = "models/crossbow_bolt.mdl"
RECIPE.desc = "Five makeshift bolts."
 
RECIPE.items = {
	["j_scrap_metals"] = 10,
	["j_scrap_wood"] = 5,
	["j_scrap_cloth"] = 5
}
RECIPE.result = {
	["ammo_xbow"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ch4rm"
RECIPE.name = "CH-4RM"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/w_crossbow.mdl"
RECIPE.desc = "Makeshift power single ultra-cam compound crossbow featuring an automatic draw system. It's a wonder how most of the wooden arrows survive being fired from this thing."
 
RECIPE.items = {
	["j_scrap_adhesive"] = 5,
	["j_scrap_metals"] = 25,
	["j_scrap_elastic"] = 25,
	["j_scrap_screws"] = 8,
	["j_scrap_elecs"] = 10,
	["j_scrap_battery"] = 4
}
RECIPE.result = {
	["tfa_ch4rm"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_chalk"
RECIPE.name = "CH-ALK"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_usas_12.mdl"
RECIPE.desc = "Looks like an I-beam that someone decided to use as a base for their highschool science fair project. Awkward to hold, but doesn't recoil like your typical conventional rifle.\nThis weapon utilizes batteries."
 
RECIPE.items = {
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
RECIPE.result = {
	["tfa_chalk"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ch3m0"
RECIPE.name = "CH-3M0"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_striker_12g.mdl"
RECIPE.desc = "Makeshift grenade launcher made out of various scrap parts. Munitions are loaded into an internal cylindrical magazine.\nThis weapon utilizes explosive grenades."
 
RECIPE.items = {
	["comp_firing_mechanism"] = 3,
	["comp_reinforced_barrel"] = 7,
	["j_scrap_screws"] = 18,
	["j_scrap_metals"] = 25,
	["j_scrap_plastics"] = 18,
	["j_scrap_adhesive"] = 15,
	["j_scrap_chems"] = 25,
	["cube_chip"] = 25
}
RECIPE.result = {
	["tfa_ch3m0"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ch1l1"
RECIPE.name = "CH-1L1"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_striker_12g.mdl"
RECIPE.desc = "Makeshift incendiary launcher made out of various scrap parts. Similarly to the CH-3M0 Munitions are loaded into an internal cylindrical magazine, however has a heavily modified ignition system.\nThis weapon utilizes molotov cocktails."
 
RECIPE.items = {
	["comp_firing_mechanism"] = 3,
	["comp_reinforced_barrel"] = 7,
	["j_scrap_screws"] = 18,
	["j_scrap_metals"] = 25,
	["j_scrap_plastics"] = 18,
	["j_scrap_adhesive"] = 15,
	["j_scrap_chems"] = 25,
	["cube_chip"] = 25
}
RECIPE.result = {
	["tfa_ch1l1"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ch3m0_fe"
RECIPE.name = "CH-3M0-FE"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_striker_12g.mdl"
RECIPE.desc = "The old school scrap launcher but the barrels are replaced with very thick metal and containing a single .50 BMG each. Pretty heavy, but it comes off as a .50 BMG revolver.\nThis weapon utilizes .50 BMG rounds."
 
RECIPE.items = {
	["comp_firing_mechanism"] = 3,
	["comp_reinforced_barrel"] = 7,
	["j_scrap_screws"] = 18,
	["j_scrap_metals"] = 25,
	["j_scrap_plastics"] = 18,
	["j_scrap_adhesive"] = 15,
	["j_scrap_chems"] = 25,
	["cube_chip"] = 25
}
RECIPE.result = {
	["tfa_ch3m0_fe"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_bone_rattle"
RECIPE.name = "Bone Rattle"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/gibs/hgibs_spine.mdl"
RECIPE.desc = "A makeshift cudgel made out of bones, it's kind of puny."
 
RECIPE.items = {
	["j_scrap_bone"] = 10,
	["j_scrap_adhesive"] = 1
}
RECIPE.result = {
	["hl2_m_bonerattle"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cr3s750fe"
RECIPE.name = "CR-3S7-50-FE"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_g2_contender.mdl"
RECIPE.desc = "A makeshift break action single shot .50 BMG hunting rifle with a long barrel and stock built from various scrap parts. Appears to be based off the much more compact CR-3ST. Sporting an 'FE' custom scope."
 
RECIPE.items = {
	["tfa_cr3s750"] = 1,
	["hl2_m_pipe"] = 2,
	["j_scrap_screws"] = 12,
	["j_scrap_glass"] = 40,
	["j_scrap_plastics"] = 28,
	["j_scrap_adhesive"] = 4,
	["j_scrap_chems"] = 2,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_cr3s750fe"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_criss"
RECIPE.name = "CR-ISS"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_snip_m24_6.mdl"
RECIPE.desc = "A modified CR-OSS with internals reworked, streamlined, and made less finicky to allow installation for a specially made three round magazine."
 
RECIPE.items = {
	["tfa_cross"] = 1,
	["j_scrap_screws"] = 6,
	["j_scrap_rubber"] = 20,
	["j_scrap_chems"] = 6,
	["j_scrap_plastics"] = 14,
	["j_scrap_adhesive"] = 6,
	["cube_chip"] = 15,	
	["comp_firing_mechanism"] = 3
}
RECIPE.result = {
	["tfa_criss"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_cpunk"
RECIPE.name = "CP-UNK"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_sw_model_500.mdl"
RECIPE.desc = "Cheap scrap concrete slug pistol. Utilizes a special case device when loading that gets more out of the ammo permitted by its breach loaded design. One handing normally will more than likely break your wrist."
 
RECIPE.items = {
	["j_scrap_rubber"] = 4,
	["comp_firing_mechanism"] = 1,
	["j_scrap_metals"] = 10,
	["j_scrap_wood"] = 8,
	["cube_chip"] = 5,
	["hl2_m_pipe"] = 1
}
RECIPE.result = {
	["tfa_cpunk"] = 1
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
RECIPE.uid = "nut_suture"
RECIPE.name = "Makeshift Suture Kit"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/box01a.mdl"
RECIPE.desc = "A small box filled tools and sutures."
 
RECIPE.items = {
	["j_scrap_plastics"] = 15,
	["j_scrap_cloth"] = 15,
	["j_scrap_metals"] = 10
}
RECIPE.result = {
	["medical_suture"] = 1
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
	["j_scrap_metals"] = 5,
	["j_scrap_plastics"] = 5,
	["j_scrap_elecs"] = 3,
	["j_scrap_chems"] = 2
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
	["j_scrap_metals"] = 10,
	["j_scrap_plastics"] = 5,
	["j_scrap_elecs"] = 4,
	["j_scrap_chems"] = 2
}
RECIPE.result = {
	["j_power_saw"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_bandages_memory"
RECIPE.name = "Memory Wraps"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/box01a.mdl"
RECIPE.desc = "A small box filled with some strange wrappings.\nThese wrappings help deal with numbness caused by blight damage."
 
RECIPE.items = {
	["medical_bandages"] = 2,
	["j_scrap_memory"] = 2
}
RECIPE.result = {
	["medical_memory"] = 1
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
RECIPE.uid = "nut_rebar_club"
RECIPE.name = "Rebar Club"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/props_debris/rebar003b_48.mdl"
RECIPE.desc = "A spike of rebar with a chunk of concrete on it."
 
RECIPE.items = {
	["j_scrap_concrete"] = 20,
	["j_scrap_metals"] = 10
}
RECIPE.result = {
	["hl2_m_rebar"] = 1
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
	["j_scrap_plastics"] = 10,
	["j_scrap_organic"] = 10,
	["j_scrap_concrete"] = 5,	
	["j_cactus_plant"] = 1,
	["shard_dust"] = 1
}
RECIPE.result = {
	["farm_cactus"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_sledgehammer"
RECIPE.name = "Makeshift Sledgehammer"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/props_debris/wood_board02a.mdl"
RECIPE.desc = "A large hammer usually used to distribute force over a wide area."
 
RECIPE.items = {
	["j_scrap_concrete"] = 20,
	["j_scrap_wood"] = 15
}
RECIPE.result = {
	["hl2_m_sledgehammer"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_shield_wood"
RECIPE.name = "Makeshift Shield (Wood)"
RECIPE.category = "Shields"
RECIPE.model = "models/cloud/glassholdshield.mdl"
RECIPE.desc = "A large wooden shield."
 
RECIPE.items = {
	["j_scrap_wood"] = 35
}
RECIPE.result = {
	["shield_wood"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_shield_metal"
RECIPE.name = "Makeshift Shield (Scrap Metal)"
RECIPE.category = "Shields"
RECIPE.model = "models/cloud/glassholdshield.mdl"
RECIPE.desc = "A large metal shield."
 
RECIPE.items = {
	["j_scrap_metals"] = 30
}
RECIPE.result = {
	["shield_metal"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_grenade_nail"
RECIPE.name = "Makeshift Nail Bomb"
RECIPE.category = "Grenades"
RECIPE.model = "models/items/grenadeammo.mdl"
RECIPE.desc = "A makeshift shrapnel bomb that uses nails and other sharp pieces of metal to damage foes."
 
RECIPE.items = {
	["j_scrap_nails"] = 1,
	["j_scrap_metals"] = 10,
	["j_scrap_chems"] = 1,
}
RECIPE.result = {
	["tfa_nailbomb"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_grenade_yin"
RECIPE.name = "Yin Yang"
RECIPE.category = "Grenades"
RECIPE.model = "models/items/grenadeammo.mdl"
RECIPE.desc = "A makeshift bomb that creates a large shockwave from its detonation area. Generally non-lethal, but typically stunning and disorienting, capable of knocking down most drifters and even fairly large creatures."
 
RECIPE.items = {
	["ichor"] = 4,
	["blight"] = 4,
	["j_scrap_metals"] = 10,
}
RECIPE.result = {
	["tfa_yinyang"] = 1
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
	["j_scrap_elecs"] = 2,
	["j_scrap_glass"] = 2
}
RECIPE.result = {
	["j_scrap_light"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_makeshift_shiv_metal"
RECIPE.name = "Metal Shiv"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/gibs/glass_shard04.mdl"
RECIPE.desc = "A shiv made out of scrap metal."
 
RECIPE.items = {
	["j_scrap_metals"] = 8
}
RECIPE.result = {
	["hl2_m_shiv_metal"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_makeshift_pickaxe"
RECIPE.name = "Pick-axe"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/props_mining/pickaxe01.mdl"
RECIPE.desc = "A long pick-axe commonly used to assist extracting valuable ores from the earth."
 
RECIPE.items = {
	["j_pickaxe_head"] = 1,
	["j_scrap_wood"] = 10
}
RECIPE.result = {
	["hl2_m_pickaxe_alt"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_crowbar"
RECIPE.name = "Crowbar"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/warz/melee/crowbar.mdl"
RECIPE.desc = "A tool made out of metal, used for prying."
 
RECIPE.items = {
	["j_scrap_metals"] = 15
}
RECIPE.result = {
	["hl2_m_crowbar"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_shovel"
RECIPE.name = "Shovel"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/props_junk/shovel01a.mdl"
RECIPE.desc = "A long common garden shovel."
 
RECIPE.items = {
	["j_scrap_metals"] = 10,
	["j_scrap_wood"] = 14
}
RECIPE.result = {
	["hl2_m_shovel_alt"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_meat_hook"
RECIPE.name = "Meat Hook"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/props_junk/meathook001a.mdl"
RECIPE.desc = "A metal instrument usually used to hang meat."
 
RECIPE.items = {
	["j_scrap_metals"] = 15
}
RECIPE.result = {
	["hl2_m_meathook"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_armor_chain"
RECIPE.name = "Makeshift Chain Armor"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebel_molle.mdl"
RECIPE.desc = "A crude vest crafted in a style similar to that of medieval chain mail.\nInstead of using individual chain links, circular pieces of scrap metal with hole drilled through them have been woven into the fabric, providing a fair amount of chest protection against slashing and low-velocity munitions."
 
RECIPE.items = {
	["j_scrap_metals"] = 50,
	["j_scrap_elastic"] = 8,
	["j_scrap_cloth"] = 25,
	["j_tshirts"] = 1
}
RECIPE.result = {
	["armor_chain"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_armor_gambeson"
RECIPE.name = "Crude Gambeson"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebelmetrocop.mdl"
RECIPE.desc = "A simple jacket that has been reinforced by quilting additional layers of fabric underneath the exterior, with scraps of cloth and cotton stuffed in.\nIt provides a fair amount of protection against blunt strikes and light slashing, while remaining comfortable for the wearer."
 
RECIPE.items = {
	["j_scrap_cloth"] = 60,
	["j_tshirts"] = 4
}
RECIPE.result = {
	["armor_gambeson"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_armor_tread"
RECIPE.name = "Tread Warrior's Guard"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebel1.mdl"
RECIPE.desc = "A rubber chestplate that covers the breast and shoulders of the wearer through the ingenious use of repurposed tires.\nThe thick treads covering the chest stop most melee attacks, but are vulnerable to strong thrusts and ranged weapons."
 
RECIPE.items = {
	["j_scrap_rubber"] = 25,
	["j_scrap_screws"] = 6,
	["j_scrap_elastic"] = 2,
	["j_scrap_metals"] = 5,
	["j_tire"] = 2
}
RECIPE.result = {
	["armor_tread"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_armor_charged"
RECIPE.name = "Voltaic Armor"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebel1.mdl"
RECIPE.desc = "A type of chest armor composed mostly of rubber with some sort of light metal component lining the outside. Upon making physical contact with another conductive surface, it will discharge its electricity, injuring and potentially stunning a creature if it has the misfortune of touching it.\nCannot discharge on the wearer.\nMust be recharged with a charged battery after each discharge."
 
RECIPE.items = {
	["j_scrap_rubber"] = 25,
	["j_scrap_elastic"] = 2,
	["j_scrap_metals"] = 10,
	["charged_cube"] = 2
}
RECIPE.result = {
	["armor_charged"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_armor_pauldrons"
RECIPE.name = "PL-8 Pauldrons"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebel1.mdl"
RECIPE.desc = "Pauldrons that protect the shoulders crafted from old license plates.\nThe plates are fastened together through the use of zipties in holes that once housed screws, and provide a small amount of protection against firearms on the shoulders.  The plates are vulnerable to blunt strikes, but impervious to stabbing and slashing."
 
RECIPE.items = {
	["j_scrap_rubber"] = 10,
	["j_scrap_cloth"] = 10,
	["j_scrap_plastics"] = 10,
	["j_scrap_elastic"] = 2,
	["j_scrap_metals"] = 60
}
RECIPE.result = {
	["armor_pauldrons"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_armor_wood"
RECIPE.name = "Drifter-Wood"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebel1.mdl"
RECIPE.desc = "The simplest armor that man can come up with. Dried scraps of wood are cut and strapped together to provide some protection against slashes from light blades, light stabs, and lower velocity ammunition.\nBlunt strikes, axe swings, thrusts into a grain, and larger calibers may cause the armor to splinter, rendering that panel useless until repaired."
 
RECIPE.items = {
	["j_scrap_rubber"] = 20,
	["j_scrap_wood"] = 10,
	["j_scrap_cloth"] = 12,
	["j_scrap_elastic"] = 1
}
RECIPE.result = {
	["armor_wood"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_armor_sapper"
RECIPE.name = "Sapper's Friend"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebeloverwatch.mdl"
RECIPE.desc = "A modern-ish take on the medieval cuirass, this 2.6MM thick steel breastplate clocks in at just under 8 pounds.\nAt a range of 100 meters, the plate can easily stop any pistol caliber munitions fired at it and may even stop a rifle-caliber cartridge.\nUnfortunately, the substantial protection offered comes at the cost of limited mobility and the retention of vulnerabilities on the backside. Most importantly however, it protects your crotch."
 
RECIPE.items = {
	["j_scrap_metals"] = 60,
	["j_scrap_rubber"] = 8,
	["j_scrap_cloth"] = 20,
	["j_scrap_screws"] = 5,
	["j_car_door"] = 1
}
RECIPE.result = {
	["armor_sapper"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_tshirt"
RECIPE.name = "T-Shirt"
RECIPE.category = "Clothing"
RECIPE.model = "models/props/de_tides/vending_tshirt.mdl"
RECIPE.desc = "A simple piece of clothing that covers the upper body."
 
RECIPE.items = {
	["j_scrap_cloth"] = 9
}
RECIPE.result = {
	["j_tshirts"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_axe_lumber"
RECIPE.name = "Lumber Axe"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/props/cs_militia/axe.mdl"
RECIPE.desc = "A tool used for chopping lumber."
 
RECIPE.items = {
	["j_scrap_wood"] = 15,
	["j_scrap_metals"] = 10
}
RECIPE.result = {
	["hl2_m_lumberaxe"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_axe_lumber_2"
RECIPE.name = "Double Axe"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/props/cs_militia/axe.mdl"
RECIPE.desc = "A double bitted axe, useful for cutting."
 
RECIPE.items = {
	["hl2_m_lumberaxe"] = 1,
	["j_scrap_metals"] = 10
}
RECIPE.result = {
	["hl2_m_lumberaxe_2"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_axe_hatchet"
RECIPE.name = "Hatchet"
RECIPE.category = "Weapons - Melee"
RECIPE.model = "models/warz/melee/hatchet.mdl"
RECIPE.desc = "A sharp tool made out of metal and wood, used for chopping."
 
RECIPE.items = {
	["j_scrap_wood"] = 10,
	["j_scrap_metals"] = 10
}
RECIPE.result = {
	["hl2_m_axe"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_helmet_makeshift"
RECIPE.name = "Makeshift Helmet"
RECIPE.category = "Armor"
RECIPE.model = "models/helm_04.mdl"
RECIPE.desc = "A crude helmet fashioned out of scrap cloth and scrap metal.\nMay protect the head from weaker melee blows to some extent, but likely not very bullet resistant."
 
RECIPE.items = {
	["j_scrap_metals"] = 10,
	["j_scrap_cloth"] = 10
}
RECIPE.result = {
	["helmet_makeshift"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_helmet_gasmask"
RECIPE.name = "Gas Mask"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/gasmask.mdl"
RECIPE.desc = "A mask used to protect the user from inhaling airborne pollutants and toxic gases."
 
RECIPE.items = {
	["j_scrap_cloth"] = 10,
	["j_scrap_plastics"] = 10,
	["j_scrap_elastic"] = 2,
	["j_scrap_glass"] = 4
}
RECIPE.result = {
	["gasmask"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_beanie"
RECIPE.name = "Beanie"
RECIPE.category = "Clothing"
RECIPE.model = "models/tnb/items/beanie.mdl"
RECIPE.desc = "A warm winter beanie."
 
RECIPE.items = {
	["j_scrap_cloth"] = 15
}
RECIPE.result = {
	["j_beanie"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ushanka"
RECIPE.name = "Ushanka"
RECIPE.category = "Clothing"
RECIPE.model = "models/ushanka.mdl"
RECIPE.desc = "A Russian fur cap with ear flaps that can be tied up to the crown of the cap."
 
RECIPE.items = {
	["j_scrap_cloth"] = 30
}
RECIPE.result = {
	["j_ushanka"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_boonie"
RECIPE.name = "Leather Boonie"
RECIPE.category = "Clothing"
RECIPE.model = "models/warz/leatherboonie.mdl"
RECIPE.desc = "A form of wide-brim hat commonly used by military forces. Its design is similar to a bucket hat but with a stiffer brim."
 
RECIPE.items = {
	["j_scrap_cloth"] = 20,
	["j_scrap_organic"] = 10
}
RECIPE.result = {
	["j_boonie"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_gloves"
RECIPE.name = "Gloves"
RECIPE.category = "Clothing"
RECIPE.model = "models/tnb/items/gloves.mdl"
RECIPE.desc = "A warm pair of gloves to protect against the cold."
 
RECIPE.items = {
	["j_scrap_cloth"] = 10
}
RECIPE.result = {
	["j_gloves"] = 1
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
	["j_scrap_plastics"] = 10,
	["j_scrap_glass"] = 15
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
	["drug_sleepingpills"] = 4,
	["j_scrap_memory"] = 5
}
RECIPE.result = {
	["drug_nightmare"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_bell"
RECIPE.name = "The Bell"
RECIPE.category = "Mysterious"
RECIPE.model = "models/props/de_inferno/bell_largeb.mdl"
RECIPE.desc = "???"
 
RECIPE.items = {
	["shard_dust"] = 1,
	["blight"] = 5,
	["ichor"] = 5,
	["j_scrap_memory"] = 5,
	["cube_chip_memory"] = 2
}
RECIPE.result = {
	["bell"] = 1
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
	["sacrificial_skull"] = 4,
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
	["j_scrap_metals"] = 5
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
	["j_scrap_glass"] = 4,
	["j_scrap_rubber"] = 2
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
	["j_scrap_chems"] = 4
}
RECIPE.result = {
	["j_paint_can"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_storage_lock"
RECIPE.name = "Intrinsic Lock"
RECIPE.category = "Storage"
RECIPE.model = "models/props_wasteland/prison_padlock001a.mdl"
RECIPE.desc = "A one time use lock that can be placed on storage.\nUses a password, and only one storage can be passworded at any one time."
 
RECIPE.items = {
	["j_scrap_memory"] = 10,
}
RECIPE.result = {
	["storage_lock"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_arm1n"
RECIPE.name = "AR-M1N"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_pancor_jackhammer.mdl"
RECIPE.desc = "A compact 12-gauge bullpup revolver shotgun made out of scrap parts. It uses removable 6-round cylindrical magazines. 'Altruit Industries' is engraved on it's stock."
 
RECIPE.items = {
    ["j_scrap_screws"] = 6,
    ["j_scrap_rubber"] = 8,
    ["j_scrap_adhesive"] = 8,
    ["j_scrap_chems"] = 6,
    ["j_scrap_metals"] = 35,
    ["j_scrap_plastics"] = 15,
    ["j_scrap_wood"] = 5,
    ["comp_reinforced_barrel"] = 1,
    ["cube_chip"] = 10
}
RECIPE.result = {
    ["tfa_arm1n"] = 1
}
RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_ap2rt"
RECIPE.name = "AP-2RT"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_sw_model_500.mdl"
RECIPE.desc = "A large triple barreled handcannon with a really strange and complex design alongside a large caliber for you to use, your hand might dislike it though. 'Altruit Industries' is engraved on it's grip."

RECIPE.items = {
	["comp_reinforced_barrel"] = 1,
	["comp_firing_mechanism"] = 1,
	["cube_chip"] = 12,
	["j_scrap_metals"] = 25,
	["j_scrap_wood"] = 15,
	["j_scrap_chems"] = 4,
	["j_scrap_rubber"] = 6,
	["j_scrap_adhesive"] = 5,
	["j_scrap_screws"] = 4
}
RECIPE.result = {
	["tfa_ap2rt"] = 1
}

RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_ap4m0"
RECIPE.name = "AP-4M0"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_hk45c.mdl"
RECIPE.desc = "A small semi-automatic pistol with a decently sized magazine. Outside of it's overly complex design it seems pretty normal. 'Altruit Industries' is engraved on it's grip."

RECIPE.items = {
	["cube_chip"] = 8,
	["hl2_m_pipe"] = 1,
	["j_scrap_wood"] = 10,
	["j_scrap_metals"] = 15,
	["j_scrap_chems"] = 2,
	["j_scrap_rubber"] = 4,
	["j_scrap_plastics"] = 10,
	["j_scrap_adhesive"] = 2,
	["j_scrap_screws"] = 3
}
RECIPE.result = {
	["tfa_ap4m0"] = 1
}

RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_ap4m1"
RECIPE.name = "AP-4M1"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/tfa_w_hk45c.mdl"
RECIPE.desc = "A small fully automatic pistol with a decently sized magazine. Outside of it's overly complex design it offers a really high firing speed. 'Altruit Industries' is engraved on it's grip."

RECIPE.items = {
	["tfa_ap4m0"] = 1,
	["comp_firing_mechanism"] = 1,
	["j_scrap_metals"] = 10,
	["j_scrap_plastics"] = 10,
	["j_scrap_rubber"] = 10,
	["j_scrap_wood"] = 10,
	["j_scrap_chems"] = 4,
	["j_scrap_adhesive"] = 2,
	["cube_chip"] = 6,
	["j_scrap_screws"] = 2
}
RECIPE.result = {
	["tfa_ap4m1"] = 1
}

RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_arg0n"
RECIPE.name = "AR-G0N"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/w_fg42.mdl"
RECIPE.desc = "A small semi-automatic rifle with no stock and a short barrel. Firing it is uncomfortable but it makes up for it with it's suprising accuracy. 'Altruit Industries' is engraved on it's grip."

RECIPE.items = {
	["comp_reinforced_barrel"] = 1,
	["j_scrap_metals"] = 40,
	["j_scrap_wood"] = 20,
	["j_scrap_chems"] = 10,
	["j_scrap_rubber"] = 15,
	["j_scrap_plastics"] = 30,
	["cube_chip"] = 16,
	["j_scrap_adhesive"] = 4,
	["j_scrap_screws"] = 5
}
RECIPE.result = {
	["tfa_arg0n"] = 1
}

RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_arg3n"
RECIPE.name = "AR-G3N"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/w_fg42.mdl"
RECIPE.desc = "A burst fire rifle with a stock, extended barrel and a holographic sight. The bursts are somewhat hard to control but offer great firepower to the user. 'Altruit Industries' is engraved on it's stock."

RECIPE.items = {
	["tfa_arg0n"] = 1,
	["comp_firing_mechanism"] = 1,
	["comp_weapons_cpu_basic"] = 1,
	["cube_chip"] = 10,
	["j_scrap_metals"] = 30,
	["j_scrap_plastics"] = 15,
	["j_scrap_chems"] = 5,
	["j_scrap_rubber"] = 10,
	["j_scrap_wood"] = 10,
	["j_scrap_battery"] = 2,
	["j_scrap_adhesive"] = 6,
	["j_scrap_screws"] = 4
}
RECIPE.result = {
	["tfa_arg3n"] = 1
}

RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_arg4n"
RECIPE.name = "AR-G4N"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/w_fg42.mdl"
RECIPE.desc = "A semi-automatic rifle with a stock, extended barrel and a magnified scope. The firing speed isn't that great but it's even more accurate than it's previous version. 'Altruit Industries' is engraved on it's stock."

RECIPE.items = {
	["tfa_arg0n"] = 1,
	["comp_weapons_cpu_basic"] = 1,
	["j_scrap_metals"] = 30,
	["j_scrap_plastics"] = 25,
	["j_scrap_chems"] = 10,
	["j_scrap_rubber"] = 15,
	["j_scrap_wood"] = 30,
	["comp_reinforced_barrel"] = 1,
	["j_scrap_adhesive"] = 6,
	["cube_chip"] = 10
}
RECIPE.result = {
	["tfa_arg4n"] = 1
}

RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_arg5n"
RECIPE.name = "AR-G5N"
RECIPE.category = "Weapons - Modifications"
RECIPE.model = "models/weapons/w_fg42.mdl"
RECIPE.desc = "A semi-automatic sniper rifle with a stock, greatly extended barrel and a magnified scope. The reworked internals allow it to fire a much larger caliber at the cost of the magazine size. 'Altruit Industries' is engraved on it's stock."

RECIPE.items = {
	["tfa_arg4n"] = 1,
	["comp_reinforced_barrel"] = 1,
	["j_scrap_metals"] = 65,
	["comp_firing_mechanism"] = 1,
	["cube_chip"] = 22,
	["j_scrap_plastics"] = 50,
	["j_scrap_chems"] = 10,
	["j_scrap_rubber"] = 10,
	["j_scrap_adhesive"] = 10,
	["j_scrap_screws"] = 8
}
RECIPE.result = {
	["tfa_arg5n"] = 1
}

RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_ark4n"
RECIPE.name = "AR-K4N"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_winchester_1897_trench.mdl"
RECIPE.desc = "A small pump action shotgun. There's nothing amazing about but it's pretty light, it's probably a good idea to be really close to your enemy due to the really short barrel. 'Altruit Industries' is engraved on it's stock."

RECIPE.items = {
	["j_scrap_metals"] = 30,
	["j_scrap_screws"] = 6,
	["j_scrap_chems"] = 4,
	["j_scrap_rubber"] = 5,
	["j_scrap_wood"] = 45,
	["cube_chip"] = 8,
	["j_scrap_adhesive"] = 2,
	["j_scrap_plastics"] = 20
}
RECIPE.result = {
	["tfa_ark4n"] = 1
}

RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_arm0n"
RECIPE.name = "AR-M0N"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/w_pancor_jackhammer.mdl"
RECIPE.desc = "A semi-automatic bullpup revolver made out of scrap parts. It uses removable 6-round cylindrical magazines. 'Altruit Industries' is engraved on it's stock. This variant has a extended barrel and a scope."

RECIPE.items = {
	["j_scrap_chems"] = 6,
	["comp_reinforced_barrel"] = 1,
	["j_scrap_adhesive"] = 8,
	["j_scrap_wood"] = 5,
	["j_scrap_metals"] = 35,
	["j_scrap_plastics"] = 15,
	["j_scrap_rubber"] = 8,
	["cube_chip"] = 10,
	["j_scrap_screws"] = 6
}
RECIPE.result = {
	["tfa_arm0n"] = 1
}

RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_arm4n"
RECIPE.name = "AR-M4N"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/w_pancor_jackhammer.mdl"
RECIPE.desc = "A compact automatic bullpup revolver made out of scrap parts. It uses removable 60-round cylindrical magazines. 'Altruit Industries' is engraved on it's stock. This variant is shortened."

RECIPE.items = {
	["j_scrap_chems"] = 6,
	["comp_reinforced_barrel"] = 1,
	["j_scrap_adhesive"] = 8,
	["j_scrap_wood"] = 5,
	["j_scrap_metals"] = 35,
	["j_scrap_plastics"] = 15,
	["j_scrap_rubber"] = 8,
	["cube_chip"] = 10,
	["j_scrap_screws"] = 6
}
RECIPE.result = {
	["tfa_arm4n"] = 1
}

RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_ap40n"
RECIPE.name = "AP-40N"
RECIPE.category = "Weapons - Ranged"
RECIPE.model = "models/weapons/tfa_w_hk_ump45.mdl"
RECIPE.desc = "A small compact submachine gun capable of firing 25 round magazines filled with .45 ACP. 'Altruit Industries' is engraved on it's stock."

RECIPE.items = {
	["cube_chip"] = 15,
	["j_scrap_metals"] = 35,
	["j_scrap_plastics"] = 25,
	["j_scrap_rubber"] = 12,
	["j_scrap_chems"] = 6,
	["j_scrap_adhesive"] = 5,
	["j_scrap_wood"] = 25,
	["hl2_m_pipe"] = 1,
	["j_scrap_screws"] = 8
}
RECIPE.result = {
	["tfa_ap40n"] = 1
}

RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_bleach"
RECIPE.name = "Bleach"
RECIPE.category = "Miscellaneous"
RECIPE.model = "models/props_junk/garbage_plasticbottle001a.mdl"
RECIPE.desc = "Cleaning solution often used for disinfecting surfaces."

RECIPE.items = {
	["j_scrap_chems"] = 3,
	["j_scrap_plastics"] = 4,
}
RECIPE.result = {
	["bleach"] = 1
}

RECIPES:Register(RECIPE)
//