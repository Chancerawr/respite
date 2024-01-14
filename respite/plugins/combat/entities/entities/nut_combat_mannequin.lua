ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Mannequin"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/nh2_gmn/dave_the_dummy_on_stand.mdl"
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

ENT.hp = 40
ENT.armor = 15

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = 100,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

function ENT:Initialize()
	self:basicSetup()

	--[[
	if(SERVER) then
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetSolid(SOLID_BBOX)
		
		local physObj = self:GetPhysicsObject()
		if (IsValid(physObj)) then
			physObj:EnableMotion(true)
			physObj:EnableGravity(true)
			--physObj:Sleep()
			physObj:EnableCollisions(true)
			physObj:Wake()
		end
	end
	--]]
end