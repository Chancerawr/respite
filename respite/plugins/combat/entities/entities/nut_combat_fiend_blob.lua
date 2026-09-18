ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Crimson Blob"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/props_phx/construct/metal_dome360.mdl"
ENT.material = "models/flesh"
ENT.color = Color(128, 20, 20)

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 25,
	["accuracy"] = 10,
	["end"] = 25,
	["luck"] = 5,
	["perception"] = 25,
	["fortitude"] = 20,
}

ENT.dmg = {
	["Pierce"] = 20,
}

ENT.hp = 1000
ENT.armor = 200

ENT.res = {
	["Pierce"] = 10,
	["Slash"] = 10,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = -25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = -25,
}

ENT.StepData = {
	0.25,
	0.75,
}

ENT.FootstepSounds = {
	"npc/footsteps/hardboot_generic1.wav",
	"npc/footsteps/hardboot_generic2.wav",
	"npc/footsteps/hardboot_generic3.wav",
	"npc/footsteps/hardboot_generic4.wav",
	"npc/footsteps/hardboot_generic5.wav",
	"npc/footsteps/hardboot_generic6.wav",
}