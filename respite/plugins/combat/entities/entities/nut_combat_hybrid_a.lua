ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "ɐ˥Ԁɥ∀ α"
ENT.Category = "NutScript - Combat (Hybrid)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/_maz_ter_/deadspace/deadspacenecros/twitcher.mdl"
ENT.material = "models/effects/comball_glow1"

ENT.AttackAnim = "Twitcher_Attack01"

ENT.color = Color(128, 0, 0)

--all attributes
ENT.attribs = {
	["stm"] = 50,
	["str"] = 50,
	["accuracy"] = 50,
	["end"] = 50,
	["luck"] = 30,
	["perception"] = 0,
	["fortitude"] = 50,
}

ENT.dmg = {
	["Unknown"] = 30,
}

ENT.hp = 1000
ENT.armor = 150

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