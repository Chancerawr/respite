ITEM.name = "Corrupted Fountain"
ITEM.uniqueID = "fountain"
ITEM.model = "models/props/de_inferno/claypot01.mdl"
ITEM.material = "models/props_lab/xencrystal_sheet"
ITEM.desc = "A vase-like object with a strange texture."
ITEM.width = 2
ITEM.height = 3
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Devices"
ITEM.color = Color(135, 200, 255)

ITEM.iconCam = {
	pos = Vector(0, 200, 20),
	ang = Angle(0, 270, 0),
	fov = 10
}

--how long it takes for a charge to regenerate.
local timeCharge = 1200

local function chargeTimer(startTime)

	if(!startTime) then
		return 0
	end
	
	local maxCharges = 3
	local passed = CurTime() - startTime
	local charges = 0
	
	--generally happens after server restarts.
	if(passed < 0) then
		return 1
	end

	charges = passed / timeCharge
	if(charges > maxCharges) then
		charges = maxCharges
	end

	return math.Round(charges)
end

ITEM.functions.Fill = {
	name = "Fill Container",
	icon = "icon16/bell.png",
	--sound = "ambient/gas/steam2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
	
		local containers = {}
		for k, v in pairs(nut.item.list) do
			if(v.fillable) then				
				table.insert(containers, v.uniqueID)
			end
		end
	
		local container
		for k, v in pairs(containers) do
			container = inventory:getFirstItemOfType(v)
			if(container) then
				break
			end
		end
		
		if(!container) then
			client:notify("You do not have a viable container.")
			return false
		end
		
		--decrements a charge
		local charges = chargeTimer(item:getData("sTime", 0))
		item:setData("sTime", CurTime() - timeCharge*(charges-1))
		
		container:remove()

		inventory:addSmart("food_water_misc", 1, position)
	
		nut.chat.send(client, "itclose", "The container is filled with corrupted water.")	
	
		return false
	end,
	onCanRun = function(item)
		if(chargeTimer(item:getData("sTime", 0)) < 1) then
			return false
		end
		
		return true
	end
}

ITEM.functions.Battery = {
	name = "Charged Battery",
	icon = "icon16/asterisk_orange.png",
	sound = "ambient/energy/zap9.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local required = inventory:getFirstItemOfType("ammo_battery")
			
		required:remove()

		nut.item.spawn("food_blood", position)
		nut.item.spawn("food_blood", position)

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "Blood suddenly sprays out of the fountain.")

		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("ammo_battery") then 
			return false
		end
		
		return true
	end
}

function ITEM:getDesc()
	local desc = self.desc
	
	local charges = chargeTimer(self:getData("sTime", 0))

	if(charges) then
		if(charges == 0) then
			desc = desc .. "\nThere is nothing in the container."
		else
			desc = desc .. "\nThere is corrupted water in the container."
		end
	end
	
	return Format(desc)
end
