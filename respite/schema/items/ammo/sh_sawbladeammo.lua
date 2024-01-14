ITEM.name = "Sawblade"
ITEM.model = "models/props_junk/sawblade001a.mdl"
ITEM.material = "models/gibs/metalgibs/metal_gibs"
ITEM.ammo = "slam" 
ITEM.ammoAmount = 1
ITEM.desc = "A single, small sawblade."
ITEM.category = "Ammunition"
ITEM.flag = "v"
ITEM.price = 0
ITEM.uniqueID = "ammo_sawblade"
ITEM.maxstack = 4

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 11.5,
}

if (CLIENT) then
	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		entity:DrawShadow(false)
	end
end

function ITEM:onEntityCreated(entity)
	local scale = 0.25
	entity:SetModelScale(scale)
	
	local physobj = entity:GetPhysicsObject()
	if (!IsValid(physobj)) then return false end

	--grabbed from a collision resizer tool
	local physmesh = physobj:GetMeshConvexes()
	if (!istable(physmesh)) or (#physmesh < 1) then return false end

	for convexkey, convex in pairs(physmesh) do
		for poskey, postab in pairs(convex) do
			convex[poskey] = postab.pos * scale
		end
	end

	local asleep = physobj:IsAsleep()

	entity:PhysicsInitMultiConvex(physmesh)
	
	if(!asleep) then
		entity:GetPhysicsObject():Wake()
	end
end