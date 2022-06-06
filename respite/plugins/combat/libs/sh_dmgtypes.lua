local PLUGIN = PLUGIN

PLUGIN.dmgTypes = {
	--guns
	["Shotgun"] = {
		name = "Shell Damage",
		color = Color(180,180,180),
		armor = 0.8,
	},
	["Pistol"] = {
		name = "Pistol Damage",
		color = Color(180,180,180),
		armor = 0.5,
	},
	["Magnum"] = {
		name = "Magnum Damage",
		color = Color(180,180,180),
		armor = 0.4,
	},
	["Rifle"] = {
		name = "Rifle Damage",
		color = Color(180,180,180),
		armor = 0.3,
	},
	["Sniper"] = {
		name = "Sniper Damage",
		color = Color(180,180,180),
		armor = 0.1,
	},

	--various
	["Cold"] = {
		name = "Cold Damage",
		color = Color(0,0,200),
		armor = 0.5,
	},
	["Fire"] = {
		name = "Fire Damage",
		color = Color(200,0,0),
		armor = 0.5,
	},
	["Electric"] = {
		name = "Electrical Damage",
		color = Color(0,162,255),
		armor = 0.4,
	},
	["Explosion"] = {
		name = "Explosion Damage",
		color = Color(200,165,0),
		armor = 0.8,
	},
	["Poison"] = {
		name = "Poison Damage",
		color = Color(0,255,0),
		armor = 0.5,
	},
	["Acid"] = {
		name = "Acid Damage",
		color = Color(200,200,0),
		armor = 0.5,
	},
	
	--regular physical things
	["Pierce"] = {
		name = "Pierce Damage",
		color = Color(180,180,180),
		armor = 0.3,
	},
	["Slash"] = {
		name = "Slash Damage",
		color = Color(180,180,180),
		armor = 1,
	},
	["Blunt"] = {
		name = "Blunt Damage",
		color = Color(180,180,180),
		armor = 0.9,
	},
	
	--used for massive things that dont fit elsewhere, such as like giants foot or something, might be removed
	["Siege"] = {
		name = "Siege Damage",
		color = Color(180,180,180),
		armor = 1,
	},
	
	--special things
	["Ichor"] = {
		name = "Ichor Damage",
		color = Color(200,200,200),
		armor = 0.5,
	},
	["Blight"] = {
		name = "Blight Damage",
		color = Color(0,0,0),
		armor = 0.5,
	},
	["Shard"] = {
		name = "Shard Damage",
		color = Color(255,255,255),
		armor = 0.5,
	},
	
	["Distort"] = {
		name = "Distortion Damage",
		color = Color(128,20,128),
		armor = 0,
	},
	["Time"] = {
		name = "Time Damage",
		color = Color(0,128,128),
		armor = 0,
	},
	
	--damage to sanity
	["Mind"] = {
		name = "Mind Damage",
		color = Color(0,180,180),
		armor = 0,
	},
}

--function that determines how armor will reduce certain damage types
function PLUGIN:armorReduction(dmgT)
	return ((PLUGIN.dmgTypes[dmgT] and PLUGIN.dmgTypes[dmgT].armor) or 1)
end