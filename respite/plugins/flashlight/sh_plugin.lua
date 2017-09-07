PLUGIN.name = "Flashlight"
PLUGIN.author = "Chessnut"
PLUGIN.desc = "Provides a flashlight item to regular flashlight usage."

--[[
function PLUGIN:PlayerSwitchFlashlight(ply, on)
	if not IsValid(ply) then return false end
			
	local character = ply:getChar()

	if (!character or !character:getInv()) then
		return false
	end

	if (!character:getInv():hasItem("flashlight")) then
		return false
	end
			
	-- on = Player toggled the flashlight
	if (!on) then
	 	ply:SetNWBool("customFlashlight", false)
		return
	else
		ply:EmitSound("items/flashlight1.wav")
		ply:SetNWBool("customFlashlight", !ply:FlashlightIsOn())
	end
end
--]]