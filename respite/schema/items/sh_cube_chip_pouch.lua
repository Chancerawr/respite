ITEM.name = "Chip Pouch"
ITEM.uniqueID = "cube_chip_pouch"
ITEM.desc = "A small sack, it has many slots within it. It can hold 25 chips."
ITEM.model = "models/props_junk/garbage_bag001a.mdl"
ITEM.material = "models/props_pipes/destroyedpipes01a"
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "V"
ITEM.category = "Machines"
ITEM.color = Color(140, 20, 140)

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 170),
	fov = 5.5,
}

ITEM.functions.Fill = {
	tip = "Put your chips into the bag.",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local chip = inventory:getFirstItemOfType("cube_chip")	
		while(chip) do
			local chipcount = item:getData("chipcount", 0)
			if (chip and chipcount < 25) then
				chip:remove()
				item:setData("chipcount", chipcount + 1)
				item.player:EmitSound("ambient/materials/dinnerplates1.wav", 65, 60)
			else
				return false
			end

			chip = inventory:getFirstItemOfType("cube_chip")	
		end
		
		return false
	end,
	onCanRun = function(item)
		if (IsValid(item.entity)) then
			return false
		end
		
		return true
	end
}

ITEM.functions.Extract = {
	tip = "Take a chip out of the bag.",
	icon = "icon16/delete.png",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		
		local chipcount = item:getData("chipcount", 0)
		
		if (chipcount > 0) then
			client:requestString("Split", "", function(text)	
				amount = math.Clamp(tonumber(text), 1, chipcount)
				
				item:setData("chipcount", chipcount - amount)

				inventory:addSmart("cube_chip", amount, position)
				
				client:EmitSound("ambient/materials/dinnerplates1.wav", 65, 130)
			end, 1)
		end
		
		return false
	end,
	onCanRun = function(item)
		if (IsValid(item.entity)) then
			return false
		end
		
		return true
	end
}

function ITEM:getDesc()
	local str
	if (!self.entity or !IsValid(self.entity)) then
		str = "A small bag with dozens of small pouches within it.\nCapacity: 25\nChip Count: %s"
	else
		str = "A small bag with dozens of small pouches within it."
	end
	return Format(str, (self:getData("chipcount", 0)))
end