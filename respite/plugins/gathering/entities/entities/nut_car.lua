ENT.Type = "anim"
ENT.Base = "nut_gathering"
ENT.PrintName = "Car"
ENT.Author = "" --Weird modifications by chancer
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering"

ENT.health = nut.config.get("treeLife")

ENT.harvestMsg = "Harvest with <E>"

ENT.models = {
	"models/props_vehicles/car001b_hatchback.mdl",
	"models/props_vehicles/car001a_hatchback.mdl",
	"models/props_vehicles/car002b_physics.mdl",
	"models/props_vehicles/car003a_physics.mdl",
	"models/props_vehicles/car003b_physics.mdl",
	"models/props_vehicles/car004a_physics.mdl",
	"models/props_vehicles/car004b_physics.mdl",
	"models/props_vehicles/car005a_physics.mdl",
	"models/props_vehicles/car005b_physics.mdl",
	--"models/props_vehicles/truck002a_cab.mdl",
	--"models/props_vehicles/truck001a.mdl",
	"models/props_vehicles/van001a_physics.mdl",
}

ENT.resources = {
	"j_scrap_metals"
}

if (SERVER) then
	function ENT:Initialize()
		local model = self.models[math.random(#self.models)]
		self:SetModel(model)
		
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		
		self:SetHealth(nut.config.get("treeLife"))
		
		local pos = self:GetPos()

		self:SetPos(Vector(pos.X,pos.Y,pos.Z + 15))
		self:SetAngles(Angle(0,math.random(0,360),0))
		
		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion(false)
			physicsObject:Sleep()
		end
	end
end
