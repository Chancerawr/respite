ITEM.name = "Device - Rib Cage"
ITEM.uniqueID = "ribcage"
ITEM.model = "models/skeleton/skeleton_torso2_noskins.mdl"
ITEM.material = "models/xqm/squaredmatinverted"
ITEM.desc = "A strange object that heavily resembles a section of the human skeleton. The ribs are closed tightly, and there are bones inside of them. There is a coin slot on the side.\nCosts 8 coins."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(128, 128, 128)

ITEM.data = {
	sTime = 0
}

--how long it takes for a charge to regenerate.
local timeCharge = 120

local function chargeTimer(startTime)

	if(!startTime) then
		return false
	end
	
	local maxCharges = 5
	local passed = CurTime() - startTime
	local charges = 0
	
	--generally happens after server restarts.
	if(passed < 0) then
		return false
	end

	charges = passed / timeCharge
	if(charges > maxCharges) then
		charges = maxCharges
	end
	
	return math.Round(charges)
end


ITEM.functions.Release = {
	icon = "icon16/box.png",
	sound = "npc/barnacle/neck_snap2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local charges = chargeTimer(item:getData("sTime"))
		
		client:getChar():takeMoney(8)
		
		item:setData("sTime", CurTime() - timeCharge*(charges-1)) 
		
		if(!inventory:add("j_scrap_bone", 1)) then --if the inventory has space, put it in the inventory
			nut.item.spawn("j_scrap_bone", position) --if not, drop it on the ground
		end
		
		nut.chat.send(client, "itclose", "The cage opens, releasing a bone, it closes soon after.")	
		
		return false
	end,
	onCanRun = function(item)
		local player
		if(item:getOwner() == nil) then --so we can do this on the ground or in the inventory
			player = item.player
		else
			player = item:getOwner()
		end
		
		local startTime = item:getData("sTime")
		local charges = chargeTimer(startTime)
		
		--if charges return false, that means we need to reset our time value.
		if(!charges) then
			item:setData("sTime", CurTime())
			return false
		elseif(charges < 1) then
			return false
		end
		
		if (player:getChar():getMoney() < 8) then 
			return false
		end
	end
}


function ITEM:getDesc()
	local desc = self.desc
	
	local charges = chargeTimer(self:getData("sTime"))
	if(charges) then
		desc = desc .. "\nStored Bones: " .. charges .. "."
	end
	
	return Format(desc)
end
