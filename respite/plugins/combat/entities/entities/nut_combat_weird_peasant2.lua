ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Peasant..?"
ENT.Category = "NutScript - Combat (∀˥ᴉ‾∩ǝ‾˥ɹ)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.hp = 500

ENT.noRag = true

ENT.dmg = {
	["Blunt"] = 15,
}

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
	
	["Erasure"] = -100,
}

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 30,
	["accuracy"] = 15,
	["end"] = 30,
	["luck"] = 5,
	["perception"] = 10,
	["fortitude"] = 0,
}

ENT.actions = {
	"fire_bolt",
	"fire_ball",
	"fire_incinerate",
	"fire_inferno",
	"water_heal",
	"frost_bolt",
	"frost_freeze",
	"lightning_bolt",
	"lightning_chain",
	"poison_bolt",
	"dark_bolt",
	"dark_raise",
	"dark_void",
	"wind_blade",
	"earth_fist",
	"earth_impale",
	"light_blind",
	"light_heal",
	"light_seraphim",
	"twist_basic",
}

ENT.model = "models/humans/groupm6/male_02.mdl"
ENT.models = {
	"models/humans/groupm1/male_02.mdl",
	"models/humans/groupm1/male_04.mdl",
	"models/humans/groupm1/male_06.mdl",
	"models/humans/groupm1/male_07.mdl",
	"models/humans/groupm1/male_08.mdl",
	"models/humans/groupm1/male_09.mdl",
	
	"models/humans/groupm2/male_02.mdl",
	"models/humans/groupm2/male_04.mdl",
	"models/humans/groupm2/male_06.mdl",
	"models/humans/groupm2/male_07.mdl",
	"models/humans/groupm2/male_08.mdl",
	"models/humans/groupm2/male_09.mdl",
	
	"models/humans/groupm3/male_02.mdl",
	"models/humans/groupm3/male_04.mdl",
	"models/humans/groupm3/male_06.mdl",
	"models/humans/groupm3/male_07.mdl",
	"models/humans/groupm3/male_08.mdl",
	"models/humans/groupm3/male_09.mdl",
	
	"models/humans/groupm5/male_02.mdl",
	"models/humans/groupm5/male_04.mdl",
	"models/humans/groupm5/male_06.mdl",
	"models/humans/groupm5/male_07.mdl",
	"models/humans/groupm5/male_08.mdl",
	"models/humans/groupm5/male_09.mdl",
	
	"models/humans/groupm6/male_02.mdl",
	"models/humans/groupm6/male_04.mdl",
	"models/humans/groupm6/male_06.mdl",
	"models/humans/groupm6/male_07.mdl",
	"models/humans/groupm6/male_08.mdl",
	"models/humans/groupm6/male_09.mdl",
	
	"models/humans/groupm7/male_02.mdl",
	"models/humans/groupm7/male_04.mdl",
	"models/humans/groupm7/male_06.mdl",
	"models/humans/groupm7/male_07.mdl",
	"models/humans/groupm7/male_08.mdl",
	"models/humans/groupm7/male_09.mdl",
	
	"models/humans/groupm8/male_02.mdl",
	"models/humans/groupm8/male_04.mdl",
	"models/humans/groupm8/male_06.mdl",
	"models/humans/groupm8/male_07.mdl",
	"models/humans/groupm8/male_08.mdl",
	"models/humans/groupm8/male_09.mdl",	
	
	"models/humans/groupm1/female_01.mdl",
	"models/humans/groupm1/female_02.mdl",
	"models/humans/groupm1/female_06.mdl",
	
	"models/humans/groupm2/female_01.mdl",
	"models/humans/groupm2/female_02.mdl",
	"models/humans/groupm2/female_06.mdl",	
	
	"models/humans/groupm3/female_01.mdl",
	"models/humans/groupm3/female_02.mdl",
	"models/humans/groupm3/female_06.mdl",	
	
	"models/humans/groupm5/female_01.mdl",
	"models/humans/groupm5/female_02.mdl",
	"models/humans/groupm5/female_06.mdl",	
	
	"models/humans/groupm6/female_01.mdl",
	"models/humans/groupm6/female_02.mdl",
	"models/humans/groupm6/female_06.mdl",	
	
	"models/humans/groupm7/female_01.mdl",
	"models/humans/groupm7/female_02.mdl",
	"models/humans/groupm7/female_06.mdl",	
	
	"models/humans/groupm8/female_01.mdl",
	"models/humans/groupm8/female_02.mdl",
	"models/humans/groupm8/female_06.mdl",
}

function ENT:Initialize()
	local faces = {
		"models/humans/female/groupm1/joey_facemap",
		"models/humans/female/groupm1/kanisha_cylmap",
		"models/humans/female/groupm1/naomi_facemap",
		"models/humans/gene/eric_facemap",
		"models/humans/gene/ted_facemap",
		"models/humans/gene/sandro_facemap",
		"models/humans/gene/mike_facemap",
		"models/humans/gene/vance_facemap",
		"models/humans/gene/erdim_cylmap",
	}
	
	self:SetMaterial(table.Random(faces))
	
	self:basicSetup()
end