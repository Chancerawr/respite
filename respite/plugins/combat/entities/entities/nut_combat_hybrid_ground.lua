ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Cursed Ground"
ENT.Category = "NutScript - Combat (Hybrid)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/kyb/kokon.mdl"
ENT.material = "models/effects/comball_glow1"

ENT.AttackAnim = "Spawn"

ENT.color = Color(128, 0, 0)

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 50,
	["accuracy"] = 0,
	["end"] = 100,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Rot"] = 30,
}

ENT.hp = 1000
ENT.armor = 250

ENT.actions = {
	"cursed_ground",
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = 100,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetRenderFX(kRenderFxDistort)
	end
end