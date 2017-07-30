ITEM.name = "Refinery - Battery"
ITEM.uniqueID = "refinery_battery"
ITEM.model = "models/props_lab/reciever01b.mdl"
ITEM.desc = "A strange metal box, It has two large slots that are labelled 'METAL' and 'CHEMICAL'. There is an output hatch labelled 'BATTERY'."
ITEM.width = 2
ITEM.height = 1
ITEM.flag = "v"
ITEM.price = 500
ITEM.material = "models/props/cs_assault/metal_stairs1"
ITEM.category = "Machines"
ITEM.color = Color(128, 128, 128)

ITEM.functions.Refine = {
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local metals = inventory:hasItem("j_scrap_metals")	
		local chems = inventory:hasItem("j_scrap_chems")	
			
		if (!metals or !chems) then
			client:notifyLocalized("You need 5 metal, and 1 gram of chemicals to refine a battery!") return false
		end
			
		local amount = metals:getData("Amount")
		local amount2 = chems:getData("Amount")
		if (amount >= 5 and amount2 >= 1) then
			nut.chat.send(client, "itclose", "The machine accepts the materials, and then outputs a single battery.")
			nut.item.spawn("j_scrap_battery", position)
			metals:setData("Amount", amount - 5)
			chems:setData("Amount", amount2 - 1)
			if (metals:getData("Amount") == 0) then
				metals:remove()
			end
			if (chems:getData("Amount") == 0) then
				chems:remove()
			end
		else
			client:notifyLocalized("You need 5 metal, and 1 gram of chemicals to refine a battery!")
		end

		return false
	end
}