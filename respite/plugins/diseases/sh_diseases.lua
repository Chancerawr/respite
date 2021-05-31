local PLUGIN = PLUGIN
//
--[[
local DISEASE = {}
DISEASE.uid = "dis_"
DISEASE.name = "Disease" --shows up in diagnosis and used for giving it to people
DISEASE.desc = "You have a disease." --shows up in diagnosis
DISEASE.category = "Mental" --doesn't really do anything
DISEASE.random = 0.01 --chance that someone catches the disease randomly
DISEASE.think = 3600
DISEASE.duration = 10800

DISEASE.infect = { --chance that someone catches the disease randomly
	spreadRange = 500,
	spreadChance = 1,
} 

DISEASE.buffScale = { --buffs attributes by a multiplier
	["attrib1"] = 0.5,
	["attrib2"] = 1.1,
}

DISEASE.buff = { --buffs attributes by addition/subtraction
	["attrib1"] = 10,
	["attrib2"] = -10,
}

DISEASE.symptoms = { --prints that happen periodically when you have it
	{ --tables are checked differently and can do more things
		text = "", --text that prints in chat when symptom happens
		
		func = function(client) --function that runs when symptom happens
		
		end,
		
		cd = 3600, --how long this delays the next symptom print
	},
}

DISEASE.catch = { --when they catch it
	"",
	{ --tables are check differently and can do more things
		text = "",
		
		func = function(client)
		
		end,
	},
}

DISEASE.cure = { --when it goes away
	"",
	{ --tables are check differently and can do more things
		text = "",
		
		func = function(client)
		
		end,
	},
}
--]]

--example cold
local DISEASE = {}
DISEASE.uid = "dis_cold"
DISEASE.name = "Cold"
DISEASE.desc = "An ordinary cold, causes you to feel bad. Can be spread to others."
DISEASE.category = "Illness"
--DISEASE.random = true
DISEASE.duration = 32768 --around 9 hours
DISEASE.infect = { --chance that someone catches the disease randomly
	spreadRange = 600,
	spreadChance = 50,
} 

DISEASE.symptoms = {
	{ 
		text = {
			"Your throat hurts.",
			"Your nose is runny.",
			"Your nose is stuffed.",
			"You have a headache.",
			"You feel feverish.",
			"You feel unwell.",
		},
		
		func = function(client)
			if(math.random(0,1) == 1) then
				nut.chat.send(client, "me", "coughs.")
				client:EmitSound("ambient/voices/cough" ..math.random(1,4).. ".wav", 75, math.random(90,110))
			else
				nut.chat.send(client, "me", "sniffles.")
			end
		end,
		cd = 1800,
	},
}
DISEASE.cure = {
	"You recover from your cold."
}
DISEASES:Register(DISEASE)
//

local DISEASE = {}
DISEASE.uid = "fort_pani"
DISEASE.name = "Panic"
DISEASE.desc = "In a state of near constant panic."
DISEASE.category = "Mental"
DISEASE.buffScale = {
	["stm"] = 0.2,
	["accuracy"] = -0.5
}

DISEASE.symptoms = {
	{ 
		text = {
			"Your mind is racing, and you suddenly feel like something terrible is going to happen.",
			"Your mind fills with panic, you can't help but be anxious.",
			"You feel like something is coming for you, and there's no way to stop it.",
			"You get the feeling that someone is right behind you.",
			"You feel like you're surrounded by some invisible force, it's closing in.",
			"You feel unprepared and unready, the situation around you seems insurmountable."
		},
		cd = 7200,
	},
}
DISEASE.cure = {
	"Your panic slowly melts away.",
}
DISEASES:Register(DISEASE)

//
local DISEASE = {}
DISEASE.uid = "fort_insa"
DISEASE.name = "Insanity"
DISEASE.desc = "Greatly lowered mental stability, may act on impulse."
DISEASE.category = "Mental"
DISEASE.buff = {
	["fortitude"] = 10,
	["end"] = -10,
	["accuracy"] = -5,
	["str"] = -5,
	["perception"] = -10
}
DISEASE.symptoms = {
	{ 
		text = {
			"Something is wrong with you, your feel unstable, and uncertain.",
			"You hear dozens of voices screaming in your head, and they just won't stop.",
			"You have a terrible urge to do something damaging to yourself.",
			"You don't feel like you're controlling yourself, like you're some kind of puppet.",
			"You just want to go home.",
			"You just want to be safe.",
			"A voice whispers to you quietly, 'It doesn't have to be this way.'",
			"You don't feel like anything is real, not yourself or anything around you.",
			"For a few moments, you are hit with a surge of clarity, everything around you makes perfect sense.\nThis only lasts for a few moments, and as soon as the feeling leaves you, you feel lost again.",
			"Your head spins into madness, you can't tell right from wrong, and you can't tell yourself from others anymore. Everything is just a big mess."
		},
		cd = 7200,
	},
}
DISEASE.cure = {
	"Your sanity returns.",
}
DISEASES:Register(DISEASE)

