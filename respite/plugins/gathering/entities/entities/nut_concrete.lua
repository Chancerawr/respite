ENT.Type = "anim"
ENT.PrintName = "Debris"
ENT.Author = "Cyumus" --Weird modifications by chancer
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering"

if (SERVER) then
	function ENT:Initialize()
		local function getRandomModel()
			local debris = {
				"models/props_debris/barricade_short01a.mdl",
				"models/props_debris/barricade_short02a.mdl",
				"models/props_debris/barricade_short03a.mdl",
				"models/props_debris/barricade_short04a.mdl",
				"models/props_debris/barricade_tall01a.mdl",
				"models/props_debris/barricade_tall02a.mdl",
				"models/props_debris/barricade_tall03a.mdl",
				"models/props_debris/barricade_tall04a.mdl",
				"models/props_debris/walldestroyed08a.mdl",
			}
			local random = math.random(1,table.getn(debris))
			return debris[random]
		end
		self:SetModel(getRandomModel())
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
			nut.item.spawn("j_scrap_concrete", dmginfo:GetDamagePosition())
			if (nut.config.get("gDamage")) then
				self:SetHealth(self:Health() - nut.config.get("lifeDrain"))
				if(self:Health() == 0) then
					self:Remove()
				end
			end
		elseif(dmginfo:IsDamageType(DMG_BLAST)) then --if they blow it up, destroy it entirely.
			nut.item.spawn("j_scrap_concrete", self:GetPos() + self:GetUp() * 40)
			nut.item.spawn("j_scrap_concrete", self:GetPos() + self:GetUp() * 40)
			nut.item.spawn("j_scrap_concrete", self:GetPos() + self:GetUp() * 40)
			nut.item.spawn("j_scrap_concrete", self:GetPos() + self:GetUp() * 40)
			nut.item.spawn("j_scrap_concrete", self:GetPos() + self:GetUp() * 40)
			self:Remove()
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
		local tx, ty = drawText("Debris", x, y, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 2)
	end
end
