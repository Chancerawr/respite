local PLUGIN = PLUGIN
PLUGIN.name = "Traps"
PLUGIN.author = ""
PLUGIN.desc = "Items that spawn traps."

PLUGIN.savedEnts = {}--PLUGIN.savedEnts or {}

if SERVER then
	function PLUGIN:SaveEntities()
		self.savedEnts = {}
	
		for k, v in ipairs(ents.GetAll()) do
			if(!IsValid(v)) then continue end
			if(v.Category and (v.Category == "PolyTraps" or v.Category == "J.I. Defense Solutions")) then
				local stick
				if(v.stick) then
					local stickMotion
					
					local physObj = v.stick:GetPhysicsObject()
					if(IsValid(physObj)) then
						stickMotion = physObj:IsMotionEnabled()
					end
				
					stick = {
						pos = v.stick:GetPos(),
						ang = v.stick:GetAngles(),
						motion = stickMotion,
					}
				end
				
				local motion
				local physObj = v:GetPhysicsObject()
				if(IsValid(physObj)) then
					motion = physObj:IsMotionEnabled()
				end
				
				local worldWeld
				if(constraint.FindConstraint(v, "Weld")) then
					worldWeld = true
				end
				
				local entData = {
					class = v:GetClass(),
					pos = v:GetPos(),
					ang = v:GetAngles(),
					skin = v:GetSkin(),
					motion = motion,
					stick = stick,
					primed = v.primed,
					primed2 = v.primed2,
					armed = v.Armed,
					worldWeld = worldWeld,
				}
			
				table.insert(self.savedEnts, entData)
			end
		end

		self:setData(self.savedEnts)
	end

	function PLUGIN:LoadData()
		self.savedEnts = self:getData()
		
		for k, v in pairs(self.savedEnts) do
			self:spawnEntity(v)
		end
	end

	function PLUGIN:spawnEntity(data)
		local entity = ents.Create(data.class)
		if(IsValid(entity)) then
			entity:SetAngles(data.ang)
			entity:SetPos(data.pos)

			entity:Spawn()
			
			if(data.worldWeld) then
				local weld = constraint.Weld(entity, game.GetWorld(),0,0,0,0,0)
			end
			
			if(data.skin) then
				entity:SetSkin(data.skin)
			end

			local physObj = entity:GetPhysicsObject()
			if (physObj) then
				physObj:EnableMotion(data.motion or false)
				physObj:Sleep() --no physics until hit by a physical force
			end

			timer.Simple(2, function()
				if(IsValid(entity)) then
					if(data.stick) then
						local stick = entity.stick
						if(IsValid(stick)) then
							stick:SetPos(data.stick.pos)
							stick:SetAngles(data.stick.ang)
						end
						
						local physObj = stick:GetPhysicsObject()
						if (physObj) then
							physObj:EnableMotion(data.stick.motion or false)
							physObj:Sleep() --no physics until hit by a physical force
						end
					end
					
					if(data.primed) then
						entity.primed = data.primed
					end
					
					if(data.primed2) then
						entity.primed2 = data.primed2
					end
					
					if(data.armed) then
						entity:Arm()
					end
				end
			end)
		end
	end
end

nut.command.add("trapsave", {
	adminOnly = true,
	onRun = function(client)
		if SERVER then
			PLUGIN:SaveEntities()
			
			client:notify((#PLUGIN.savedEnts).. " entities saved.")
		end
	end
})

nut.command.add("trapload", {
	adminOnly = true,
	onRun = function(client)
		if SERVER then
			for k, v in pairs(PLUGIN.savedEnts) do
				if(IsValid(v)) then
					SafeRemoveEntity(v)
				end
			end
		
			PLUGIN:LoadData()
			
			client:notify((#PLUGIN.savedEnts).. " entities loaded.")
		end
	end
})