//
local DISEASE = {}
DISEASE.uid = "fort_enrage"
DISEASE.name = "Enraged"
DISEASE.desc = "Greatly increased irritability and brute strength."
DISEASE.category = "Mental"
DISEASE.buff = {
	["str"] = 15,
	["end"] = -10,
	["accuracy"] = -15,
	["stm"] = -10,
}
DISEASE.symptoms = {
	{ 
		text = {
			"You really want to hit something.",
			"You're very angry, but you don't know why.",
			"You are nearly overcome by your fury, and you just want to destroy something.",
			"You want your enemies to be destroyed, and you want to be the one to do it.",
			"Your anger overcomes your good sense, and you feel like you're physically stronger than normal.",
			"You dream of battle where you can crush your enemies.",
			"You feel a surge of energy, and you want to use it to hurt things.",
			"You feel a glimpse of fatigue, but this somehow only makes you angry, and you push yourself past it.",
			"You temporarily find it hard to understand complex concepts."
		},
		cd = 7200,
	},
}
DISEASE.cure = {
	"You calm down, and are no longer enraged.",
}
DISEASES:Register(DISEASE)

//
local DISEASE = {}
DISEASE.uid = "fort_nost"
DISEASE.name = "Nostalgia"
DISEASE.desc = "Lost in the memories of the past, it may be hard to see the present."
DISEASE.category = "Mental"
DISEASE.buffScale = {
	["fortitude"] = -0.5,
	["perception"] = -0.5
}
DISEASE.symptoms = {
	{ 
		text = {
			"Your mind fills with images of those you used to know.",
			"You feel an intense longing for home.",
			"You hear a familiar voice calling your name.",
			"You smell something familiar.",
			"You feel like you're in a daze, like you aren't really here, but somewhere else, you think of home.",
			"You long for the past, the places you used to know.",
			"You hunger for your favorite food.",
			"Out of the corner of your vision you can see someone you used to know, but as you turn there's nothing there.",
		},
		cd = 7200,
	},
}
DISEASE.cure = {
	"Your nostalgia is slowly subsiding.",
}
DISEASES:Register(DISEASE)
//

local DISEASE = {}
DISEASE.uid = "fort_conf"
DISEASE.name = "Confusion"
DISEASE.desc = "Prevents thorough understanding of many simple concepts, leading to anxiety and other issues."
DISEASE.category = "Mental"
DISEASE.buff = {
	["accuracy"] = -5,
	["str"] = -5,
	["end"] = -5,
	["stm"] = -5,
}
DISEASE.buffScale = {
	["fortitude"] = 0.2,
	["perception"] = -0.2
}
DISEASE.symptoms = {
	{ 
		text = {
			"You feel very confused, simple concepts become very difficult.",
			"You don't understand your surroundings, you feel lost.",
			"You feel out of place and lost, you don't know what to do.",
			"You can't comprehend the situation around you.",
			"Your surroundings become unfamiliar, and you have no idea where you are.",
			"Your mind goes blank, and you have no idea what you're doing, or what you want to do.",
			"For a short amount of time you completely forget what you're doing.",
			"Operating your body becomes confusing, and it's hard to move properly.",
		},
		cd = 7200,
	},
}
DISEASE.cure = {
	"You are no longer confused, and things begin to make sense again.",
}
DISEASES:Register(DISEASE)
//

local DISEASE = {}
DISEASE.uid = "fort_headache"
DISEASE.name = "Headache"
DISEASE.desc = "A constant throbbing headache."
DISEASE.category = "Mental"
DISEASE.buff = {
	["perception"] = -15,
	["accuracy"] = -15,
	["medical"] = 10,
}
DISEASE.symptoms = {
	{ 
		text = {
			"The pain of your headache fades away for a moment, but comes back right after even stronger than before.",
			"Your head aches and throbs, you have difficulty focusing.",
			"Your head throbs and aches, the pain is agitating.",
		},
		cd = 7200,
	},
}
DISEASE.cure = {
	"Your headache is cured.",
}
DISEASES:Register(DISEASE)
//

