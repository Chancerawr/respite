ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Flesh Mannequin"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/nh2_gmn/dave_the_dummy_on_stand.mdl"
ENT.material = "models/flesh"

ENT.noRag = true

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 0,
	["end"] = 3,
	["luck"] = 1,
	["perception"] = 0,
	["fortitude"] = 30,
}

ENT.dmg = {
	["Blunt"] = 0,
}

ENT.hp = 50
ENT.armor = 15

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		local ran = math.random(0,1)
		if(ran == 1) then
			self:SetMaterial("models/flesh")
		else
			self:SetMaterial("models/zombie_fast/fast_zombie_sheet")
		end
	end
end