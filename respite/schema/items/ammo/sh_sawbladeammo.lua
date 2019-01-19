ITEM.name = "Sawblade"
ITEM.model = "models/props_junk/sawblade001a.mdl"
ITEM.material = "models/gibs/metalgibs/metal_gibs"
ITEM.ammo = "slam" // type of the ammo
ITEM.ammoAmount = 1 // amount of the ammo
ITEM.desc = "A single, small sawblade."
ITEM.category = "Ammunition"
ITEM.flag = "v"
ITEM.price = 0
ITEM.uniqueID = "ammo_sawblade"

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 11.5,
}

if (CLIENT) then
	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		entity:SetModelScale(.25)
		entity:DrawShadow(false)	
	end
end