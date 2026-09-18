ITEM.name = "Hamburger"
ITEM.desc = "A tasty looking hamburger."
ITEM.uniqueID = "food_hamburger"
ITEM.model = "models/food/burger.mdl"
ITEM.quantity2 = 2
ITEM.price = 10

ITEM.physMat = "zombieflesh"

ITEM.attrib = { 
	["str"] = 4, 
	["end"] = 5
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 3,
	["Meat"] = 10,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["str"] = 4, 
			["end"] = 5
		},
		
		res = {
			["Move"] = 5,
			["Slow"] = 5,
			["Stun"] = 5,
		}
	},
}


function ITEM:onEntityCreated(entity)
	if(self.modelColor) then
		entity:SetColor(self.modelColor)
	end

	local customData = self:getData("custom", {})
	local modelScale = customData.modelScale or self.modelScale
	modelScale = tonumber(modelScale)
	
	if(modelScale) then
		local scale = modelScale
		entity:SetModelScale(scale)
		entity:Activate()

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

	if(self.entMass) then
		local physObj = entity:GetPhysicsObject()
		if(IsValid(physObj)) then
			physObj:SetMass(self.entMass)
		end
	end
end

ITEM.iconCam = {
	pos = Vector(0, 200, 14.5),
	ang = Angle(0, 270, 0),
	fov = 2
}