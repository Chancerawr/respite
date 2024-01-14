ITEM.name = "Plastic Leg"
ITEM.desc = "An entire leg that is made out of plastic, like something that came off of a mannequin."
ITEM.uniqueID = "j_plastic_leg"
ITEM.model = "models/dismemberment/gibs/legs.mdl"
ITEM.material = "models/props_wasteland/prison_toilet01"
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 4

if(SERVER) then
	ITEM.loot = {
		["Corpse"] = true,
		["Plastic"] = true,
	}
end

ITEM.salvItem = {
	["j_scrap_plastics"] = 5
}