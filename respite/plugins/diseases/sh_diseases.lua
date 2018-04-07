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
	"Your hands are covered in blood, but when you blink they return to normal.",
	"Out of the corner of your vision you see a someone approaching, but when you turn there is no one there.",
	"You are suddenly falling from a great height, but a moment later find yourself back on your feet.",
	"For a moment, everyone around you is a terrifying monster, they seemingly return to normal a minute later.",
	"You can see moving shapes in the shadows around you.",
	"For a moment, there are insects all over your body, you can feel them crawling. They disappear shortly after.",
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
DISEASE.spreadChance = 25
DISEASE.spreadRange = 500
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