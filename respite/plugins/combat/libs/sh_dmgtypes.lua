local PLUGIN = PLUGIN

PLUGIN.dmgTypes = {
	["Fire"] = {
		name = "Fire Damage",
		color = Color(200,0,0),
		armor = 1,
	},
	["Shock"] = {
		name = "Shock Damage",
		color = Color(200,200,255),
		armor = 1,
	},
	["Explosion"] = {
		name = "Explosion Damage",
		color = Color(200,200,255),
		armor = 1,
	},
	["Acid"] = {
		name = "Acid Damage",
		color = Color(200,200,255),
		armor = 1,
	},
	
	--regular physical things
	["Pierce"] = {
		name = "Pierce Damage",
		color = Color(180,180,180),
		armor = 1,
	},
	["Slash"] = {
		name = "Slash Damage",
		color = Color(180,180,180),
		armor = 1,
	},
	["Blunt"] = {
		name = "Blunt Damage",
		color = Color(180,180,180),
		armor = 1,
	},
	
	--used for massive things that dont fit elsewhere, such as like giants foot or something, might be removed
	["Siege"] = {
		name = "Siege Damage",
		color = Color(180,180,180),
		armor = 1,
	},
	
	--special things
	["Blight"] = {
		name = "Blight Damage",
		color = Color(0,0,0),
		armor = 1,
	},
	["Shard"] = {
		name = "Shard Damage",
		color = Color(255,255,255),
		armor = 1,
	},
	["Ichor"] = {
		name = "Ichor Damage",
		color = Color(200,200,200),
		armor = 1,
	},
	["Phase"] = {
		name = "Phase Damage",
		color = Color(200,200,200),
		armor = 0,
	},
	
	--damage to sanity
	["Mental"] = {
		name = "Mental Damage",
		color = Color(0,180,180),
		armor = 0,
	},
}

--function that determines how armor will reduce certain damage types
function PLUGIN:armorReduction(dmgT)
	return ((PLUGIN.dmgTypes[dmgT] and PLUGIN.dmgTypes[dmgT].armor) or 1)
end