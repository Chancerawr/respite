local PLUGIN = PLUGIN
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
	
	giveDisease(client, "peculiar")
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "zealot" 
TRAIT.name = "Zealot"
TRAIT.desc = "God watches over you."
TRAIT.category = "Peculiar"
TRAIT.items = {
	"j_bible"
}
TRAIT.func = function(client, character)
	giveDisease(client, "trait_zealot")
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "cursed" 
TRAIT.name = "Cursed"
TRAIT.desc = "Suffering awaits."
TRAIT.category = "Peculiar"
TRAIT.items = {
	"chip_escape",
	"cube_chip_enhanced"
}
TRAIT.func = function(client, character)
	giveDisease(client, "trait_curse")	
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "lost" 
TRAIT.name = "Lost"
TRAIT.desc = "Something was taken from you."
TRAIT.category = "Peculiar"
TRAIT.items = {
	"ichor",
	"ichor",
	"ichor"
}
TRAIT.func = function(client, character)
	giveDisease(client, "trait_soul")
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "purge" 
TRAIT.name = "PURGE"
TRAIT.desc = "All must be wiped clean."
TRAIT.category = "Peculiar"
TRAIT.items = {
	"medical_purge",
	"bleach",
	"bleach"
}
TRAIT.func = function(client, character)
	giveDisease(client, "trait_purge")
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "dark" 
TRAIT.name = "Afraid of the Dark"
TRAIT.desc = "Darkness is dangerous, the light is safe."
TRAIT.category = "Peculiar"
TRAIT.items = {
	"nut_flare",
	"nut_flare_w",
	"coflantern"
}
TRAIT.func = function(client, character)
	giveDisease(client, "trait_dark")	
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "digger" 
TRAIT.name = "Gravedigger"
TRAIT.desc = "You must give them the gift of rest."
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	if(math.random(0,1) == 1) then
		character:getInv():add("hl2_m_shovel", 1)
	else
		character:getInv():add("hl2_m_shovel_alt", 1)
	end
	
	giveDisease(client, "trait_digger")
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "headache" 
TRAIT.name = "Extreme Headache"
TRAIT.desc = "What did you do to deserve this?"
TRAIT.category = "Peculiar"
TRAIT.items = {
	"drug_painkillers",
	"drug_painkillers",
	"drug_painkillers",
	"drug_painkillers"
}
TRAIT.func = function(client, character)
	giveDisease(client, "trait_headache")
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "addict" 
TRAIT.name = "Addict"
TRAIT.desc = "This will be the last time."
TRAIT.category = "Peculiar"
TRAIT.items = {
	"haze_bottled",
	"haze_bottled"
}
TRAIT.func = function(client, character)
	giveDisease(client, "addict_bh")		
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "clumsy" 
TRAIT.name = "Clumsy"
TRAIT.desc = "You are a walking accident."
TRAIT.category = "Peculiar"
TRAIT.items = {
	"medical_bandages",
	"medical_bandages",
	"medical_gauze"
}
TRAIT.func = function(client, character)
	giveDisease(client, "trait_clumsy")			
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "paranoia" 
TRAIT.name = "Extreme Paranoia"
TRAIT.desc = "Don't look behind you."
TRAIT.category = "Peculiar"
TRAIT.items = {
	"j_blanket",
	"j_turtle"
}
TRAIT.func = function(client, character)
	giveDisease(client, "trait_paranoid")		
end
TRAIT.modifier = {
	["perception"] = 1.1,
	["fortitude"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "lunatic" 
TRAIT.name = "Lunatic"
TRAIT.desc = "Bark at the moon."
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	giveDisease(client, "trait_lunatic")	
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "void" 
TRAIT.name = "The Void"
TRAIT.desc = "It stares back."
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	giveDisease(client, "trait_void")
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "instrumental" 
TRAIT.name = "Instrumental"
TRAIT.desc = "Broken strings and unmoving keys produce no sounds."
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	giveDisease(client, "trait_instrument")
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "ravenous" 
TRAIT.name = "Ravenous"
TRAIT.desc = "An abyss that can never be filled."
TRAIT.category = "Peculiar"
TRAIT.func = function(client, character)
	giveDisease(client, "trait_hunger")
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "blind" 
TRAIT.name = "Blind"
TRAIT.desc = "Your eyes no longer properly function, whether this condition is recent or from birth is up to you."
TRAIT.category = "Peculiar"
TRAIT.modifier = {
	["perception"] = 0,
	["fortitude"] = 2
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "deaf" 
TRAIT.name = "Deaf"
TRAIT.desc = "You can run but you can't hear.\nYour hearing no longer properly functions, whether this condition is recent or from birth is up to you."
TRAIT.category = "Peculiar"
TRAIT.modifier = {
	["perception"] = 0.5,
	["fortitude"] = 1.2
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "mute" 
TRAIT.name = "Mute"
TRAIT.desc = "You cannot properly speak, whether this condition is recent or from birth is up to you. The severity of the condition is also up to you."
TRAIT.category = "Peculiar"
TRAIT.modifier = {
	["perception"] = 1.1
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "blighted" 
TRAIT.name = "Blighted"
TRAIT.desc = "The past grips you tightly."
TRAIT.category = "Peculiar"
TRAIT.items = {
	"reminiscence"
}
TRAIT.func = function(client, character)	
	local pTable = {}
	pTable["al"] = {math.random(10,50), "Blight"}
	pTable["lr"] = {math.random(10,100), "Blight"}
	
	character:setData("parts", pTable)
	
	giveDisease(client, "fort_nost")
end

TRAITS:Register(TRAIT)