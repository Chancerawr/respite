ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Skin Tree"
ENT.Category = "NutScript - Combat (Husk)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_skin"

ENT.models = {
	"models/props_foliage/tree_deciduous_01a.mdl",
	"models/props_foliage/tree_deciduous_02a.mdl",
	"models/props_foliage/tree_deciduous_03a.mdl",
	"models/props_foliage/tree_deciduous_03b.mdl",
}

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 20,
	["accuracy"] = 20,
	["end"] = 40,
	["luck"] = -10,
	["perception"] = 15,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 20,
}

ENT.hp = 1000
ENT.armor = 200

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 20,
	["Blunt"] = 20,
	
	["Ichor"] = 0,
	["Blight"] = 25,
	["Shard"] = 25,
	["Distort"] = 0,
	["Time"] = 25,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
	
	-- Change appearance (color, material, etc)
	self:SetColor(Color(200,200,200))
	
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
	
	self.WalkAnim = "Zombie Walk 0" ..math.random(1,6)
end