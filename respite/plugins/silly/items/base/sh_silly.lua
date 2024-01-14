ITEM.name = "Silly Item"
ITEM.desc = "An item that really need to make any sense."
ITEM.model = "models/Items/grenadeAmmo.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Stuff"
--ITEM.sound = "items/battery_pickup.wav"

ITEM.functions.use = {
	name = "Use",
	tip = "useTip",
	icon = "icon16/bell.png",
	onRun = function(item)
		local client = item.player
	
		if(item.startFunc) then
			item.startFunc(item, client)
		end
	
		if(item.sound) then
			local pitch 
			if(item.pitch and istable(item.pitch)) then
				pitch = math.random(item.pitch[1], item.pitch[2])
			else
				pitch = item.pitch or 100
			end

			local entity = item:getEntity() or client
			entity:EmitSound(item.sound, 75, pitch)
		end
	
		item:setData("producing", CurTime())
		timer.Simple(item.cd or 5, function()
			item:setData("producing", nil)
		end)

		return false --makes it so item is not consumed, allows for multiple silly uses.
	end,
	onCanRun = function(item)
		local prodTime = item.cd or 5
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
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

function ITEM:getDesc(partial)
	local desc = self.desc
	
	local customData = self:getData("custom", {})
	if(customData.desc) then
		desc = customData.desc
	end
	
	return desc
end