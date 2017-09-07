-- Config table for the quiz plugin.
nut.config.quiz = {}
-- Questions for the quiz plugin.
nut.config.quiz.questions = {
	[1] = {
		question = "What is the goal of roleplay?",
		options = {
			[1] = "Shooting the bad guys.",
			[2] = "Climbing the ranks.",
			[3] = "Developing a character.",
			[4] = "Completing events."
		},
		correct = 3
	},
	[2] = {
		question = "Choose the right description of the character.",
		options = {
			[1] = "5'11/Slim build/Black long hair/Scar covering right hand/Rifle slinged over left shoulder.",
			[2] = "24yearsold/Deep voice/5'7/Standard armor.",
			[3] = "The best soldier there ever was."
		},
		correct = 1
	},
	[3] = {
		question = "What is powergaming?",
		options = {
			[1] = "It is using outside knowledge of the game to achieve a goal ingame.",
			[2] = "It is forcing actions against another player without them being able to react or defend themselves.",
			[3] = "It is like minging, but acting like you're in control."
		},
		correct = 2
	},
	[4] = {
		question = "What is the correct way to /me in combat.",
		options = {
			[1] = "1./me swings at the enemy with his right fist 2. /roll",
			[2] = "1./me attacks the enemy",
			[3] = "1./me goes for an uppercut at the enemy 2.*enemies turn to /me*"
		},
		correct = 3
	},
	[5] = {
		question = "What universe this server take place?",
		options = {
			[1] = "StarWars.",
			[2] = "StarTrek.",
			[3] = "BattlestarGalactica."
		},
		correct = 1
	},	
	[6] = {
		question = "What is metagaming?",
		options = {
			[1] = "Forcing actions against other players without letting them react or defend themselves.",
			[2] = "Using ooc to talk ic.",
			[3] = "Using knowledge from outside the game to achieve a certain goal from inside the game .",
			[4] = "Playing a game meta like.",
		},
		correct = 3
	},
	[7] = {
		question = "What type of server is this?",
		options = {
			[1] = "Darkrp",
			[2] = "Serious Textbased Nutscript roleplay",
			[3] = "Mingerp",
		},
		correct = 2
	},	
	[8] = {
		question = "Do you understand that you must follow higher ups orders as a clone without question?",
		options = {
			[1] = "Yes",
			[2] = "No",
			[3] = "Eh",
		},
		correct = 1
	},	
	[9] = {
		question = "Can you spell and use proper grammer correctly?",
		options = {
			[1] = "Yes I can",
			[2] = "yes, I can.",
			[3] = "Yes, I can.",
		},
		correct = 3
	}
}
-- The default text to be shown for questions which a player have not yet selected an answer for.
nut.config.quiz.defaultText = "Select an answer."
-- How wide the quiz menu is. This is a ratio for the screen's width. (0.5 = half of the screen's width)
nut.config.quiz.menuWidth = 0.5
-- How tall the quiz menu is. This is a ratio for the screen's height. (0.5 = half the screen's height)
nut.config.quiz.menuHeight = 0.6
-- The kick message a player should recieve if they have any incorrect answers.
nut.config.quiz.kickMessage = "One or more answers were incorrect! Please read the rules and roleplaying guide found on our forums here: http://seismicgaminggmod.proboards.com/board/5/rules then come back and try again!"
-- Whether or not the passedQuiz column should attempt to to added to the player table (MySQL).
-- Have this turned on the first time you use the plugin. When the comlumn has been added you can then
-- turn it off to avoid getting a MySQL error on startup and reloads
nut.config.quiz.addColumn = true