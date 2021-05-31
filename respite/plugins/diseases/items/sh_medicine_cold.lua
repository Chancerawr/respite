ITEM.name = "Cold Medication"
ITEM.desc = "Medication for the common cold."
ITEM.uniqueID = "medicine_cold"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.color = Color(0, 128, 128)

ITEM.permit = "permit_general"
ITEM.price = 20

ITEM.cures = {
	["dis_cold"] = true,
}

ITEM.functions.use = { -- sorry, for name order.
	name = "Use",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
	
		if (client:Alive()) then
			local position = client:getItemDropPos()
			
			for k, v in pairs(DISEASES.diseases) do
				if(client:hasDisease(v.uid) and item.cures[v.uid]) then
					client:removeDisease(v.uid)
				end
			end
		end
	end
}

// On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.usef = { -- sorry, for name order.
	name = "Use Forward",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		local trace = client:GetEyeTraceNoCursor() -- We don't need cursors.
		local target = trace.Entity

		if (target and target:IsValid() and target:IsPlayer() and target:Alive()) then
			if(item.container) then
				nut.item.spawn(item.container, position)
			end
		
			target:getChar():setVar("cybermed", CurTime() + 10800)
		
			for k, v in pairs(DISEASES.diseases) do
				if(item.cures[v.uid] and target:hasDisease(v.uid)) then
					target:removeDisease(v.uid)
				end
			end
		else
			client:notify("Look at a valid player.")
			return false
		end
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

ITEM.iconCam = {
	pos = Vector(89.432174682617, 74.904991149902, 54.501823425293),
	ang = Angle(25, 220, 0),
	fov = 5,
}