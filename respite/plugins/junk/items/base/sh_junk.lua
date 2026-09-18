ITEM.name = "Junk Item"
ITEM.model = "models/Items/grenadeAmmo.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = "A junk item."
ITEM.category = "Junk"
ITEM.multiChance = 20
ITEM.flag = "j"
ITEM.color = Color(125, 125, 125)
	
ITEM.customizable = {
	["name"] = true,
	["desc"] = true,
	["model"] = true,
	["modelScale"] = true,
	["modelColor"] = true,
	["material"] = true,
	["color"] = true,
	["img"] = true,
}
	
ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/wrench.png",
	--sound = "npc/manhack/grind"..math.random(1,5)..".wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inv = char:getInv()
		local position = client:getItemDropPos()
		local scrap
		local amt
		
		local roll = math.random(1,100)
		local chance = item.multiChance
		local multi = 1
		
		if(TRAITS and client:hasTrait("scrapper")) then --trait increases chance of multi result
			chance = chance + 10
		end
		
		if(roll < chance) then
			multi = 2
		end

		for i = 1, multi do
			amt, scrap = table.Random(item.salvItem)
			
			local itemTable = nut.item.list[scrap]
			if(itemTable) then
				if(itemTable.maxstack) then
					timer.Simple(i/2, function()
						inv:addSmart(scrap, 1, position, {Amount = amt})
					end)
				else
					inv:addSmart(scrap, amt, position)
				end
			end
		end
		
		--Randomized sounds don't work up there so I had to do this.
		client:EmitSound("npc/manhack/grind"..math.random(1,5)..".wav", 70, math.random(85,105))
	end,
	onCanRun = function(item)
		if(!item.salvItem) then
			return false
		end
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("kit_salvager")
	end
}

ITEM.functions.Custom = {
	name = "Customize",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)		
		nut.plugin.list["customization"]:startCustom(item.player, item)
		
		return false
	end,
	
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.Fill = {
	icon = "icon16/box.png",
	sound = "ambient/water/distant_drip4.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		
		inventory:addSmart("food_water_misc", 1, position)
		
		client:notify("Your container has been filled.")
	end,
	onCanRun = function(item)
		if(!item.fillable) then
			return false
		end
	
		local client = item.player
		if(client:WaterLevel() < 1) then
			return false
		end
		
		return true
	end
}

function ITEM:getDesc(partial)
	local desc = self.desc
	
	local customData = self:getData("custom", {})
	if(customData.desc) then
		desc = customData.desc
	end
		
	if(!partial) then
		if(customData.quality) then
			desc = desc.. " \nQuality: " ..customData.quality
		end
		
		if(self.fillable) then
			desc = desc.. " \nThis container can be filled with water."
		end
	end
	
	return desc
end

function ITEM:getName()
	local name = self.name
	
	local customData = self:getData("custom", {})
	if(customData.name) then
		name = customData.name
	end
	
	return name
end

function ITEM:onGetDropModel()
	local model = self.model
	
	local customData = self:getData("custom", {})
	if(customData.model) then
		model = customData.model
	end
	
	return Format(model)
end

function ITEM:onEntityCreated(entity)
	local customData = self:getData("custom", {})

	local modelColor = customData.modelColor or self.modelColor
	if(modelColor) then
		entity:SetColor(modelColor)
	end
	
	local scale = customData.modelScale or self.modelScale
	scale = tonumber(scale)
	
	--crashes the server sometimes, don't know why
	--[[
	if(scale) then
		--clamp this so you cant just crash the server with it
		scale = math.Clamp(scale, 0.1, 10)
		
		entity:SetModelScale(scale)

		local physobj = entity:GetPhysicsObject()
		if (!IsValid(physobj)) then return false end

		--grabbed from a collision resizer tool
		local physmesh = physobj:GetMeshConvexes()
		if (!istable(physmesh)) or (#physmesh < 1) then return false end

		for convexkey, convex in pairs(physmesh) do
			for poskey, postab in pairs(convex) do
				convex[poskey] = postab.pos * scale
			end
		end

		local asleep = physobj:IsAsleep()

		entity:PhysicsInitMultiConvex(physmesh)
		
		if(!asleep) then
			entity:GetPhysicsObject():Wake()
		end
	end
	--]]

	if(self.entMass) then
		local physObj = entity:GetPhysicsObject()
		if(IsValid(physObj)) then
			physObj:SetMass(self.entMass)
		end
	end
	
	if(self.physMat) then
		local property = {
			["GravityToggle"] = true, 
			["Material"] = self.physMat,
		}
		construct.SetPhysProp(nil, entity, 0, entity:GetPhysicsObject(), property)
	end
end