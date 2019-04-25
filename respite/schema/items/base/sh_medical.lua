ITEM.name = "Medical Stuff"
ITEM.model = "models/healthvial.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = "A Medical Stuff"
--ITEM.container = ""
ITEM.healAmount = 50
ITEM.healSeconds = 10
ITEM.flag = "v"
ITEM.category = "Medical"
ITEM.color = Color(232, 0, 0)
ITEM.quantity2 = 1

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

			local quantity = item:getData("quantity", item.quantity or 1)
			if(quantity > 1) then
				item:setData("quantity", quantity - 1)
				return false
			else
				if(item.container) then
					nut.item.spawn(item.container, position)
				end
			end
			
			return true
		end

		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

ITEM.functions.Custom = {
	name = "Customize",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player
		client:requestString("Change Name", "What name do you want this item to have?", function(text)
			item:setData("customName", text)
			client:requestString("Change Description", "What Description do you want this item to have?", function(text)
				item:setData("customDesc", text)
				client:requestString("Change Model", "What Model do you want this item to have?\nBe sure it is a valid model.", function(text) --start of model
					item:setData("customMdl", text)
				end, item:getData("customMdl", item.model)) --end of model
			end, item:getDesc()) --end of desc
		end, item:getName()) --end of name
			
		--hopefully resets the player's icons
		client:ConCommand("nut_flushicon")
		
		return false
	end,
	
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return client:getChar():hasFlags("1")
	end
}

local quality = {}
quality[0] = "Terrible"
quality[1] = "Awful"
quality[2] = "Bad"
quality[3] = "Poor"
quality[4] = "Normal"
quality[5] = "Decent"
quality[6] = "Good"
quality[7] = "Great"
quality[8] = "Excellent"
quality[9] = "Master"
quality[10] = "Perfect"

function ITEM:getName()
	local name = self.name
	
	if(self:getData("customName") != nil) then
		name = self:getData("customName")
	end

	return Format(name)
end

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("customDesc") != nil) then
		desc = self:getData("customDesc")
	end		
	
	if(self:getData("quantity", self.quantity) != nil) then
		desc = desc .. "\nRemaining Uses: " .. self:getData("quantity", self.quantity)
	end	
	
	if(self:getData("quality") != nil) then
		desc = desc .. "\nQuality: " .. quality[math.Round(self:getData("quality"))]
	end
	
	return Format(desc)
end

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		local quantity = item:getData("quantity", item.quantity2)

		if (quantity and quantity > 1) then
			draw.SimpleText(quantity, "DermaDefault", w - 12, h - 14, Color(255,50,50), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
		end
	end
end