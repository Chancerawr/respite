ITEM.name = "Drone (Scanner)"
ITEM.model = "models/props/cs_office/cardboard_box02.mdl"
ITEM.desc = "A flying drone with a flashlight and a gun.\nDrone commands:\nDrone, on me.\nDrone, light on/off\nDrone, ammo.\nDrone, report callsign.\nDrone, deactivate."
ITEM.throwent = "ent_jack_drone_scanner"
ITEM.throwforce = 0
ITEM.price = 0
ITEM.flag = "v"
ITEM.uniqueID = "drone"
ITEM.category = "Robotic"

ITEM.throwFunc = function(item, client, entity)
	local charge = item:getData("battery", 50)
	
	entity.RoundsInMag = charge
	entity.item = item
	entity.Owner = client
end

ITEM.functions.Charge = {
	name = "Charge",
	tip = "useTip",
	icon = "icon16/asterisk_yellow.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()
		
		local battery = inventory:getFirstItemOfType("ammo_battery")

		if(battery) then
			battery:remove()
			item:setData("battery", 50)
			client:EmitSound("npc/scanner/cbot_discharge1.wav", 75)
			
			local deployed = item:getData("deployed")
			if(IsValid(deployed)) then
				deployed.RoundsInMag = 50
				deployed.RoundInChamber = true
			end
		else
			client:notify("Requires a Charged Battery.")
		end

		return false
	end
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 5),
	ang = Angle(0, -0, 0),
	fov = 5,
}

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		local battery = tonumber(item:getData("battery", 50))
		if (battery) then
			draw.SimpleText(battery.. "/" .."50", "DermaDefault", 6, h - 16, Color(50,200,50), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
		end
	end
end