ENT.Type = "anim"
ENT.Base = "nut_gathering"
ENT.PrintName = "Memory Leaf"
ENT.Author = ""
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering - Herbs"

ENT.plant = true

ENT.models = {
	"models/props/cs_office/plant01_p1.mdl",
}

ENT.resources = {
	"j_scrap_memory",
}

if (SERVER) then
	function ENT:Initialize()
		local model = self.models[math.random(#self.models)]
		self:SetModel(model)
		
		self:SetMaterial("models/props_lab/security_screens2")
		
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		
		self:SetHealth(nut.config.get("treeLife"))
		
		self.gathers = math.random(2,5)
		
		local pos = self:GetPos()
		
		self:SetPos(Vector(pos.X,pos.Y,pos.Z - 25))
		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion(false)
			physicsObject:Sleep()
		end
	end
end
