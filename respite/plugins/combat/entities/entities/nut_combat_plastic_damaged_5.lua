ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Decrepit Plastic (5)"
ENT.Category = "NutScript - Combat (Plastic)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Decrepit Plastic"

ENT.model = "models/player/group01/male_04.mdl"
ENT.material = "models/props_buildings/destroyedbuilldingwall01a"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 5,
	["accuracy"] = 5,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 5,
}

ENT.dmg = {
	["Blight"] = 2,
	["Pistol"] = 8,
}

ENT.hp = 100
ENT.armor = 30

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -25,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = 0,
}