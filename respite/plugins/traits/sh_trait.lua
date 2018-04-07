local PLUGIN = PLUGIN

//
local TRAIT = {}
TRAIT.uid = "test"
TRAIT.name = "Test Trait"
TRAIT.desc = "Ignore This"
TRAIT.category = "Language"
TRAIT.ignore = true --if you dont want it to show up in the char creation menu

TRAITS:Register( TRAIT )
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
TRAIT.desc = "You like to keep things up close and personal.\nMelee attacks, grapple, parry, block, and defends are increased to 1.5x.\nAll ranged rolls are reduced to 0.5x."
TRAIT.category = "Character"
TRAIT.blacklist = "range"

TRAIT.modifier = {
	["melee"] = 1.5,
	["grapple"] = 1.5,
	["meleedual"] = 1.5,
	["parry"] = 1.5,
	["block"] = 1.5,
	["defend"] = 1.5,
	["flail"] = 1.5,
	["firearms"] = 0.5,
	["firearmsburst"] = 0.5,
	["firearmsaimed"] = 0.5,
	["firearmsburstaimed"] = 0.5,
	["quickdraw"] = 0.5,
	["execute"] = 0.5,
	["throw"] = 0.5,
	["akimbo"] = 0.5,
	["suppress"] = 0.5
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "ranged" 
TRAIT.name = "Ranged Specialist"
TRAIT.desc = "You like to keep some distance in your relationships.\nMelee attacks, grapple, parry, block, and defends are decreased to 0.5x\nAll ranged rolls are increased to 1.5x."
TRAIT.category = "Character"
TRAIT.blacklist = "close"

TRAIT.modifier = {
	["melee"] = 0.5,
	["grapple"] = 0.5,
	["meleedual"] = 0.5,
	["parry"] = 0.5,
	["block"] = 0.5,
	["defend"] = 0.5,
	["flail"] = 0.5,
	["firearms"] = 1.5,
	["firearmsburst"] = 1.5,
	["firearmsaimed"] = 1.5,
	["firearmsburstaimed"] = 1.5,
	["quickdraw"] = 1.5,
	["execute"] = 1.5,
	["throw"] = 1.5,
	["akimbo"] = 1.5,
	["suppress"] = 1.5
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "gunslinger" 
TRAIT.name = "Gunslinger"
TRAIT.desc = "Fire first, die last.\nQuick draw, akimbo, and regular firearms rolls increased to 1.5x.\nAimed rolls reduced to 0.5x."
TRAIT.category = "Character"
TRAIT.blacklist = "marksman"

TRAIT.modifier = {
	["firearmsaimed"] = 0.5,
	["firearmsburstaimed"] = 0.5,
	["firearms"] = 1.5,
	["quickdraw"] = 1.5,
	["akimbo"] = 1.5
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "marksman" 
TRAIT.name = "Marksman"
TRAIT.desc = "You aren't the quickest shot, but you are the deadliest.\nQuick draw, akimbo, and regular firearms rolls decreased to 0.5x.\nAimed rolls increased to 1.5x."
TRAIT.category = "Character"
TRAIT.blacklist = "gunslinger"

TRAIT.modifier = {
	["firearmsaimed"] = 1.5,
	["firearmsburstaimed"] = 1.5,
	["firearms"] = 0.5,
	["quickdraw"] = 0.5,
	["akimbo"] = 0.5
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
TRAIT.uid = "berserk" 
TRAIT.name = "Berserk"
TRAIT.desc = "Your therapist can't stop you now.\nYour non-firearm offensive rolls are increased to 1.4x.\nYour defensive rolls are 0.5x."
TRAIT.category = "Character"
TRAIT.modifier = {
	["endure"] = 0.5,
	["dodge"] = 0.5,
	["block"] = 0.5,
	["parry"] = 0.5,
	["defend"] = 0.5,
	["fortitude"] = 0.5,
	["melee"] = 1.4,
	["meleedual"] = 1.4,
	["throw"] = 1.4,
	["flail"] = 1.4,
	["grapple"] = 1.4
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "lightfeet" 
TRAIT.name = "Light Feet"
TRAIT.desc = "You're a bit of a pushover, but you're pretty good at sneaking around.\nYour sneak rolls are increased to 1.5x.\nBlock, parry, and defend rolls reduced to 0.5x."
TRAIT.category = "Character"
TRAIT.modifier = {
	["sneak"] = 1.5,
	["block"] = 0.5,
	["parry"] = 0.5,
	["defend"] = 0.5
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
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "handy" 
TRAIT.name = "Handy Man"
TRAIT.desc = "You know your way around a tool or two.\nStart with a salvager kit."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
	character:getInv():add("kit_salvager", 1)
end

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
TRAIT.desc = "Your favorite part is the unboxing, your second favorite part is the boxing.\nStart with a crowbar.\nScavenge rolls increased to 1.1x."
TRAIT.category = "Character"
TRAIT.func = function(client, character)
		local ranItems = {
		"hl2_m_crowbar",
		"hl2_m_crowbar_alt"
	}
	character:getInv():add(table.Random(ranItems), 1) --one random item from above pool
end
TRAIT.modifier = {
	["scavenge"] = 1.1
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
		"food_yams",
		"food_banana",
		"j_gnome",
		"food_apple_cursed"
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
TRAIT.desc = "Start with an Intrinsic Symbol, but also a few status debuffs."
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	character:getInv():add("chip_escape", 1)
	character:setData("fort_nost", CurTime()) --fort debuff
	character:setData("fort_conf", CurTime()) --fort debuff
	character:setData("fort_pani", CurTime()) --fort debuff
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

	character:setData("dis_wrai", CurTime()) --fort debuff
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
	timer.Simple(0.75, function() --delayed to prevent item collisions
		character:getInv():add("hl2_m_glassshiv", 1)
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