ITEM.name = "Bleach"
ITEM.desc = "Cleaning solution often used for disinfecting surfaces."
ITEM.model = "models/props_junk/garbage_plasticbottle001a.mdl"
ITEM.flag = "j"

ITEM.salvItem = {
	["j_scrap_plastics"] = 2,
	["j_scrap_chems"] = 1
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Cleaning"] = true,
		["Chem"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(224.21, 188.086, 136.61),
	ang = Angle(25, 220, 0),
	fov = 4.86,
}

ITEM.functions.Drink = {
	sound = "npc/barnacle/barnacle_gulp2.wav",
	onRun = function(item)
		timer.Create("nutBleach"..item:getID(), 5, 1, function()
			item.player:Kill()
		end)
	end
}