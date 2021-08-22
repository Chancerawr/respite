ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Fiend (Dummy)"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Dummy Blood Fiend"

ENT.model = "models/spite/fiend.mdl"
ENT.material = "models/flesh"
ENT.color = Color(128, 20, 20)

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 0,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
	
	if (CLIENT) then
		local mat = Matrix()
		mat:Scale(Vector(math.random(90,110)*0.01, math.random(90,110)*0.01, math.random(80,110)*0.01))
		self:EnableMatrix( "RenderMultiply", mat )	
	end
end