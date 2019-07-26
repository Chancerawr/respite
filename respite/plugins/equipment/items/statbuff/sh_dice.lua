ITEM.name = "Box of Dice"
ITEM.uniqueID = "j_dice"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/xqm/boxfull_diffuse"
ITEM.desc = "A small box that contains several different dice."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.buffCategory = "Accessory"

ITEM.salvItem = {
	["j_scrap_plastics"] = 2
}

ITEM.attribBoosts = {
	["luck"] = 3
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 4,
}

--6 4 8 10 20

ITEM.functions.D4 = {
	name = "Roll D4",
	icon = "icon16/arrow_refresh.png",
	sound = "physics/concrete/rock_impact_soft3.wav",
	onRun = function(item)
		local roll = math.random(1,4)
		
		nut.chat.send(item.player, "roll", roll .. " on a D4")
		
		return false
	end
}

ITEM.functions.D6 = {
	name = "Roll D6",
	icon = "icon16/arrow_refresh.png",
	sound = "physics/concrete/rock_impact_soft3.wav",
	onRun = function(item)
		local roll = math.random(1,6)
		
		nut.chat.send(item.player, "roll", roll .. " on a D6")
		
		return false
	end
}

ITEM.functions.D8 = {
	name = "Roll D8",
	icon = "icon16/arrow_refresh.png",
	sound = "physics/concrete/rock_impact_soft3.wav",
	onRun = function(item)
		local roll = math.random(1,8)
		
		nut.chat.send(item.player, "roll", roll .. " on a D8")
		
		return false
	end
}

ITEM.functions.D10 = {
	name = "Roll D10",
	icon = "icon16/arrow_refresh.png",
	sound = "physics/concrete/rock_impact_soft3.wav",
	onRun = function(item)
		local roll = math.random(1,10)
		
		nut.chat.send(item.player, "roll", roll .. " on a D10")
		
		return false
	end
}

ITEM.functions.D20 = {
	name = "Roll D20",
	icon = "icon16/arrow_refresh.png",
	sound = "physics/concrete/rock_impact_soft3.wav",
	onRun = function(item)
		local roll = math.random(1,20)
		
		nut.chat.send(item.player, "roll", roll .. " on a D20")
		
		return false
	end
}

ITEM.functions.D100 = {
	name = "Roll D100 (2 D10's)",
	icon = "icon16/arrow_refresh.png",
	sound = "physics/concrete/rock_impact_soft3.wav",
	onRun = function(item)
		local roll = math.random(1,100)
		
		nut.chat.send(item.player, "roll", roll .. " on a D100")
		
		return false
	end
}