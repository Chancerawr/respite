ITEM.name = "Plastic Pelvis"
ITEM.desc = "A pelvis that is made out of plastic, like something that came off of a mannequin."
ITEM.uniqueID = "j_plastic_pelvis"
ITEM.model = "models/props_debris/metal_panelshard01c.mdl"
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