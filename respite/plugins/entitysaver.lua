local PLUGIN = PLUGIN
PLUGIN.name = "Special Entity Saver"
PLUGIN.author = " "
PLUGIN.desc = "Lets you save specified entities."

PLUGIN.savedEnts = PLUGIN.savedEnts or {}

--this is the list of entities that will be saved when you run the command
--put the class names in there
PLUGIN.entsToSave = {
	["anom_bead"] = true,
	["anom_bubble"] = true,
	["anom_burner"] = true,
	["anom_damage"] = true,
	["anom_deathfog"] = true,
	["anom_divide"] = true,
	["anom_electro"] = true,
	["anom_evade"] = true,
	["anom_heat"] = true,
	["anom_hoverstone"] = true,
	["anom_hydro"] = true,
	["anom_mystic"] = true,
	["anom_static"] = true,
	["anom_trapper"] = true,
	["anom_vortex"] = true,
	["anom_whirlgig"] = true,
	["anom_bigvortex"] = true,
}

if SERVER then
	function PLUGIN:SaveEntities()
		self.savedEnts = {}
	
		for k, v in ipairs(ents.GetAll()) do
			if(!IsValid(v)) then continue end
			
			if(PLUGIN.entsToSave[v:GetClass()]) then
				table.insert(self.savedEnts, {v:GetPos(), v:GetAngles(), v:GetClass()})
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
		local pos = data[1]
		local ang = data[2]
		local class = data[3]

		local entity = ents.Create(class)
		
		if(IsValid(entity)) then
			entity:SetPos(pos)
			entity:SetAngles(ang)
		
			entity:Spawn()
		end
	end
end

nut.command.add("specialentitysave", {
	adminOnly = true,
	onRun = function(client)
		if SERVER then
			PLUGIN:SaveEntities()
			
			client:notify((#PLUGIN.savedEnts).. " entities saved.")
		end
	end
})