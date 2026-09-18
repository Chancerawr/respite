ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Vehicular Manslaughter"
ENT.Category = "NutScript - Combat (Boss)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/donald/hl2vehicle/charger_04.mdl"
ENT.material = "models/effects/splode_sheet"

--ENT.WalkAnim = "walk_all"
--ENT.RunAnim = "run_all_01"

ENT.hp = 2500
ENT.armor = 200

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 50,
	["accuracy"] = 100,
	["end"] = 50,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Blunt"] = 45,
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = -50,
	["Blight"] = -50,
	["Shard"] = 50,
	["Distort"] = 25,
	
	["Time"] = 0,
	["Erasure"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = -100,
	["Acid"] = 0,
	["Poison"] = -25,
	["Electric"] = 0,
}

ENT.actions = {
	"vehicle_crash",
}

function ENT:Initialize()
	self:basicSetup()
	
	-- Change appearance (color, material, etc)
	self:SetColor(Color(200,0,0))
end