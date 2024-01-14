ITEM.name = "Violet"
ITEM.desc = "You will harm yourself with this."
ITEM.model = "models/props_junk/sawblade001a.mdl"
ITEM.class = "weapon_violetshuriken"
ITEM.uniqueID = "weapon_violetshuriken"
ITEM.slot = "sidearm"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Special"
ITEM.color = Color(69, 0, 127)
ITEM.modelColor = Color(69, 0, 127)

ITEM.dmg = {
	["Slash"] = 20,
}

ITEM.scaling = {
	["accuracy"] = 0.3,
	["stm"] = 0.3,
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
}

ITEM.functions.Feed = {
	name = "Feed",
	tip = "useTip",
	icon = "icon16/cog.png",
	sound = "physics/metal/metal_sheet_impact_soft2.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()
		
		local haze = inventory:getFirstItemOfType("haze_bottled")
		local amount = haze:getData("Amount", 1)
		
		if(amount > 1) then
			haze:setData("Amount", amount - 1)
		else
			haze:remove()
		end

		local dmg = item:getData("dmg", item.dmg)
		for k, v in pairs(dmg) do
			dmg[k] = dmg[k] + 0.1
		end
		item:setData("dmg", dmg)

		local scaling = item:getData("scale", item.scaling)
		for k, v in pairs(scaling) do
			scaling[k] = scaling[k] + 0.005
		end
		item:setData("scale", scaling)

		return false
	end,
	onCanRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()
		
		local haze = inventory:getFirstItemOfType("haze_bottled")
		if(haze) then
			return true
		end
		
		return false
	end
}