local DISEASE = {}
DISEASE.uid = "fort_migraine"
DISEASE.name = "Migraine"
DISEASE.desc = "An excruciating pain."
DISEASE.category = "Mental"
DISEASE.buff = {
	["perception"] = -30,
	["accuracy"] = -30,
	["medical"] = 10,
	["fortitude"] = 10
}
DISEASE.symptoms = {
	{ 
		text = {
			"The pain of your migraine fades away for a moment, but comes back right after even stronger than before.",
			"Loud sounds send waves of pains through your body due to your migraine, you want everything to be quiet.",
			"Everything is too bright, and too noisy, moving only makes your migraine worse, and you just want it to stop.",
			"Your head hurts very badly, your eyes are very sensitive to the light.",
			"Your vision blurs, and you feel like you're going to vomit.",
		},
		cd = 7200,
	},
}
DISEASE.cure = {
	"Your migraine is slowly fades away.",
}
DISEASES:Register(DISEASE)
//

local DISEASE = {}
DISEASE.uid = "fort_hall"
DISEASE.name = "Hallucination"
DISEASE.desc = "Afflicted may hallucinate at random."
DISEASE.category = "Mental"
DISEASE.buff = {
	["str"] = -10
}
DISEASE.buffScale = {
	["perception"] = -0.5,
	["accuracy"] = -0.5
}
DISEASE.symptoms = {
	{ 
		text = {
			"You see strange objects in the corner of your vision.",
			"You hear someone call your name.",
			"Someone is watching you from far away.",
			"The ground is unsteady, and moving by itself.",
			"The sky is blood red, but when you blink it returns to normal.",
			"The walls begin to bleed, this goes on for several minutes before returning to normal.",
			"Your hands are covered in blood, but when you blink they return to normal.",
			"Out of the corner of your vision you see a someone approaching, but when you turn there is no one there.",
			"You are suddenly falling from a great height, but a moment later find yourself back on your feet.",
			"For a moment, everyone around you is a terrifying monster, they seemingly return to normal a minute later.",
			"You can see moving shapes in the shadows around you.",
			"For a moment, there are insects all over your body, you can feel them crawling. They disappear shortly after.",
			"You smell your favorite food somewhere nearby.",
			"You feel your skin crawling away from you, your bones screaming, and your head expanding. You feel normal a moment or so later.",
			"You see yourself from the third person for a few minutes, your body very slowly morphs and changes into something inhuman, you can only watch.\nOnce your body has changed into something completely unrecognizable, you see through your own eyes again, and find that your body is just as you left it.",
		},
		cd = 7200,
	},
}
DISEASE.cure = {
	"All of the hallucinations disappear, things feel normal again.",
}
DISEASES:Register(DISEASE)
//

local DISEASE = {}
DISEASE.uid = "fort_para"
DISEASE.name = "Paralysis"
DISEASE.desc = "Afflicted will have difficulty moving their body parts."
DISEASE.category = "Mental"
DISEASE.buff = {
	["accuracy"] = -10,
	["str"] = -10
}
DISEASE.buffScale = {
	["stm"] = -0.75,
}
DISEASE.symptoms = {
	{ 
		text = {
			"Your body is heavy, and it's hard to move.",
			"Your hands won't properly move, and you find it hard to do anything intricate with them.",
			"Your left leg gives out, and refuses to move for the time being.",
			"Your right leg gives out, and refuses to move for the time being.",
			"Your right arm refuses to respond, and is unable to move for the time being.",
			"Your left arm refuses to respond, and is unable to move for the time being.",
			"Your back is sluggish, and you find it hard to stand up.",
			"Your muscles are fatigued, you feel like you don't have any energy.",
		},
		cd = 7200,
	},
}
DISEASE.cure = {
	"Your body returns to normal, and you feel like you can move freely again.",
}
DISEASES:Register(DISEASE)
//

