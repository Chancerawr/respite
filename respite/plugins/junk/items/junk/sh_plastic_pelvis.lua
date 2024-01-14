ITEM.name = "Plastic Pelvis"
ITEM.desc = "A pelvis that is made out of plastic, like something that came off of a mannequin."
ITEM.uniqueID = "j_plastic_pelvis"
ITEM.model = "models/dismemberment/gibs/torso/torso_pelvis.mdl"
ITEM.material = "models/props_wasteland/prison_toilet01"
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 2

if(SERVER) then
	ITEM.loot = {
		["Corpse"] = true,
		["Plastic"] = true,
	}
end

ITEM.salvItem = {
	["j_scrap_plastics"] = 5
}