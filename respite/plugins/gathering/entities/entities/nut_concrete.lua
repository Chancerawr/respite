ENT.Type = "anim"
ENT.Base = "nut_gathering"
ENT.PrintName = "Debris"
ENT.Author = "" --Weird modifications by chancer
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering"

ENT.health = nut.config.get("treeLife")

ENT.models = {
	"models/props_debris/barricade_short01a.mdl",
	"models/props_debris/barricade_short02a.mdl",
	"models/props_debris/barricade_short03a.mdl",
	"models/props_debris/barricade_short04a.mdl",
	"models/props_debris/barricade_tall01a.mdl",
	"models/props_debris/barricade_tall02a.mdl",
	"models/props_debris/barricade_tall03a.mdl",
	"models/props_debris/barricade_tall04a.mdl",
	"models/props_debris/walldestroyed08a.mdl",
}

ENT.resources = {
	"j_scrap_concrete"
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
