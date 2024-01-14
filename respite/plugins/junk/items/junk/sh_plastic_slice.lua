ITEM.name = "Plastic Slice"
ITEM.desc = "A miscellaneous slice of plastic."
ITEM.uniqueID = "j_plastic_slice"
ITEM.model = "models/props_debris/metal_panelshard01c.mdl"
ITEM.material = "models/props_wasteland/prison_toilet01"
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 2

if(SERVER) then
	ITEM.loot = {
		["Corpse"] = true,
		["Plastic"] = true,
	}
end

ITEM.salvItem = {
	["j_scrap_plastics"] = 3
}