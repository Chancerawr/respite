ITEM.name = "Junk Item"
ITEM.model = "models/Items/grenadeAmmo.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = "A junk item."
ITEM.category = "Junk"
ITEM.data = { scrapamount = 1 } --this is in the form of data so that it can be modified by spawners
ITEM.salvItem = "c_scrap"
ITEM.multiChance = 20
	
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
		
		if(TRAITS and hasTrait(client, "scrapper")) then --trait increases chance of multi result
			chance = chance + 10
		end
		
		if(roll < chance) then
			multi = 2
		end
		
		if(istable(item.salvItem)) then
			for i = 1, multi do
				amt, scrap = table.Random(item.salvItem)
				timer.Simple(i/2, function()
					if(!inv:add(scrap, 1, { Amount = amt })) then
						nut.item.spawn(scrap, position,
							function(item2)
								item2:setData("Amount", amt)
							end
						)
					end
				end)
			end
		else
			for i = 1, multi do
				scrap = item.salvItem
				if(!inv:add(scrap, 1, { Amount = item:getData("scrapamount") })) then
					nut.item.spawn(scrap, position,
						function(item2)
							item2:setData("Amount", item:getData("scrapamount"))
						end
					)
				end
			end
		end
		
		--Randomized sounds don't work up there so I had to do this.
		item.player:EmitSound("npc/manhack/grind"..math.random(1,5)..".wav", 70)
	end,
	onCanRun = function(item)
		if(!item.salvItem) then
			return false
		end
		local client = item:getOwner() or item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():hasItem("kit_salvager")
	end
}

ITEM.functions.Custom = {
	name = "Customize",
	tip = "Customize this item",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		client:requestString("Change Name", "What name do you want this item to have?", function(text)
			item:setData("customName", text)
			client:requestString("Change Description", "What Description do you want this item to have?", function(text)
				item:setData("customDesc", text)	
			end, item:getDesc())
		end, item:getName())
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomCol = {
	name = "Customize Color",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		local color = item:getData("customCol", Color(255,255,255))
		client:requestString("Change Color", "Enter ', ' separated RGB values.", function(text) --start of model
			local colorTbl = string.Split(text, ", ")
			if(table.Count(colorTbl) == 3) then
				red = tonumber(colorTbl[1])
				green = tonumber(colorTbl[2])
				blue = tonumber(colorTbl[3])
				if(red and green and blue) then --i put in a lot of extra shit here to idiot proof it.
					color.r = red
					color.g = green
					color.b = blue
				end
			end
		
			item:setData("customCol", color)
		end, color.r .. ", " .. color.b .. ", " .. color.g) --end of color
		
		--hopefully resets the player's icons
		client:ConCommand("nut_flushicon")
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return client:getChar():hasFlags("1")
	end
}

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("customDesc") != nil) then
		desc = self:getData("customDesc")
	end
	
	return Format(desc)
end

function ITEM:getName()
	local name = self.name
	
	if(self:getData("customName") != nil) then
		name = self:getData("customName")
	end
	
	return Format(name)
end

