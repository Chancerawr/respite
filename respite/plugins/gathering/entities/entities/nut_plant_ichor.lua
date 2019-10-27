ENT.Type = "anim"
ENT.Base = "nut_gathering"
ENT.PrintName = "Ichor Infested Plant"
ENT.Author = ""
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering - Herbs"

ENT.plant = true

ENT.models = {
	"models/props/de_inferno/potted_plant1_p1.mdl",
	"models/props/de_inferno/potted_plant2_p1.mdl",
	"models/props/de_inferno/potted_plant3_p1.mdl"
}

ENT.resources = {
	"ichor",
	"j_scrap_organic"
}

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

if (SERVER) then
	function ENT:Initialize()
		local model = self.models[math.random(#self.models)]
		self:SetModel(model)
		
		self:SetMaterial("models/props_combine/tpballglow")
		
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		
		self:SetHealth(nut.config.get("treeLife"))
		
		self.gathers = math.random(2,3)
		
		local pos = self:GetPos()
		
		self:SetPos(Vector(pos.X,pos.Y,pos.Z - 20))
		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion(false)
			physicsObject:Sleep()
		end
	end
end
