ITEM.name = "Ichor"
ITEM.model = "models/healthvial.mdl"
ITEM.material = "models/props_combine/tpballglow"
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "j"
ITEM.desc = "Some kind of strange liquid, it moves by itself."
ITEM.uniqueID = "ichor"
ITEM.color = Color(0, 128, 128)

ITEM.maxstack = 10
ITEM.data = {
	Amount = 1
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}

ITEM.functions.Add = {
	name = "Assimilate",
	tip = "Add the ichor to your ichor body parts.",
	icon = "icon16/bullet_white.png",
	sound = "items/medshot4.wav",
	onRun = function(item)
		local client = item.player
	
		client:ScreenFade(1, Color(255, 255, 255, 200), .75, 0)
		
		if(item:getData("Amount", 1) > 1) then
			item:setData("Amount", item:getData("Amount", 1) - 1)
		else
			item:remove()
		end
		
		partsAdd(client, math.random(2,5), "ichor")
		
		return false
	end,
	onCanRun = function(item)
		if(item.entity) then
			return false
		end
		
		local player = item.player or item:getOwner()
		local char = player:getChar()

		if (char:getFaction() != FACTION_SURVIVOR) then
			return false
		end
	end
}
