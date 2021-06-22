ITEM.name = "Mysterious Banana"
ITEM.desc = "A strange talking banana."
ITEM.uniqueID = "banana_mysterious"
ITEM.model = "models/props/cs_italy/bananna.mdl"
ITEM.flag = "v"
ITEM.width = 1
ITEM.height = 1
ITEM.color = Color(128, 128, 0)

ITEM.cd = 2

local function constructStory()
	local nounsStart = {
		"You",
		"I",
		"He",
		"She",
		"It",
		"They",
		
		"Monkey",
		"Banana",
	}
	
	local nounsObj = {
		"you",
		"me",
		"him",
		"her",
		"it",
		
		"eggplant",
		"happiness",
		"sadness",
		"hatred",
		"life",
		"death",
		"genocide",
		"banana",
		"gourd",
		"wife",
		"husband",
		"yam",
		"crab",
		"rat",
		"monkey",
		"ape",
		"darkness",
		"dog",
		"cat",
		"cat girls",
		"girls",
		"boys",
		"everyone",
		"agony",
		"humans",
		"suicide",
		"demons",
		"angels",
		"music",
		"pain",
		"baby",
		"drugs",
		"tyranny",
		"capitalism",
		"communism",
		"society",
		"racism",
		"freedom",
		
		"God",
		"Satan",
		
		"DONG",
		"BING BONG",
		
		"Japan",
		"Europe",
		"North America",
		"Jerusalem",
		
		"the light",
		"the dark",
		"the world",
		"the Japanese Federation",
		"the A.S.F.",
		"the homeless",
		"the obese",
		"the weak",
		"the strong",
		
		"your loved ones",

		"7192",
		"The Void",
		
		"*AHHHHHHHHHHHHHHHHHHH*",
	}
	
	local verb = {
		"hug",
		"kiss",
		"kill",
		"hunt",
		"murder",
		"desire",
		"want",
		"take",
		"generate",
		"buy",
		"slice",
		"cut",
		"heal",
		"beat",
		"restore",
		"like",
		"devour",
		"commit",
		"curse",
		"steal",
		"crush",
		"destroy",
		"create",
		"jiggle",
		"belittle",
		"love",
		"hate",
		"eliminate",
		"abuse",
		"evade",
		"fear",
		"sacrifice",
		"forget",
		"strangle",
		"consume",
		"eat",
		"bonk",
		"stab",
		"sniff",
		"punch",
		"forgive",
		"poke",
		"see",
		"hear",
		"produce",
		
		"listen to",
		"refer to",
		"dance with",
		"side with",
		"smile at",
		"scream at",
		"laugh at",
		"sing to",
		"fantasize about",
		
		"*AHHHHHHHHHHHHHHHHHHH*",
	}
	
	local adverb = {
		"hungrily",
		"nicely",
		"quickly",
		"slowly",
		"sadly",
		"happily",
		"rapidly",
		"silently",
		"crudely",
		"facetiously",
		"ironiically",
		"sarcastically",
		"psychotically",
		"desperately",
		"loudly",
		"rudely",
		"diligently",
		"warmly",
		"sweetly",
		
		"rarely",
		"sometimes",
		"never",
		"always",
		
		--these are modal verbs fuck off
		"will",
		"will not",
		"shall",
		"cannot",
		"shall not",
		"have to",
		"must",
		"may",
		
		"*AHHHHHHHHHHHHHHHHHHH*",
	}

	local adverbCheck
	if(math.random(1,4) == 4) then
		adverbCheck = true
	end

	local nounStart = table.Random(nounsStart)
	local adverb = adverbCheck and table.Random(adverb)
	local verb = table.Random(verb)
	local nounObj = table.Random(nounsObj)

	local story = {
		nounStart,
		adverb,
		verb,
		nounObj,
	}
	
	return story
end

--find this in a weird drone entity
function ITEM:Speak()
	local words = constructStory()
	
	local client = self.player

	self.PhrasesSaid = (self.PhrasesSaid or 0) + 1
	local ThisPhrase = self.PhrasesSaid
	self.MostRecentSpeech = table.Copy(words)

	--client:EmitSound("npc/turret_floor/click1.wav",70,100)
	--client:EmitSound("npc/turret_floor/click1.wav",40,100)
	
	local Delay = 0.25
	for key,word in pairs(words)do
		if(type(word)=="string")then
			local ProperWord = "HL1/fvox/blip.wav" --the sound that emits
			local Len = SoundDuration(ProperWord)
			
			timer.Simple(Delay,function()
				if((IsValid(client))and(self.PhrasesSaid == ThisPhrase))then
					client:EmitSound(ProperWord,70,100)
					client:EmitSound(ProperWord,40,100)
				end
			end)
			
			Delay = Delay + Len + .5
		end
	end
	
	local wordsString = ""
	for k, v in pairs(words) do
		wordsString = wordsString.. " " ..v
	end
	
	nut.chat.send(client, "itclose", "The Mysterious Banana whispers, \"" ..wordsString.. ".\"" )
end

ITEM.functions.use = {
	name = "Use",
	tip = "useTip",
	icon = "icon16/bell.png",
	onRun = function(item)
		item:Speak()

		item:setData("producing", CurTime())
		timer.Simple(item.cd or 5, function()
			item:setData("producing", nil)
		end)
	
		return false --makes it so item is not consumed, allows for multiple silly uses.
	end,
	onCanRun = function(item)
		local prodTime = item.cd or 5
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 3),
	ang = Angle(0, -0, 0),
	fov = 6.5,
}