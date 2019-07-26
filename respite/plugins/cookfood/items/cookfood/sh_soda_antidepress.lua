ITEM.name = "Antidepressant Soda"
ITEM.uniqueID = "food_soda_antidepress"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.material = "models/player/player_chrome1"
ITEM.hungerAmount = 3
ITEM.desc = "An aluminium can filled with something not sad."
ITEM.quantity2 = 2
ITEM.price = 4
ITEM.width = 1
ITEM.height = 1
ITEM.cookable = false
ITEM.container = "j_empty_soda_can"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attribBoosts = { 
	["fortitude"] = 6,
	["stm"] = 1,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 2.5,
}

ITEM:hook("use", function(item)
	item.player:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
	
	local cures = {
		"fort_nost"
	}
	
	for k, v in pairs(cures) do
		if(hasDisease(item.player, v)) then
			cureDisease(item.player, v)
		end
	end
end)