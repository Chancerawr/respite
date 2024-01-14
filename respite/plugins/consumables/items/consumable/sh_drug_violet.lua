ITEM.name = "Violet Soda"
ITEM.prefix = "Violet"
ITEM.desc = "A can that is constantly vibrating. The liquid inside is purple and always in motion. Drinking it increases the speed at which you can move dramatically for roughly an hour."
ITEM.uniqueID = "drug_violet"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.material = "models/alyx/emptool_glow"
ITEM.category = "Drug"
ITEM.duration = 3600
ITEM.price = 200
ITEM.color = Color(128, 0, 255)
ITEM.modelColor = Color(69, 0, 127)
ITEM.sound = "ambient/levels/labs/electric_explosion1.wav"

ITEM.stomach = false

ITEM.attrib = {
	["stm"] = 25,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(128, 0, 255), 10, 0)
end

ITEM.loot = {
	["Consumable"] = 10,
	["Drug"] = 0.5,
	["Special"] = 1,
}

ITEM.craft = {
	buffTbl = {
		attrib = {
			["stm"] = 12,
		},
		
		res = {
			["Stun"] = 25,
			["Root"] = 25,
			["Knockdown"] = 25,
			["Slow"] = 50,
			["Sleep"] = 100,
		}
	},
}