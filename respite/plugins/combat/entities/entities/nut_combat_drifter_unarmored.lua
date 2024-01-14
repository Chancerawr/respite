ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Drifter (Unarmored)"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Drifter"

ENT.model = "models/player/group01/male_04.mdl"

ENT.WalkAnim = "walk_all"
ENT.RunAnim = "run_all_01"

ENT.models = {
	"models/player/group01/female_01.mdl",
	"models/player/group01/female_02.mdl",
	"models/player/group01/female_03.mdl",
	"models/player/group01/female_04.mdl",
	"models/player/group01/female_05.mdl",
	"models/player/group01/female_06.mdl",
	"models/player/group01/male_01.mdl",
	"models/player/group01/male_02.mdl",
	"models/player/group01/male_03.mdl",
	"models/player/group01/male_04.mdl",
	"models/player/group01/male_05.mdl",
	"models/player/group01/male_06.mdl",
	"models/player/group01/male_07.mdl",
	"models/player/group01/male_08.mdl",
	"models/player/group01/male_09.mdl",
}

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
	["Blunt"] = 10,
}

ENT.hp = 100
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

function ENT:Initialize()
	if(!self.saveKey) then
		self.attribs.stm = math.random(5,15)
		self.attribs.str = math.random(5,15)
		self.attribs.accuracy = math.random(5,15)
		self.attribs["end"] = math.random(5,15)
		self.attribs.luck = math.random(5,15)
		self.attribs.perception = math.random(5,15)
		self.attribs.fortitude = math.random(5,15)
	end
	
	self:basicSetup()
end