ENT.Type = "anim"
ENT.Base = "nut_gathering"
ENT.PrintName = "Berry Bush"
ENT.Author = ""
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering - Herbs"

ENT.plant = true

ENT.models = {
	"models/props/de_inferno/largebush01.mdl",
}

ENT.resources = {
	"herb_berry"
}

if (SERVER) then
	function ENT:Initialize()
		local model = self.models[math.random(#self.models)]
		self:SetModel(model)
		self:SetColor(Color(200, 200, 200))
		
		--self:SetMaterial("models/props_lab/security_screens2")
		
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		
		self:SetHealth(math.random(1,2))
		
		self.gathers = math.random(5,10)
		
		local pos = self:GetPos()
		
		self:SetPos(Vector(pos.X,pos.Y,pos.Z - 10))
		local physicsObject = self:GetPhysicsObject()

		self:SetAngles(Angle(0,math.random(0,360),0))

		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion(false)
			physicsObject:Sleep()
		end
	end
end
