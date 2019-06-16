ITEM.name = "Curator"
ITEM.uniqueID = "curator"
ITEM.model = "models/props_docks/dock01_cleat01a.mdl"
ITEM.material = "models/props_lab/cornerunit_cloud"
ITEM.desc = "The mysterious object has no obvious use.\nPutting your hands on it clears your mind, and calms you down."
ITEM.width = 2
ITEM.height = 1
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(70, 120, 70)

ITEM.iconCam = {
	pos = Vector(0, 200, 8.5),
	ang = Angle(0, 270, 0),
	fov = 12,
}

ITEM.functions.Cleanse = {
	icon = "icon16/heart.png",
	sound = "ambient/gas/steam2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local water = inventory:getFirstItemOfType("food_water") or inventory:getFirstItemOfType("food_water_mountain") or inventory:getFirstItemOfType("food_blood")
		
		if (!water) then
			client:notify("You need bottled water to do this.") 
			return false
		end

		water:remove()
		nut.chat.send(client, "itclose", "The liquid is poured onto the object.")	
		
		local cures = {
			--doesnt cure fort debuffs
			--[[
			["fort_pani"] = true, 
			["fort_nost"] = true,
			["fort_conf"] = true,
			["fort_headache"] = true,
			["fort_migraine"] = true,
			["fort_hall"] = true,
			["fort_para"] = true,
			["fort_noia"] = true,
			["fort_insa"] = true,
			["fort_enrage"] = true,
			--]]
			"dis_poti",
			"dis_wrai",
			"dis_eyes",
			"dis_mind",
			"dis_touch"
		}
		
		local cured = false
		for k, v in pairs(cures) do
			if(hasDisease(client, v)) then
				cureDisease(client, v)
				cured = true
			end
		end
		
		if(cured) then
			client:notify("You feel refreshed, and healthier.")
		else
			client:notify("You don't feel any different.")
		end
		
		if(water.uid == "food_blood") then
			giveDisease(client, "fort_enrage")
		end

		return false
	end
}

ITEM.functions.Shard = {
	icon = "icon16/pill.png",
	sound = "ambient/levels/canals/windchime2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local shard = inventory:getFirstItemOfType("shard")
		
		if (!shard) then
			client:notify("You need a shard to do this.") 
			return false
		end

		shard:remove()
		nut.chat.send(client, "itclose", "The shard enters the object, and it chimes lightly.\nTwo vials of All Purge come out of it.")	
		
		nut.item.spawn("medical_purge", position)
		nut.item.spawn("medical_purge", position)
		nut.item.spawn("medical_purge", position)

		return false
	end
}

ITEM.functions.Blight = {
	icon = "icon16/bullet_black.png",
	sound = "ambient/levels/canals/windchime4.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local blight = inventory:getFirstItemOfType("blight")
		
		if (!blight) then
			client:notify("You need blight to do this.") 
			return false
		end

		blight:remove()
		nut.chat.send(client, "itclose", "The blight seeps into the object, and it chimes quietly.\nA pill bottle comes out of the object.")

		nut.item.spawn("drug_antipsychotics", position)
		nut.item.spawn("drug_antipsychotics", position)
		
		return false
	end
}

ITEM.functions.Ichor = {
	icon = "icon16/bullet_white.png",
	sound = "ambient/levels/canals/windchime5.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local ichor = inventory:getFirstItemOfType("ichor")
		
		if (!ichor) then
			client:notify("You need ichor to do this.") 
			return false
		end

		ichor:remove()
		nut.chat.send(client, "itclose", "The ichor seeps into the object, and it chimes quietly.\nA pill bottle comes out of the object.")

		nut.item.spawn("drug_psychotics", position)
		nut.item.spawn("drug_psychotics", position)
		nut.item.spawn("drug_psychotics", position)
		
		return false
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
		nut.item.spawn("nightmare", position)
		
		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces some pill bottles.")

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