ITEM.name = "Newspaper"
ITEM.uniqueID = "j_newspaper"
ITEM.model = "models/props_junk/garbage_newspaper001a.mdl"
ITEM.desc = "A typical-looking newspaper that talks about the events in a place you have never heard of."
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 2

ITEM.salvItem = {
	["misc_paper"] = 2
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 180),
	fov = 8,
}

--makes it so it randomizes the story. Couldn't find a good function to hook this onto so it just happens when picked up or dropped.
local function onUse(item)
	local customData = item:getData("custom", {})
	if(!customData.special) then
		local news = {
			"Local man found dead in river.",
			"Local child sentenced to death for theft.",
			"Woman found guilty of smuggling illegal substances across river.",
			"Mayor's cat gives birth to twenty-seven kittens in record breaking event.",
			"President found alive in office, country relieved.",
			"BE WORRIED.\nBe very worried.\nSomething is going to get you.",
			"Janitor finds family mop in the forest, search called off.",
			"Dogs outlawed in controversial political shift.",
			"Thousands dead after cats given the right to drive.",
			"Mysterious creature spotted within your home.\nYes. Your home.",
			"Local newspaper filled with nonsense, reports indicate.",
			"Death is coming for you. You should just accept it.",
			"Top scientists say that we're all going to die and it's your fault.",
			"#ASD !SD) M(ASDM A(SDIU_(SA (S5DU*A S&*D HELPE *)$ @M (XC **PL%T#XKO NO.",
			"Sunny skies for the next month.",
			"Parents thrilled when missing child found in his room with no injuries.",
			"The rain won't stop.",
			"Your shadow is watching you.",
			"The sky is falling.",
			"Latest reports indicate that the ocean is full of incomprehensible monsters.",
			"Police arrest local drug dealer for not selling enough drugs.",
			"Amphibious monster deemed unstoppable, navy surrendering.",
			"Cartel successfully stages a coup, declares all drugs illegal.",
			"Local bear mauled to death by enraged human.",
			"An elephant's favorite drink! The answer may surprise you (it's water).",
			"Bananas to go extinct due to fast spreading crop infection.",
			"'Az', you need to wake up.",
			
			"America's government in shambles, president found out to be a complete husk.",
			"A great darkness has come.",
			"The Void's stability has decreased due to changes in the world outside of it.",
			"Humanity has perished, only those in the Void remain.",
			"The world has ended, there is no one left.",
			"We are all alone now.",
			"Local Drifters attempting to restore stability found dead, shredded, drowned, and eviscerated.",
		}
		
		customData.desc = item.desc.. "\n\"" ..table.Random(news).. "\""
		customData.special = true
		
		item:setData("custom", customData)
	end
end

ITEM:hook("drop", onUse)
ITEM:hook("take", onUse)