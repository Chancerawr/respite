ITEM.name = "Mysterious Yams"
ITEM.uniqueID = "food_yams_mysterious"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.material = "models/props_lab/security_screens2"
ITEM.hungerAmount = 10
ITEM.foodDesc = "Something's wrong.."
ITEM.quantity = 3
ITEM.price = 4
ITEM.width = 1
ITEM.height = 1
ITEM.color = Color(0, 128, 128)

ITEM.container = "j_tinc"
 

ITEM.attribBoosts = { ["fortitude"] = -15, ["endurance"] = -15 }

ITEM:hook("use", function(item)
	item.player:EmitSound(item.sound)
end)

ITEM.functions.use = {
	name = "Consume",
	tip = "useTip",
	icon = "icon16/cup.png",
	onRun = function(item)
		local cooked = item:getData("cooked", 1)
		local quantity = item:getData("quantity", item.quantity)
		local mul = COOKLEVEL[cooked][2]
		local position = item.player:getItemDropPos()
		local client = item.player
		local char = client:getChar()

		quantity = quantity - 1
		client:notify("Your mind fills with images of another person's life.")
		client:notify("You are having vivid hallucinations.")
		client:notify("It is hard to focus.")
		
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
		
		if (quantity >= 1) then
			item:setData("quantity", quantity)
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