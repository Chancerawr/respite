ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Practice Dummy"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/nh2_gmn/dave_the_dummy_on_stand.mdl"
ENT.material = "models/props/cs_militia/roofbeams02"

ENT.noRag = true

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 0,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 0,
}

ENT.hp = 99999
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = 0,
	["Shard"] = 0,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}