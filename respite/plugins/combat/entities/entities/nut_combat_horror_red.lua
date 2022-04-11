ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Red Horror"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/horror/zm_f4zt.mdl"
ENT.material = "models/effects/splode1_sheet"
ENT.color = Color(255, 93, 0)

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

--all attributes
ENT.attribs = {
	["stm"] = 25,
	["str"] = 5,
	["accuracy"] = 5,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Fire"] = 5,
	["Ichor"] = 5,
	["Slash"] = 10,
}

ENT.hp = 50
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}