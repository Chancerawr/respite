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
			if(v.Category and v.Category == "PolyTraps") then
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
				
				local entData = {
					class = v:GetClass(),
					pos = v:GetPos(),
					ang = v:GetAngles(),
					motion = motion,
					stick = stick,
					primed = v.primed,
					primed2 = v.primed2,
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
		entity:SetPos(data.pos)
		entity:SetAngles(data.ang)
		entity:Spawn()
		
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
			end
		end)
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