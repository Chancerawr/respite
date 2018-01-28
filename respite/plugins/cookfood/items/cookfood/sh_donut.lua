ITEM.name = "Donut"
ITEM.uniqueID = "food_donut"
ITEM.model = "models/noesis/donut.mdl"
ITEM.hungerAmount = 20
ITEM.foodDesc = "A tasty pastry."
ITEM.quantity = 2
ITEM.price = 10
ITEM.width = 1
ITEM.height = 1
ITEM.cookable = false

ITEM.attribBoosts = { ["luck"] = 4 }

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 7,
}

if (CLIENT) then
	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		entity:SetModelScale(.5)
		entity:DrawShadow(false)	
	end
end