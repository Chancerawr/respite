local PLUGIN = PLUGIN
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
DISEASE.phase = {
	"Your mind is racing, and you suddenly feel like something terrible is going to happen.",
	"Your mind fills with panic, you can't help but be anxious.",
	"You feel like something is coming for you, and there's no way to stop it.",
	"You get the feeling that someone is right behind you.",
	"You feel like you're surrounded by some invisible force, it's closing in.",
	"You feel unprepared and unready, the situation around you seems insurmountable."
}
DISEASE.cure = {
	"Your panic slowly melts away.",
}

DISEASES:Register( DISEASE )
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
DISEASE.phase = {
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
}
DISEASE.cure = {
	"Your insanity dissipates.",
}

DISEASES:Register( DISEASE )
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
DISEASE.phase = {
	"You really want to hit something.",
	"You're very angry, but you don't know why.",
	"You are nearly overcome by your fury, and you just want to destroy something.",
	"You want your enemies to be destroyed, and you want to be the one to do it.",
	"Your anger overcomes your good sense, and you feel like you're physically stronger than normal.",
	"You dream of battle where you can crush your enemies.",
	"You feel a surge of energy, and you want to use it to hurt things.",
	"You feel a glimpse of fatigue, but this somehow only makes you angry, and you push yourself past it.",
	"You temporarily find it hard to understand complex concepts."
}
DISEASE.cure = {
	"You calm down, and are no longer enraged.",
}

