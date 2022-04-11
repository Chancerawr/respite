ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Jeffrey"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.noRag = true

ENT.model = "models/Zombie/Poison.mdl"
ENT.material = "models/props_lab/security_screens"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 100,
	["accuracy"] = 20,
	["end"] = 100,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 200,
}

ENT.dmg = {
	["Blunt"] = 20,
	["Ichor"] = 40,
}

ENT.hp = 2000
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 50,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 100,
	["Electric"] = 25,
}

ENT.actions = {
	"constrict",
}

function ENT:Initialize()
	timer.Simple(0.6, function()
		self:SetModelScale(3)
		self:ResetSequence("firewalk")
	end)
	
	if(CLIENT) then
		local bones = {
			"ValveBiped.Bip01_L_UpperArm",
			"ValveBiped.Bip01_L_Forearm",
			"ValveBiped.Bip01_L_Hand",
			"ValveBiped.Bip01_L_Finger1",
			"ValveBiped.Bip01_L_Finger11",
			"ValveBiped.Bip01_L_Finger12",
			"ValveBiped.Bip01_L_Finger2",
			"ValveBiped.Bip01_L_Finger21",
			"ValveBiped.Bip01_L_Finger22",
			"ValveBiped.Bip01_L_Finger3",
			"ValveBiped.Bip01_L_Finger31",
			"ValveBiped.Bip01_L_Finger32",
			"ValveBiped.Bip01_R_UpperArm",
			"ValveBiped.Bip01_R_Forearm",
			"ValveBiped.Bip01_R_Hand",
			"ValveBiped.Bip01_R_Finger1",
			"ValveBiped.Bip01_R_Finger11",
			"ValveBiped.Bip01_R_Finger12",
			"ValveBiped.Bip01_R_Finger2",
			"ValveBiped.Bip01_R_Finger21",
			"ValveBiped.Bip01_R_Finger22",
			"ValveBiped.Bip01_R_Finger3",
			"ValveBiped.Bip01_R_Finger31",
			"ValveBiped.Bip01_R_Finger32"
		}

		for _, bone in pairs(bones) do
			local boneid = self:LookupBone(bone)
			if boneid and boneid > 0 then
				self:ManipulateBoneScale(boneid, Vector(2,2,2))
			end
		end
	end

	self:basicSetup()
end