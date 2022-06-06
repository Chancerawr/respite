local PLUGIN = PLUGIN

RECIPES = {}
RECIPES.recipes = {}
function RECIPES:Register( tbl )
	if !tbl.CanCraft then
		function tbl:CanCraft( player )
			local mult --used to check if we have multiple of the same item, rather than a stack.
			for k, v in pairs( self.items ) do
				local inv = player:getChar():getInv()
				local item = inv:getFirstItemOfType(k)
				
				if !inv:getFirstItemOfType(k) then
					return false
				end
				
				if (inv:getFirstItemOfType(k) and item:getData("Amount") == nil) then
					local count = inv:getItemCount(k)
					if (count >= v) then
						mult = true
					else
						return false
					end
				end
				
				if (inv:getFirstItemOfType(k)) then
					if (!mult and tonumber(item:getData("Amount")) < v and allStacks(inv, k) < v) then
						return false
					else
						mult = false
					end
				end
			end
			return true
		end
	end
	if !tbl.ProcessCraftItems then
		function tbl:ProcessCraftItems(player)
			local char = player:getChar()
		
			player:EmitSound("items/ammo_pickup.wav")

			local requiredItems = self.items
			local items = char:getInv():getItems()
			
			--checks that the player has all the items
			local count
			local success = true
			for k, required in pairs(requiredItems) do --basically goes for the least common ingredient first
				count = 0
				
				for id, item in pairs(items, false) do	
					if(item.uniqueID != k) then continue end
				
					if(count >= required) then
						break
					end
					
					--nothing left of this one
					if(item.mark and item.mark == 0) then
						continue
					end
					
					local quan = item.mark or item:getData("Amount", 1)
					
					count = count + quan
					
					local name = item.prefix or item:getName()
					if(count > required) then
						item.mark = count - required --marks the item with how much is left
					else
						item.mark = 0 --marks the item with 0 for later deletion
					end
				end
				
				--not enough of some item, so it fails
				if(count < required) then
					success = false
					break
				end
			end
			
			if(success) then
				for k, v in pairs(items) do
					if(v.mark == 0) then
						v:remove()
					elseif(v.mark) then
						v:setData("Amount", v.mark)
						v.mark = nil
					end
				end
				
				local inventory = player:getChar():getInv()
				
				for k, v in pairs(self.result) do
					if(self.stackedResults) then
						inventory:addSmart(k, 1, player:getItemDropPos(), {Amount = v, ammo = v})
					else
						inventory:addSmart(k, v, player:getItemDropPos())
					end
				
					--inventory:addSmart(k, v, player:getItemDropPos(), itemData)
					
					nut.log.addRaw(player:Name().. " crafted " ..nut.item.list[k].name.. ".")
				end
				
				if(self.xp) then
					PLUGIN:giveCraftXP(char, self.profession, self.xp)
				end
				
				player:notifyLocalized("You have created %s.", self.name)
			else
				client:notify("You do not have the required items.")
				
				for k, v in pairs(items) do
					v.mark = nil
				end
			end
		end
	end
	
	self.recipes[tbl.uid] = tbl
end

--finds the total amount of material in a person's inventory (across multiple items.)
function allStacks(inventory, uid)
	local all = inventory:getItems()
	local quantity = 0
	
	for k, v in pairs (all) do
		if (uid == v.uniqueID) then
			local amount = v:getData("Amount")
			if(amount != nil) then
				quantity = quantity + amount
			end
		end
	end
	
	return quantity
end

function RECIPES:Get( name )
	return self.recipes[ name ]
end

function RECIPES:GetAll()
	return self.recipes
end

function RECIPES:GetItem( item )
	local tblRecipe = self:Get( item )
	return tblRecipe.items
end

function RECIPES:GetResult( item )
	local tblRecipe = self:Get( item )
	return tblRecipe.result
end

function RECIPES:CanCraft(player, item)
	local tblRecipe = self:Get(item)
	if PLUGIN.reqireBlueprint then
		if !tblRecipe.noBlueprint then
			local name_bp = (tblRecipe.uid)
			if !player:getFirstItemOfType(name_bp) then
				return 2
			end
		end
	end
	if !tblRecipe:CanCraft( player ) then
		return 1
	end
	return 0
end

if(SERVER) then
	util.AddNetworkString("nut_CraftItem")
	
	net.Receive("nut_CraftItem", function(length, client)
		local item = net.ReadString()
		local cancraft = RECIPES:CanCraft(client, item)
		local tblRecipe = RECIPES:Get(item)
		if cancraft == 0 then
			tblRecipe:ProcessCraftItems(client)
		else
			if cancraft == 2 then
				client:notify("You don't have the required blueprint.")
			elseif cancraft == 1 then
				client:notify("You don't have the required materials.")
			end
		end
	end)
end