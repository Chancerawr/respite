ITEM.name = "Charged Cube"
ITEM.uniqueID = "charged_cube"
ITEM.desc = "A perfect cube, it is hot the touch and stores electricity incredibly well."
ITEM.model = "models/hunter/blocks/cube025x025x025.mdl"
ITEM.material = "models/alyx/emptool_glow"
ITEM.flag = "v"
ITEM.category = "Charged"

ITEM.data = {
	sTime = 0
}

ITEM.iconCam = {
	pos = Vector(126.46921539307, 106.120262146, 76.984527587891),
	ang = Angle(25, 220, 0),
	fov = 6,
}

--how long it takes for a charge to regenerate.
local timeCharge = 3600

local function chargeTimer(startTime)

	if(!startTime) then
		return false
	end
	
	local maxCharges = 1
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

ITEM.functions.Charge = {
	name = "Charge Battery",
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local battery = inventory:hasItem("j_battery_dead")	
		local char = client:getChar()
		
		nut.chat.send(client, "itclose", "The object accepts the dead battery and the money, vibrates intensely, and outputs a freshly charged battery.")
		
		battery:remove()
		item:setData("sTime", CurTime() - timeCharge*(charges-1)) 
		
		if(!inventory:add("ammo_battery")) then
			nut.item.spawn("ammo_battery", position)
		end
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		
		if (!player:getChar():getInv():hasItem("j_battery_dead")) then --if item of importance isn't in the inventory.
			return false
		end
	end
}

function ITEM:getDesc()
	local desc = self.desc
	
	local charges = chargeTimer(self:getData("sTime"))
	if(charges) then
		if(charges == 0) then
			desc = desc .. "\nThe cube is not charged."
		else
			desc = desc .. "\nThe cube is charged."
		end
	end
	
	return Format(desc)
end
