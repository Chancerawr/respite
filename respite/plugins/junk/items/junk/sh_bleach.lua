ITEM.name = "Bleach"
ITEM.desc = "Cleaning solution often used for disinfecting surfaces."
ITEM.model = "models/props_junk/garbage_plasticbottle001a.mdl"
ITEM.flag = "j"

ITEM.salvItem = {
	["j_scrap_plastics"] = 2,
	["j_scrap_chems"] = 1
}

ITEM.iconCam = {
	pos = Vector(224.21286010742, 188.08586120605, 136.6078338623),
	ang = Angle(25, 220, 0),
	fov = 4.8611911663843,
}

ITEM.functions.Drink = {
	sound = "npc/barnacle/barnacle_gulp2.wav",
	onRun = function(item)
		timer.Create("nutBleach"..item:getID(), 5, 1, function()
			item.player:Kill()
		end)
	end
}