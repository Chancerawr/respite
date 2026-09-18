local PLUGIN = PLUGIN
PLUGIN.name = "Special Entity Saver"
PLUGIN.author = " "
PLUGIN.desc = "Lets you save specified entities."

PLUGIN.savedEnts = PLUGIN.savedEnts or {}

if SERVER then
	function PLUGIN:SaveEntities()
		self.savedEnts = {}
	
		for k, v in ipairs(ents.GetAll()) do
			if(!IsValid(v)) then continue end
			--if(!(v.IsVehicle and v:IsVehicle())) then continue end
			
			local class = v:GetClass():lower()
	
			local IsSimfphys = (class == "gmod_sent_vehicle_fphysics_base")
			if(IsSimfphys) then
				local vehicleData = {
					class = v.VehicleName,
					pos = v:GetPos(),
					ang = v:GetAngles(),
					color = v:GetColor(),
					skin = v:GetSkin(),
					material = v:GetMaterial(),
					health = v:GetCurHealth(),
					simfphys = true,
				}
			
				table.insert(self.savedEnts, vehicleData)
			elseif(v.LVS) then
				local vehicleData = {
					class = v:GetClass(),
					pos = v:GetPos(),
					ang = v:GetAngles(),
					color = v:GetColor(),
					skin = v:GetSkin(),
					material = v:GetMaterial(),
					health = v:GetHP(),
					LVS = true,
				}
			
				table.insert(self.savedEnts, vehicleData)
			end
		end

		self:setData(self.savedEnts)
	end
	
	function PLUGIN:loadCars()
		self.savedEnts = self:getData()
		
		for k, v in pairs(self.savedEnts) do
			self:spawnEntity(v)
		end
	end
	
		-- this stupid time stuff stops them from getting broken when other things break when the load hook is called
	function PLUGIN:InitPostEntity()
		pcall(function()
			PLUGIN:loadCars()
		end)
	end

	function PLUGIN:spawnEntity(data)
		local spawnPos = data.pos
	
		local vehicle
		if(data.LVS) then
			vehicle = ents.Create(data.class)
			vehicle:SetPos(spawnPos)
			vehicle:SetAngles(data.ang)
			vehicle:Spawn()
			
			if(data.health) then
				vehicle:SetHP(data.health)
			end
		else --simfphys
			vehicle = simfphys.SpawnVehicleSimple(data.class, spawnPos, data.ang)
			
			if(data.health) then
				timer.Simple(1, function()
					if(IsValid(vehicle)) then
						vehicle:ApplyDamage(vehicle:GetMaxHealth() - data.health, DMG_GENERIC)
					end
				end)
			end
		end
		
		local colorTbl = data.color
		local color = Color(colorTbl.r or 255, colorTbl.g or 255, colorTbl.b or 255)
		
		vehicle:SetColor(color)
		vehicle:SetMaterial(data.material or "")
		vehicle:SetSkin(data.skin or 0)
	end
end

nut.command.add("simfphyssave", {
	adminOnly = true,
	onRun = function(client)
		if SERVER then
			PLUGIN:SaveEntities()
			
			client:notify((#PLUGIN.savedEnts).. " entities saved.")
		end
	end
})