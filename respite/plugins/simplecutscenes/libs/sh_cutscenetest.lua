local PLUGIN = PLUGIN

-- this needs to be here because nutscript likes to load things depth first sometimes
PLUGIN.cutscenes = PLUGIN.cutscenes or {}

--this is a crude test cutscene
local cutscene = {
	{ -- This is the start of the "scene", basically one image slide
		image = "https://i.imgur.com/OkgvIx2.png", -- The image to be displayed (1920 x 810)
		sound = "music/HL2_song26.mp3",
		subtitles = { --List of subtitles that show up during the scene
			{
				text = "Hey look it's a cutscene kind of.", -- Subtitle text
				font = "nutTitleFont", -- The font is uses
				--sound = "soundpath", -- The sound it plays when this text starts
				duration = 1,  -- How long it stays on the screen before the next thing happens
			},
			{
				text = "here are a few more words",
				font = "nutTitleFont",
				duration = 1, 
			},
			{
				text = "This is an extra long sentence to test if it properly wraps the lines wow",
				color = Color(255,0,0),
				font = "nutTitleFont",
				duration = 6, 
			},
			{
				text = "words",
				font = "nutTitleFont",
				duration = 1, 
			},
			{
				text = "wordswords",
				font = "nutTitleFont",
				duration = 1, 
			},
		}
	},
	{
		image = "https://i.imgur.com/AdaqV5m.png",
		--sound = ""
		songFade = true, --needs to be on the last scene for it to do anything, will fade out the currently playing song
		subtitles = {
			{
				text = "He is rock",
				font = "nutTitleFont",
				--sound = "soundpath", -- optional
				duration = 1, 
			},
			{
				text = "He's a rock",
				font = "nutTitleFont",
				--sound = "soundpath", -- optional
				duration = 1, 
			},
			{
				text = "He's a boulder",
				font = "nutTitleFont",
				--sound = "soundpath", -- optional
				duration = 1, 
			},
			{
				text = "nice",
				font = "nutTitleFont",
				--sound = "soundpath", -- optional
				duration = 1, 
			},
		}
	},
}

--"cutscenetest" is the name of this cutscene for the command
PLUGIN.cutscenes["cutscenetest"] = cutscene