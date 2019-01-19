ITEM.name = "Ruined Core"
ITEM.uniqueID = "plastic_core"
ITEM.model = "models/props_phx2/garbage_metalcan001a.mdl"
ITEM.material = "models/props_vents/borealis_vent001c"
ITEM.desc = "A strange object made out of some kind of metal."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.salvItem = "cube_chip"

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 4.5,
}

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local position = item.player:getItemDropPos()
		
		if(math.random(0,1) == 1) then
			nut.item.spawn(item.salvItem, position)
			nut.item.spawn(item.salvItem, position)
		else
			nut.item.spawn(item.salvItem, position)
		end

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