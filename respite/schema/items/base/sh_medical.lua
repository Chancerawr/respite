ITEM.name = "Medical Stuff"
ITEM.model = "models/healthvial.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = "A Medical Stuff"
ITEM.container = ""
ITEM.healAmount = 50
ITEM.healSeconds = 10
ITEM.flag = "v"
ITEM.category = "Medical"

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

local function onUse(item)
	item.player:EmitSound("items/medshot4.wav", 80, 110)
	item.player:ScreenFade(1, Color(0, 255, 0, 100), .4, 0)
end

ITEM:hook("use", onUse)
ITEM:hook("usef", onUse)

// On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.use = { -- sorry, for name order.
	name = "Use",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		if (item.player:Alive()) then
		local position = item.player:getItemDropPos()
			healPlayer(item.player, item.player, item.healAmount, item.healSeconds)
			if(item.container) then
				nut.item.spawn(item.container, position)
			end	
		end
	end,
	onCanRun = function(item)
		if (item.player != nil) then
			client = item.player
			char = client:getChar()
		elseif(item:getOwner() != nil) then
			client = item:getOwner()
			char = client:getChar()
		end

		if (char:getFaction() != FACTION_PLASTIC and item.uniqueID != "medical_plastic") then
			return true
		elseif (char:getFaction() == FACTION_PLASTIC and item.uniqueID == "medical_plastic") then
			return true
		else
			return false
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

		if (target and target:IsValid() and target:IsPlayer() and target:Alive() and target:getChar():getFaction() != FACTION_PLASTIC) then
			healPlayer(item.player, target, item.healAmount, item.healSeconds)

			return true
		end

		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}
