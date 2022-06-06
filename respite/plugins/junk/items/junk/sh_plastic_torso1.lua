ITEM.name = "Plastic Torso Chunk"
ITEM.desc = "A plastic torso chunk, like something that came off of a mannequin."
ITEM.uniqueID = "j_plastic_torso1"
ITEM.model = "models/dismemberment/gibs/torso/torso_left_lower.mdl"
ITEM.material = "phoenix_storms/mrref2"
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