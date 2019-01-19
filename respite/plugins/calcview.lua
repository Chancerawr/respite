PLUGIN.name = "View Calculation"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Allows you to customize how far away players can see for optimization purposes."

nut.config.add("zfar", 84600, "How far the map's clipping plane is from a player's view.", nil, {
	data = {min = 1, max = 84600},
	category = "Map"
})

local function PluginCView(ply, pos, ang, fov, znear, zfar)
	if !GetConVar("simple_thirdperson_enabled"):GetBool() and IsValid(ply) then
		return {zfar = nut.config.get("zfar", 84600)}
	end
	
	--the above is so it doesn't conflict with simple thirdperson.
	--return {zfar = nut.config.get("zfar", 84600)}
end

hook.Add("CalcView", "PluginCView", PluginCView)