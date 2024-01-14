PLUGIN.name = "View Calculation"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Allows you to customize how far away players can see for optimization purposes."

nut.config.add("zfar", 84600, "How far the map's clipping plane is from a player's view.", nil, {
	data = {min = 1, max = 84600},
	category = "Map"
})

nut.config.add("zfarEnabled", false, "Whether it's on at all or not.", nil, {
	category = "Map"
})

local function PluginCView(ply, pos, ang, fov, znear, zfar)
	if(nut.config.get("zfarEnabled", false)) then
		local simplethird = GetConVar("simple_thirdperson_enabled")
	
		if (simplethird and !simplethird:GetBool()) and IsValid(ply) then
			return {zfar = nut.config.get("zfar", 84600)}
		end
		
		if(!simplethird) then
			return {zfar = nut.config.get("zfar", 84600)}
		end

		--the above is so it doesn't conflict with simple thirdperson.
		--return {zfar = nut.config.get("zfar", 84600)}
	end
end

hook.Add("CalcView", "ZFarPluginCalcView", PluginCView)