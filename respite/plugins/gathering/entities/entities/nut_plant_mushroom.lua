ENT.Type = "anim"
ENT.Base = "nut_gathering"
ENT.PrintName = "Mushroom"
ENT.Author = ""
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering - Herbs"

ENT.plant = true

ENT.models = {
	"models/props/de_inferno/potted_plant3_p1.mdl"
}

ENT.resources = {
	"herb_mushroom"
}

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

if (SERVER) then
	function ENT:Initialize()
		local model = self.models[math.random(#self.models)]
		self:SetModel(model)
		self:SetColor(Color(200, 200, 200))
		
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		
		self:SetHealth(nut.config.get("treeLife"))
		
		self.gathers = math.random(1,4)
		
		local pos = self:GetPos()
		
		self:SetPos(Vector(pos.X,pos.Y,pos.Z - 20))
		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion(false)
			physicsObject:Sleep()
		end
	end
end
