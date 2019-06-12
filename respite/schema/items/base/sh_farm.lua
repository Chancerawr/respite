ITEM.name = "Farm Base"
ITEM.model = "models/props_junk/terracotta01.mdl"
ITEM.desc = "A strange pot, the dirt in it gives off a dim light."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Farms"
ITEM.data = { producing2 = 0 }
ITEM.color = Color(50, 150, 50)
ITEM.yield = 3
ITEM.growTime = 180

ITEM.iconCam = {
	pos = Vector(188.63706970215, 158.96276855469, 122.02513885498),
	ang = Angle(25, 220, 0),
	fov = 4.7276473777797,
}

ITEM.functions.Farm = {
	icon = "icon16/picture.png",
	sound = "npc/barnacle/barnacle_tongue_pull1.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()
		
		local water = inventory:getFirstItemOfType("food_water_misc") or inventory:getFirstItemOfType("food_water") or inventory:getFirstItemOfType("food_water_mountain") or inventory:getFirstItemOfType("food_blood")
		local grow
		if(water) then
			if (water.uniqueID == "food_water_misc" ) then
				grow = item.grow .. "_plastic"
			else
				grow = item.grow
			end
			
			local container = water.container
			water:remove()
			inventory:add(container)
			
			nut.chat.send(client, "itclose", "The liquid is poured onto the strange dirt.")	
			item:setData("producing", CurTime())
			
			timer.Simple(item.growTime, function()
				if (item != nil) then
					item:setData("producing", nil)
					for i=1, item.yield do
						if(!IsValid(item:getEntity())) then --checks if item is not on the ground
							inventory:addSmart(grow, 1, client:getItemDropPos())
						else --if the item it on the ground
							nut.item.spawn(grow, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
						end
					end
					client:notify("Farming has finished.")
				end
			end)
		else
			client:notify("You don't have any water!") return false
		end
		
		return false
	end,
	onCanRun = function(item) --only one farm action should be happening at once with one item.
		local prodTime = item.growTime
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("producing", false)) then
		desc = desc .. "\nSomething is growing."
	end
	
	return Format(desc)
end