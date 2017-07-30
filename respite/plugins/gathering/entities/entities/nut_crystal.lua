ENT.Type = "anim"
ENT.PrintName = "Strange Crystal"
ENT.Author = "Cyumus"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering"

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/props_wasteland/rockgranite02a.mdl")
		self:SetMaterial("models/props/cs_assault/moneywrap02") 
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:SetHealth(nut.config.get("rockLife"))

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
			nut.item.spawn("shard_dust", self:GetPos() + self:GetUp() * 5)
			self:EmitSound("physics/glass/glass_largesheet_break"..math.random(1,3)..".wav")
			self:EmitSound("physics/glass/glass_largesheet_break"..math.random(1,3)..".wav")
			self:Remove()
		end
	end
else
	function ENT:Draw()
		self:DrawModel()
	end

	ENT.DrawEntityInfo = true
	local toScreen = FindMetaTable("Vector").ToScreen
	local colorAlpha = ColorAlpha
	local drawText = nut.util.drawText
	local configGet = nut.config.get

	function ENT:onDrawEntityInfo(alpha)
		local position = toScreen(self.LocalToWorld(self, self.OBBCenter(self)))
		local x, y = position.x, position.y
		local tx, ty = drawText("Strange Crystal", x, y, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 2)
	end
end
