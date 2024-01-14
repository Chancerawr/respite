local PLUGIN = PLUGIN
PLUGIN.name = "Safebox"
PLUGIN.author = "La Corporativa"
PLUGIN.desc = "A plugin that allows players to have a safe place to store their items."

nut.config.add("safeModel", "models/Items/item_item_crate.mdl", "The model of the safe", nil, {
	category = "Safebox"
})

nut.config.add("safeHeight", 4, "The height of the safe", nil, {
	data = {min = 1, max = 20},
	category = "Safebox"
})

nut.config.add("safeWidth", 4, "The width of the safe", nil, {
	data = {min = 1, max = 20},
	category = "Safebox"
})

nut.config.add("groupStorage", -1, "Do not touch this", nil, {
	data = {min = -1, max = 99999999},
	category = "Safebox"
})

if (SERVER) then
	function PLUGIN:saveBox()
		local data = {}

		for k, v in ipairs(ents.FindByClass("nut_safebox")) do
			data[#data + 1] = {v:GetPos(), v:GetAngles(), v:GetModel(), v:GetClass()}
		end
		
		for k, v in ipairs(ents.FindByClass("nut_memory_storage")) do
			data[#data + 1] = {v:GetPos(), v:GetAngles(), v:GetModel(), v:GetClass()}
		end

		self:setData(data)
	end

	function PLUGIN:SaveData()
		if(!nut.shuttingDown) then
			self:saveBox()
		end
	end

	function PLUGIN:loadBoxes()
		local data = self:getData()

		if (data) then
			for k, v in ipairs(data) do
				local storage = ents.Create(v[4] or "nut_safebox")
				storage:SetPos(v[1])
				storage:SetAngles(v[2])
				storage:Spawn()
				storage:SetModel(v[3])
				storage:SetSolid(SOLID_VPHYSICS)
				storage:PhysicsInit(SOLID_VPHYSICS)

				local physObject = storage:GetPhysicsObject()

				if (physObject) then
					physObject:EnableMotion()
				end
			end
		end
	end
	
	-- this stupid time stuff stops them from getting broken when other things break when the load hook is called
	function PLUGIN:InitPostEntity()
		--[[
		timer.Simple(60, function()
			PLUGIN:loadBoxes()
		end)
		--]]
	end
	
	function PLUGIN:LoadData()
		pcall(function()
			PLUGIN:loadBoxes()
		end)
	end
end