DISEASES:Register( DISEASE )

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
DISEASE.phase = {
	"Your mind fills with images of those you used to know.",
	"You feel an intense longing for home.",
	"You hear a familiar voice calling your name.",
	"You smell something familiar.",
	"You feel like you're in a daze, like you aren't really here, but somewhere else, you think of home.",
	"You long for the past, the places you used to know.",
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
DISEASE.phase = {
	"You feel very confused, simple concepts become very difficult.",
	"You don't understand your surroundings, you feel lost.",
	"You feel out of place and lost, you don't know what to do.",
	"You can't comprehend the situation around you.",
	"Your surroundings become unfamiliar, and you have no idea where you are.",
	"Your mind goes blank, and you have no idea what you're doing, or what you want to do.",
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
DISEASE.desc = "A constant throbbing headache."
DISEASE.category = "Mental"
DISEASE.buff = {
	["perception"] = -15,
	["accuracy"] = -15,
	["medical"] = 10,
}
DISEASE.phase = {
	"The pain of your headache fades away for a moment, but comes back right after even stronger than before.",
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
DISEASE.desc = "An excruciating pain."
DISEASE.category = "Mental"
DISEASE.buff = {
	["perception"] = -30,
	["accuracy"] = -30,
	["medical"] = 10,
	["fortitude"] = 10
}
DISEASE.phase = {
	"The pain of your migraine fades away for a moment, but comes back right after even stronger than before.",
	"Loud sounds send waves of pains through your body due to your migraine, you want everything to be quiet.",
	"Everything is too bright, and too noisy, moving only makes your migraine worse, and you just want it to stop.",
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
DISEASE.desc = "Afflicted may hallucinate at random."
DISEASE.category = "Mental"
DISEASE.buff = {
	["str"] = -10
}
DISEASE.buffScale = {
	["perception"] = -0.5,
	["accuracy"] = -0.5
}
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
	"You see yourself from the third person for a few minutes, your body very slowly morphs and changes into something inhuman, you can only watch.\nOnce your body has changed into something completely unrecognizable, you see through your own eyes again, and find that your body is just as you left it.",
}
DISEASE.cure = {
	"All of the hallucinations disappear, things feel normal again.",
}

DISEASES:Register( DISEASE )

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
DISEASE.phase = {
	"Your body is heavy, and it's hard to move.",
	"Your hands won't properly move, and you find it hard to do anything intricate with them.",
	"Your left leg gives out, and refuses to move for the time being.",
	"Your right leg gives out, and refuses to move for the time being.",
	"Your right arm refuses to respond, and is unable to move for the time being.",
	"Your left arm refuses to respond, and is unable to move for the time being.",
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
DISEASE.desc = "Damaged mental state, may involve hallucinations."
DISEASE.category = "Mental"
DISEASE.buffScale = {
	["perception"] = 0.5,
	["fortitude"] = -0.5
}
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
	"Your body returns to normal, and you don't feel as paranoid anymore.",
}

DISEASES:Register( DISEASE )

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
DISEASE.phase = {
	"Your body is heavy, and you feel weak.", --endurance
	"Your mind feels sluggish and slow.", --craftiness
	"Your vision blurs, and it's hard to see things in detail.", --perception
	"Your feel somewhat out of it mentally.", --craftiness/fortitude
	"You feel slow, and sluggish.", --agility
	"You feel weak, and harmless.", --strength
	"You feel mentally unstable, as if the smallest thing may break you.", --fortitude
	"You feel unlucky.", --luck
}
DISEASE.cure = {
	"You feel normal again, the potion sickness fades away.",
}

DISEASES:Register( DISEASE )

//
local DISEASE = {}
DISEASE.uid = "dis_wrai"
DISEASE.name = "Soul Sickness"
DISEASE.desc = "Commonly seen among those attacked by wraiths, thought to be a weakening of a person's consciousness."
DISEASE.category = "Illness"
DISEASE.phase = {
	"You feel empty inside, like something is missing.",
	"You feel hollow, you want it back.",
	"Your feel lightheaded, and it's hard to focus.",
	"Your vision blurs, and you feel nauseous.",
	"They took it from you. You don't know what it was, but it's gone, and you feel great loss.",
	"You want to feel whole again.",
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
DISEASE.desc = "This person is doomed."
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
DISEASE.desc = "A contagious disease involving sight related hallucinations."
DISEASE.category = "Illness"
DISEASE.duration = 7200
DISEASE.spreadChance = 10
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
	--"A quiet, whispering voice comes from behind you.\nIt says, 'You aren't real.'\nAs you turn, you see no one there.\n'You're just like me.'",
	--"A quiet, whispering voice comes from your left side.\nIt says, 'I know what you are.'\nAs you turn, you see no one there.",
	--"A quiet, whispering voice comes from your right side.\nIt says, 'You are empty inside.'\nAs you turn, you see no one there.",
	"You hear some sort of incomprehensible whispering behind you, but there is nothing there."
	--"'You don't deserve to be called a Drifter.'"
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "dis_touch"
DISEASE.name = "Feeling"
DISEASE.desc = "A contagious disease involving touch related hallucinations."
DISEASE.category = "Illness"
DISEASE.duration = 7200
DISEASE.spreadChance = 20
DISEASE.spreadRange = 100
DISEASE.cure = {
	"You go back to normal, and no longer feel any strange sensations."
}
DISEASE.phase = {
	"You feel something touch your back for a brief moment.",
	"Your nose itches.",
	"You get a strange sensation on the front of your neck, like something just brushed past it.",
	"It feels like someone just poked you in the side.",
	"Scratches appear on your left arm, they are somewhat painful.",
	"Suddenly, you feel like your back is being clawed open, but there is no wound to be found.",
	"You feel hands wrap around your neck, and it becomes hard to breathe. This stops after a short amount of time.",
	"You hear some sort of incomprehensible whispering behind you, but there is nothing there.",
	"Your entire body begins to feel cold, you start to shiver uncontrollably. The cold leaves you after a few minutes.",
	"Your entire body begins to feel very hot, you start to sweat and find it hard to breathe. The heat leaves you after a few minutes.",
	"You start to feel very itchy all over, the urge to scratch yourself becomes hard to resist. This feeling fades away after a minute or so."
	--"A quiet, whispering voice comes from in front of you. You see some kind of dark, wispy figure directly in front of you. Its head is only inches away from yours, but you find it hard to make out any significant details.\nIt says, 'Time is running out.'\nSomething covers your eyes from behind you, and a feeling of dread fills you.\nNo matter what you try, you cannot move what is covering your eyes, leaving you essentially blind for around a minute.\nOnce your vision returns, the figure in front of you is gone, and you feel sick to your stomach."
}

DISEASES:Register( DISEASE )
//
local DISEASE = {}
DISEASE.uid = "dis_mind"
DISEASE.name = "Mind"
DISEASE.desc = "A contagious disease involving emotional swings, hallucinations, and strange visions."
DISEASE.category = "Illness"
DISEASE.duration = 7200
DISEASE.spreadChance = 15
DISEASE.spreadRange = 300
DISEASE.cure = {
	"You go back to normal, and your mind is no longer as unstable."
}
DISEASE.phase = {
	"You feel like something is inside your head, moving around and changing you somehow.",
	"Your head hurts slightly, as if you had a mild headache.",
	"Suddenly, dozens of voices begin talking at once in your head, it's hard to think clearly or focus on anything.",
	"You feel unstable, uncertain, and unbalanced. Something feels wrong, very wrong.",
	"You suddenly feel like everything is really funny around you, and you have the urge to laugh. You feel scared that you're having these thoughts, but that somehow becomes funny too.",
	"You have the urge to cry, like something sad just happened.",
	"Your emotions vanish, and you feel nothing at all for a short period of time.",
	"The world terrifies you suddenly, everything is startling, everything is horrific. You just want to go home.",
	"You feel an uncomfortable twist of despair deep within you, it hurts to even exist.",
	"Anger rises up within you, but not at anything in particular. The world itself is infuriating for a small amount of time.",
	"Your mind goes blank for awhile, everything seems tranquil and peaceful, there are no worries, no dangers. Everything is fine.",
	"Your heart fills to the brim with your own happiness. Everything is simply wonderful for awhile.",
	--"Your own voice speaks to you, but nobody else can hear it, 'There are cracks in our empty vessel. Once it breaks there's no going back.'",
	--"You hear your own voice begin to speak, though nobody else can hear it.\n'We don't deserve this- This future is cursed, our past is broken. We don't exist, we don't belong.'\nI can feel it watching us, I can feel it touching us. I want to escape.'\n'We can't forget ourselves.'",
	"You imagine a white box, the box has a simple white door.\nYou move to open the door, but it opens with just a thought.\nInside the box is nothing but a pitch black darkness. Something inside calls your name, and you walk straight into the dark."
}

DISEASES:Register( DISEASE )

//
local DISEASE = {}
DISEASE.uid = "dis_past"
DISEASE.name = "Past"
DISEASE.desc = "???"
DISEASE.category = "Illness"
DISEASE.duration = 8000
DISEASE.cure = {
	"You return to normal."
}
DISEASE.phase = {
	"For a moment, everything goes dark. Your vision returns to normal shortly after.",
	"A thought enters your mind, you want everyone to come together, and work together. Together.",
	"You don't want to be alone.",
	"You feel very lonely for a few moments.",
	"You feel singled out for a moment, as if everyone has left you behind.",
	"An abnormal hunger arises in your stomach, you've never been this hungry before.",
	"An extreme thirst comes over you, you really want to drink something.",
	"Your vision distorts, and you suddenly see from the perspective of someone else.\nBefore you can get your bearings, it switches again, and again, and again.\nThis happens dozens of times, you become so dizzy and mixed up that you barely notice that you've returned to normal.",
	"Your head suddenly fills with the voices of dozens of people. You can't understand anything any of them are saying, and it's very hard to concentrate. This dissipates after a minute or so.",
	"When you close your eyes, you see a world of blinding light. Your hands are interlinked with two people beside you. You feel complete.\nWhen you open your eyes the image, and the feeling is gone. You feel very lonely.",
	"You blink, and the world around you has changed. You are surrounded by a swirling white mass. It spins into the sky endlessly. When you blink everything is back to normal."
}

DISEASES:Register( DISEASE )
