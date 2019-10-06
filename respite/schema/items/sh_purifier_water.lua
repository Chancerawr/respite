ITEM.name = "Purifier"
ITEM.uniqueID = "purifier_water"
ITEM.model = "models/props_junk/plasticbucket001a.mdl"
ITEM.material = "models/props_combine/com_shield001a"
ITEM.desc = "A strange object, it appears to be both liquid and solid at the same time."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(135, 200, 255)

ITEM.iconCam = {
	pos = Vector(-200, 0, 3.5),
	ang = Angle(0, -0, 0),
	fov = 7,
}

local alcohols = {
	"alc_beer",
	"alc_whiskey",
	"alc_vodka",
	"alc_midori",
	"alc_moonshine",
	"alc_bourbon",
	"alc_rum",
	"alc_tequila",
	"alc_wine"
}

ITEM.functions.Water = {
	icon = "icon16/bullet_black.png",
	sound = "ambient/levels/canals/toxic_slime_sizzle2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local corWater = inventory:getFirstItemOfType("food_water_misc")
		
		if(!corWater) then
			client:notify("You don't have any corrupted water.")
			return false
		end
		
		item:setData("purity", item:getData("purity", 10) - 1)
		
		corWater:remove()
		inventory:add("food_water")
		
		nut.chat.send(client, "itclose", "The container passes through the object, and the substance inside of it is purified.")
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		
		if !client:getChar():getInv():getFirstItemOfType("food_water_misc") then --if corrupted water isn't in the inventory.
			return false
		end
		
		local purity = item:getData("purity", 10)
		
		if (purity >= 1) then
			return true
		else
			return false
		end
	end
}

ITEM.functions.Haze = {
	name = "Blue Haze",
	icon = "icon16/bullet_blue.png",
	sound = "ambient/levels/canals/toxic_slime_sizzle2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local corWater = inventory:getFirstItemOfType("haze_bottled")
			
		item:setData("purity", item:getData("purity", 10) - 5)
		
		corWater:remove()
		inventory:add("food_apple_cursed")
		
		nut.chat.send(client, "itclose", "The container passes through the object, and the substance inside of it is purified.")

		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("haze_bottled") then --if blue haze isn't in the inventory.
			return false
		end
		
		if (item:getData("purity", 10) >= 5) then -- <50% purity cannot purify blue haze
			return true
		else
			return false
		end
	end
}

ITEM.functions.HazePink = {
	name = "Pink Haze",
	icon = "icon16/bullet_pink.png",
	sound = "ambient/levels/canals/toxic_slime_sizzle2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local corWater = inventory:getFirstItemOfType("haze_bottled_pink")
			
		item:setData("purity", item:getData("purity", 10) - 5)
		
		corWater:remove()
		inventory:add("voltaic")
		
		nut.chat.send(client, "itclose", "The container passes through the object, and an apple comes out?")

		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("haze_bottled_pink") then --if blue haze isn't in the inventory.
			return false
		end
		
		if (item:getData("purity", 10) >= 5) then -- <50% purity cannot purify blue haze
			return true
		else
			return false
		end
	end
}

ITEM.functions.Alcohol = {
	icon = "icon16/bullet_yellow.png",
	sound = "ambient/levels/canals/toxic_slime_sizzle2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local drink
		
		for k, v in pairs (alcohols) do
			drink = inventory:getFirstItemOfType(v)
			if (drink) then
				break
			end
		end
		
		item:setData("purity", item:getData("purity", 10) - 2)
		drink:remove()
		
		if(math.random(0,1) == 1) then
			inventory:add("drug_disinfectant")
		else
			inventory:add("drug_rubbingalcohol")
		end
		
		nut.chat.send(client, "itclose", "The container passes through the object, and the substance inside of it is purified.")

		return false
	end,
	onCanRun = function(item)
		local player = item.player
		local inventory = player:getChar():getInv()
		local drink
		
		for k, v in pairs (alcohols) do
			drink = inventory:getFirstItemOfType(v)
			if (drink) then
				break
			end
		end
		
		if (item:getData("purity", 10) >= 2 and drink) then -- <20% purity cannot purify alcohol
			return true
		else
			return false
		end
	end
}

ITEM.functions.Tablet = {
	icon = "icon16/bullet_white.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local tablet = inventory:getFirstItemOfType("purifier_water_tablet")
		local purity = item:getData("purity", 10)
		
		if(!tablet) then
			client:notify("You don't have a purification tablet.")
			return false
		end
		
		tablet:remove()
		
		if(purity <= 7) then
			item:setData("purity", purity + 3)
		else
			item:setData("purity", 10)
		end
		
		nut.chat.send(client, "itclose", "The strange object appears clearer now.")
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("purifier_water_tablet") then --if a purification tablet isn't in the inventory.
			return false
		end
		
		if (item:getData("purity", 10) < 10) then -- 100% purity cannot be increased
			return true
		else
			return false
		end
	end
}

ITEM.functions.Battery = {
	name = "Charged Battery",
	icon = "icon16/asterisk_orange.png",
	sound = "ambient/energy/zap9.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local required = inventory:getFirstItemOfType("ammo_battery")
			
		required:remove()
		nut.item.spawn("drug_venom", position)
		nut.item.spawn("drug_venom", position)

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces some kind of liquid.")

		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("ammo_battery") then 
			return false
		end
		
		return true
	end
}

function ITEM:getDesc()
	local desc = self.desc
	
	desc = desc .. "\nPurity: " .. (self:getData("purity", 10) * 10) .. "%."

	return desc
end