local PLUGIN = PLUGIN

//
local TRAIT = {}
TRAIT.uid = "glutton"
TRAIT.name = "Glutton"
TRAIT.desc = "You enjoy a meal, whether it's a hot dog or a lobster.\nBuffs received from food are enhanced by 20%."
TRAIT.category = "Character"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "survival"
TRAIT.name = "Survivalist"
TRAIT.desc = "You know how to make use of what you've got.\nBuffs received from food last 20% longer."
TRAIT.category = "Character"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "close" 
TRAIT.name = "Close Quarters Specialist"
TRAIT.desc = "You like to keep things up close and personal.\nMelee attacks, grapple, block, and defends are increased to 1.2x.\nAll ranged rolls are reduced to 0.7x."
TRAIT.category = "Character"
TRAIT.blacklist = "range"

TRAIT.modifier = {
	["melee"] = 1.2,
	["grapple"] = 1.2,
	["meleedual"] = 1.2,
	["block"] = 1.2,
	["defend"] = 1.2,
	["flail"] = 1.2,
	["firearms"] = 0.7,
	["firearmsburst"] = 0.7,
	["firearmsaimed"] = 0.7,
	["firearmsburstaimed"] = 0.7,
	["quickdraw"] = 0.7,
	["execute"] = 0.7,
	["throw"] = 0.7,
	["akimbo"] = 0.7,
	["suppress"] = 0.7
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "ranged" 
TRAIT.name = "Ranged Specialist"
TRAIT.desc = "You like to keep some distance in your relationships.\nMelee attacks, grapple, parry, block, and defends are decreased to 0.7x\nAll ranged rolls are increased to 1.2x."
TRAIT.category = "Character"
TRAIT.blacklist = "close"

TRAIT.modifier = {
	["melee"] = 0.7,
	["grapple"] = 0.7,
	["meleedual"] = 0.7,
	["parry"] = 0.7,
	["block"] = 0.7,
	["defend"] = 0.7,
	["flail"] = 0.7,
	["firearms"] = 1.2,
	["firearmsburst"] = 1.2,
	["firearmsaimed"] = 1.2,
	["firearmsburstaimed"] = 1.2,
	["quickdraw"] = 1.2,
	["execute"] = 1.2,
	["throw"] = 1.2,
	["throwaimed"] = 1.2,
	["akimbo"] = 1.2,
	["suppress"] = 1.2
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "gunslinger" 
TRAIT.name = "Gunslinger"
TRAIT.desc = "Fire first, die last.\nQuick draw, akimbo, revolver burst, and regular firearms rolls increased to 1.2x.\nAimed rolls reduced to 0.7x."
TRAIT.category = "Character"
TRAIT.blacklist = "marksman"

TRAIT.modifier = {
	["firearmsaimed"] = 0.7,
	["firearmsburstaimed"] = 0.7,
	["firearms"] = 1.2,
	["quickdraw"] = 1.2,
	["revolverburst"] = 1.2,
	["akimbo"] = 1.2
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "fanthehammer" 
TRAIT.name = "Fan the Hammer"
TRAIT.desc = "We're a long way from Texas.\nYou gain the ability to burst fire revolvers (/revolverburst)."
TRAIT.category = "Char Abilities"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "marksman"
TRAIT.name = "Marksman"
TRAIT.desc = "You aren't the quickest shot, but you are the deadliest.\nQuick draw, akimbo, and regular firearms rolls decreased to 0.7x.\nAimed rolls increased to 1.2x."
TRAIT.category = "Character"
TRAIT.blacklist = "gunslinger"

TRAIT.modifier = {
	["firearmsaimed"] = 1.2,
	["firearmsburstaimed"] = 1.2,
	["firearms"] = 0.7,
	["quickdraw"] = 0.7,
	["akimbo"] = 0.7
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "scavenger"
TRAIT.name = "Scavenger"
TRAIT.desc = "You always know where to find the good stuff.\nScavenge and perception rolls increased to 1.15x. Fortitude and Endure rolls reduced to 0.8x."
TRAIT.category = "Character"
TRAIT.modifier = {
	["scavenge"] = 1.15,
	["perception"] = 1.15,
	["fortitude"] = 0.8,
	["endure"] = 0.8
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "blind_luck" 
TRAIT.name = "Dumb Luck"
TRAIT.desc = "You stumble your way into fortune.\nScavenge rolls increased to 1.05x. Perception rolls reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.modifier = {
	["scavenge"] = 1.05,
	["perception"] = 0.9,
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "attuned" 
TRAIT.name = "Attuned"
TRAIT.desc = "Those voices are finally coming in handy.\nFortitude based rolls increased to 1.2x.\nEndure, block, parry, and dodge reduced to 0.8x."
TRAIT.category = "Character"

TRAIT.modifier = {
	["fortitude"] = 1.2,
	["fortattack"] = 1.2,
	["will"] = 1.2,
	["dodge"] = 0.8,
	["endure"] = 0.8,
	["block"] = 0.8,
	["parry"] = 0.8
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "finedollar" 
TRAIT.name = "Fine Dollar"
TRAIT.desc = "A pretty penny, a fine dollar.\nStart with 200 scrap coins."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:giveMoney(200)
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "businessman" 
TRAIT.name = "Business Man"
TRAIT.desc = "You have places to be, and things to be doing.\nStart with a suitcase."
TRAIT.category = "Character"
TRAIT.items = {
	"hl2_m_suitcase"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "student" 
TRAIT.name = "Student"
TRAIT.desc = "On the bright side, there's no debt here.\nStart with a backpack.\nPerception rolls increased to 1.15x.\nMelee attack rolls reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"pack"
}
TRAIT.modifier = {
	["melee"] = 0.9,
	["meleedual"] = 0.9,
	["grapple"] = 0.9,
	["flail"] = 0.9,
	["perception"] = 1.15
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "computer" 
TRAIT.name = "Computer Nerd"
TRAIT.desc = "You're ready to level up.\nStart with a mouse and keyboard.\nAimed firearms rolls increased to 1.05x.\nGrapple rolls reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"j_mouse",
	"hl2_m_keyboard"
}
TRAIT.modifier = {
	["firearmsaimed"] = 1.05,
	["grapple"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "night_light" 
TRAIT.name = "Night Light"
TRAIT.desc = "Start with a flashlight."
TRAIT.category = "Character"
TRAIT.items = {
	"flashlight"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "berserk" 
TRAIT.name = "Berserk"
TRAIT.desc = "Your therapist can't stop you now.\nYour non-firearm offensive rolls are increased to 1.2x.\nYour defensive rolls are 0.7x.\nEndure rolls are increased to 1.2x."
TRAIT.category = "Character"
TRAIT.modifier = {
	["dodge"] = 0.7,
	["block"] = 0.7,
	["parry"] = 0.7,
	["defend"] = 0.7,
	["fortitude"] = 0.7,
	["endure"] = 1.2,
	["melee"] = 1.2,
	["meleedual"] = 1.2,
	["throw"] = 1.2,
	["flail"] = 1.2,
	["grapple"] = 1.2,
	["rapidstab"] = 1.2,
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "goliath" 
TRAIT.name = "Goliath"
TRAIT.desc = "Slow and steady.\nEndure, block, defend, melee, dual melee, and grapple rolls are increased to 1.1x.\nDodge, parry, quickdraw, sneak, fortitude rolls are reduced 0.8x."
TRAIT.category = "Character"
TRAIT.modifier = {
	["endure"] = 1.1,
	["block"] = 1.1,
	["defend"] = 1.1,
	["melee"] = 1.1,
	["meleedual"] = 1.1,
	["grapple"] = 1.1,
	["dodge"] = 0.8,
	["parry"] = 0.8,
	["quickdraw"] = 0.8,
	["sneak"] = 0.8,
	["fortitude"] = 0.8
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "lightfeet" 
TRAIT.name = "Light Feet"
TRAIT.desc = "You're a bit of a pushover, but you're pretty good at sneaking around.\nYour sneak and dodge rolls are increased to 1.1x.\nBlock, parry, and defend rolls reduced to 0.8x."
TRAIT.category = "Character"
TRAIT.modifier = {
	["sneak"] = 1.1,
	["dodge"] = 1.1,
	["block"] = 0.8,
	["parry"] = 0.8,
	["defend"] = 0.8
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "fisher" 
TRAIT.name = "Fisherman"
TRAIT.desc = "A calm day on the lake is where you'd rather be right now.\nStart with a fishing rod."
TRAIT.category = "Character"
TRAIT.items = {
	"fishing_pole"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "farmer" 
TRAIT.name = "Farmer"
TRAIT.desc = "You're a grower, not a shower.\nStart with a random regular farm device and a pitchfork."
TRAIT.category = "Character"
TRAIT.items = {
	"melee_pitchfork"
}
TRAIT.func = function(client, character)
	local ranItems = {
		"farm_apple",
		"farm_banana",
		"farm_cactus",
		"farm_lemon",
		"farm_melon",
		"farm_orange",
		"farm_potato",
		"farm_pumpkin",
		"farm_onion",
		"farm_monster"
	}
	
	character:getInv():add(table.Random(ranItems), 1) --one random item from above pool
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "junkrat" 
TRAIT.name = "Junk Rat"
TRAIT.desc = "You hate throwing things away, especially the broken things.\nStart with two broken peculiar generator.\nFortitude rolls reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"generator_broken",
	"generator_broken"
}
TRAIT.modifier = {
	["fortitude"] = 0.9,
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "pyro" 
TRAIT.name = "Pyromaniac"
TRAIT.desc = "Build a man a fire, he'll be warm for a night. Set a man on fire, he'll be warm for the rest of his life.\nStart with a can of fuel and two molotovs.\nEndure and Fortitude rolls reduced to 0.95x."
TRAIT.category = "Character"
TRAIT.items = {
	"j_gas_can",
	"molotov",
	"molotov"
}
TRAIT.modifier = {
	["fortitude"] = 0.95,
	["endure"] = 0.95
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "crafter" 
TRAIT.name = "Craftsman"
TRAIT.desc = "You are skilled at working with odds and ends.\nYour starting Craftiness is boosted by 25."
TRAIT.category = "Character"
TRAIT.items = {
	"j_scrap_metals",
	"j_scrap_plastics",
	"j_scrap_elecs",
	"j_scrap_wood"
}
TRAIT.func = function(client, character)
	character:updateAttrib("medical", 25)
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "handy" 
TRAIT.name = "Handy Man"
TRAIT.desc = "You know your way around a tool or two.\nStart with a salvager kit.\nScavenge rolls reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"kit_salvager"
}
TRAIT.modifier = {
	["scavenge"] = 0.9,
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "loudclear" 
TRAIT.name = "Loud & Clear"
TRAIT.desc = "There are some things that just have to be said.\nStart with two radios, and a radio booster.\nPerception, scavenge rolls reduced by 0.95x."
TRAIT.category = "Character"
TRAIT.items = {
	"comm_radio",
	"comm_radio",
	"radio_booster"
}
TRAIT.modifier = {
	["perception"] = 0.95,
	["scavenge"] = 0.95
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "personality" 
TRAIT.name = "Radio Personality"
TRAIT.desc = "If video didn't kill you, neither will this.\nStart with a broadcaster.\nBackstab, quickdraw rolls reduced by 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"broadcaster"
}
TRAIT.modifier = {
	["backstab"] = 0.9,
	["quickdraw"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "carto" 
TRAIT.name = "Cartographer"
TRAIT.desc = "You really know your way around.\nStart with a map.\nPerception rolls increased by 1.1x.\nReflex rolls reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"j_map"
}
TRAIT.modifier = {
	["perception"] = 1.1,
	["reflexes"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "photo" 
TRAIT.name = "Photographer"
TRAIT.desc = "You know how to get the perfect shot.\nStart with a camera.\nAimed firearms rolls increased by 1.1x.\nFortitude rolls reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"j_camera"
}
TRAIT.modifier = {
	["firearmsaimed"] = 1.05,
	["fortitude"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "glasses" 
TRAIT.name = "Impaired Sight"
TRAIT.desc = "Your eyesight isn't the best.\nStart with a pair of glasses.\nFortitude rolls increased by 1.1x.\nPerception rolls reduced by 0.8x."
TRAIT.category = "Character"
TRAIT.items = {
	"j_glasses"
}
TRAIT.modifier = {
	["fortitude"] = 1.1,
	["perception"] = 0.8,
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "construct" 
TRAIT.name = "Construction Worker"
TRAIT.desc = "Someone's gotta do it.\nStart with a hard hat.\nEndurance rolls increased by 1.05x.\nFortitude rolls reduced by 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"helmet_hard"
}
TRAIT.modifier = {
	["endure"] = 1.05,
	["fortitude"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "fireman" 
TRAIT.name = "Fireman"
TRAIT.desc = "If you can't stand the heat, put on your protective equipment.\nStart with a fireman's hat and a fireaxe.\nEndurance and fortitude rolls increased by 1.05x.\nBlock and parry rolls reduced by 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"helmet_fire",
	"melee_fireaxe"
}
TRAIT.modifier = {
	["endure"] = 1.05,
	["fortitude"] = 1.05,
	["block"] = 0.9,
	["parry"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "lumberjack" 
TRAIT.name = "Lumberjack"
TRAIT.desc = "What rolls down stairs, and travels in pairs?\nStart with a lumber axe and some wood.\nMelee rolls increased by 1.05x, Endure rolls increased by 1.05x.\nDodge rolls reduced by 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"hl2_m_lumberaxe",
	"j_scrap_wood",
	"j_scrap_wood",
	"j_scrap_wood"
}
TRAIT.modifier = {
	["melee"] = 1.05,
	["endure"] = 1.05,
	["dodge"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "cozy" 
TRAIT.name = "Cozy"
TRAIT.desc = "At least you'll be warm.\nStart with a pair of gloves and an ushanka.\nEndure rolls increased by 1.1x.\nReflex rolls reduced by 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"j_ushanka",
	"j_gloves"
}
TRAIT.modifier = {
	["endure"] = 1.1,
	["reflex"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "carpenter" 
TRAIT.name = "Carpenter"
TRAIT.desc = "Some problems are best solved with a hammer and nails.\nStart with a carpenter's hammer, some nails, and some wood.\nInteract rolls increased by 1.05x.\nFortitude rolls reduced by 0.95x."
TRAIT.category = "Character"
TRAIT.items = {
	"hl2_m_hammer",
	"j_scrap_nails",
	"j_scrap_nails",
	"j_scrap_wood",
	"j_scrap_wood"
}
TRAIT.modifier = {
	["interact"] = 1.1,
	["fortitude"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "breacher" 
TRAIT.name = "Breacher"
TRAIT.desc = "If there isn't a door, just make one.\nInteract rolls increased by 1.05x.\nDodge and flee rolls reduced by 0.95x."
TRAIT.category = "Character"
TRAIT.items = {
	"hl2_m_sledgehammer",
	"breach"
}
TRAIT.modifier = {
	["interact"] = 1.05,
	["dodge"] = 0.9,
	["flee"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "nerveagent" 
TRAIT.name = "Nerve Agent"
TRAIT.desc = "Don't be nervous\nStart with a gas mask and two tear gas grenades.\nPerception rolls reduced by 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"gasmask",
	"nut_teargas",
	"nut_teargas"
}
TRAIT.modifier = {
	["perception"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "veteran" 
TRAIT.name = "Veteran"
TRAIT.desc = "Don't worry, that's just the tinnitus.\nStart with a holster.\nFirearms, Firearms Aimed, and Endure rolls are increased by 1.05x.\nFortitude, will, and perception rolls reduced by 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"j_holster",
}
TRAIT.modifier = {
	["firearms"] = 1.05,
	["firearmsaimed"] = 1.05,
	["endure"] = 1.05,
	["fortitude"] = 0.9,
	["will"] = 0.9,
	["perception"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "bodyguard" 
TRAIT.name = "Bodyguard"
TRAIT.desc = "You specialize in guarding bodies.\nStart with a T1 armored vest.\nBlock and defend rolls increased by 1.05x.\nDodge rolls reduced by 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"armor_t1"
}
TRAIT.modifier = {
	["block"] = 1.05,
	["defend"] = 1.05,
	["dodge"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "defender" 
TRAIT.name = "Defender"
TRAIT.desc = "Those who stand with you, stand behind you.\nYou gain the ability to defend others from attacks (/defend).\nDodge rolls reduced by 0.95x."
TRAIT.category = "Char Abilities"
TRAIT.modifier = {
	["dodge"] = 0.95
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "rapidstab" 
TRAIT.name = "Rapid Stabbing"
TRAIT.desc = "How violent of you.\nYou gain the ability to stab rapidly (/rapidstab).\nUnaimed firearm rolls reduced by 0.95x."
TRAIT.category = "Char Abilities"
TRAIT.modifier = {
	["firearms"] = 0.95,
	["firearmsburst"] = 0.95
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "thrower" 
TRAIT.name = "Throwing Specialist"
TRAIT.desc = "Finally your party trick comes in handy.\nYou gain the ability to throw accurately (/throwaimed).\nMelee rolls reduced by 0.95x."
TRAIT.category = "Char Abilities"
TRAIT.modifier = {
	["melee"] = 0.95
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "rogue" 
TRAIT.name = "Rogue"
TRAIT.desc = "You really like to get behind.\nYou gain the ability to backstab enemies with a melee weapon. (/backstab).\nSneak rolls increased by 1.05x."
TRAIT.category = "Char Abilities"
TRAIT.modifier = {
	["sneak"] = 1.05
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "executioner" 
TRAIT.name = "Executioner"
TRAIT.desc = "Some would call an executioner's work violent and cruel, they might be right.\nYou gain the ability to execute enemies with a firearms weapon in certain situations. (/execute)."
TRAIT.category = "Char Abilities"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "scout" 
TRAIT.name = "Scout"
TRAIT.desc = "You really like to get ahead.\nStart with binoculars.\nPerception rolls increased by 1.05x.\nEndure rolls reduced by 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"j_binoculars"
}
TRAIT.modifier = {
	["perception"] = 1.05,
	["endure"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "ace" 
TRAIT.name = "Ace"
TRAIT.desc = "You brought some cards, at least you won't be bored.\nStart with a deck of cards and a box of dice.\nYou start with three extra luck."
TRAIT.category = "Character"
TRAIT.items = {
	"j_cards",
	"j_dice"
}
TRAIT.func = function(client, character)
	character:updateAttrib("luck", 3)
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "butcher" 
TRAIT.name = "Butcher"
TRAIT.desc = "You work with meat on a daily basis.\nStart with an organic converter."
TRAIT.category = "Character"
TRAIT.items = {
	"converter_meat"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "brewery" 
TRAIT.name = "Homebrewer"
TRAIT.desc = "You're your own favorite customer.\nStart with a brewery device.\nPerception rolls reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"brewery"
}
TRAIT.modifier = {
	["perception"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "brewery_soda" 
TRAIT.name = "Carbonation Expert"
TRAIT.desc = "Life is more exciting with a little fizz.\nStart with a soda stream device.\nFortitude rolls reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"soda_stream"
}
TRAIT.modifier = {
	["fortitude"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "medicator" 
TRAIT.name = "Chemist"
TRAIT.desc = "Let's get chemical.\nStart with a medicator device.\nWill and Endure rolls reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"medicator"
}
TRAIT.modifier = {
	["will"] = 0.9,
	["endure"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "drunk" 
TRAIT.name = "Drunk"
TRAIT.desc = "The bottle solves all problems.\nStart with a broken bottle.\nEndure rolls set to 1.1x.\nPerception rolls lowered to 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"hl2_m_brokenbottle",
	"alc_beer"
}
TRAIT.modifier = {
	["perception"] = 0.9,
	["endure"] = 1.1,
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "wonderwall" 
TRAIT.name = "Wonderwall"
TRAIT.desc = "Anyway, here's Wonderwall.\nStart with a guitar.\nWill rolls increased to 1.1x.\nPerception rolls reduced to 0.95x."
TRAIT.category = "Character"
TRAIT.items = {
	"j_guitar"
}
TRAIT.modifier = {
	["perception"] = 0.95,
	["will"] = 1.1
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "crowbar" 
TRAIT.name = "Warehouse Worker"
TRAIT.desc = "Your favorite part is the unboxing, your second favorite part is the boxing.\nStart with a crowbar.\nScavenge rolls increased to 1.05x.\nWill rolls reduced to 0.9x"
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	local ranItems = {
		"hl2_m_crowbar",
		"hl2_m_crowbar_alt"
	}
	
	character:getInv():add(table.Random(ranItems), 1) --one random item from above pool
end
TRAIT.modifier = {
	["scavenge"] = 1.05,
	["will"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "protester" 
TRAIT.name = "Protester"
TRAIT.desc = "Some people wait for a sign from above, you made your own sign.\nStart with a sign.\nWill rolls increased to 1.05x.\nEndure rolls reduced to 0.9x"
TRAIT.category = "Character"
TRAIT.items = {
	"hl2_m_woodensign"
}
TRAIT.modifier = {
	["will"] = 1.05,
	["endure"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "scrapper" 
TRAIT.name = "Scrapper"
TRAIT.desc = "You know your way around a piece of junk.\nThe chance of a salvaged items giving bonus materials is increased by 10%."
TRAIT.category = "Character"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "family" 
TRAIT.name = "Family Man"
TRAIT.desc = "Your family is waiting for you."
TRAIT.category = "Peculiar"
TRAIT.items = {
	"j_scrap_memory",
	"j_scrap_memory",
	"j_scrap_memory",
	"j_family_picture",
	"reminiscence"
}
TRAIT.func = function(client, character)
	character:setData("fort_nost", CurTime()) --fort debuff
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "vain" 
TRAIT.name = "Vain"
TRAIT.desc = "Pride is a sin."
TRAIT.category = "Peculiar"
TRAIT.items = {
	"mirror",
	"j_scrap_glass",
	"j_scrap_glass"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "yams" 
TRAIT.name = "Yams"
TRAIT.desc = "Just start with a bunch of yams, that's what you want isn't it?"
TRAIT.category = "Peculiar"
TRAIT.items = {
	"nac",
	"food_yams",
	"food_yams",
	"food_yams",
	"food_yams",
	"food_yams",
	"food_yams",
	"food_yams",
	"food_yams",
	"food_yams",
	"food_yams",
	"food_yams"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "rock" 
TRAIT.name = "Rock"
TRAIT.desc = "Rock and Roll, man.\nYou start with a single rock."
TRAIT.category = "Peculiar"
TRAIT.items = {
	"hl2_m_rock"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "trinket" 
TRAIT.name = "Trinket Collector"
TRAIT.desc = "You enjoy your strange collectables.\nStart with a Hula Doll, Stuffed Turtle, and Baby Doll."
TRAIT.category = "Character"
TRAIT.items = {
	"j_baby_doll",
	"j_stuffed_turtle",
	"j_hula"
}
//
local TRAIT = {}
TRAIT.uid = "baker" 
TRAIT.name = "Baker"
TRAIT.desc = "You know how to cook it by the books.\nStart with a bakery device.\nFortitude rolls reduced to 0.95x."
TRAIT.category = "Character"
TRAIT.items = {
	"bakery"
}
TRAIT.modifier = {
	["fortitude"] = 0.95
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "cultist" 
TRAIT.name = "Cultist"
TRAIT.desc = "You'll believe anything, but sometimes that's just the ticket.\nStart with a sacrificial skull.\nFortitude rolls reduced to 0.8x."
TRAIT.category = "Character"
TRAIT.items = {
	"sacrificial_skull"
}
TRAIT.modifier = {
	["fortitude"] = 0.8
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "target" 
TRAIT.name = "Designated Target"
TRAIT.desc = "People have been beating you up for so long, you got pretty good at taking hits.\nBlock and endure rolls increased to 1.1x.\nFortitude rolls reduced to 0.8x."
TRAIT.category = "Character"
TRAIT.items = {
	"j_scrap_rubber",
	"j_scrap_rubber",
	"j_scrap_rubber"
}
TRAIT.modifier = {
	["block"] = 1.1,
	["endure"] = 1.1,
	["dodge"] = 0.8
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "engineer" 
TRAIT.name = "Engineer"
TRAIT.desc = "You've done the math.\nStart with a random refinery device."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	local ranItems = {
		"refinery_battery",
		"refinery_chems",
		"refinery_currency",
		"refinery_enhanced",
		"refinery_plastics",
		"refinery_adhesive",
		"refinery_screws"
	}
	
	character:getInv():add(table.Random(ranItems), 1) --one random item from above pool
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "librarian" 
TRAIT.name = "Librarian"
TRAIT.desc = "Read a book.\nStart with a random useless book.\nPerception rolls increased by 1.05x."
TRAIT.category = "Character"
TRAIT.modifier = {
	["perception"] = 1.05
}
TRAIT.func = function(client, character)
	local ranItems = {
		"blackcat",
		"blackguy",
		"blueskies",
		"book_curse",
		"book_crazy",
		"fword",
		"grog_boat",
		"sun_shade1"
	}
	
	character:getInv():add(table.Random(ranItems), 1) --one random item from above pool
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "batter" 
TRAIT.name = "Batter"
TRAIT.desc = "Batter up.\nStart with a baseball bat.\nStandard melee and throw rolls are increased to 1.05x.\nDodge rolls reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	if(math.random(0,1) == 1) then
		character:getInv():add("hl2_m_bat_metal", 1)
	else
		character:getInv():add("hl2_m_bat", 1)
	end
end
TRAIT.modifier = {
	["melee"] = 1.05,
	["throw"] = 1.05,
	["dodge"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "authority" 
TRAIT.name = "Authority"
TRAIT.desc = "Criminals must be apprehended.\nStart with two zip ties and a baton.\nGrapple rolls increased 1.05x.\nFortitude rolls reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"ziptie",
	"ziptie",
	"melee_baton"
}
TRAIT.modifier = {
	["grapple"] = 1.05,
	["fortitude"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "trucker" 
TRAIT.name = "Trucker"
TRAIT.desc = "Your truck is a beautiful machine, too bad it's not here.\nStart with a steering wheel and energy pills.\nEndure increased to 1.05x.\nWill decreased to 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"hl2_m_steeringwheel",
	"drug_energy",
	"drug_energy",
	"drug_energy"
}
TRAIT.modifier = {
	["endure"] = 1.05,
	["will"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "mechanic" 
TRAIT.name = "Mechanic"
TRAIT.desc = "You fix vehicles and drive a piece of shit.\nStart with a wrench and some scrap.\nCraftiness increased by 5 points.\nSneak decreased to 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"j_scrap_metals",
	"j_scrap_metals",
	"hl2_m_wrench"
}
TRAIT.func = function(client, character)
	character:updateAttrib("medical", 5)
end
TRAIT.modifier = {
	["sneak"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "consistent" 
TRAIT.name = "Consistent"
TRAIT.desc = "Whether that's a good thing or not is up to you.\nYour combat rolls are critical more often than normal, but they're also not as good.\nYou almost never critically fail."
TRAIT.category = "Character"
TRAIT.critMult = function(client, char, critMult)
	critMult = critMult * 0.75
	
	return critMult
end
TRAIT.critChance = function(client, char, critChance)
	critChance = critChance + 50
	
	return critChance
end
TRAIT.critFail = function(client, char, critFail)
	critFail = critFail - 5
	
	return critFail
end
TRAIT.items = {
	"j_dice"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "inconsistent" 
TRAIT.name = "Inconsistent"
TRAIT.desc = "Whether that's a good thing or not is up to you.\nYour combat rolls are critical less often than normal, but they're also much better.\nYou critically fail more often."
TRAIT.category = "Character"
TRAIT.critMult = function(client, char, critMult)
	critMult = critMult + 1
	
	return critMult
end
TRAIT.critChance = function(client, char, critChance)
	critChance = critChance * 0.5
	
	return critChance
end
TRAIT.critFail = function(client, char, critFail)
	critFail = critFail + 2
	
	return critFail
end
TRAIT.items = {
	"j_dice"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "smoker" 
TRAIT.name = "Smoker"
TRAIT.desc = "You enjoy spending money on destroying your health.\nStart with a pack of cigarettes.\nFortitude rolls increased to 1.05x.\nEndure reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"j_cigs"
}
TRAIT.modifier = {
	["fortitude"] = 1.05,
	["endure"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "painter" 
TRAIT.name = "Painter"
TRAIT.desc = "This is no place for a happy little tree.\nStart with two cans of paint.\nFortitude and perception rolls increased to 1.05x.\nSneak and reflex rolls reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.items = {
	"j_paint_can",
	"j_paint_can"
}
TRAIT.modifier = {
	["fortitude"] = 1.05,
	["perception"] = 1.05,
	["sneak"] = 0.9,
	["reflexes"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "donor" 
TRAIT.name = "Blood Donor"
TRAIT.desc = "You pride yourself in giving whatever you can to those in need.\nYou can bottle your own blood once every week (/blood)."
TRAIT.category = "Char Abilities"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "diagnose" 
TRAIT.name = "Pathologist"
TRAIT.desc = "You know exactly what's wrong with everyone else.\nYou can diagnose the afflictions of others (/diagnose)."
TRAIT.category = "Char Abilities"

TRAITS:Register( TRAIT )

