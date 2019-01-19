--these are some diseases that are linked to traits, just delete the file if you dont want them
local PLUGIN = PLUGIN

//
local DISEASE = {}
DISEASE.uid = "trait_curse"
DISEASE.name = "Cursed"
DISEASE.desc = "This person is afflicted by some sort of terrible curse, the list of their symptoms is seemingly endless."
DISEASE.category = "Trait"
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
DISEASE.desc = "Sometimes seen among those who nearly died to wraiths, they can seem empty and hopeless."
DISEASE.category = "Trait"
DISEASE.phase = {
	"You feel empty inside, like something is missing.",
	"You feel hollow, you just want it back.",
	"Your feel light headed, and it's hard to focus.",
	"Your vision blurs, and you feel nauseous.",
	"You long for something, but cannot picture what it is.",
	"You want to feel whole again.",
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
DISEASE.desc = "Some sort of mental affliction, causes the afflicted to desire cleanliness above all."
DISEASE.category = "Trait"
DISEASE.phase = {
	"Everything around you is filty- disgusting even.",
	"The smell of the wretched world around you makes you want to gag.",
	"Everything is so dirty, you want to clean it.",
	"You can't stand the filth, it must be cleaned.",
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
DISEASE.desc = "A very severe headache that rarely relents."
DISEASE.category = "Trait"
DISEASE.phase = {
	"Your head aches and throbs, you have difficulty focusing.",
	"Your head throbs and aches, the pain is agitating.",
	"Your head hurts very badly, your eyes are very sensitive to the light.",
	"Your vision blurs, and you feel like you're going to vomit.",
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
DISEASE.desc = "A disorder that causes a person to be less competent in their movements."
DISEASE.category = "Trait"
DISEASE.phase = {
	"You have a hard time holding onto whatever you are currently holding.",
	"You suddenly feel like you're losing your balance, if you're walking you might trip.",
	"You accidentally bump into something nearby.",
	"If you're near an object, you accidentally bump your elbow on it.",
	"You find yourself gazing into space, and lose track of what you're doing.",
	"You forget about the object you are currently holding in your hands, and then wonder what happened to it. Eventually you realize that it's right there.",
	"You stumble in your step, tripping on air."
}
DISEASE.cure = {
	"Your extreme headache has been removed.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_paranoid"
DISEASE.name = "Constant Paranoia"
DISEASE.desc = "A constant paranoia, afflicted are known to become withdrawn and suspicious."
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
	"Something is right behind you."
}
DISEASE.cure = {
	"Your constant paranoia has been removed.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_zealot"
DISEASE.name = "Zealot"
DISEASE.desc = "This person's faith borders on madness, may involve auditory hallucinations."
DISEASE.category = "Trait"
DISEASE.phase = {
	"You feel god watching over you, it is comforting.",
	"Your actions are righteous, you know it to be true.",
	"You stand for the light.",
	"Evil must be purged.",
	"Demons must be exterminated.",
	"You must endure this trial.",
	"You feel god's might within you.",
	"The light is your strength.",
	"Justice shall be done.",
	"The light will guide your path.",
	"The light will give you strength."
}
DISEASE.cure = {
	"Your blind devotion to god has been purged.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_dark"
DISEASE.name = "Afraid of the Dark"
DISEASE.desc = "An abnormal fear of the darkness, and an obsession with light."
DISEASE.category = "Trait"
DISEASE.phase = {
	"The shadows in the room stretch strangely, and seemingly reach towards you.",
	"You feel something watching you from the darkness.",
	"Something scuttles around in a nearby shadow.",
	"You feel something in the darkness calling to you.",
	"Your lights flicker momentarily, allowing the darkness to get dangerously close.",
	"Every time you blink, the darkness draws closer and closer. It returns to normal a minute later.",
	"You need more light, it's too dark.",
	"A pair of eyes is watching you from the darkness.",
	"In the corner of your eye you see a person made of darkness, he watches you silently.",
}
DISEASE.cure = {
	"Your curse of darkness has been removed.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_digger"
DISEASE.name = "Gravedigger"
DISEASE.desc = "This person may be obsessed with burials, dirt, and graves."
DISEASE.category = "Trait"
DISEASE.phase = {
	"You feel safer underground.",
	"You feel exposed above ground.",
	"The soil will protect you.",
	"The soil will protect it.",
	"You want to bury it.",
	"The ground will protect everyone.",
	"You want to dig a hole.",
	"You want to dig some holes.",
	"The dead must be put to rest.",
	"The dead must be treated with respect.",
	"You alone can bury the sins of the dead.",
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
DISEASE.desc = "This person has a strange condition relating to some moon that only they can see."
DISEASE.category = "Addiction"
DISEASE.phase = {
	"The unseen moon calls out to you in a whisper-like voice. Its voice is gentle and seems to inspire confidence within you, but you cannot understand a single thing it says, as if it were in some kind of foreign language.",
	"The moon shines brightly outside, no matter what time it is, and no matter what the weather is like.\nIt shines for you.",
	"You have a strong desire to tell others of the moon they cannot see.",
	"You feel confident and mentally stable. You feel as though the moonlight protects you from outside influences.",
	"The moon outside is blue, even if you cannot see it, you know.\nYou want to protect others and spread word of the moon that they cannot see.",
	"The moon outside is red, even if you cannot see it, you know.\nYou have the urge to destroy evil.",
	"The moon outside is green, even if you cannot see it, you know.\nYou are calm and tranquil. Any pain you'd have would be abated for a short time.",
	"The moon outside is gone, even if you cannot see it, you know.\nYou feel very stressed and flustered, you might also be confused for a short while. Somehow, it feels lonely.",
	"The moon outside is orange, even if you cannot see it, you know.\nYou have an urge to improve yourself in some way, you may also feel hungry.",
	"The moon outside is white, even if you cannot see it, you know.\nYou feel that everything will be alright with the moon above your head.",
	"The moon outside is yellow, even if you cannot see it, you know.\nYou have a small desire to create something honoring the moon.",
	"The sky turns black, but the moon remains a bright and shining white. It feels as though it is shining just for you, protecting you somehow.\nThe world feels dark, but the moon feels bright.\nYou are filled with confidence, as if the moon has somehow reassured you."
}
DISEASE.cure = {
	"The moon has disappeared forever.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "addict_bh"
DISEASE.name = "Blue Haze Addiction"
DISEASE.desc = "An addiction to blue haze, typically caused by overuse of the substance."
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

