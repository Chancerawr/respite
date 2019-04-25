local PLUGIN = PLUGIN
PLUGIN.name = "Experimental Things"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Don't worry about this."

if(SERVER) then
	inventoryQueue = {}
	local invMETA = nut.meta.inventory or {}

	function invMETA:addCareful(uniqueID, quantity, data, x, y, noReplication, forceSplit)
		local args = {self, uniqueID, quantity, data, x, y, noReplication, forceSplit}
		table.insert(inventoryQueue, args)
		
		PrintTable(inventoryQueue)
	end

	function PLUGIN:Think()
		if(#inventoryQueue > 0) then
			--PrintTable(inventoryQueue)
			
			--local inventory = inventoryQueue[1]
			
			--inventory:add(inventoryQueue[2], 1)
			table.remove(inventoryQueue, 1)
		end
	end
end

nut.command.add("addcareful", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		client:getChar():getInv():addCareful("food_banana", 1)
	end
})