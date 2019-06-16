ITEM.name = "Medicator"
ITEM.uniqueID = "medicator"
ITEM.model = "models/props_combine/health_charger001.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.desc = "A strange metal object, It has a large slot that is labelled 'DEPRESSANTS', another slot labelled 'ORGANICS', and a small output slot labelled 'MEDICATION'."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(70, 120, 70)

ITEM.iconCam = {
	pos = Vector(200, 0, 0),
	ang = Angle(180, -0, 180),
	fov = 14,
}

ITEM.functions.Medical = {
	name = "Create Medical Supplies",
	icon = "icon16/heart.png",
	sound = "items/smallmedkit1.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local organic = inventory:getFirstItemOfType("j_scrap_organic")	
		local depress = inventory:getFirstItemOfType("drug_depress")	
		
		local meds = {
			"medical_kit",
			"medical_bandages",
			"medical_gauze",
			"medical_iv",
			"medical_splint",
			"medical_suture",
			"drug_antibiotics",
			"drug_antidepressants",
			"drug_antipsychotics",
			"drug_antivenom",
			"drug_burnointment",
			"drug_disinfectant",
			"drug_painkillers",
			"drug_energy",
			"drug_rubbingalcohol",
			"drug_sleepingpills",
			"drug_steroid"
		}

		local amount = organic:getData("Amount", 1)
		local amount2 = depress:getData("Amount", 1)
		
		nut.chat.send(client, "itclose", "The machine accepts the materials, vibrates intensely, and outputs a something medical after a short period of time.")

		if(amount > 10) then
			organic:setData("Amount", amount - 10)
		else
			organic:remove()
		end		
		
		if(amount2 > 1) then
			depress:setData("Amount", amount2 - 1)
		else
			depress:remove()
		end
		
		nut.item.spawn(table.Random(meds), position)
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player
		local organic = player:getChar():getInv():getFirstItemOfType("j_scrap_organic")
		
		if !player:getChar():getInv():getFirstItemOfType("drug_depress") or !organic or (organic and organic:getData("Amount") < 10) then --if item of importance isn't in the inventory.
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
		nut.item.spawn("salve_healing", position)

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces a vial filled with green liquid.")

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