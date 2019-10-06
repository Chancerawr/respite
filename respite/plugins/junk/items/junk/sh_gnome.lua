ITEM.name = "Gnome"
ITEM.uniqueID = "j_gnome"
ITEM.model = "models/props_junk/gnome.mdl"
ITEM.desc = "A friendly garden gnome to watch over your plants."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.color = Color(255, 140, 20)

ITEM.salvItem = {
	["c_scrap_gnome"] = 2
}

ITEM.iconCam = {
	pos = Vector(280.4, 236.9, 184.8),
	ang = Angle(25, 220, 0),
	fov = 5.1,
}

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/wrench.png",
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

		for i = 1, multi do
			amt, scrap = table.Random(item.salvItem)
			
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
		
		client:EmitSound("ambient/voices/m_scream1.wav", 70, math.random(120,160))
	end,
	onCanRun = function(item)
		if(!item.salvItem) then
			return false
		end
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("kit_salvager")
	end
}

ITEM.functions.Memory = {
	icon = "icon16/box.png",
	sound = "physics/concrete/rock_impact_soft3.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local object = inventory:getFirstItemOfType("j_scrap_memory")
		local emotions = {
			"fear",
			"anger",
			"sadness",
			"joy",
			"disgust",
			"surprise",
			"trust",
			"anticipation",
			"neutral",
		}
			
		local emotion = emotions[math.random(0,8)]
		object:setData("feeling", emotion)
		
		nut.chat.send(client, "itclose", "The memory is changed somehow.")		
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("j_scrap_memory") then --if item of importance isn't in the inventory.
			return false
		end
		
		return true
	end
}