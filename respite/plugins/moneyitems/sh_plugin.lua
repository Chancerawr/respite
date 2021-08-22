local PLUGIN = PLUGIN
PLUGIN.name = "Money Items"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Lets you drop money as an item."

nut.command.add("moneyconvert", {
	adminOnly = true,
	syntax = "<number value>",
	onRun = function(client, arguments)
		local money = client:getChar():getMoney()
	
		local drop = tonumber(arguments[1])
		if(!drop) then
			client:notify("Specify a money amount.")
			return false
		end
		
		drop = math.Round(drop)
		
		if(drop < 1) then
			client:notify("You cannot do that.")
			return false
		end
		
		if(money < drop) then
			client:notify("You do not have enough money.")
			return false
		end
		
		local char = client:getChar()
		local inventory = char:getInv()
		local position = client:getItemDropPos()
		
		char:takeMoney(drop)
		
		local data = {}
		data.value = drop
		
		inventory:addSmart("money_custom", 1, position, data)
		
		client:notify("You have converted " ..nut.currency.get(drop).. " into an item.")
	end
})

nut.command.add("spawnmoney", {
	adminOnly = true,
	syntax = "<number value>",
	onRun = function(client, arguments)
		local drop = tonumber(arguments[1])
		if(!drop) then
			client:notify("Specify a money amount.")
			return false
		end
		
		local position = client:getItemDropPos()
		
		drop = math.Round(drop)
		
		if(drop < 1) then
			client:notify("Cannot spawn money with zero or less value.")
			return false
		end
		
		nut.item.spawn("money_custom", position, function(item)
			item:setData("value", drop)
		end)
		
		client:notify("You have spawned " ..nut.currency.get(drop).. ".")
	end
})