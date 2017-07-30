ITEM.name = "Device - naC"
ITEM.uniqueID = "nac"
ITEM.model = "models/props/de_nuke/emergency_lighta.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.desc = "A strange metal cylinder, it kind of looks like a can if you stare long enough."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(128, 128, 128)
ITEM.data = { producing2 = 0, can = "food_yams" }

local canned = {
	"food_asparagus",
	"food_beans",
	"food_chicken",
	"food_chili",
	"food_corn",
	"food_mushrooms",
	"food_peaches",
	"food_pears",
	"food_peas",
	"food_instant_potatoes",
	"food_ravioli",
	"food_sausage",
	"food_beefstew",
	"food_chowder",
	"food_chickennoodle",
	"food_canned_1",
	"food_tuna",
	"food_yams",
	"food_laugh" --hahaha
}

ITEM.functions.Store = {
	name = "Store Can",
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local position = client:getItemDropPos()
		
		for k, v in pairs (canned) do
			can = inventory:hasItem(v)
			if (can) then
				break
			end
		end
		
		nut.chat.send(client, "itclose", "The can currently in the container is released, and the new one is put in.")
		nut.item.spawn(item:getData("can"), position) --releases the current can
		item:setData("can", can.uniqueID) --puts the new can in
		can:remove()
		
		return false
	end,
	onCanRun = function(item) --if the player has a canned food item, he can do this.
		local player = item.player or item:getOwner()
		local inventory = player:getChar():getInv()
		local can
		
		for k, v in pairs (canned) do
			can = inventory:hasItem(v)
			if (can) then
				return true
			end
		end
		
		return false
	end
}

ITEM.functions.Create = {
	name = "Create Can",
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local position = client:getItemDropPos()
		local metal = inventory:hasItem("j_scrap_metals")	
		
		if (!metal) then
			client:notifyLocalized("You need 5 scrap metal!") return false
		end
		
		local amount = metal:getData("Amount")
		if(amount >= 5) then
		
			metal:setData("Amount", amount - 5)
			if (amount - 5 == 0) then
				metal:remove()
			end
			
			nut.chat.send(client, "itclose", "A new can is created.")
			if(math.random(0,10) != 10) then
				nut.item.spawn(item:getData("can"), position) --creates a duplicate of the currently stored can item.
			else
				nut.item.spawn(canned[math.random(1,18)], position) --small chance to spawn random canned food
			end
		else
			client:notifyLocalized("You need 5 scrap metal!") return false
		end
		
		return false
	end
}

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("can") != nil) then
		desc = desc .. "\nStored: " .. (nut.item.list[self:getData("can")]:getName()) .. "."
	end
	
	return Format(desc)
end