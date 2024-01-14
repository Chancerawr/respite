ITEM.name = "Makeshift Sentry"
ITEM.desc = "An automated turret that fires based on movement."
ITEM.uniqueID = "sentry"
ITEM.model = "models/combine_turrets/floor_turret.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.width = 1
ITEM.height = 4
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(70, 120, 70)

ITEM.dmg = {
	["Pistol"] = 20,
}

local ammoTypes = {
	{name = "Shotgun", data = {"Shotgun", 20}},
	{name = "Pistol", data = {"Pistol", 20}},
	{name = "Magnum", data = {"Magnum", 20}},
	{name = "Rifle", data = {"Rifle", 20}},
	{name = "Sniper", data = {"Sniper", 20}},
}

ITEM.functions.Place = {
	name = "Deploy",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		
		local customData = item:getData("custom", {})

		local deployed = item:getData("deployed")
		if(IsValid(deployed)) then
			deployed:SetPos(client:getItemDropPos())
			deployed:SetAngles(client:GetAngles())
		else
			local sentry = ents.Create("nut_combat_sentry")
			sentry:SetPos(client:getItemDropPos())
			sentry:SetAngles(client:GetAngles())
			sentry:Spawn()

			sentry.itemID = item.id
			sentry:setNetVar("name", (customData.name or "Makeshift Sentry"))
			sentry.dmg = item:getData("dmg", item.dmg)
			
			sentry:SetCreator(client)
			
			item:setData("deployed", sentry)
			
			--remove item from inventory while it's deployed (but dont delete it)
			--item:removeFromInventory(true)
		end

		return false
	end
}

ITEM.functions.Name = {
	tip = "Name this item",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		
		local customData = item:getData("custom", {})
		
		client:requestString("Change Name", "What do you want to name your sentry? (This is final)", function(text)
			customData.name = text
			item:setData("custom", customData)
			nut.log.addRaw(client:Name().. " has set name of " ..item.name.. " to " ..text.. ".")
		end, customData.name or item.name)
		
		return false
	end,
	onCanRun = function(item)
		local customData = item:getData("custom", {})
		
		if (customData.name) then
			return false
		else
			return true
		end
		
		return true
	end
}

ITEM.functions.Modify = {
    name = "Modify",
    tip = "Modify your sentry turret",
    icon = "icon16/star.png",
	sound = "ambient/machines/thumper_amb.wav",
    isMulti = true,
    multiOptions = function(item, client)
        return ammoTypes
    end,
    onRun = function(item, data)
        local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		
		local object = inventory:getFirstItemOfType("j_scrap_dream")

		if(data) then
			local dmgT = data[1]
			local dmgV = data[2]
		
			local dmg = {
				[dmgT] = dmgV,
			}
		
			item:setData("dmg", dmg)

			local amount = object:getData("Amount", 1)
			if(amount > 1) then
				object:SetData("Amount", amount - 1)
			else
				object:remove()
			end
		end
	 
        return false
    end,
	onCanRun = function(item)      
		if(IsValid(item.entity)) then
			return false
		end
		
		local player = item.player
		local inv = player:getChar():getInv()
		
		if(!inv:getFirstItemOfType("j_scrap_dream")) then
			return false
		end
		
		return true
    end
}

function ITEM:getName()
	local name = self.name
	
	local customData = self:getData("custom", {})
	if(customData.name) then
		name = customData.name
	end

	return name
end

function ITEM:getDesc()
	local desc = self.desc

	return desc
end

function ITEM:onEntityCreated(entity)
	local deployed = self:getData("deployed")
	if(IsValid(deployed)) then
		SafeRemoveEntity(deployed)
	end
	
	local physObj = entity:GetPhysicsObject()
	if(IsValid(physObj)) then
		physObj:SetMass(100)
	end
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 29),
	ang = Angle(0, -0, 0),
	fov = 7,
}