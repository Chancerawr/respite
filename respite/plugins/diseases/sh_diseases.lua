local PLUGIN = PLUGIN
//
local DISEASE = {}
DISEASE.uid = "fort_pani"
DISEASE.name = "Panic"
DISEASE.category = "Mental"
DISEASE.phase = {
	"Your mind is racing, and you suddenly feel like something terrible is going to happen.",
	"Your mind fills with panic, you can't help but be anxious.",
	"You feel like something is coming for you, and there's no way to stop it.",
	"You get the feeling that someone is right behind you.",
	"You feel like you're surrounded by some invisible force, it's closing in.",
}
DISEASE.cure = {
	"Your panic slowly melts away.",
}

DISEASES:Register( DISEASE )

//
local DISEASE = {}
DISEASE.uid = "fort_nost"
DISEASE.name = "Nostalgia"
DISEASE.category = "Mental"
DISEASE.phase = {
	"Your mind fills with images of those you used to know.",
	"You feel an intense longing for home.",
	"You hear a familiar voice calling your name.",
	"You smell something familiar.",
	"You hunger for your favorite food.",
	"Out of the corner of your vision you can see someone you used to know, but as you turn there's nothing there.",
}
DISEASE.cure = {
	"Your nostalgia is slowly subsiding.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_dark"
DISEASE.name = "Afraid of the Dark"
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
DISEASE.uid = "fort_conf"
DISEASE.name = "Confusion"
DISEASE.category = "Mental"
DISEASE.phase = {
	"You feel very confused, simple concepts become very difficult.",
	"You don't understand your surroundings, you feel lost.",
	"For a short amount of time you completely forget what you're doing.",
	"Operating your body becomes confusing, and it's hard to move properly.",
}
DISEASE.cure = {
	"You are no longer confused, and things begin to make sense again.",
}

DISEASES:Register( DISEASE )

//
local DISEASE = {}
DISEASE.uid = "fort_headache"
DISEASE.name = "Headache"
DISEASE.category = "Mental"
DISEASE.phase = {
	"Your head aches and throbs, you have difficulty focusing.",
	"Your head throbs and aches, the pain is agitating.",
}
DISEASE.cure = {
	"Your headache is cured.",
}

DISEASES:Register( DISEASE )

//
local DISEASE = {}
DISEASE.uid = "fort_migraine"
DISEASE.name = "Migraine"
DISEASE.category = "Mental"
DISEASE.phase = {
	"Your head hurts very badly, your eyes are very sensitive to the light.",
	"Your vision blurs, and you feel like you're going to vomit.",
}
DISEASE.cure = {
	"Your migraine is slowly fades away.",
}

DISEASES:Register( DISEASE )

//
local DISEASE = {}
DISEASE.uid = "fort_hall"
DISEASE.name = "Hallucination"
DISEASE.category = "Mental"
DISEASE.phase = {
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
}
DISEASE.cure = {
	"All of the hallucinations disappear, things feel normal again.",
}

DISEASES:Register( DISEASE )

//
local DISEASE = {}
DISEASE.uid = "fort_para"
DISEASE.name = "Paralysis"
DISEASE.category = "Mental"
DISEASE.phase = {
	"Your body is heavy, and it's hard to move.",
	"Your left leg gives out, and refuses to move for the time being.",
	"Your right arm refuses to respond, and is unable to move for the time being.",
	"Your back is sluggish, and you find it hard to stand up.",
	"Your muscles are fatigued, you feel like you don't have any energy.",
}
DISEASE.cure = {
	"Your body returns to normal, and you feel like you can move freely again.",
}

DISEASES:Register( DISEASE )

//
local DISEASE = {}
DISEASE.uid = "fort_noia"
DISEASE.name = "Paranoia"
DISEASE.category = "Mental"
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
	"Your body returns to normal, and you feel like you can move freely again.",
}

DISEASES:Register( DISEASE )

//
local DISEASE = {}
DISEASE.uid = "dis_poti"
DISEASE.name = "Potion Sickness"
DISEASE.category = "Illness"
DISEASE.phase = {
	"Your body is heavy, and you feel weak.",
	"Your mind feels sluggish and slow.",
	"Your vision blurs, and it's hard to see things in detail.",
	"Your feel somewhat out of it mentally.",
	"You feel slow, and sluggish.",
	"You feel unlucky.",
}
DISEASE.cure = {
	"You feel normal again, the potion sickness fades away.",
}

DISEASES:Register( DISEASE )

