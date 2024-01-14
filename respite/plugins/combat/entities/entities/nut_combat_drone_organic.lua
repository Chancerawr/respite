ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Organic Drone"
ENT.Category = "NutScript - Combat (Drone)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/shield_scanner.mdl"
--ENT.material = "models/props/cs_militia/roofbeams02"

ENT.IdleAnim = "Hover4"

--ENT.noRag = true

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 30,
	["accuracy"] = 10,
	["end"] = 25,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Pierce"] = 15,
	["Poison"] = 15,
}

ENT.hp = 250
ENT.armor = 20

--[[
--injection attack
--shocky attack
--maybe a grapple or something
--]]

ENT.res = {
	["Pierce"] = 20,
	["Slash"] = 40,
	["Blunt"] = -25,
	["Siege"] = 0,
	
	["Ichor"] = -25,
	["Blight"] = -50,
	["Shard"] = 50,
	["Distort"] = 0,
	["Time"] = -15,
	
	["Rot"] = -25,
	["Cold"] = -15,
	["Fire"] = -15,
	["Explosion"] = -25,
	["Acid"] = -25,
	["Poison"] = 25,
	["Electric"] = -25,
}