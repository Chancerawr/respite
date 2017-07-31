ENT.Type = "anim"
ENT.PrintName = "Tree"
ENT.Author = "Cyumus"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering"

if (SERVER) then
	function ENT:Initialize()
		local function getRandomModel()
			local trees = {
				"models/props_foliage/tree_poplar_01.mdl",
				"models/props_foliage/tree_springers_01a-lod.mdl",
				"models/props_foliage/tree_springers_01a.mdl",
				"models/props_foliage/tree_deciduous_03b.mdl",
				"models/props_foliage/tree_deciduous_03a.mdl",
				"models/props_foliage/tree_deciduous_02a.mdl",
				"models/props_foliage/tree_deciduous_01a.mdl",
				"models/props_foliage/tree_deciduous_01a-lod.mdl",
				"models/props_foliage/tree_cliff_01a.mdl",
			}
			local random = math.random(1,table.getn(trees))
			return trees[random]
		end
		self:SetModel(getRandomModel())
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:SetHealth(nut.config.get("treeLife"))
		local pos = self:GetPos()
		self:SetPos(Vector(pos.X,pos.Y,pos.Z - 10))
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
			nut.item.spawn("j_scrap_wood", dmginfo:GetDamagePosition())
			if (nut.config.get("gDamage")) then
				self:SetHealth(self:Health() - nut.config.get("lifeDrain"))
				if(self:Health() == 0) then
					self:Remove()
				end
			end
		elseif(dmginfo:IsDamageType(DMG_BLAST)) then --if they blow it up, destroy it entirely.
			nut.item.spawn("j_scrap_wood", self:GetPos() + self:GetUp() * 40)
			nut.item.spawn("j_scrap_wood", self:GetPos() + self:GetUp() * 40)
			nut.item.spawn("j_scrap_wood", self:GetPos() + self:GetUp() * 40)
			nut.item.spawn("j_scrap_wood", self:GetPos() + self:GetUp() * 40)
			nut.item.spawn("j_scrap_wood", self:GetPos() + self:GetUp() * 40)
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
		local tx, ty = drawText("Tree", x, y, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 2)
	end
end
