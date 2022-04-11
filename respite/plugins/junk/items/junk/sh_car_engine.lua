ITEM.name = "Car Engine"
ITEM.uniqueID = "j_car_engine"
ITEM.model = "models/props_c17/TrapPropeller_Engine.mdl"
ITEM.desc = "An engine block from some sort of vehicle."
ITEM.flag = "j"
ITEM.width = 5
ITEM.height = 4

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Car"] = true,
		["Garbage"] = true,
	}
end

ITEM.salvItem = {
	["j_scrap_metals"] = 8,
	["j_scrap_chems"] = 2
}