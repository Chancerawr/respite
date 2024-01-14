local PLUGIN = PLUGIN

//
local TRAIT = {}
TRAIT.uid = "nofall"
TRAIT.name = "Acrobat"
TRAIT.desc = "You don't fallover when you take fall damage."
TRAIT.category = "Character"

TRAITS:Register(TRAIT)

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

TRAITS:Register(TRAIT)
//
local TRAIT = {}
TRAIT.uid = "finedollar" 
TRAIT.name = "Fine Dollar"
TRAIT.desc = "A pretty penny, a fine dollar.\nStart with 200 scrap coins."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:giveMoney(200)
end

TRAITS:Register(TRAIT)
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
TRAIT.desc = "You're ready to level up.\nStart with a mouse and keyboard."
TRAIT.category = "Character"
TRAIT.items = {
	"j_mouse",
	"hl2_m_keyboard"
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
TRAIT.desc = "Build a man a fire, he'll be warm for a night. Set a man on fire, he'll be warm for the rest of his life.\nStart with a can of fuel and two molotovs."
TRAIT.category = "Character"
TRAIT.items = {
	"j_gas_can",
	"molotov",
	"molotov"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "handy" 
TRAIT.name = "Handy Man"
TRAIT.desc = "You know your way around a tool or two.\nStart with a salvager kit."
TRAIT.category = "Character"
TRAIT.items = {
	"kit_salvager"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "loudclear" 
TRAIT.name = "Loud & Clear"
TRAIT.desc = "There are some things that just have to be said.\nStart with two radios, and a radio booster."
TRAIT.category = "Character"
TRAIT.items = {
	"comm_radio",
	"comm_radio",
	"radio_booster"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "personality" 
TRAIT.name = "Radio Personality"
TRAIT.desc = "If video didn't kill you, neither will this.\nStart with a broadcaster."
TRAIT.category = "Character"
TRAIT.items = {
	"broadcaster"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "photo" 
TRAIT.name = "Photographer"
TRAIT.desc = "You know how to get the perfect shot.\nStart with a camera."
TRAIT.category = "Character"
TRAIT.items = {
	"j_camera"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "glasses" 
TRAIT.name = "Impaired Sight"
TRAIT.desc = "Your eyesight isn't the best.\nStart with a pair of glasses."
TRAIT.category = "Character"
TRAIT.items = {
	"j_glasses"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "construct" 
TRAIT.name = "Construction Worker"
TRAIT.desc = "Someone's gotta do it.\nStart with a hard hat and a rebar club."
TRAIT.category = "Character"
TRAIT.items = {
	"hl2_m_rebar",
	"helmet_hard",
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "fireman" 
TRAIT.name = "Fireman"
TRAIT.desc = "If you can't stand the heat, put on your protective equipment.\nStart with a fireman's hat and a fireaxe."
TRAIT.category = "Character"
TRAIT.items = {
	"helmet_fire",
	"melee_fireaxe"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "lumberjack" 
TRAIT.name = "Lumberjack"
TRAIT.desc = "What rolls down stairs, and travels in pairs?\nStart with a lumber axe and some wood."
TRAIT.category = "Character"
TRAIT.items = {
	"hl2_m_lumberaxe",
	"j_scrap_wood",
	"j_scrap_wood",
	"j_scrap_wood"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "cozy" 
TRAIT.name = "Cozy"
TRAIT.desc = "At least you'll be warm.\nStart with a pair of gloves and an ushanka."
TRAIT.category = "Character"
TRAIT.items = {
	"j_ushanka",
	"j_gloves"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "carpenter" 
TRAIT.name = "Carpenter"
TRAIT.desc = "Some problems are best solved with a hammer and nails.\nStart with a carpenter's hammer, some nails, and some wood."
TRAIT.category = "Character"
TRAIT.items = {
	"hl2_m_hammer",
	"j_scrap_nails",
	"j_scrap_nails",
	"j_scrap_wood",
	"j_scrap_wood"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "breacher" 
TRAIT.name = "Breacher"
TRAIT.desc = "If there isn't a door, just make one."
TRAIT.category = "Character"
TRAIT.items = {
	"hl2_m_sledgehammer",
	"breach"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "nerveagent" 
TRAIT.name = "Nerve Agent"
TRAIT.desc = "Don't be nervous\nStart with a gas mask and two tear gas grenades."
TRAIT.category = "Character"
TRAIT.items = {
	"gasmask",
	"nut_teargas",
	"nut_teargas"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "veteran" 
TRAIT.name = "Veteran"
TRAIT.desc = "Don't worry, that's just the tinnitus.\nStart with a holster and some 9x19mm bullets."
TRAIT.category = "Character"
TRAIT.items = {
	"ammo_919",
	"ammo_919",
	"ammo_919",
	"ammo_919",
	"ammo_919",
	"j_holster",
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "bodyguard" 
TRAIT.name = "Bodyguard"
TRAIT.desc = "You specialize in guarding bodies.\nStart with a T1 armored vest."
TRAIT.category = "Character"
TRAIT.items = {
	"armor_t1"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "defender" 
TRAIT.name = "Defender"
TRAIT.desc = "Those who stand with you, stand behind you.\nYou gain the ability to defend others from attacks (/defend)."
TRAIT.category = "Char Abilities"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "rapidstab" 
TRAIT.name = "Rapid Stabbing"
TRAIT.desc = "How violent of you.\nYou gain the ability to stab rapidly (/rapidstab)."
TRAIT.category = "Char Abilities"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "rogue" 
TRAIT.name = "Rogue"
TRAIT.desc = "You really like to get behind.\nYou gain the ability to backstab enemies with a melee weapon. (/backstab)."
TRAIT.category = "Char Abilities"

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
TRAIT.desc = "You really like to get ahead.\nStart with binoculars."
TRAIT.category = "Character"
TRAIT.items = {
	"j_binoculars"
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
	"converter_meat",
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "brewery" 
TRAIT.name = "Homebrewer"
TRAIT.desc = "You're your own favorite customer.\nStart with a brewery device."
TRAIT.category = "Character"
TRAIT.items = {
	"brewery"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "brewery_soda" 
TRAIT.name = "Carbonation Expert"
TRAIT.desc = "Life is more exciting with a little fizz.\nStart with a soda stream device."
TRAIT.category = "Character"
TRAIT.items = {
	"soda_stream"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "medicator" 
TRAIT.name = "Chemist"
TRAIT.desc = "Let's get chemical.\nStart with a medicator device."
TRAIT.category = "Character"
TRAIT.items = {
	"medicator"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "drunk" 
TRAIT.name = "Drunk"
TRAIT.desc = "The bottle solves all problems.\nStart with a broken bottle."
TRAIT.category = "Character"
TRAIT.items = {
	"hl2_m_brokenbottle",
	"alc_whiskey",
	"alc_beer",
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "wonderwall" 
TRAIT.name = "Wonderwall"
TRAIT.desc = "Anyway, here's Wonderwall.\nStart with a guitar."
TRAIT.category = "Character"
TRAIT.items = {
	"j_guitar"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "crowbar" 
TRAIT.name = "Warehouse Worker"
TRAIT.desc = "Your favorite part is the unboxing, your second favorite part is the boxing.\nStart with a crowbar."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	local ranItems = {
		"hl2_m_crowbar",
		"hl2_m_crowbar_alt"
	}
	
	character:getInv():add(table.Random(ranItems), 1) --one random item from above pool
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "protester" 
TRAIT.name = "Protester"
TRAIT.desc = "Some people wait for a sign from above, you made your own sign.\nStart with a sign."
TRAIT.category = "Character"
TRAIT.items = {
	"hl2_m_woodensign"
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
TRAIT.desc = "Rock and Roll, man.\nYou start with four rocks."
TRAIT.category = "Peculiar"
TRAIT.items = {
	"hl2_m_rock",
	"hl2_m_rock",
	"hl2_m_rock",
	"hl2_m_rock",
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
	"j_hula",
}
//
local TRAIT = {}
TRAIT.uid = "baker" 
TRAIT.name = "Baker"
TRAIT.desc = "You know how to cook it by the books.\nStart with a bakery device."
TRAIT.category = "Character"
TRAIT.items = {
	"bakery"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "cultist" 
TRAIT.name = "Cultist"
TRAIT.desc = "You'll believe anything, but sometimes that's just the ticket.\nStart with a sacrificial skull."
TRAIT.category = "Character"
TRAIT.items = {
	"sacrificial_skull"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "target" 
TRAIT.name = "Designated Target"
TRAIT.desc = "People have been beating you up for so long, you got pretty good at taking hits."
TRAIT.category = "Character"
TRAIT.items = {
	"armor_tread",
	"j_scrap_rubber",
	"j_scrap_rubber",
	"j_scrap_rubber",
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
TRAIT.desc = "Read a book.\nStart with a random useless book."
TRAIT.category = "Character"
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
TRAIT.desc = "Batter up.\nStart with a baseball bat."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	if(math.random(0,1) == 1) then
		character:getInv():add("hl2_m_bat_metal", 1)
	else
		character:getInv():add("hl2_m_bat", 1)
	end
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "authority" 
TRAIT.name = "Authority"
TRAIT.desc = "Criminals must be apprehended.\nStart with two zip ties and a baton."
TRAIT.category = "Character"
TRAIT.items = {
	"ziptie",
	"ziptie",
	"melee_baton"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "trucker" 
TRAIT.name = "Trucker"
TRAIT.desc = "Your truck is a beautiful machine, too bad it's not here.\nStart with a steering wheel and energy pills."
TRAIT.category = "Character"
TRAIT.items = {
	"hl2_m_steeringwheel",
	"drug_energy",
	"drug_energy",
	"drug_energy"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "mechanic" 
TRAIT.name = "Mechanic"
TRAIT.desc = "You fix vehicles and drive a piece of shit.\nStart with a wrench and some scrap."
TRAIT.category = "Character"
TRAIT.items = {
	"j_scrap_metals",
	"j_scrap_metals",
	"hl2_m_wrench"
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
TRAIT.desc = "You enjoy spending money on destroying your health.\nStart with a pack of cigarettes."
TRAIT.category = "Character"
TRAIT.items = {
	"j_cigs"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "painter" 
TRAIT.name = "Painter"
TRAIT.desc = "This is no place for a happy little tree.\nStart with two cans of paint."
TRAIT.category = "Character"
TRAIT.items = {
	"j_paint_can",
	"j_paint_can"
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