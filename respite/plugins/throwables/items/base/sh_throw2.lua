ITEM.name = "Throwable Objects 2"
ITEM.model = "models/Items/grenadeAmmo.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.class = "nut_beac"
ITEM.desc = "A throwable object."

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

ITEM.functions.Equip = {
	name = "Equip",
	tip = "equipTip",
	icon = "icon16/tick.png",
	onRun = function(item)
		local client = item.player
		
		if (client:HasWeapon(item.class)) then
			client:notify("You're already holding this grenade!") return false
		end

		local weapon = client:Give(item.class)

		if (IsValid(weapon)) then
			client:SelectWeapon(weapon:GetClass())
			client:EmitSound("items/ammo_pickup.wav", 80)
			weapon:SetClip1(1)
		else
			print(Format("[Nutscript] Weapon %s does not exist!", item.class))
		end
		
		return true
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

ITEM.functions.Paint = {
	name = "Paint",
	icon = "icon16/color_swatch.png",
	onRun = function(item)
		local client = item.player
		local paint = client:getChar():getInv():getFirstItemOfType("j_paint_can")
		local paintCol = paint:getData("paint", "white")
		client:requestString("Paint", "Are you sure you want to paint this grenade " ..paintCol.."?",
			function(text)
				paint:remove()
				item:setData("customDesc", item:getDesc() .. "\nThis weapon is painted "..paintCol..".")
				nut.item.spawn("j_empty_paint_can", client:getItemDropPos())
			end
		)
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return (client:getChar():getInv():getFirstItemOfType("j_paint_can"))
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
	
	local customData = self:getData("custom", {})
	if(customData.desc) then
		desc = customData.desc
	end
	
	return desc
end

function ITEM:onEntityCreated(entity)
	local customData = self:getData("custom", {})

	local modelColor = customData.modelColor or self.modelColor
	if(modelColor) then
		entity:SetColor(modelColor)
	end
	
	local scale = customData.modelScale or self.modelScale
	scale = tonumber(scale)
	
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