ENT.Type = "anim"
ENT.Base = "nut_gathering"
ENT.PrintName = "Ore"
ENT.Author = "" --Weird modifications by chancer
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering"

ENT.models = {
	"models/props_wasteland/rockcliff01b.mdl",
	"models/props_wasteland/rockcliff01c.mdl",
	"models/props_wasteland/rockcliff01f.mdl",
	"models/props_wasteland/rockcliff01j.mdl",
	"models/props_wasteland/rockcliff01k.mdl",
}

ENT.resources = {
	"j_scrap_iron",
	"j_scrap_copper",
	"j_scrap_silver",
}

if (SERVER) then
	function ENT:Initialize()
		local model = self.models[math.random(#self.models)]
		self:SetModel(model)
		
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		
		self:SetHealth(math.random(3,6))
		
		if(!self.nodeSpawned) then
			self:SetPos(self:GetPos() - self:GetUp()*11)
		end
		
		self:SetAngles(Angle(0,math.random(0,360),0))

		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion(false)
			physicsObject:Sleep()
		end
	end
end
