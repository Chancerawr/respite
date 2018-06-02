ITEM.name = "Tome of Knowledge"
ITEM.uniqueID = "experience"
ITEM.model = "models/props_lab/binderredlabel.mdl"
ITEM.desc = "This is an OOC book used to give you a stat upgrade after combat. It will increase the stat by 1."
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.price = 999999
ITEM.category = "OOC"
ITEM.data = { customCol = Color(255, 253, 0) }
ITEM.color = Color(255, 253, 0)

ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 4.5,
}

--luck
--fortitude
--agility
--endurance
--accuracy
--medical
--strength
--perception

ITEM.functions.Agility = {
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
			local client = item.player
			local char = client:getChar()
			char:updateAttrib("stm", 1)
	end
}

ITEM.functions.Accuracy = {
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
			local client = item.player
			local char = client:getChar()
			char:updateAttrib("accuracy", 1)
	end
}

ITEM.functions.Endurance = {
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
			local client = item.player
			local char = client:getChar()
			char:updateAttrib("end", 1)
	end
}

ITEM.functions.Fortitude = {
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
			local client = item.player
			local char = client:getChar()
			char:updateAttrib("fortitude", 1)
	end
}

ITEM.functions.Luck = {
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
			local client = item.player
			local char = client:getChar()
			char:updateAttrib("luck", 1)
	end
}

ITEM.functions.Craftiness = {
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
			local client = item.player
			local char = client:getChar()
			char:updateAttrib("medical", 1)
	end
}

ITEM.functions.Perception = {
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
			local client = item.player
			local char = client:getChar()
			char:updateAttrib("perception", 1)
	end
}

ITEM.functions.Strength = {
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
			local client = item.player
			local char = client:getChar()
			char:updateAttrib("str", 1)
	end
}
