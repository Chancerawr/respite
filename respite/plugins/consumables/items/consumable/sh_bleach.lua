ITEM.name = "Bleach"
ITEM.desc = "Cleaning solution often used for disinfecting surfaces."
ITEM.model = "models/props_junk/garbage_plasticbottle001a.mdl"
--ITEM.model = "models/foodnhouseholditems/clorox.mdl"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.flag = "j"
ITEM.color = Color(128,128,19)

ITEM.salvItem = {
	["j_scrap_plastics"] = 2,
	["j_scrap_chems"] = 1
}

if(SERVER) then
	ITEM.loot = {
		["Consumable"] = 10,
		["Drink"] = 1,
		["Junk"] = 5,
		["Cleaning"] = 8,
		["Chem"] = 7,
	}
end

ITEM.extraFunc = function(item, client)
	if(client) then
		client:TakeDamage(90, client, client)
	end
end

ITEM.iconCam = {
	pos = Vector(224.21, 188.086, 136.61),
	ang = Angle(25, 220, 0),
	fov = 4.86,
}