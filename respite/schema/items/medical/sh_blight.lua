ITEM.name = "Blight"
ITEM.model = "models/items/healthvial2.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.healAmount = 0
ITEM.healSeconds = 1
ITEM.price = 75
ITEM.desc = "A strange vial that is filled with some black liquid."
ITEM.flag = "V"
ITEM.uniqueID = "blight"
ITEM.container = "j_empty_vial"
ITEM.color = Color(0, 0, 0)

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}

local function onUse(item)
	item.player:EmitSound("items/medshot4.wav", 80, 75)
	item.player:ScreenFade(1, Color(0, 0, 0, 200), 1, 0)
end

ITEM:hook("use", onUse)
ITEM:hook("usef", onUse)

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

ITEM.functions.use = { -- sorry, for name order.
	name = "Use",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		if (item.player:Alive()) then
			healPlayer(item.player, item.player, item.healAmount, item.healSeconds)
			
			local quantity = item:getData("quantity", item.quantity2)

			if(quantity > 1) then
				item:setData("quantity", quantity - 1)
				return false
			else
				if(item.container) then
					local position = item.player:getItemDropPos()
					nut.item.spawn(item.container, position)
				end
			end
		end
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		local char = player:getChar()

		if (char:getFaction() == FACTION_PLASTIC) then
			return false
		end
		
		if(IsValid(item.entity)) then
			return false
		end
    end
}