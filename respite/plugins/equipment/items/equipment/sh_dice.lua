ITEM.name = "Box of Dice"
ITEM.uniqueID = "j_dice"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/xqm/boxfull_diffuse"
ITEM.desc = "A small box that contains several different dice."

ITEM.width = 1
ITEM.height = 1
ITEM.slot = "Accessory"

ITEM.salvage = {
	["j_scrap_plastics"] = 2
}

ITEM.attrib = {
	["luck"] = 3
}

ITEM.upgradeSlots = { 
	["Dream"] = 1,
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
				
		local response = item.player:Name().. " rolled " ..roll.. " on a D4"
		nut.log.addRaw(response, 2)
		
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
		
		local response = item.player:Name().. " rolled " ..roll.. " on a D6"
		nut.log.addRaw(response, 2)
		
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
		
		local response = item.player:Name().. " rolled " ..roll.. " on a D8"
		nut.log.addRaw(response, 2)
		
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
		
		local response = item.player:Name().. " rolled " ..roll.. " on a D10"
		nut.log.addRaw(response, 2)
		
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
		
		local response = item.player:Name().. " rolled " ..roll.. " on a D20"
		nut.log.addRaw(response, 2)
		
		return false
	end
}

ITEM.functions.D100 = {
	name = "Roll D100",
	icon = "icon16/arrow_refresh.png",
	sound = "physics/concrete/rock_impact_soft3.wav",
	onRun = function(item)
		local roll = math.random(1,100)
		
		nut.chat.send(item.player, "roll", roll .. " on a D100")
		
		local response = item.player:Name().. " rolled " ..roll.. " on a D100"
		nut.log.addRaw(response, 2)
		
		return false
	end
}