//
local DISEASE = {}
DISEASE.uid = "dis_wrai"
DISEASE.name = "Soul Sickness"
DISEASE.category = "Illness"
DISEASE.phase = {
	"You feel empty inside, like something is missing.",
	"You feel hollow, you just want it back.",
	"Your feel lightheaded, and it's hard to focus.",
	"Your vision blurs, and you feel nauseous.",
	"You long for something, but cannot picture what it is.",
	"You feel like something was taken from you, but you can't picture what.",
}
DISEASE.cure = {
	"You feel whole again.",
}

DISEASES:Register( DISEASE )

//
local DISEASE = {}
DISEASE.uid = "dis_shad"
DISEASE.name = "Shadow Plague"
DISEASE.category = "Illness"
DISEASE.phaseTime = 1800
--DISEASE.spreadChance = 25
--DISEASE.spreadRange = 500
DISEASE.cure = {
	"The darkness covering your body slowly disappears, and you begin to feel normal again.",
}
DISEASE.phases = {
	[0] = "The bottoms of your feet are covered in a dark shadowy substance, it cannot be removed and they feel numb.\nYou feel slightly nostalgic.",
	[1] = "Everything up to your legs are covered in a dark shadowy substance, it cannot be removed and they feel numb.\nYou feel nostalgic.",
	[2] = "Everything up to your lower torso is covered in a dark shadowy substance, it cannot be removed and it feels numb.\nYou feel very nostalgic.",
	[3] = "Everything up to your upper torso is covered in a dark shadowy substance, it cannot be removed and it feels numb.\nYou feel incredibly nostalgic.",
	[4] = "Everything up to your neck is covered in a dark shadowy substance, it cannot be removed and it feels numb.\nYou feel incredibly nostalgic.",
	[5] = "Everything but your head is covered in a dark shadowy substance, it cannot be removed and it feels numb.\nYour consciousness is fading into your own memories.",
	[6] = "Your entire body is covered in a dark shadowy substance, you slowly start to fade away. After a few moments, nothing is left of you. Nobody will even remember who you were.",
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "dis_eyes"
DISEASE.name = "Watcher"
DISEASE.category = "Illness"
DISEASE.duration = 7200
DISEASE.spreadChance = 30
DISEASE.spreadRange = 500
DISEASE.cure = {
	"You go back to normal, and no longer feel like something is watching you."
}
DISEASE.phase = {
	"You see someone in the distance, they appear to be watching you from afar.",
	"You see someone watching you from above for a moment, but there's nothing there.",
	"You feel eyes peering at you from behind.",
	"Someone is watching you.",
	"Something is watching you.",
	"They are watching you.",
	"'We are watching you.'",
	"He is watching you.",
	"She is watching you.",
	"It is watching you.",
	"It watches you from the darkness.",
	"You think you see something in the corner of you vision, but as you turn there is nothing there.",
	"You suddenly feel very paranoid, like there's something right behind you.",
	"You spot someone from the corner of your eye, watching you.",
	"Your eyes hurt slightly, as if they've dried out somehow.",
	"Every time you blink, you feel as though something bad is going to happen.",
	"You blink, and right before your eyes close, you see someone staring at you.",
	"Your eyes suddenly get dry, and you have the urge to blink, but you feel as though something bad will happen if you do.",
	"As your eyes blink closed, you feel as though something is right in front of you, you can feel it there, staring at you.",
	"A quiet, whispering voice comes from behind you.\nIt says, 'You aren't real.'\nAs you turn, you see no one there.\n'You're just like me.'",
	"A quiet, whispering voice comes from your left side.\nIt says, 'I know what you are.'\nAs you turn, you see no one there.",
	"A quiet, whispering voice comes from your right side.\nIt says, 'You are empty inside.'\nAs you turn, you see no one there.",
	"You hear some sort of incomprehensible whispering behind you, but there is nothing there."
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "trait_curse"
DISEASE.name = "Cursed"
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
DISEASE.category = "Trait"
DISEASE.phase = {
	"You feel empty inside, like something is missing.",
	"You feel hollow, you just want it back.",
	"Your feel light headed, and it's hard to focus.",
	"Your vision blurs, and you feel nauseous.",
	"You long for something, but cannot picture what it is.",
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
DISEASE.category = "Trait"
DISEASE.phase = {
	"Everything around you is filty- disgusting even.",
	"The smell of the wretched world around you makes you want to gag.",
	"Everything is so dirty, you want to clean it.",
	"You can't stand the filth, it must be cleaned.",
	"You feel it absolutely necessary to wash your hands.",
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
DISEASE.uid = "addict_bh"
DISEASE.name = "Blue Haze Addiction"
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
