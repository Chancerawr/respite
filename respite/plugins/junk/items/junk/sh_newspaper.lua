ITEM.name = "Newspaper"
ITEM.uniqueID = "j_newspaper"
ITEM.model = "models/props_junk/garbage_newspaper001a.mdl"
ITEM.desc = "A typical-looking newspaper that talks about the events in a place you have never heard of."
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 2

ITEM.data = { scrapamount = 1 }
ITEM.salvItem = "misc_paper"

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 180),
	fov = 8,
}

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local position = item.player:getItemDropPos()
		
		nut.item.spawn(item.salvItem, position)
		nut.item.spawn(item.salvItem, position)

		return true
	end,
	onCanRun = function(item)
		if (item:getOwner() == nil) then
			return item.player:getChar():hasFlags("q") or item.player:getChar():getInv():hasItem("kit_salvager")
		else
			return item:getOwner():getChar():hasFlags("q") or item:getOwner():getChar():getInv():hasItem("kit_salvager")
		end
	end
}

--makes it so it randomizes the story. Couldn't find a good function to hook this onto so it just happens when picked up or dropped.
local function onUse(item)
	if(!item:getData("customDesc")) then
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
			"Amphibious monster deemed unstoppable, navy surrendering."
		}
		
		item:setData("customDesc", item.desc.. "\n\"" ..table.Random(news).. "\"")
	end
end

ITEM:hook("drop", onUse)
ITEM:hook("take", onUse)