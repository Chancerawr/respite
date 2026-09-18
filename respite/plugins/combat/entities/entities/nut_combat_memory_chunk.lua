ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Memory"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/props_wasteland/rockcliff01b.mdl"
ENT.material = "models/props_lab/security_screens"

ENT.BloodColor = DONT_BLEED

ENT.models = {
	"models/props_wasteland/rockcliff01b.mdl",
	"models/props_wasteland/rockcliff01c.mdl",
	"models/props_wasteland/rockcliff01f.mdl",
	"models/props_wasteland/rockcliff01j.mdl",
	"models/props_wasteland/rockcliff01k.mdl",
}

--all attributes
ENT.attribs = {
	["stm"] = -100,
	["str"] = 0,
	["accuracy"] = 0,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Time"] = 1,
}

ENT.hp = 50
ENT.armor = 0

ENT.res = {
	["Pierce"] = 20,
	["Slash"] = 15,
	["Blunt"] = 0,
	
	["Time"] = 100,
	["Rot"] = -100,
}

function ENT:Initialize()
	self:basicSetup()
	
	local physObj = self:GetPhysicsObject()
	if(IsValid(physObj)) then
		physObj:EnableMotion(false)
	end
end

function ENT:SpawnFunction(client, trace, className)
	if (!trace.Hit) then return end
	
	local normal = trace.HitNormal

	local SpawnPos = trace.HitPos + normal * -5
	local SpawnAng = normal:Angle() + Angle(90,0,0)--Angle(normal.x*180, normal.y*180, normal.z*180)

	local ent = ents.Create(ClassName)
	ent:SetPos(SpawnPos)
	ent:SetAngles(SpawnAng)

	ent:Spawn()
	ent:Activate()
	
	return ent
end