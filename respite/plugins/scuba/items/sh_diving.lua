ITEM.name = "Diving Gear"
ITEM.desc = "A suit with an oxygen tank attached, allows you to spend extended periods of time underwater."
ITEM.model = "models/items/crossbowrounds.mdl"
ITEM.material = "models/Gibs/HGIBS.mdl"
ITEM.price = 50
ITEM.flag = "v"
ITEM.uniqueID = "divinggear"

ITEM.functions.Equip = {
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()

		--checks if they have one equipped already.
		for k, v in pairs(inventory:getItems()) do
			if(v.uniqueID == item.uniqueID and v:getData("equip")) then
				client:notify("You already have " ..item:getName().. " equipped.")
				return false
			end
		end

		client.DivingTank = true
	
		item:setData("equip", true)

		return false
	end,
	onCanRun = function(item)
		if(item:getData("equip")) then
			return false
		end
	
		if(IsValid(item.entity)) then
			return false
		end
	
		return true
	end
}

ITEM.functions.EquipUn = {
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
	
		client.DivingTank = nil
	
		item:setData("equip", false)

		return false
	end,
	onCanRun = function(item)
		if(!item:getData("equip")) then
			return false
		end
		
		if(IsValid(item.entity)) then
			return false
		end
	
		return true
	end
}

--prevents equipped items from being transferred
function ITEM:onCanBeTransfered(oldInventory, newInventory)
	if (newInventory and self:getData("equip")) then
		return false
	end
	
	local client = self.player
	if(client and IsValid(client.nutRagdoll)) then
		return false
	end

	return true
end


function ITEM:onLoadout()
	local client = self.player

	if(self:getData("equip")) then
		client.DivingTank = true
	end
end

-- Inventory drawing
if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		if (item:getData("equip")) then
			surface.SetDrawColor(110, 255, 110, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end
