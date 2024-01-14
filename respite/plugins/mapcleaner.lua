local PLUGIN = PLUGIN
PLUGIN.name = "Map Cleaner"
PLUGIN.author = " "
PLUGIN.desc = "Removes Half-Life 2 entities from maps on startup."

function PLUGIN:CleanEntities()
	local deleteThese = {
			["item_ammo_pistol"] = true,
			["item_ammo_357"] = true,
			["item_ammo_smg1"] = true,
			["item_box_buckshot"] = true,
			["item_item_crate"] = true,
		}
	
	local entities = ents.GetAll()

	for k, entity in pairs(entities) do
		if(deleteThese[entity:GetClass()]) then
			SafeRemoveEntity(entity)
		end
	end
end

if(SERVER) then
	function PLUGIN:InitPostEntity()
		PLUGIN:CleanEntities()
	end
end

nut.command.add("mapcleaner", {
	adminOnly = true,
	onRun = function(client, arguments)
		PLUGIN:CleanEntities()
	end
})