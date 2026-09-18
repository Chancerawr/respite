ITEM.name = "Deck of Cards"
ITEM.uniqueID = "j_cards"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/props_combine/metal_combinebridge001"
ITEM.desc = "A standard 52 card deck."

ITEM.width = 1
ITEM.height = 1
ITEM.slot = "Accessory"

ITEM.salvage = {
	["j_scrap_cloth"] = 2
}

ITEM.attrib = {
	["luck"] = 2,
	["medical"] = 1,
}

ITEM.upgradeSlots = { 
	["Dream"] = 1,
}

ITEM.functions.Draw = {
	name = "Draw Card",
	icon = "icon16/arrow_refresh.png",
	sound = "physics/cardboard/cardboard_box_impact_soft7.wav",
	onRun = function(item)
		local client = item.player
	
		local cards = {"1","2","3","4","5","6","7","8","9","10","Ace","Queen","King","Jack"}
		local family = {"Spades", "Hearts", "Diamonds", "Clubs"}
		
		local msg = "draws the " ..table.Random(cards).. " of " ..table.Random(family)
		
		nut.chat.send(client, "rolld", msg)
		nut.log.addRaw(client:Name().. " " ..msg, 2)
		
		return false
	end
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 4.5,
}