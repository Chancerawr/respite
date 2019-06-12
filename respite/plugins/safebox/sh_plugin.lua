PLUGIN.name = "Safebox"
PLUGIN.author = "La Corporativa"
PLUGIN.desc = "A plugin that allows players to have a safe place to store their items."

nut.config.add("safeModel", "models/items/item_item_crate.mdl", "The model of the safe", nil, {
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

if (SERVER) then
	function PLUGIN:saveBox()
		local data = {}

		for k, v in ipairs(ents.FindByClass("nut_safebox")) do
			data[#data + 1] = {v:GetPos(), v:GetAngles(), v:GetModel()}
		end

		self:setData(data)
	end

	function PLUGIN:SaveData()
		self:saveBox()
	end

	function PLUGIN:LoadData()
		local data = self:getData()

		if (data) then
			for k, v in ipairs(data) do
				local storage = ents.Create("nut_safebox")
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
end