local DISEASE = {}
DISEASE.uid = "fort_noia"
DISEASE.name = "Paranoia"
DISEASE.desc = "Damaged mental state, may involve hallucinations."
DISEASE.category = "Mental"
DISEASE.buffScale = {
	["perception"] = 0.5,
	["fortitude"] = -0.5
}
DISEASE.symptoms = {
	{ 
		text = {
			"You feel like someone is watching you.",
			"Someone is following you.",
			"You feel like something is watching you from the ceiling.",
			"Out of the corner of your eye you spot something watching you.",
			"You feel someone breathing down your neck.",
			"Someone touches your left shoulder.",
			"You hear footsteps behind you.",
			"You see something in the distance looking at you, but when you look again you see nothing.",
			"Something is coming for you.",
			"You swear you hear someone whisper your name.",
			"You feel as though if you talk too loudly, 'they' will hear you. You don't want that.",
			"You feel like something is coming after you.",
			"Something is right behind you."
		},
		cd = 7200,
	},
}
DISEASE.cure = {
	"Your body returns to normal, and you don't feel as paranoid anymore.",
}
DISEASES:Register(DISEASE)
//

local DISEASE = {}
DISEASE.uid = "dis_poti"
DISEASE.name = "Potion Sickness"
DISEASE.desc = "Abuse of potions can lead to downsides, mostly physical."
DISEASE.category = "Illness"
DISEASE.buff = {
	["stm"] = -5,
	["str"] = -5,
	["end"] = -5,
	["fortitude"] = -5,
	["accuracy"] = -5,
	["luck"] = -5,
	["perception"] = -5,
	["medical"] = -5,
}
DISEASE.symptoms = {
	{ 
		text = {
			"Your body is heavy, and you feel weak.", --endurance
			"Your mind feels sluggish and slow.", --craftiness
			"Your vision blurs, and it's hard to see things in detail.", --perception
			"Your feel somewhat out of it mentally.", --craftiness/fortitude
			"You feel slow, and sluggish.", --agility
			"You feel weak, and harmless.", --strength
			"You feel mentally unstable, as if the smallest thing may break you.", --fortitude
			"You feel unlucky.", --luck
		},
		cd = 7200,
	},
}
DISEASE.cure = {
	"You feel normal again, the potion sickness fades away.",
}
DISEASES:Register(DISEASE)
//

local DISEASE = {}
DISEASE.uid = "dis_wrai"
DISEASE.name = "Soul Sickness"
DISEASE.desc = "Commonly seen among those attacked by wraiths, thought to be a weakening of a person's consciousness."
DISEASE.category = "Illness"
DISEASE.symptoms = {
	{ 
		text = {
			"You feel empty inside, like something is missing.",
			"You feel hollow, you want it back.",
			"Your feel lightheaded, and it's hard to focus.",
			"Your vision blurs, and you feel nauseous.",
			"They took it from you. You don't know what it was, but it's gone, and you feel great loss.",
			"You want to feel whole again.",
			"You long for something, but cannot picture what it is.",
			"You feel like something was taken from you, but you can't picture what.",
		},
		cd = 7200,
	},
}
DISEASE.cure = {
	"You feel whole again.",
}
DISEASES:Register(DISEASE)
//

local DISEASE = {}
DISEASE.uid = "dis_shad"
DISEASE.name = "Shadow Plague"
DISEASE.desc = "This person is doomed."
DISEASE.category = "Illness"
DISEASE.phaseTime = 1800
--DISEASE.spreadChance = 25
--DISEASE.spreadRange = 500
DISEASE.symptoms = {
	{ 
		text = { --requires progression, not done yet
			[0] = "The bottoms of your feet are covered in a dark shadowy substance, it cannot be removed and they feel numb.\nYou feel slightly nostalgic.",
			[1] = "Everything up to your legs are covered in a dark shadowy substance, it cannot be removed and they feel numb.\nYou feel nostalgic.",
			[2] = "Everything up to your lower torso is covered in a dark shadowy substance, it cannot be removed and it feels numb.\nYou feel very nostalgic.",
			[3] = "Everything up to your upper torso is covered in a dark shadowy substance, it cannot be removed and it feels numb.\nYou feel incredibly nostalgic.",
			[4] = "Everything up to your neck is covered in a dark shadowy substance, it cannot be removed and it feels numb.\nYou feel incredibly nostalgic.",
			[5] = "Everything but your head is covered in a dark shadowy substance, it cannot be removed and it feels numb.\nYour consciousness is fading into your own memories.",
			[6] = "Your entire body is covered in a dark shadowy substance, you slowly start to fade away. After a few moments, nothing is left of you. Nobody will even remember who you were.",
		},
		cd = 7200,
	},
}
DISEASE.cure = {
	"The darkness covering your body slowly disappears, and you begin to feel normal again.",
}
DISEASES:Register(DISEASE)
//