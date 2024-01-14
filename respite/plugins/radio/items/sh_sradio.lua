ITEM.name = "Stationary Radio"
ITEM.model = "models/props_lab/citizenradio.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.category = "Communication"
ITEM.price = 250
ITEM.flag = "v"
ITEM.uniqueID = "comm_radio_stationary"

ITEM.salvage = {
	["j_scrap_battey"] = 3,
	["j_scrap_elecs"] = 5,
	["j_scrap_metals"] = 8,
}

ITEM.iconCam = {
	pos = Vector(200, 0, 8),
	ang = Angle(180, -0, 180),
	fov = 10,
}

function ITEM:getDesc()
	local str
	
	if (!self.entity or !IsValid(self.entity)) then
		str = "A radio that allows you to send a signal to other characters in distance.\nPower: %s\nFrequency: %s"
		return Format(str, (self:getData("power") and "On" or "Off"), self:getData("freq", "000.0"))
	else
		local data = self.entity:getData()
		
		str = "A functional radio. Power: %s Frequency: %s"
		return Format(str, (self.entity:getData("power") and "On" or "Off"), self.entity:getData("freq", "000.0"))
	end
end

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		if (item:getData("power")) then
			surface.SetDrawColor(110, 255, 110, 100)
		else
			surface.SetDrawColor(255, 110, 110, 100)
		end

		surface.DrawRect(w - 14, h - 14, 8, 8)
	end

	local GLOW_MATERIAL = Material("sprites/glow04_noz.vmt")
	local COLOR_ACTIVE = Color(0, 255, 0)
	local COLOR_INACTIVE = Color(255, 0, 0)

	function ITEM:drawEntity(entity, item)
		entity:DrawModel()

		local position = entity:GetPos() + entity:GetForward() * 10 + entity:GetUp() * 11 + entity:GetRight() * 9.5

		render.SetMaterial(GLOW_MATERIAL)
		render.DrawSprite(position, 14, 14, entity:getData("power", false) and COLOR_ACTIVE or COLOR_INACTIVE)
	end
end

// On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.toggle = { -- sorry, for name order.
	name = "Toggle",
	tip = "useTip",
	icon = "icon16/connect.png",
	onRun = function(item)
		item:setData("power", !item:getData("power", false), nil, nil, true)
		item.player:EmitSound("buttons/button14.wav", 70, 150)
		
		if(item.entity) then
			item.entity:setNetVar("data", item.data)
		end

		return false
	end
}

ITEM.functions.use = { -- sorry, for name order.
	name = "Freq",
	tip = "useTip",
	icon = "icon16/wrench.png",
	onRun = function(item)
		netstream.Start(item.player, "radioAdjust", item:getData("freq", "000,0"), item.id)

		return false
	end
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
		
		client:requestQuery("Are you sure you want to scrap this item?", "Scrap", function(text) --confirmation message
			local roll = math.random(1,100)
			local chance = item.multiChance or 0
			local multi = 1
			
			if(TRAITS and client:hasTrait("scrapper")) then --trait increases chance of multi result
				chance = chance + 10
			end
			
			if(roll < chance) then
				multi = 2
			end
			
			if(istable(item.salvage)) then
				for i = 1, multi do
					amt, scrap = table.Random(item.salvage)
					
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
			end
			
			local customBoosts = item:getData("attrib", item.attrib or {})
			if (!table.IsEmpty(customBoosts)) then			
				for k, v in pairs(customBoosts) do
					client:getChar():removeBoost(item:getName(), k)
				end
			end
			
			--Randomized sounds don't work up there so I had to do this.
			client:EmitSound("npc/manhack/grind"..math.random(1,5)..".wav", 70, math.random(85,105))
					
			item:remove()
		end)
		
		return false
	end,
	onCanRun = function(item)
		if(!item.salvage) then
			return false
		end
		
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("kit_salvager")
	end
}