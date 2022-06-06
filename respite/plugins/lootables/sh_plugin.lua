local PLUGIN = PLUGIN
PLUGIN.name = "Lootables"
PLUGIN.author = "Chancer"
PLUGIN.desc = ""

PLUGIN.lootEnts = PLUGIN.lootEnts or {}

nut.config.add("lootMax", 10, "The maximum amount of loot entities that can be active each cycle.", nil, {
	data = {min = 0, max = 2024},
	category = "Loot Entities"
})

nut.config.add("lootTime", 5, "How long it takes to search a loot entity.", nil, {
	data = {min = 0, max = 2024},
	category = "Loot Entities"
})

if(SERVER) then
	function PLUGIN:Think()
		if((self.nextLootCycle or 0) < CurTime()) then
			self.nextLootCycle = CurTime() + 60
			
			if(table.IsEmpty(PLUGIN.lootEnts)) then
				return false
			end
			
			-- keep track of the keeys we should remove
			local keysToRemove = {} -- I do it this way just to make sure the loop doesnt get weird
			for k, v in pairs(PLUGIN.lootEnts) do
				if(!IsValid(v)) then 
					keysToRemove[k] = true
				
					continue
				end
				
				v.lootEnabled = false
			end
		
			-- remove the dead entities
			for k, v in pairs(keysToRemove) do
				table.remove(PLUGIN.lootEnts, k)
			end
			
			-- number of entities that exist
			local entNumber = #PLUGIN.lootEnts

			local activeEnts = nut.config.get("lootMax", 10)

			for i=1, activeEnts, 1 do
				PLUGIN.lootEnts[math.random(entNumber)].lootEnabled = true
			end
		end
	end

	local function GetWeightedRandomKey(lootTable)
		local lootData = PLUGIN.loot[lootTable]
		if(!lootData) then return end --invalid loot table
	
		local sum = 0
		
		for k, rarity in pairs(lootData) do
			sum = sum + (rarity or 1)
		end

		local select = math.random() * sum

		for item, rarity in pairs(lootData) do
			select = select - (rarity or 1)
			if select < 0 then 
				return item
			end
		end
	end

	-- generates an item based on the loot entity
	function PLUGIN:generateLoot(lootEnt)
		local lootTable = lootEnt:GetLootTable()
		if(!lootTable) then return false end

		local item = GetWeightedRandomKey(lootTable)
		
		return item
	end
	
	function PLUGIN:SaveData()
		local data = {}
		
		for k, entity in pairs(PLUGIN.lootEnts) do
			if(!IsValid(entity)) then continue end
		
			local motion = false
			if(IsValid(entity)) then
				local physObj = entity:GetPhysicsObject()
				if(IsValid(physObj)) then
					motion = physObj:IsMotionEnabled()
				end
			end
		
			data[k] = {
				name = entity:GetEntName(),
				desc = entity:GetEntDesc(),
				model = entity:GetEntModel(),
				loot = entity:GetLootTable(),
				pos = entity:GetPos(),
				ang = entity:GetAngles(),
				motion = motion,
			}
		end
		
		self:setData(data)
	end
	
	function PLUGIN:LoadData()
		local data = self:getData()
		
		for k, entity in pairs(data) do
			local lootEnt = ents.Create("nut_lootable")
			lootEnt:SetPos(entity.pos)
			lootEnt:SetAngles(entity.ang)
			lootEnt:Spawn()
			lootEnt:SetModel(entity.model)
			
			lootEnt:SetEntName(entity.name)
			lootEnt:SetEntDesc(entity.desc)
			lootEnt:SetEntModel(entity.model)
			lootEnt:SetLootTable(entity.loot)

			local physObj = lootEnt:GetPhysicsObject()
			if (physObj) then
				physObj:EnableMotion(entity.motion)
				
				if(entity.motion) then
					physObj:Wake()
				end
			end
		end
	end
end

nut.command.add("lootentsave", {
	adminOnly = true,
	onRun = function(client)
		if SERVER then
			PLUGIN:SaveData()
		end
	end
})