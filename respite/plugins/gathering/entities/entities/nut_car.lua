ENT.Type = "anim"
ENT.PrintName = "Car"
ENT.Author = "Cyumus" --Weird modifications by chancer
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering"

if (SERVER) then
	function ENT:Initialize()
		local function getRandomModel()
			local cars = {
				"models/props_vehicles/car001b_hatchback.mdl",
				"models/props_vehicles/car001a_hatchback.mdl",
				"models/props_vehicles/car002b_physics.mdl",
				"models/props_vehicles/car003a_physics.mdl",
				"models/props_vehicles/car003b_physics.mdl",
				"models/props_vehicles/car004a_physics.mdl",
				"models/props_vehicles/car004b_physics.mdl",
				"models/props_vehicles/car005a_physics.mdl",
				"models/props_vehicles/car005b_physics.mdl",
				--"models/props_vehicles/truck002a_cab.mdl",
				--"models/props_vehicles/truck001a.mdl",
				"models/props_vehicles/van001a_physics.mdl",
			}
			local random = math.random(1,table.getn(cars))
			return cars[random]
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
			nut.item.spawn("j_scrap_metals", dmginfo:GetDamagePosition())
			if (nut.config.get("gDamage")) then
				self:SetHealth(self:Health() - nut.config.get("lifeDrain"))
				if(self:Health() < 1) then
					self:Remove()
				end
			end
		elseif(dmginfo:IsDamageType(DMG_BLAST)) then --if they blow it up, destroy it entirely.
			nut.item.spawn("j_scrap_metals", self:GetPos() + self:GetUp() * 40)
			nut.item.spawn("j_scrap_metals", self:GetPos() + self:GetUp() * 40)
			nut.item.spawn("j_scrap_metals", self:GetPos() + self:GetUp() * 40)
			nut.item.spawn("j_scrap_metals", self:GetPos() + self:GetUp() * 40)
			nut.item.spawn("j_scrap_metals", self:GetPos() + self:GetUp() * 40)
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
		local tx, ty = drawText("Vehicle", x, y, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 2)
	end
end
