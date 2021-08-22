ITEM.name = "Shardlight"
ITEM.model = "models/warz/melee/flashlight.mdl"
ITEM.material = "models/props/de_inferno/offwndwb_break"
ITEM.desc = "A flashlight that is powered by an internal shard."
ITEM.class = "hl2_m_flashlight"
ITEM.uniqueID = "flashlight_shard"
ITEM.weaponCategory = "melee"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Illumination"

ITEM.salvItem = {
	["j_scrap_metals"] = 3,
	["j_scrap_adhesive"] = 1,
	["j_scrap_battery"] = 1,
	["shard_dust"] = 1
}

ITEM.iconCam = {
	pos = Vector(-200, 1.5, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}

ITEM:hook("drop", function(item)
	if (item.player:FlashlightIsOn()) then
		item.player:Flashlight(false)
	end
end)