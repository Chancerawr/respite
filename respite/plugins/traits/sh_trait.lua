local PLUGIN = PLUGIN
//
local TRAIT = {}
TRAIT.uid = "fin"
TRAIT.name = "Finnish Language"
TRAIT.desc = "You can speak Finnish.\nCommand: /fin"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "pol"
TRAIT.name = "Polish Language"
TRAIT.desc = "You can speak Polish.\nCommand: /pol"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "sign_a"
TRAIT.name = "American Sign Language"
TRAIT.desc = "You can use American Sign Language.\nCommand: /sign"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "pla"
TRAIT.name = "Plastic Languages"
TRAIT.desc = "You can use and understand the plastic languages.\nCommand: /plastic, /signp"
TRAIT.category = "Language"
TRAIT.ignore = true

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "kor"
TRAIT.name = "Korean Language"
TRAIT.desc = "You can speak Korean.\nCommand: /kor"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "afr"
TRAIT.name = "Afrikaans Language"
TRAIT.desc = "You can speak Afrikaans.\nCommand: /afr"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "fre"
TRAIT.name = "French Language"
TRAIT.desc = "You can speak French.\nCommand: /fre"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "ara"
TRAIT.name = "Arabic Language"
TRAIT.desc = "You can speak Arabic.\nCommand: /ara"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "spa"
TRAIT.name = "Spanish Language"
TRAIT.desc = "You can speak Spanish.\nCommand: /spa"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "ger"
TRAIT.name = "German Language"
TRAIT.desc = "You can speak German.\nCommand: /ger"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "rus"
TRAIT.name = "Russian Language"
TRAIT.desc = "You can speak Russian.\nCommand: /rus"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "chi"
TRAIT.name = "Chinese Language"
TRAIT.desc = "You can speak Chinese.\nCommand: /chi"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "ita"
TRAIT.name = "Italian Language"
TRAIT.desc = "You can speak Italian.\nCommand: /ita"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "jap"
TRAIT.name = "Japanese Language"
TRAIT.desc = "You can speak Japanese.\nCommand: /jap"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//--todo
local TRAIT = {}
TRAIT.uid = "glutton"
TRAIT.name = "Glutton"
TRAIT.desc = "You enjoy a meal, whether it's a hot dog or a lobster.\nBuffs received from food are enhanced by 20%."
TRAIT.category = "Character"

TRAITS:Register( TRAIT )
//--todo
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
	["akimbo"] = 1.2,
	["suppress"] = 1.2
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "gunslinger" 
TRAIT.name = "Gunslinger"
TRAIT.desc = "Fire first, die last.\nQuick draw, akimbo, and regular firearms rolls increased to 1.2x.\nAimed rolls reduced to 0.7x."
TRAIT.category = "Character"
TRAIT.blacklist = "marksman"

TRAIT.modifier = {
	["firearmsaimed"] = 0.7,
	["firearmsburstaimed"] = 0.7,
	["firearms"] = 1.2,
	["quickdraw"] = 1.2,
	["akimbo"] = 1.2
}

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
TRAIT.desc = "You always know where to find the good stuff.\nScavenge and perception rolls increased to 1.2x. Fortitude and Endure rolls reduced to 0.8x."
TRAIT.category = "Character"

