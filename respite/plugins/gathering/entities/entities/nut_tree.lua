ENT.Type = "anim"
ENT.Base = "nut_gathering"
ENT.PrintName = "Tree"
ENT.Author = ""
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering"

ENT.models = {
	"models/props_foliage/tree_poplar_01.mdl",
	"models/props_foliage/tree_springers_01a-lod.mdl",
	"models/props_foliage/tree_springers_01a.mdl",
	"models/props_foliage/tree_deciduous_03b.mdl",
	"models/props_foliage/tree_deciduous_03a.mdl",
	"models/props_foliage/tree_deciduous_02a.mdl",
	"models/props_foliage/tree_deciduous_01a.mdl",
	"models/props_foliage/tree_deciduous_01a-lod.mdl",
	"models/props_foliage/tree_cliff_01a.mdl",
	"models/props_foliage/tree_dead01.mdl",
	"models/props_foliage/tree_dead02.mdl",
	"models/props_foliage/tree_dead03.mdl",
	"models/props_foliage/tree_dead04.mdl",
	"models/props_foliage/tree_dry01.mdl",
	"models/props_foliage/tree_dry02.mdl",
	"models/props_foliage/tree_pine04.mdl",
	"models/props_foliage/tree_pine05.mdl",
	"models/props_foliage/tree_pine06.mdl"
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
		
		self:SetPos(Vector(pos.X,pos.Y,pos.Z - 10))
		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion(false)
			physicsObject:Sleep()
		end
	end
end
