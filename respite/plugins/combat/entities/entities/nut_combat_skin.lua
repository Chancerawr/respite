ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Skin"
ENT.Category = "NutScript - Combat (Husk)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.models = {
	"models/Humans/Group01/male_01.mdl",
	"models/Humans/Group01/male_02.mdl",
	"models/Humans/Group01/male_03.mdl",
	"models/Humans/Group01/male_04.mdl",
	"models/Humans/Group01/male_05.mdl",
	"models/Humans/Group01/male_06.mdl",
	"models/Humans/Group01/male_07.mdl",
	"models/Humans/Group01/male_08.mdl",
	"models/Humans/Group01/male_09.mdl",
}

--all attributes
ENT.attribs = {
	["stm"] = 3,
	["str"] = 6,
	["accuracy"] = 4,
	["end"] = 4,
	["luck"] = 0,
	["perception"] = 2,
	["fortitude"] = 3,
}

function ENT:Initialize()
	self:basicSetup()
	
	local faces = {
		"models/humans/female/group01/joey_facemap",
		"models/humans/female/group01/kanisha_cylmap",
		"models/humans/female/group01/naomi_facemap",
		"models/humans/male/group01/eric_facemap",
		"models/humans/male/group01/ted_facemap",
		"models/humans/male/group01/sandro_facemap",
		"models/humans/male/group01/mike_facemap",
		"models/humans/male/group01/vance_facemap",
		"models/humans/male/group01/erdim_cylmap",
		"models/humans/male/group01/mike_facemap",
	}
	
	for k, v in pairs(self:GetMaterials()) do
		self:SetSubMaterial(k-1, table.Random(faces))
	end
end