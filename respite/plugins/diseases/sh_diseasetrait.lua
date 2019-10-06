--these are some diseases that are linked to traits, just delete the file if you dont want them
local PLUGIN = PLUGIN

//
local DISEASE = {}
DISEASE.uid = "trait_curse"
DISEASE.name = "Cursed"
DISEASE.desc = "This person is afflicted by some sort of terrible curse, the list of their symptoms is seemingly endless."
DISEASE.category = "Trait"
DISEASE.unpurgeable = true
DISEASE.phase = {
	"Your mind fills with images of those you used to know.",
	"You feel an intense longing for home.",
	"You hear a familiar voice calling your name.",
	"You smell something familiar.",
	"You hunger for your favorite food.",
	"Out of the corner of your vision you can see someone you used to know, but as you turn there's nothing there.",
	"You feel very confused, simple concepts become very difficult.",
	"You don't understand your surroundings, you feel lost.",
	"For a short amount of time you completely forget what you're doing.",
	"Operating your body becomes confusing, and it's hard to move properly.",
	"Your mind is racing, and you suddenly feel like something terrible is going to happen.",
	"Your mind fills with panic, you can't help but be anxious.",
	"You feel like something is coming for you, and there's no way to stop it.",
	"You get the feeling that someone is right behind you.",
	"You feel like you're surrounded by some invisible force, it's closing in.",
	"Your body is heavy, and you feel weak.",
	"Your mind feels sluggish and slow.",
	"Your vision blurs, and it's hard to see things in detail.",
	"Your feel somewhat out of it mentally.",
	"You feel slow, and sluggish.",
	"You feel unlucky."
}
DISEASE.cure = {
	"Your curse has been removed.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_soul"
DISEASE.name = "Soulless"
DISEASE.desc = "Something was taken from you."
DISEASE.category = "Trait"
DISEASE.unpurgeable = true
DISEASE.phase = {
	"You feel empty inside, like something is missing.",
	"You feel hollow, you just want it back.",
	"Your feel light headed, and it's hard to focus.",
	"Your vision blurs, and you feel nauseous.",
	"You long for something, but cannot picture what it is.",
	"You want to feel whole again.",
	"You are filled with a sense of mourning, as if a loved one had recently died.",
	"You are overcome with a feeling of loss.",
	"A great longing burns within you for something you cannot properly imagine.",
	"You feel like something was taken from you, but you can't picture what."
}
DISEASE.cure = {
	"You feel whole again.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_purge"
DISEASE.name = "PURGE"
DISEASE.desc = "All must be wiped clean."
DISEASE.category = "Trait"
DISEASE.unpurgeable = true
DISEASE.phase = {
	"Everything around you is filthy- disgusting even.",
	"The smell of the wretched world around you makes you want to gag.",
	"Everything is so dirty, you want to clean it.",
	"You can't stand the filth, it must be cleaned.",
	"You dream of a world free of filth, clean and perfect.",
	"You want to clean, you want to be clean.",
	"You want others to be clean.",
	"You want everything to be clean.",
	"Everything is filthy, even the air. You want to clean it, you need to clean it.",
	"You feel it absolutely necessary to wash your hands.",
	"Everything around you is infected, and infested with filth, this can't continue.",
	"The thought of touching anything in this room disturbs you."
}
DISEASE.cure = {
	"Your curse of cleanliness has been removed.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_headache"
DISEASE.name = "Extreme Headache"
DISEASE.desc = "What did you do to deserve this?"
DISEASE.category = "Trait"
DISEASE.phase = {
	"Your head aches and throbs, you have difficulty focusing.",
	"Your head throbs and aches, the pain is agitating.",
	"Your head hurts very badly, your eyes are very sensitive to the light.",
	"Your vision blurs, and you feel like you're going to vomit.",
	"The pain of your headache is so bad, you start to hallucinate. Your mind wanders to a world where the pain is gone.",
	"Your head hurts incredibly badly, it is difficult to even stand.",
	"Your head hurts so much that you just don't want to do anything, you just want it to stop."
}
DISEASE.cure = {
	"Your extreme headache has been removed.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_clumsy"
DISEASE.name = "Clumsy"
DISEASE.desc = "You are a walking accident."
DISEASE.category = "Trait"
DISEASE.unpurgeable = true
DISEASE.phase = {
	"You have a hard time holding onto whatever you are currently holding.",
	"You suddenly feel like you're losing your balance, if you're walking you might trip.",
	"You accidentally bump into something nearby.",
	"You move your body in a way that's somehow painful, and hurt yourself slightly.",
	"If you're near an object, you accidentally bump your elbow on it.",
	"You find yourself gazing into space, and lose track of what you're doing.",
	"You forget about the object you are currently holding in your hands, and then wonder what happened to it. Eventually you realize that it's right there.",
	"You stumble in your step, tripping on air.",
	"For a moment, you feel incredibly coordinated. However, the next action you take will prove the opposite, as you will no doubt fail it in some strange way.",
}
DISEASE.cure = {
	"Your ridiculous clumsiness has been cured.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_paranoid"
DISEASE.name = "Constant Paranoia"
DISEASE.desc = "Don't look behind you."
DISEASE.category = "Trait"
DISEASE.phase = {
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
}
DISEASE.cure = {
	"You no longer feel constantly paranoid.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_zealot"
DISEASE.name = "Zealot"
DISEASE.desc = "God watches over you."
DISEASE.category = "Trait"
DISEASE.unpurgeable = true
DISEASE.phase = {
	"You feel the light watching over you, it is comforting.",
	"You feel protected and safe.",
	"You feel that you are being guided by a righteous force.",
	"You feel self assured, your actions are righteous, you know it to be true.",
	"You feel the urge to purge evil, it is what the light wants you to do.",
	"Demons must be exterminated, that is what must be done.",
	"You feel the light's might within yourself.",
	"You feel fulfilled knowing that you are living your life correctly.",
	"No matter what trial awaits you, as long as you follow your teachings you will be able to prevail.",
	"You wish to tell others of your sacred knowledge, to protect them from the evils of the world.",
	"You know that the path you follow is the right one.",
	"Following the righteous path that you do fills you with a sense of honor.",
	"You desire to right the wrongs of the world.",
	"You know that justice will prevail in the end.",
	"You are filled with strength and confidence, this is surely the work of that which you worship.",
	"You are filled with genuine happiness, it truly is an honor to follow the path that you do."
}
DISEASE.cure = {
	"Your unyielding devotion has been purged.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_dark"
DISEASE.name = "Afraid of the Dark"
DISEASE.desc = "Darkness is dangerous, the light is safe."
DISEASE.category = "Trait"
DISEASE.unpurgeable = true
DISEASE.phase = {
	"The shadows in the room stretch strangely, and seemingly reach towards you.",
	"You feel something watching you from the darkness.",
	"The darkness nearby squirms and wriggles, it makes you feel very uncomfortable.",
	"Something scuttles around in a nearby shadow.",
	"You feel something in the darkness calling to you.",
	"Your lights flicker momentarily, allowing the darkness to get dangerously close.",
	"Every time you blink, the darkness draws closer and closer. It returns to normal a minute later.",
	"You need more light, it's too dark.",
	"There is something lurking in your own shadow, you need to destroy it with light.",
	"The lights around you dim, and the shadows draw closer. You feel very unsafe.",
	"A pair of eyes is watching you from the darkness.",
	"In the corner of your eye you see a person made of darkness, he watches you silently.",
	"The light around you brightens, and you feel very safe and comfortable.",
	"You imagine a room filled with light, with no darkness to be seen.",
	"The light comforts and eases you, it takes your mind off of the clinging darkness.",
	"Your own shadow seems as if it's staring back at you."
}
DISEASE.cure = {
	"Your curse of darkness has been purged.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_digger"
DISEASE.name = "Gravedigger"
DISEASE.desc = "You must give them the gift of rest."
DISEASE.category = "Trait"
DISEASE.unpurgeable = true
DISEASE.phase = {
	"Your hands feel empty without a shovel in them.",
	"You have an urge to check your shovel, and to repair it if it is damaged at all.\nIf you do not have a shovel, you have an intense desire to acquire one.",
	"The tool that allows the dead to rest is a sacred one.",
	"You feel safer underground.",
	"You feel exposed above ground.",
	"The soil will protect you.",
	"The soil will protect it.",
	"You want to bury it.",
	"The ground will protect everyone.",
	"You want to dig a hole.",
	"You want to dig some holes.",
	"The dead must be put to rest.",
	"You hear unintelligible whispers, seemingly coming from the ground beneath you.",
	"The dead must be treated with respect.",
	"You alone can bury the sins of the dead.",
	"An eternal slumber is the reward for life. You want them to rest in peace.",
	"It is your duty to provide rest to those who can no longer sleep."
}
DISEASE.cure = {
	"Your obsession with digging has been removed.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_lunatic"
DISEASE.name = "Lunatic"
DISEASE.desc = "Bark at the moon."
DISEASE.category = "Trait"
DISEASE.unpurgeable = true
DISEASE.phase = {
	"The unseen moon calls out to you in a whisper-like voice. Its voice is gentle and seems to inspire confidence within you, but you cannot understand a single thing it says, as if it were in some kind of foreign language.",
	"The moon shines brightly outside, no matter what time it is, and no matter what the weather is like.\nIt shines for you.",
	"You have a strong desire to tell others of the moon they cannot see.",
	"You have an urge to make an offering to the moon.",
	"You feel confident and mentally stable. You feel as though the moonlight protects you from outside influences.",
	"The moon outside is blue, even if you cannot see it, you know.\nYou want to protect others and spread word of the moon that they cannot see.",
	"The moon outside is red, even if you cannot see it, you know.\nYou have the urge to destroy evil.",
	"The moon outside is green, even if you cannot see it, you know.\nYou are calm and tranquil. Any pain you'd have would be abated for a short time.",
	"The moon outside is gone, even if you cannot see it, you know.\nYou feel very stressed and flustered, you might also be confused for a short while. Somehow, it feels lonely.",
	"The moon outside is orange, even if you cannot see it, you know.\nYou have an urge to improve yourself in some way, you may also feel hungry.",
	"The moon outside is white, even if you cannot see it, you know.\nYou feel that everything will be alright with the moon above your head.",
	"The moon outside is yellow, even if you cannot see it, you know.\nYou have a small desire to create something honoring the moon.",
	"The moon outside is purple, even if you cannot see it, you know.\nYou have no idea what to do.",
	"The moon outside is hollow, even if you cannot see it, you know.\nYou feel as if a great tragedy has happened, or will happen.",
	"The moon outside is a shining silver, even if you cannot see it, you know.\nIt is truly a blessed day. You have an urge to celebrate.",
	"The sky turns black, but the moon remains a bright and shining white. It feels as though it is shining just for you, protecting you somehow.\nThe world feels dark, but the moon feels bright.\nYou are filled with confidence, as if the moon has somehow reassured you."
}
DISEASE.cure = {
	"The moon has disappeared forever.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_void"
DISEASE.name = "Call of the Void"
DISEASE.desc = "It stares back."
DISEASE.category = "Trait"
DISEASE.unpurgeable = true
DISEASE.phase = {
	"Your mind goes blank, it's calming somehow.",
	"Your emotions fade away, you feel nothing at all for a short period of time.",
	"You see a vision of a grand darkness that contains no light within. You feel a sense of awe in just glimpsing it.",
	"Something calls to you, you feel as though there's somewhere else you should be.",
	"Your vision fills with dark spots that leave after a short time.",
	"Any darkness nearby you would seemingly deepen, distorting your sense of depth. You feel that if you step in, you may fall in and never reach the bottom.",
	"You close your eyes, and see a vast emptiness with no end in sight.",
	"Holes that only you can see open up in the ground, beyond them is nothing but pure darkness.",
	"A hole opens up on the ground nearby that is an exact outline of you, there is nothing but darkness beyond.",
	"Everything around you seems cluttered somehow, as if there's simply just too much there.",
	"You feel claustrophobic no matter where you are. You feel as if you need more space.",
	"You feel imprisoned, as if something if binding you, and preventing you from being free. You want to go somewhere with more space.",
	"All of your senses fade away for a few moments, and you feel nothing at all.",
	"Your senses, your emotions, and your thoughts fade out for a minute. It's as if you've become nothing at all.",
	"Your mind clears of all distractions, you can think calmly.",
	"For a moment you feel empty, like a hollowed out shell.",
	"Light becomes agitating, you feel like it's in the way somehow.",
	"You suddenly feel incredibly hungry, as if there there has never been food in your stomach.",
	"You feel winded, as if your breath vanished from your lungs."
}
DISEASE.cure = {
	"The nothingness in your heart is taken away.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_instrument"
DISEASE.name = "Instrumental"
DISEASE.desc = "Broken strings and unmoving keys produce no sounds."
DISEASE.category = "Trait"
DISEASE.unpurgeable = true
DISEASE.phase = {
	"The hear a violin being played somewhere nearby. The song being played is somber, yet somehow beautiful.",
	"You hear a piano being played somewhere nearby, it seems to be some kind of upbeat tune.",
	"You hear a trumpet being blown once in the distance, it's somewhat startling.",
	"You hear a piano being played somewhere far away. It sounds crude and loud, as if someone was just rapidly smashing the keys.",
	"You can hear eerie singing far off, and isn't in any language that you can recognize. It sounds like some kind of hymn.",
	"You hear chimes in the distance.",
	"Your hear a cacophony of brass instruments some distance away, it sounds like the instruments are heralding the approach of something important.",
	"You hear organ music coming from somewhere nearby. It sounds like wedding music.",
	"You hear organ music coming from somewhere nearby. It sounds like funeral music.",
	"You hear a drum being slowly played. It doesn't sound like music, more of just repetitious noise.",
	"You hear what sounds like someone practicing the tuba somewhere far off.",
	"You hear some kind of pop music jingle for a moment.",
	"You hear an acoustic guitar somewhere nearby. It sounds solemn, as if in mourning.",
	"It sounds like someone is intermittently beating a snare drum somewhere nearby.",
	"A single toll of a bell echoes from somewhere far away.",
	"You hear a sudden jumble of improperly tuned and out of sync instruments, it's very grating on the ears and distracting",
}
DISEASE.cure = {
	"The sounds of your mind turn to silence.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_hunger"
DISEASE.name = "Ravenous"
DISEASE.desc = "A bottomless abyss of starvation."
DISEASE.category = "Trait"
DISEASE.buff = {
	["str"] = 8,
	["end"] = 8,
	["stm"] = -5,
	["fortitude"] = -10,
	["accuracy"] = -5,
	["perception"] = -5,
}
DISEASE.buffScale = {
	["perception"] = -0.25,
	["accuracy"] = -0.5,
	["stm"] = -0.1,
}
DISEASE.phase = {
	"You are hungry.",
	"You are very hungry.",
	"You are extremely hungry.",
	"You are starving.",
	"You're so hungry that you feel like you could eat anything.",
	"You're so hungry that everything around you looks edible.",
	"You desire meat, you are very hungry.",
	"You desire fruits, you are very hungry.",
	"You desire vegetables, you are very hungry.",
	"You would eat anything, you're just so hungry.",
	"You need food, the hunger won't go away.",
	"Your body feels weak and exhausted, you're just too hungry.",
	"You would do anything for some food right now.",
	"Your stomach aches, you really want some food.",
	"You feel like you haven't eaten in days, you need food as soon as possible.",
	"You can't get your mind off of your hunger, you're just too hungry."
}
DISEASE.cure = {
	"Your hunger has finally been sated.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "addict_bh"
DISEASE.name = "Blue Haze Addiction"
DISEASE.desc = "This will be the last time."
DISEASE.category = "Addiction"
DISEASE.phase = {
	"You feel very itchy, it looks like your skin is wiggling. This stops after a minute or so.",
	"For a minute, everything in the world is shifted blue, you feel sick.",
	"Your vision blurs, and you swear you see a couple of the walls smile at you.",
	"The floor suddenly engulfs you, you are slowly being consumed. You hear it call you tasty. Shortly after everything goes back to normal.",
	"Your left hand is suddenly replaced with a hook, somehow this fills you with great joy, and you can't help but laugh to yourself. It returns to normal later, and you feel mildly disconcerted.",
	"You hear a bell toll in the distance, and feel a shiver run down your spine.",
	"You feel like you know the future suddenly, and it isn't bright. A door has been closed.",
	"The world turns incredibly gray, and disappointing. You feel like you know everything that's going to happen, like there's no surprises left. You somehow know that something blue will make you feel better."
}
DISEASE.cure = {
	"Your blue haze addiction has been removed.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "peculiar"
DISEASE.name = "???"
DISEASE.desc = "Just what is wrong with you?"
DISEASE.category = "Addiction"
DISEASE.special = function(client)
	local diseases = {
		"fort_pani", 
		"fort_nost",
		"fort_conf",
		"fort_headache",
		"fort_migraine",
		"fort_hall",
		"fort_para",
		"fort_noia",
		"fort_insa",
		"fort_enrage",
		"dis_eyes",
		"dis_mind",
		"dis_touch"
	}
	
	local disease = table.Random(diseases)
	
	giveDisease(client, disease)
end

DISEASES:Register( DISEASE )
