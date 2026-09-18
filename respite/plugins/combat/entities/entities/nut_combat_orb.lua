ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Orb?"
ENT.Category = "NutScript - Combat (Prop)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/Combine_Helicopter/helicopter_bomb01.mdl"
ENT.material = "models/props_combine/combine_interface_disp"

ENT.BloodColor = DONT_BLEED

ENT.PropHeight = 50

--all attributes
ENT.attribs = {
	["stm"] = 30,
	["str"] = 20,
	["accuracy"] = 20,
	["end"] = 20,
	["luck"] = 0,
	["perception"] = 20,
	["fortitude"] = 20,
}

ENT.dmg = {
	["Blunt"] = 0,
}

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