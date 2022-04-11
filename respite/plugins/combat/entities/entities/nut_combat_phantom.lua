ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Phantom"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/junkie_01.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 3,
	["str"] = 15,
	["accuracy"] = 5,
	["end"] = 20,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 5,
}

ENT.dmg = {
	["Blunt"] = 10,
	["Ichor"] = 10,
}

ENT.hp = 140
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"whack",
}

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetMaterial("models/effects/comball_glow1")
	end
end