ITEM.name = "Used Grenade"
ITEM.desc = "The remnants of a detonated grenade"
ITEM.uniqueID = "j_grenade_used"
ITEM.model = "models/Items/grenadeAmmo.mdl"
ITEM.material = "models/props_wasteland/tugboat01"
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Garbage"] = true,
		["Post battle"] = true,
	}
end

ITEM.salvItem = {
	["j_scrap_metals"] = 4
}