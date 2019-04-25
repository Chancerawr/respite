ITEM.name = "Chip Pouch"
ITEM.uniqueID = "cube_chip_pouch"
ITEM.desc = "A small sack, it has many slots within it. It can hold 25 chips."
ITEM.model = "models/props_junk/garbage_bag001a.mdl"
ITEM.material = "models/props_pipes/destroyedpipes01a"
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "V"
ITEM.category = "Machines"
ITEM.data = { chipcount = 0 }
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
		local chipcount = item:getData("chipcount")
		local chip = inventory:hasItem("cube_chip")	
		while(chip) do
			if (chip and item:getData("chipcount") < 25 ) then
				chip:remove()
				item:setData("chipcount", item:getData("chipcount") + 1)
				item.player:EmitSound("ambient/materials/dinnerplates1.wav")
			else
				return false
			end

			chip = inventory:hasItem("cube_chip")	
		end
		return false
	end,
	onCanRun = function(item)
		if (item:getOwner() != nil) then
			return true
		else
			return false
		end
	end
}

ITEM.functions.Extract = {
	tip = "Take a chip out of the bag.",
	icon = "icon16/delete.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local chipcount = item:getData("chipcount")
		if (chipcount > 0 and inventory:findEmptySlot(1, 1) != nil) then
			inventory:add("cube_chip", 1)
			item:setData("chipcount", item:getData("chipcount") - 1)
			item.player:EmitSound("ambient/materials/dinnerplates1.wav")
		end
		return false
	end,
	onCanRun = function(item)
		if (item:getOwner() != nil) then
			return true
		else
			return false
		end
	end
}

function ITEM:getDesc()
	local str
	if (!self.entity or !IsValid(self.entity)) then
		str = "A small bag with dozens of small pouches within it.\nCapacity: 25\nChip Count: %s"
	else
		str = "A small bag with dozens of small pouches within it."
	end
	return Format(str, (self:getData("chipcount")))
end