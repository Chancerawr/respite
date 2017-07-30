ENT.Spawnable			= false
ENT.AdminSpawnable		= false

include('shared.lua')

function ENT:Think()
	
	-- ######################## Dynamic light

		local dynlight = DynamicLight(0);
		dynlight.Pos = self:GetPos();
		dynlight.Size = math.random(150,385);
		dynlight.R = math.random(240,255);
		dynlight.G = math.random(210,225);
		dynlight.B = 55;
		dynlight.Brightness = 1
		dynlight.Decay = 3000
		dynlight.DieTime = CurTime() + 1
        dynlight.Style = 1
		
end