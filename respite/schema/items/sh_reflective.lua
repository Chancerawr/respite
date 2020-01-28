ITEM.name = "Reflective Liquid"
ITEM.model = "models/props/cs_office/water_bottle.mdl"
ITEM.material = "phoenix_storms/scrnspace"
ITEM.width = 1
ITEM.height = 2
ITEM.healAmount = 0
ITEM.healSeconds = 1
ITEM.price = 75
ITEM.desc = "A bottle filled with an incredibly reflective liquid, you can see yourself in it."
ITEM.flag = "V"
ITEM.uniqueID = "reflective"
ITEM.container = "j_empty_mountain_spring"
ITEM.color = Color(70, 120, 70)

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3,
}

ITEM.functions.use = { -- sorry, for name order.
	name = "Drink",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
	
		if (client:Alive()) then
			if(item.container) then
				local position = client:getItemDropPos()
				nut.item.spawn(item.container, position)
			end
			
			nut.chat.send(client, "body", "You begin to feel a change in your body.")
			nut.chat.send(client, "body", "It is not painful, but it gives you a sense of fatigue.")
			nut.chat.send(client, "body", "Your body's ichor concentration lowers.")
			nut.chat.send(client, "body", "Portions of your ichor body have reverted to regular human flesh.")
			
			local char = client:getChar()
			local parts = char:getData("parts", {})
			
			for k, v in pairs(parts) do
				if(string.lower(v[2]) == "ichor") then
					v[1] = v[1] * 0.67
				end
			end
			
			client:EmitSound("items/medshot4.wav", 80, 75)
			client:ScreenFade(1, Color(64, 128, 128, 150), 5, 2)
			
			char:setData("parts", parts)
		end
	end,
	onCanRun = function(item)
		if(IsValid(item.entity)) then
			return false
		end	
	
		local player = item.player
		local char = player:getChar()

		if (char:getFaction() != FACTION_DRIFTER) then
			return false
		end
		
		return true
    end
}