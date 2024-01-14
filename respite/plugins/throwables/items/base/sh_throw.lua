ITEM.name = "Throwable Object"
ITEM.desc = ""
ITEM.model = "models/Items/grenadeAmmo.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.throwent = "nut_flare"
ITEM.throwforce = 2500

ITEM.functions.Deploy = {
	name = "Deploy",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		local thrown = ents.Create( item.throwent )
		thrown:SetPos( client:EyePos() + client:GetAimVector() * 50 )
		thrown:Spawn()

		local phys = thrown:GetPhysicsObject()
		phys:SetVelocity( client:GetAimVector() * item.throwforce * math.Rand( .8, 1 ) )
		phys:AddAngleVelocity( client:GetAimVector() * item.throwforce  )

		if(item.throwFunc) then
			item:throwFunc(client, thrown)
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

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("customDesc") != nil) then
		desc = self:getData("customDesc")
	end	
	
	return desc
end