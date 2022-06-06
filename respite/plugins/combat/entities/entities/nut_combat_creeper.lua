ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Creeper"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/nh2zombies/creeper.mdl"
ENT.material = "models/alyx/emptool_glow"

ENT.AttackAnim = "Melee"

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

ENT.dmg = {
	["Slash"] = 10,
	["Electric"] = 20,
}

ENT.hp = 400
ENT.armor = 100

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = 50,
}

ENT.actions = {
	"claw_electric",
	"slash",
	"stab",
}

function ENT:Initialize()
	if (SERVER) then
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self:SetRenderFX(kRenderFxHologram)
	end
	
	self:basicSetup()
end

function ENT:CustomThink()
	if(CLIENT) then
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