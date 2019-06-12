ITEM.name = "Phthoric Dust"
ITEM.uniqueID = "j_scrap_phthoric"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.desc = "A fine black powder that absorbs most light, left behind by a dead black butterfly."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 10
ITEM.material = "models/combine_advisor/mask"

ITEM.data = {
	Amount = 1
}

ITEM.iconCam = {
	pos = Vector(89.432174682617, 74.904991149902, 54.501823425293),
	ang = Angle(25, 220, 0),
	fov = 5,
}

ITEM.functions.use = { -- sorry, for name order.
	name = "Use",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		if (item.player:Alive()) then
			item.player:TakeDamage(30)
			item.player:EmitSound("physics/flesh/flesh_bloody_impact_hard1.wav", 80, 50)
			item.player:ScreenFade(1, Color(255, 0, 0, 100), .4, 0)
			item:setData("Amount", item:getData("Amount") - 1)
		end
		
		if(item:getData("Amount") == 0) then
			return true
		end
		
		return false
	end
}