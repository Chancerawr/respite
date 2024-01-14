function ENT:Initialize()
end

function ENT:Think()
end

function ENT:Draw()
	self.Entity:DrawModel()
end

function ENT:IsTranslucent()
	return true
end