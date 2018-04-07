ENT.Type = "anim"
ENT.PrintName = "Portal Rock"
ENT.Author = "Cyumus" --Weird modifications by chancer
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering"


local ranScrap = {
	"j_scrap_adhesive",
	"j_scrap_battery",
	"j_scrap_bone",
	"drug_depress",
	"j_scrap_cloth",
	"j_scrap_concrete",
	"j_scrap_elastic",
	"j_scrap_elecs",
	"j_scrap_glass",
	"j_scrap_light",
	"j_scrap_metals",
	"j_scrap_nails",
	"j_scrap_organic",
	"j_scrap_plastics",
	"j_scrap_rubber",
	"j_scrap_memory",
	"j_scrap_wood",
	"j_dark_wood",
	"cube_chip"
}

if (SERVER) then
	function ENT:Initialize()
		local function getRandomModel()
			local rock = {
				"models/props_wasteland/rockcliff01b.mdl",
				"models/props_wasteland/rockcliff01c.mdl",
				"models/props_wasteland/rockcliff01f.mdl",
				"models/props_wasteland/rockcliff01j.mdl",
				"models/props_wasteland/rockcliff01k.mdl",
			}

			return table.Random(rock)
		end
		self:SetModel(getRandomModel())
		self:SetMaterial("models/props_lab/security_screens")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:SetHealth(nut.config.get("treeLife"))
		local pos = self:GetPos()
		self:SetPos(Vector(pos.X,pos.Y,pos.Z + 15))
		self:SetAngles(Angle(0,math.random(0,360),0))
		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion(false)
			physicsObject:Sleep()
		end
	end

	function ENT:Use(activator)
	end
	
	function ENT:OnTakeDamage( dmginfo )
		if(!dmginfo:IsDamageType(DMG_BURN) and !dmginfo:IsDamageType(DMG_BULLET) and !dmginfo:IsDamageType(DMG_BLAST) and dmginfo:GetDamage() > 10) then
			nut.item.spawn(ranScrap[math.random(1,17)], dmginfo:GetDamagePosition())
			if (nut.config.get("gDamage")) then
				self:SetHealth(self:Health() - nut.config.get("lifeDrain"))
				if(self:Health() == 0) then
					self:Remove()
				end
			end
		end
	end
else
	function ENT:Draw()
		self:DrawModel()
	end

	ENT.DrawEntityInfo = true
	local toScreen = FindMetaTable("Vector").ToScreen
	local colorAlpha = ColorAlpha
	local drawText = nut.util.drawText
	local configGet = nut.config.get

	function ENT:onDrawEntityInfo(alpha)
		local position = toScreen(self.LocalToWorld(self, self.OBBCenter(self)))
		local x, y = position.x, position.y
		local tx, ty = drawText("???", x, y, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 2)
	end
end
