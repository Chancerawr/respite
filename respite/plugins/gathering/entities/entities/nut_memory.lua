ENT.Type = "anim"
ENT.Base = "nut_gathering"
ENT.PrintName = "Memory Chunk"
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
	"j_scrap_adhesive",
	"j_scrap_battery",
	"j_scrap_bone",
	"j_scrap_cloth",
	"j_scrap_concrete",
	"j_scrap_elastic",
	"j_scrap_elecs",
	"j_scrap_glass",
	"j_scrap_light",
	"j_scrap_metals",
	"j_scrap_nails",
	"j_scrap_organic",
	"j_scrap_plastics",
	"j_scrap_rubber",
	"j_scrap_memory",
	"j_scrap_wood",
	"j_dark_wood",
	"cube_chip"
}

if (SERVER) then
	function ENT:Initialize()
		local model = self.models[math.random(#self.models)]
		self:SetModel(model)
		self:SetMaterial("models/props_lab/security_screens")
		
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		
		self:SetHealth(nut.config.get("treeLife"))
		
		local pos = self:GetPos()
		
		self:SetPos(Vector(pos.X,pos.Y,pos.Z + 15))
		self:SetAngles(Angle(0,math.random(0,360),0))
		self:SetColor(Color(math.random(150,255), math.random(150,255), math.random(150,255)))
		
		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion(false)
			physicsObject:Sleep()
		end
	end
else
	function ENT:Think()
		if(self.glowing) then
			self.turnOff = self.turnOff or CurTime() + 5 + math.random(10,15)
		
			if(self.turnOff < CurTime()) then
				self.glowing = false
				self.turnOff = nil
			end
		
			local pos = self:GetPos() + self:GetUp()
			local dlight = DynamicLight(self:EntIndex())
			dlight.Pos = pos
			local color = self:GetColor()
			dlight.r = color.r
			dlight.g = color.g
			dlight.b = color.b
			dlight.Brightness = 1
			dlight.Size = 128
			dlight.Decay = 256
			dlight.style = 5
			dlight.DieTime = CurTime() + .1
		elseif((self.nextGlowThink or 0) < CurTime()) then
			self.nextGlowThink = CurTime() + math.random(600,1200)
			
			self.glowing = true
		end
	end
end
