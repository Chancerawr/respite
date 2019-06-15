ENT.Type = "anim"
ENT.Base = "nut_gathering"
ENT.PrintName = "Strange Crystal"
ENT.Author = ""
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering"

ENT.models = {
	"models/props_wasteland/rockgranite02a.mdl"
}

ENT.resources = {
	"shard_dust"
}

if (SERVER) then
	function ENT:Initialize()
		local model = self.models[math.random(#self.models)]
		self:SetModel(model)
		self:SetMaterial("models/props/cs_assault/moneywrap02") 
		
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		
		self:SetHealth(nut.config.get("rockLife"))

		local pos = self:GetPos()

		self:SetPos(Vector(pos.X,pos.Y,pos.Z + 15))
		self:SetAngles(Angle(0,math.random(0,360),0))		
		
		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion(false)
			physicsObject:Sleep()
		end
	end

	function ENT:Use(activator)
	end
	
	function ENT:OnTakeDamage( dmginfo )
		if(dmginfo:IsDamageType(DMG_BLAST)) then --needs to be blown up to be harvested
			nut.item.spawn("shard_dust", self:GetPos() + self:GetUp() * 5)
			--nut.item.spawn("shard_dust", self:GetPos() + self:GetUp() * 5)
			self:EmitSound("physics/glass/glass_largesheet_break"..math.random(1,3)..".wav")
			self:EmitSound("physics/glass/glass_largesheet_break"..math.random(1,3)..".wav")
			self:Remove()
		end
	end
end
