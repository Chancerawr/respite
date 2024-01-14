ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Destroyer"
ENT.Category = "NutScript - Combat (Boss)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Crystalline Destroyer"

ENT.model = "models/sin/quadralex.mdl"
ENT.material = "models/props/de_inferno/offwndwb_break"

ENT.modelScale = 2

ENT.AttackAnim = "Shockwave_Attack"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 50,
	["accuracy"] = 20,
	["end"] = 50,
	["luck"] = 5,
	["perception"] = 20,
	["fortitude"] = 50,
}

ENT.dmg = {
	["Blunt"] = 60,
}

ENT.hp = 5000
ENT.armor = 250

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = -50,
	["Blight"] = -100,
	["Shard"] = 100,
	["Distort"] = -50,
	
	["Fire"] = 25,
	["Explosion"] = 25,
	["Acid"] = 25,
	["Poison"] = 50,
	["Electric"] = 0,
	["Rot"] = -100,
}

ENT.actions = {
	"shard_beam",
	"shard_pierce",
	"prolong",
	"attrition",
	"charge_telekinetic",
	"launch_telekinetic",
	"light_end",
	"life_destruction",
	"life_creation",
}

function ENT:Initialize()
	--self:SetModelScale(2)

	self:basicSetup()
end

function ENT:CustomThink()
	if(CLIENT) then
		local pos = self:GetPos() + self:GetUp()*20
		local dlight = DynamicLight(self:EntIndex())
		dlight.Pos = pos
		dlight.r = 255
		dlight.g = 255
		dlight.b = 255
		dlight.Brightness = 1
		dlight.Size = 4096
		dlight.Decay = 64
		dlight.style = 0
		dlight.DieTime = CurTime() + .1
		
		local pos = self:GetPos() + self:GetUp()*200
		local dlight2 = DynamicLight(self:EntIndex())
		dlight2.Pos = pos
		dlight2.r = 255
		dlight2.g = 255
		dlight2.b = 255
		dlight2.Brightness = 1
		dlight2.Size = 4096
		dlight2.Decay = 64
		dlight2.style = 0
		dlight2.DieTime = CurTime() + .1
	end
end