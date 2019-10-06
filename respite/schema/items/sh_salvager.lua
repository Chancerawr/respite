ITEM.name = "Salvager Kit"
ITEM.uniqueID = "kit_salvager"
ITEM.desc = "A strange metallic device. It appears to be vibrating slightly."
ITEM.model = "models/props_c17/suitcase_passenger_physics.mdl"
ITEM.material = "models/props_canal/metalwall005b"
ITEM.flag = "v"
ITEM.width = 2
ITEM.height = 2
ITEM.category = "Machines"
ITEM.color = Color(70, 120, 70)

ITEM.iconCam = {
	pos = Vector(0, 200, -9),
	ang = Angle(0, 270, 0),
	fov = 8,
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
		local roll = math.random(0,1)
		if(roll == 0) then
			nut.item.spawn("j_scrap_battery", position)
			nut.item.spawn("j_scrap_battery", position)
			nut.item.spawn("j_scrap_battery", position)
		else
			nut.item.spawn("j_scrap_screws", position)
		end

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces something.")

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