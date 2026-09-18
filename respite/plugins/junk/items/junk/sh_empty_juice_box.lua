ITEM.name = "Empty Juice Box"
ITEM.uniqueID = "j_empty_juice_box"
ITEM.model = "models/foodnhouseholditems/juicesmall.mdl"
ITEM.desc = "An empty juice box."
ITEM.flag = "j"
ITEM.fillable = true

ITEM.salvItem = {
	["j_scrap_plastics"] = 1
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Container"] = true,
		["Garbage"] = true,
	}
end