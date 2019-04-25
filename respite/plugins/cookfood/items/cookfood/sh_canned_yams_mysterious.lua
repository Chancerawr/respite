ITEM.name = "Mysterious Yams"
ITEM.uniqueID = "food_yams_mysterious"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.material = "models/props_lab/security_screens2"
ITEM.hungerAmount = 10
ITEM.desc = "Something's wrong.."
ITEM.quantity2 = 3
ITEM.price = 0
ITEM.width = 1
ITEM.height = 1
ITEM.color = Color(0, 128, 128)
ITEM.container = "j_tinc"

ITEM.attribBoosts = { ["fortitude"] = -15, ["endurance"] = -15 }

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}

ITEM:hook("use", function(item)
	item.player:EmitSound(item.sound)
end)

ITEM.functions.use = {
	name = "Consume",
	tip = "useTip",
	icon = "icon16/cup.png",
	onRun = function(item)
		local cooked = item:getData("cooked", 1)
		local quantity2 = item:getData("quantity2", item.quantity2)
		local mul = COOKLEVEL[cooked][2]
		local position = item.player:getItemDropPos()
		local client = item.player
		local char = client:getChar()

		quantity2 = quantity2 - 1
		
		if(char:getFaction() == FACTION_SURVIVOR) then
			nut.chat.send(client, "body", "Your mind fills with nothingness.")
			nut.chat.send(client, "body", "You see an empty white space, a cold room with only yourself in it.")
			nut.chat.send(client, "body", "You feel incomplete.")
		else
			nut.chat.send(client, "body", "Your mind fills with images of a life you do not remember.")
			nut.chat.send(client, "body", "You are in someone else's body, in a more peaceful world.")
			nut.chat.send(client, "body", "It feels nostalgic somehow.")
		end
		
		giveDisease(client, "fort_nost")
		
		if (char and client:Alive()) then
			if (item.attribBoosts) then
				for k, v in pairs(item.attribBoosts) do
					char:addBoost(item.uniqueID, k, v)
				end
			end
			
			local charID = char:getID()
			local name = item.name
			timer.Create("DrugEffect_" .. item.uniqueID .. "_" .. client:EntIndex(), item.duration, 1, function()

				if (client and IsValid(client)) then
					local curChar = client:getChar()
					if (curChar and curChar:getID() == charID) then
						client:notify(Format("%s has worn off.", name))

						if (item.attribBoosts) then
							for k, v in pairs(item.attribBoosts) do
								char:removeBoost(item.uniqueID, k)
							end
						end
					end
				end
			end)
		end
		
		if (quantity2 >= 1) then
			item:setData("quantity2", quantity2)
			return false
		else
			if(item.container) then
				nut.item.spawn(item.container, position)
			end
		end
		
		
		return true
	end,
	onCanRun = function(item)
		if (item.mustCooked and item:getData("cooked", 1) == 1) then
			return false
		end

		return (!IsValid(item.entity))
	end
}