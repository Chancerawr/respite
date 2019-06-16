ITEM.name = "Radio Booster"
ITEM.uniqueID = "radio_booster"
ITEM.model = "models/items/combine_rifle_cartridge01.mdl"
ITEM.material = "phoenix_storms/blue_steel"
ITEM.desc = "A useful piece of equipment that can be attached to radios to reduce or remove distortion."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 100

ITEM.iconCam = {
	pos = Vector(0, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 4.25,
}

-- Inventory drawing
if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		local char = LocalPlayer():getChar()
		if (char and char:getData("boost")) then
			surface.SetDrawColor(110, 255, 110, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end

-- On item is dropped, 
ITEM:hook("drop", function(item)
	local char = item.player:getChar()
	if (char and char:getData("boost")) then
		char:setData("boost", nil)
	end
end)

-- On player eqipped the item, Gives a weapon to player and load the ammo data from the item.
ITEM.functions.Equip = {
	name = "Equip",
	tip = "equipTip",
	icon = "icon16/tick.png",
	onRun = function(item)
		local char = item.player:getChar()
		
		if (!char:getData("boost")) then
			char:setData("boost", true, false, player.GetAll())
		end
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player
		local char = player:getChar()
		return (!IsValid(item.entity) and char:getData("boost") != true)
	end
}

-- On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.EquipUn = { -- sorry, for name order.
	name = "Turn Off",
	tip = "equipTip",
	icon = "icon16/cross.png",
	onRun = function(item)
		local char = item.player:getChar()
		if (char:getData("boost", false) == true) then
			char:setData("boost", nil)
		end
		return false
	end,
	onCanRun = function(item)
		local player = item.player
		local char = player:getChar()
		return (!IsValid(item.entity) and char:getData("boost") == true)
	end
}

function ITEM:onCanBeTransfered(oldInventory, newInventory)
	local player = self.player
	local char = false
	
	if(player and IsValid(player)) then
		char = player:getChar()
	end
	
	if (newInventory and char and char:getData("boost")) then
		return false
	end

	return true
end

