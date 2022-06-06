local FLASHTIMER = 3; --time in seconds, for the grenade to transition from full white to clear

local Endflash, Endflash2;

function ENT:Initialize()
	local Pos = self:GetPos()

	timer.Simple(2, function()
		local dynamicflash = DynamicLight(self:EntIndex())

		if ( dynamicflash ) then
			dynamicflash.Pos = Pos
			dynamicflash.r = 255
			dynamicflash.g = 255
			dynamicflash.b = 255
			dynamicflash.Brightness = 5
			dynamicflash.Size = 1000
			dynamicflash.Decay = 1000
			dynamicflash.DieTime = CurTime() + 0.5
		end
	end)
end

function ENT:Think()
end

function ENT:Draw()
	self.Entity:DrawModel()
end

function ENT:IsTranslucent()
	return true
end
	
function FlashEffect() 
	if LocalPlayer():GetNetworkedFloat("DARKED_END") > CurTime() then
		local pl = LocalPlayer();
		local FlashedEnd = pl:GetNetworkedFloat("DARKED_END")
		local FlashedStart = pl:GetNetworkedFloat("DARKED_START")
		
		local Alpha
		if(FlashedEnd - CurTime() > FLASHTIMER) then
			Alpha = 255;
		else
			local FlashAlpha = 1 - (CurTime() - (FlashedEnd - FLASHTIMER)) / (FlashedEnd - (FlashedEnd - FLASHTIMER));
			Alpha = FlashAlpha * 150;
		end
		
		surface.SetDrawColor(0, 0, 0, math.Round(Alpha))
		surface.DrawRect(0, 0, surface.ScreenWidth(), surface.ScreenHeight())
	end 
end
hook.Add("HUDPaint", "FlashEffectDark", FlashEffect);