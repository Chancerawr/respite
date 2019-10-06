ENT.Type = "anim"
ENT.Base = "nut_gathering"
ENT.PrintName = "Purple Plant"
ENT.Author = ""
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering - Herbs"

ENT.plant = true

ENT.models = {
	"models/props/de_inferno/largebush03.mdl"
}

ENT.resources = {
	"herb_purple"
}

if (SERVER) then
	function ENT:Initialize()
		local model = self.models[math.random(#self.models)]
		self:SetModel(model)
		self:SetColor(Color(200, 200, 200))
		
		self:SetColor(Color(128,0,255))
		
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		
		self:SetHealth(nut.config.get("treeLife"))
		
		self.gathers = math.random(2,3)
		
		local pos = self:GetPos()
		
		self:SetPos(Vector(pos.X,pos.Y,pos.Z - 10))
		local physicsObject = self:GetPhysicsObject()
		
		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion(false)
			physicsObject:Sleep()
		end
	end
end
