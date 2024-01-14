--this is irrelevant for the most part until the next comment as base items are not rendered ingame.
ITEM.name = "Effect Base"
ITEM.desc = ""
ITEM.category = "Effects"
ITEM.model = "models/props_combine/breenglobe.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.duration = 30

--health, if you want it to give that
--ITEM.health = 0

--[[
--what can go into an effect
--if you don't want a certain one, just delete its variable from the table
ITEM.effect = {
	colorMod = {
	
	},
	
	bloom = {
		darken = 0.65,
		mult = 0.2,
		sizeX = 9,
		sizeY = 9,
		passes = 1,
		colorMult = 1,
		r = 1,
		g = 1,
		b = 1
	},
	
	texturize = "", --requires a texture
	
	sobel = 0.5,
	
	sharpen = {
		contrast = 1,
		dist = 1
	},

	sharpen = {
		addAlpha = 1,
		drawAlpha = 1,
		delay = 1,
	},
}
--]]

--attribute buffs
--[[
ITEM.attribs = {
	["str"] = 1,
}
--]]

--custom functions
--[[
ITEM.funcStart = function(item)

end

ITEM.funcEnd = function(item)

end
--]]

ITEM.functions._use = { 
	name = "Use",
	tip = "useTip",
	icon = "icon16/bug.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		if (char and client:Alive()) then
			--attribute boosts
			if (item.attribs) then
				for k, v in pairs(item.attribBoosts) do
					char:addBoost(item.uniqueID, k, v)
				end
			end
			
			--custom screen effects
			if(item.effect) then
				client:nutEffectAdd(item.id, item.effect)
			end
			
			--custom function to run at start
			if(item.funcStart) then
				item:funcStart(item)
			end
			
			local charID = char:getID()
			local name = item.name
			timer.Create("DrugEffect_" .. item.uniqueID .. "_" .. client:EntIndex(), item.duration, 1, function()
				if (client and IsValid(client)) then
					local curChar = client:getChar()
					if (curChar and curChar:getID() == charID) then
						client:notify(Format("%s has worn off.", name))
						
						--boost removal
						if (item.attribs) then
							for k, v in pairs(item.attribs) do
								char:removeBoost(item.uniqueID, k)
							end
						end
						
						--screen effect removal
						if(item.effect) then
							client:nutEffectRemove(item.id)
						end
						
						--custom function to run at end
						if(item.funcEnd) then
							item:funcEnd(item)
						end
					end
				end
			end)
			
			return true
		end

		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}