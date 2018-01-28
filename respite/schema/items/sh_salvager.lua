ITEM.name = "Salvager Kit"
ITEM.uniqueID = "kit_salvager"
ITEM.desc = "A strange metallic device. It appears to be vibrating slightly."
ITEM.model = "models/props_c17/suitcase_passenger_physics.mdl"
ITEM.material = "models/props_canal/metalwall005b"
ITEM.flag = "v"
ITEM.width = 2
ITEM.height = 2
ITEM.category = "Machines"
ITEM.color = Color(128, 128, 128)

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
		local required = inventory:hasItem("ammo_battery")
			
		required:remove()
		nut.item.spawn("j_scrap_battery", position)
		nut.item.spawn("j_scrap_battery", position)
		nut.item.spawn("j_scrap_screws", position)

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces a strange energy cube.")

		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		
		if !player:getChar():getInv():hasItem("ammo_battery") then 
			return false
		end
	end
}