TRAIT.modifier = {
	["scavenge"] = 1.2,
	["perception"] = 1.2,
	["fortitude"] = 0.8,
	["endure"] = 0.8
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
TRAIT.desc = "A pretty penny, a fine dollar.\nStart with 100 scrap coins."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:giveMoney(100) --doubles default money.
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "businessman" 
TRAIT.name = "Business Man"
TRAIT.desc = "You have places to be, and things to be doing.\nStart with a suitcase."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:getInv():add("hl2_m_suitcase") --suitcase
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "student" 
TRAIT.name = "Student"
TRAIT.desc = "On the bright side, there's no debt here.\nStart with a backpack.\nPerception rolls increased to 1.15x.\nMelee attack rolls reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:getInv():add("pack")
end
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
TRAIT.uid = "berserk" 
TRAIT.name = "Berserk"
TRAIT.desc = "Your therapist can't stop you now.\nYour non-firearm offensive rolls are increased to 1.2x.\nYour defensive rolls are 0.7x."
TRAIT.category = "Character"
TRAIT.modifier = {
	["endure"] = 0.7,
	["dodge"] = 0.7,
	["block"] = 0.7,
	["parry"] = 0.7,
	["defend"] = 0.7,
	["fortitude"] = 0.7,
	["melee"] = 1.2,
	["meleedual"] = 1.2,
	["throw"] = 1.2,
	["flail"] = 1.2,
	["grapple"] = 1.2
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "lightfeet" 
TRAIT.name = "Light Feet"
TRAIT.desc = "You're a bit of a pushover, but you're pretty good at sneaking around.\nYour sneak and dodge rolls are increased to 1.1x.\nBlock, parry, and defend rolls reduced to 0.7x."
TRAIT.category = "Character"
TRAIT.modifier = {
	["sneak"] = 1.1,
	["dodge"] = 1.1,
	["block"] = 0.7,
	["parry"] = 0.7,
	["defend"] = 0.7
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "fisher" 
TRAIT.name = "Fisherman"
TRAIT.desc = "A calm day on the lake is where you'd rather be right now.\nStart with a fishing rod."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:getInv():add("fishing_pole") --fishing pole
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "farmer" 
TRAIT.name = "Farmer"
TRAIT.desc = "You're a grower, not a shower.\nStart with a random regular farm device."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	local ranItems = {
		"farm_apple",
		"farm_banana",
		"farm_cactus",
		"farm_lemon",
		"farm_melon",
		"farm_orange",
		"farm_potato",
		"farm_pumpkin"
	}
	character:getInv():add(table.Random(ranItems), 1) --one random item from above pool
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "junkrat" 
TRAIT.name = "Junk Rat"
TRAIT.desc = "You hate throwing things away, even when broken.\nStart with a broken peculiar generator.\nFortitude rolls reduced to 0.95x."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:getInv():add("generator_broken", 1)
end
TRAIT.modifier = {
	["fortitude"] = 0.95,
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "crafter" 
TRAIT.name = "Craftsman"
TRAIT.desc = "You are skilled at working with odds and ends.\nYour starting Craftiness is boosted by 25."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:updateAttrib("medical", 25)
	character:getInv():add("j_scrap_metals", 2)
	character:getInv():add("j_scrap_plastics", 2)
	character:getInv():add("j_scrap_wood", 2)
	character:getInv():add("j_scrap_elecs", 2)
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "handy" 
TRAIT.name = "Handy Man"
TRAIT.desc = "You know your way around a tool or two.\nStart with a salvager kit.\nScavenge rolls reduced by 0.8x."
TRAIT.category = "Character"
TRAIT.ignore = true
TRAIT.func = function(client, character)
	character:getInv():add("kit_salvager", 1)
end
TRAIT.modifier = {
	["scavenge"] = 0.8,
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "carto" 
TRAIT.name = "Cartographer"
TRAIT.desc = "You really know your way around.\nStart with a map.\nPerception rolls increased by 1.1x.\nReflex rolls reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:getInv():add("j_map", 1)
end
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
TRAIT.func = function(client, character)
	character:getInv():add("j_camera", 1)
end
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
TRAIT.func = function(client, character)
	character:getInv():add("j_glasses", 1)
end
TRAIT.modifier = {
	["fortitude"] = 1.1,
	["perception"] = 0.8,
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "ace" 
TRAIT.name = "Ace"
TRAIT.desc = "You brought some cards, at least you won't be bored.\nStart with a deck of cards."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:getInv():add("j_cards", 1)
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "butcher" 
TRAIT.name = "Butcher"
TRAIT.desc = "You work with meat on a daily basis.\nStart with an organic converter."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:getInv():add("converter_meat", 1)
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "drunk" 
TRAIT.name = "Drunk"
TRAIT.desc = "The bottle solves all problems.\nStart with a broken bottle.\nEndure rolls set to 1.1x.\nPerception rolls lowered to 0.9x."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:getInv():add("hl2_m_brokenbottle", 1)
end
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
TRAIT.func = function(client, character)
	character:getInv():add("j_guitar", 1)
end
TRAIT.modifier = {
	["perception"] = 0.95,
	["will"] = 1.1
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "crowbar" 
TRAIT.name = "Warehouse Worker"
TRAIT.desc = "Your favorite part is the unboxing, your second favorite part is the boxing.\nStart with a crowbar.\nScavenge rolls increased to 1.05x.\nWill rolls reduces to 0.9x"
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
TRAIT.uid = "peculiar" 
TRAIT.name = "???"
TRAIT.desc = "???"
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	local ranItems = {
		"mystery_box",
		"food_banana",
		"j_gnome",
		"voltaic"
	}
	
	character:getInv():add(table.Random(ranItems), 1) --one random item from above pool
	character:setData("fort_hall", CurTime()) --fort debuff
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "scrapper" 
TRAIT.name = "Scrapper"
TRAIT.desc = "You know your way around a piece of junk.\nThe chance of a salvaged item giving bonus materials is increased by 10%."
TRAIT.category = "Character"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "cursed" 
TRAIT.name = "Cursed"
TRAIT.desc = "Start with an Intrinsic Symbol, but also a terrible status debuff, it's probably not worth it."
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	character:getInv():add("chip_escape", 1)
	character:setData("trait_curse", CurTime()) --fort debuff
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "family" 
TRAIT.name = "Family Man"
TRAIT.desc = "Your family is waiting for you.\nStart with a family portrait and some memories."
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	character:getInv():add("j_scrap_memory", 1)
	character:getInv():add("j_scrap_memory", 1) 
	character:getInv():add("j_scrap_memory", 1)
	character:getInv():add("j_family_picture", 1)
	
	character:setData("fort_nost", CurTime()) --fort debuff
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "lost" 
TRAIT.name = "Lost"
TRAIT.desc = "Something was taken from you."
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	character:getInv():add("ichor", 1)
	character:getInv():add("ichor", 1)

	character:setData("trait_soul", CurTime()) --fort debuff
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "purge" 
TRAIT.name = "PURGE"
TRAIT.desc = "All must be wiped clean."
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	character:getInv():add("medical_purge", 1)
	character:getInv():add("bleach", 1)
	character:getInv():add("bleach", 1)

	character:setData("trait_purge", CurTime()) --fort debuff
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "vain" 
TRAIT.name = "Vain"
TRAIT.desc = "Pride is a sin."
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	character:getInv():add("mirror", 1)
	timer.Simple(1, function() --delayed to prevent item collisions
		character:getInv():add("j_scrap_glass", 1)
		character:getInv():add("j_scrap_glass", 1)
	end)
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "yams" 
TRAIT.name = "Yams"
TRAIT.desc = "Just start with a bunch of yams, that's what you want isn't it?"
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	character:getInv():add("food_yams", 12)
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "rock" 
TRAIT.name = "Rock"
TRAIT.desc = "Rock and Roll.\nYou start with a single rock."
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	character:getInv():add("hl2_m_rock", 1)
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "fencer" 
TRAIT.name = "Fencer"
TRAIT.desc = "Start with a wooden fence post."
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	character:getInv():add("hl2_m_fencepost", 1)
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "dark" 
TRAIT.name = "Afraid of the Dark"
TRAIT.desc = "Darkness is dangerous, the light is safe."
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	character:getInv():add("nut_flare", 1)
	character:getInv():add("nut_flare_w", 1)
	character:getInv():add("coflantern", 1)
	
	character:setData("trait_dark", CurTime()) --fort debuff
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "headache" 
TRAIT.name = "Extreme Headache"
TRAIT.desc = "What did you do to deserve this?"
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	character:getInv():add("drug_painkillers", 4)
	
	character:setData("trait_headache", CurTime()) --fort debuff
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "addict" 
TRAIT.name = "Addict"
TRAIT.desc = "This will be the last time."
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	character:getInv():add("haze_bottled", 1)
	
	character:setData("addict_bh", CurTime()) --fort debuff
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "trinket" 
TRAIT.name = "Trinket Collector"
TRAIT.desc = "You enjoy your strange collectables.\nStart with a Hula Doll, Stuffed Turtle, and Baby Doll."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:getInv():add("j_baby_doll", 1)
	character:getInv():add("j_stuffed_turtle", 1)
	character:getInv():add("j_hula", 1)
end
//
local TRAIT = {}
TRAIT.uid = "baker" 
TRAIT.name = "Baker"
TRAIT.desc = "Start with a giant donut."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:getInv():add("food_donut_giant", 1)
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "cultist" 
TRAIT.name = "Cultist"
TRAIT.desc = "You'll believe anything, but sometimes that's just the ticket.\nStart with a sacrificial skull.\nFortitude rolls reduced to 0.8x."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:getInv():add("sacrificial_skull", 1)
end
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
TRAIT.func = function(client, character)
	character:getInv():add("j_scrap_rubber", 1)
end
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
TRAIT.uid = "batter" 
TRAIT.name = "Batter"
TRAIT.desc = "Batter up.\nStart with a baseball bat.\nStandard melee and throw rolls are increased to 1.05x.\nDodge rolls reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:getInv():add("hl2_m_bat", 1)
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
TRAIT.desc = "Criminals must be apprehended.\nStart with 2 zip ties.\nGrapple rolls increased 1.05x.\nFortitude rolls reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:getInv():add("ziptie", 2)
end
TRAIT.modifier = {
	["grapple"] = 1.05,
	["fortitude"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "trucker" 
TRAIT.name = "Trucker"
TRAIT.desc = "Your truck is a beautiful machine, too bad it's not here.\nStart with a steering wheel and energy pills."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:getInv():add("hl2_m_steeringwheel", 1)
	character:getInv():add("drug_energy", 1)
end
TRAIT.modifier = {
	["grapple"] = 1.05,
	["fortitude"] = 0.9
}

TRAITS:Register( TRAIT )

//
local TRAIT = {}
TRAIT.uid = "smoker" 
TRAIT.name = "Smoker"
TRAIT.desc = "You enjoy spending money on destroying your health.\nStart with a pack of cigarettes.\nFortitude rolls increased to 1.05x.\nEndure reduced to 0.9x."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:getInv():add("j_cigs", 1)
end
TRAIT.modifier = {
	["fortitude"] = 1.05,
	["endure"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "donor" 
TRAIT.name = "Blood Donor"
TRAIT.desc = "You pride yourself in giving whatever you can to those in need.\nYou can bottle your own blood once every week.\nUse /blood."
TRAIT.category = "Character"

TRAITS:Register( TRAIT )

