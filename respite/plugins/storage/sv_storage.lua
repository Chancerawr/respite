-- This file is responsible for creating, saving, and loading storage
-- entities.
function PLUGIN:PlayerSpawnedProp(client, model, entity)
	local data = self.definitions[model:lower()]
	if (not data) then return end
	if (hook.Run("CanPlayerSpawnStorage", client, entity, data) == false) then
		return
	end

	local storage = ents.Create("nut_storage")
	storage:SetPos(entity:GetPos())
	storage:SetAngles(entity:GetAngles())
	storage:Spawn()
	storage:SetModel(model)
	storage:SetSolid(SOLID_VPHYSICS)
	storage:PhysicsInit(SOLID_VPHYSICS)
	storage:SetCreator(client)

	nut.inventory.instance(data.invType, data.invData)
		:next(function(inventory)
			if (IsValid(storage)) then
				inventory.isStorage = true
				storage:setInventory(inventory)
				self:saveStorage()

				if (isfunction(data.onSpawn)) then
					data.onSpawn(storage)
				end
			end
		end, function(err)
			ErrorNoHalt(
				"Unable to create storage entity for "..client:Name().."\n"..
				err.."\n"
			)
			if (IsValid(storage)) then
				storage:Remove()
			end
		end)

	entity:Remove()
end

function PLUGIN:CanPlayerSpawnStorage(client, entity, info)
	if (not info.invType or not nut.inventory.types[info.invType]) then
		return false
	end
end

function PLUGIN:CanSaveStorage(entity, inventory)
	return nut.config.get("saveStorage", true)
end

function PLUGIN:saveStorage()
  	local data = {}

	for _, entity in ipairs(ents.FindByClass("nut_storage")) do
		if (hook.Run("CanSaveStorage", entity, entity:getInv()) == false) then
			entity.nutForceDelete = true
			continue
		end
		
		local motion = false
		if(IsValid(entity)) then
			local physObj = entity:GetPhysicsObject()
			if(IsValid(physObj)) then
				motion = physObj:IsMotionEnabled()
			end
		end
		
		if (entity:getInv()) then
			data[#data + 1] = {
				entity:GetPos(),
				entity:GetAngles(),
				entity:getNetVar("id"),
				entity:GetModel():lower(),
				entity.password,
				entity.lootable, 
				entity:getNetVar("name", nil), 
				entity:getNetVar("desc", nil),
				entity:GetSkin(),
				motion,
				entity:GetMaterial(),
				entity:getNetVar("owner", nil),
				entity:getNetVar("overwrite", nil),
			}
		end
  	end
  	self:setData(data)
end

function PLUGIN:StorageItemRemoved(entity, inventory)
	self:saveStorage()
end

function PLUGIN:LoadData()
	local data = self:getData()
	if (not data) then return end

	for _, info in ipairs(data) do
		--local position, angles, inv, model, password, lootable, name, desc, skin = unpack(info)
		local position = info[1]
		local angles = info[2]
		local inv = info[3]
		local model = info[4]
		local password = info[5]
		local lootable = info[6]
		local name = info[7]
		local desc = info[8]
		local skin = info[9]
		local motion = info[10]
		local mat = info[11]
		local owner = info[12]
		local overwrite = info[13]
		
		local storage = self.definitions[overwrite or model]
		if (not storage) then continue end

		local storage = ents.Create("nut_storage")
		storage:SetPos(position)
		storage:SetAngles(angles)
		storage:Spawn()
		storage:SetModel(model)
		storage:SetSolid(SOLID_VPHYSICS)
		storage:PhysicsInit(SOLID_VPHYSICS)
		
		nut.inventory.loadByID(inv)
			:next(function(inventory)
				if (inventory and IsValid(storage)) then
					inventory.isStorage = true
					storage:setInventory(inventory)
					hook.Run("StorageRestored", storage, inventory)
				elseif (IsValid(storage)) then
					timer.Simple(1, function()
						if (IsValid(storage)) then
							storage:Remove()
						end
					end)
				end
			end)
		
		if (password) then
			storage.password = password
			storage:setNetVar("locked", true)
		end
		
		if(lootable) then
			storage.lootable = lootable
		end
		
		if(name) then
			storage:setNetVar("name", name)
		end
		
		if(desc) then
			storage:setNetVar("desc", desc)
		end		
		
		if(skin) then
			storage:SetSkin(skin)
		end		
		
		if(mat) then
			storage:SetMaterial(mat)
		end
		
		if(owner) then
			storage:setNetVar("owner", owner)
		end
		
		if(overwrite) then
			storage:setNetVar("overwrite", overwrite)
		end
		
		local physObject = storage:GetPhysicsObject()
		if (physObject) then
			physObject:EnableMotion(motion)
			if(motion) then
				physObject:Wake()
			end
		end
	end

	self.loadedData = true
end
