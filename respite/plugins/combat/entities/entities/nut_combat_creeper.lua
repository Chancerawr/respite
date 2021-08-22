ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Creeper"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/nh2zombies/creeper.mdl"
ENT.material = "models/alyx/emptool_glow"
ENT.color = Color(128,0,0)

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 30,
	["accuracy"] = 10,
	["end"] = 20,
	["luck"] = 10,
	["perception"] = 30,
	["fortitude"] = 60,
}

function ENT:Initialize()
	if (SERVER) then
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self:SetRenderFX(kRenderFxHologram)
	end
	
	self:basicSetup()
end

function ENT:Think()
	if(SERVER) then
		if(!self:IsPlayerHolding()) then
			local physObj = self:GetPhysicsObject()
			
			if(!physObj:IsAsleep()) then
				physObj:Sleep()
			end
		end
	else
		local pos = self:GetPos() + self:GetUp()
		local dlight = DynamicLight(self:EntIndex())
		dlight.Pos = pos
		dlight.r = 128
		dlight.g = 0
		dlight.b = 0
		dlight.Brightness = 1
		dlight.Size = 32
		dlight.Decay = 64
		dlight.style = 5
		dlight.DieTime = CurTime() + .1
	end
end