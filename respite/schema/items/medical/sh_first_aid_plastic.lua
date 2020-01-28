ITEM.name = "Plastic Aid Kit"
ITEM.model = "models/items/healthkit.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.width = 2
ITEM.height = 2
ITEM.healAmount = 80
ITEM.healSeconds = 5
ITEM.price = 0
ITEM.desc = "A medical kit the contains a large amount of plastic dust, clean water, bandages, and gauze."
ITEM.container = "j_used_first_aid_kit"
ITEM.flag = "v"
ITEM.color = Color(130, 130, 130)
ITEM.quantity2 = 6

ITEM.injFix = {
	[1] = true,
}

ITEM.iconCam = {
	pos = Vector(5, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 5.8,
}

local function onUse(client)
	client:EmitSound("items/medshot4.wav", 80, 110)
	client:ScreenFade(1, Color(100, 100, 100, 200), 1, 0)
end

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
		
		onUse(target)
	end
end

ITEM.functions.usef = { -- sorry, for name order.
	name = "Use Forward",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		local trace = client:GetEyeTraceNoCursor() -- We don't need cursors.
		local target = trace.Entity

		if (!IsValid(target) or target:getChar():getFaction() != FACTION_PLASTIC) then
			client:notify("This can only be used on Plastics.")
			return false
		end
		
		if (target and target:IsValid() and target:IsPlayer() and target:Alive()) then
			healPlayer(item.player, target, item.healAmount, item.healSeconds)

			local quantity = item:getData("quantity", item.quantity2 or 1)
			if(quantity > 1) then
				item:setData("quantity", quantity - 1)
				return false
			else
				if(item.container) then
					nut.item.spawn(item.container, position)
				end
			end
		end

		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

ITEM.functions.use = { -- sorry, for name order.
	name = "Use",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		if (item.player:Alive()) then
			local position = item.player:getItemDropPos()
			healPlayer(item.player, item.player, item.healAmount, item.healSeconds)

			local quantity = item:getData("quantity", item.quantity2 or 1)
			if(quantity > 1) then
				item:setData("quantity", quantity - 1)
				return false
			else
				if(item.container) then
					nut.item.spawn(item.container, position)
				end
			end
		end
	end,
	onCanRun = function(item)
		local player = item.player
		local char = player:getChar()

		if (char:getFaction() != FACTION_PLASTIC) then
			return false
		end
		
		if (IsValid(item.entity)) then
			return false
		end
		
		return true
    end
}