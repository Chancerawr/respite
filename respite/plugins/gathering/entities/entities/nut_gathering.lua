ENT.Type = "anim"
ENT.PrintName = "Gathering Base"
ENT.Author = ""
ENT.Spawnable = false
ENT.AdminOnly = true
ENT.Category = "Gathering"

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

ENT.harvestMsg = "Harvest with <E>"

ENT.models = {
	"models/props_foliage/tree_dead01.mdl"
}

ENT.resources = {
	"j_scrap_wood",
}

if (SERVER) then
	function ENT:Initialize()
		local model = self.models[math.random(#self.ranModels)]
		self:SetModel(model)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		
		self:SetHealth(nut.config.get("treeLife"))
		
		local pos = self:GetPos()
		
		self:SetPos(Vector(pos.X,pos.Y,pos.Z - 10))
		self:SetAngles(Angle(0,math.random(0,360),0))
		
		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion(false)
			physicsObject:Sleep()
		end
	end

	function ENT:Use(activator)
		if(IsValid(self) and self.plant) then
			local oldPos = activator:GetPos()
			activator:setAction("Gathering...", 2.5, function()
				if(activator:GetPos():Distance(oldPos) > 500) then
					activator:notify("Gathering failed, too far away.")
					return false
				end
			
				local char = activator:getChar()
				local inventory = char:getInv()
				
				if(self.resources) then
					local gather = self.resources[math.random(#self.resources)]
					
					inventory:addSmart(gather, 1, self:GetPos())
				end

				--activator:notify(nut.item.list[gather].name.. " gathered.")
				
				self:EmitSound("physics/metal/weapon_impact_soft" ..math.random(1,3).. ".wav", 65, 125)
				
				self.gathers = (self.gathers or 1) - 1
				if(self.gathers < 1) then
					self:Remove()
				end
			end)
		end
	end
	
	function ENT:OnTakeDamage( dmginfo )
		if(!self.plant) then
			if(!dmginfo:IsDamageType(DMG_BURN) and !dmginfo:IsDamageType(DMG_BULLET) and !dmginfo:IsDamageType(DMG_BLAST) and dmginfo:GetDamage() > 10) then
				local gather = self.resources[math.random(#self.resources)]
			
				nut.item.spawn(gather, dmginfo:GetDamagePosition())
				
				if (nut.config.get("gDamage")) then
					self:SetHealth(self:Health() - nut.config.get("lifeDrain"))
					if(self:Health() < 0) then
						self:Remove()
					end
				end
			elseif(dmginfo:IsDamageType(DMG_BLAST)) then --if they blow it up, destroy it entirely.
				local gather = self.resources[math.random(#self.resources)]
				
				for i = 1, math.random(4,6) do
					nut.item.spawn(gather, self:GetPos() + self:GetUp() * 40)
				end
					
				self:Remove()
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
		local tx, ty = drawText(self.Name or self.PrintName, x, y, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 2)
		--drawText(self.harvestMsg, ScrW() * 0.5, ScrH() * 0.8, colorAlpha(color_white, alpha), 1, 1, "nutEntDesc", alpha * 0.65)
	end
end
