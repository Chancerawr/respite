ITEM.name = "All Purge"
ITEM.model = "models/items/healthvial2.mdl"
ITEM.material = "models/props_lab/cornerunit_cloud"
ITEM.width = 1
ITEM.height = 1
ITEM.healAmount = 15
ITEM.healSeconds = 1
ITEM.price = 0
ITEM.desc = "A strange consumable medicine that purges all illnesses from a person. Rare and very valuable."
ITEM.uniqueID = "medical_purge"
ITEM.flag = "v"
ITEM.container = "j_empty_vial"
ITEM.color = Color(232, 0, 0)

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}

local function healPlayer(client, target, amount, seconds)
	hook.Run("OnPlayerHeal", client, target, amount, seconds)

	if (client:Alive() and target:Alive()) then
		local id = "nutHeal_"..FrameTime()
		timer.Create(id, 1, seconds, function()
			if (!target:IsValid() or !target:Alive()) then
				timer.Destroy(id)	
			end

			target:SetHealth(math.Clamp(target:Health() + (amount/seconds), 0, target:GetMaxHealth()))
		end)
	end
end

// On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.use = { -- sorry, for name order.
	name = "Use",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player

		if (client:Alive()) then
			local position = item.player:getItemDropPos()
			healPlayer(item.player, item.player, item.healAmount, item.healSeconds)
			if(item.container) then
				nut.item.spawn(item.container, position)
			end	
			
			for k, v in pairs(DISEASES.diseases) do --removes all of them for now
				if(hasDisease(client, v.uid)) then
					if(!v.unpurgeable) then
						cureDisease(client, v.uid)
					end
				end
			end
		end
	end
}

// On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.usef = { -- sorry, for name order.
	name = "Use Forward",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local trace = client:GetEyeTraceNoCursor() -- We don't need cursors.
		local target = trace.Entity

		if (target and target:IsValid() and target:IsPlayer() and target:Alive()) then
			healPlayer(item.player, target, item.healAmount, item.healSeconds)

			return true
		end
		
		for k, v in pairs(DISEASES.diseases) do --removes all of them for now
			if(hasDisease(target, v.uid)) then
				if(!v.unpurgeable) then
					cureDisease(target, v.uid)
				end
			end
		end

		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}