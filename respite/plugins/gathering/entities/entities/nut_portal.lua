ENT.Type = "anim"
ENT.PrintName = "Portal Rock"
ENT.Author = "Cyumus" --Weird modifications by chancer
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering"


local ranScrap = {}
	ranScrap[1] = "j_scrap_adhesive"
	ranScrap[2] = "j_scrap_battery"
	ranScrap[3] = "j_scrap_bone"
	ranScrap[4] = "drug_depress"
	ranScrap[5] = "j_scrap_cloth"
	ranScrap[6] = "j_scrap_concrete"
	ranScrap[7] = "j_scrap_elastic"
	ranScrap[8] = "j_scrap_elecs"
	ranScrap[9] = "j_scrap_glass"
	ranScrap[10] = "j_scrap_light"
	ranScrap[11] = "j_scrap_metals"
	ranScrap[12] = "j_scrap_nails"
	ranScrap[13] = "j_scrap_organic"
	ranScrap[14] = "j_scrap_plastics"
	ranScrap[15] = "j_scrap_rubber"
	ranScrap[16] = "j_scrap_memory"
	ranScrap[17] = "j_scrap_wood"
	--ranScrap[18] = "cube_chip"

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
			local random = math.random(1,table.getn(rock))
			return rock[random]
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
