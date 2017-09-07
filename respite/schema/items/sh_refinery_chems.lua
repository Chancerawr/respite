ITEM.name = "Refinery - Chemicals"
ITEM.uniqueID = "refinery_chems"
ITEM.model = "models/props_lab/reciever01b.mdl"
ITEM.desc = "A strange metal box, It has two large slots that are labelled 'PLASTIC/RUBBER' and 'ORGANIC'. There is an output hatch labelled 'CHEMICALS'."
ITEM.width = 2
ITEM.height = 1
ITEM.flag = "v"
ITEM.price = 500
ITEM.material = "models/props_canal/canal_bridge_railing_01b"
ITEM.category = "Machines"
ITEM.color = Color(128, 128, 128)

ITEM.functions.Refine = {
	name = "Use Plastic",
	icon = "icon16/cog.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local plastic = inventory:hasItem("j_scrap_plastics")	
		local organic = inventory:hasItem("j_scrap_organic")	
			
		if (!plastic or !organic) then
			client:notifyLocalized("You need 10 plastic, and 10 organic material to refine chemicals!") return false
		end
			
		local amount = plastic:getData("Amount")
		local amount2 = organic:getData("Amount")
		if (amount >= 10 and amount2 >= 10) then
			nut.chat.send(client, "itclose", "The machine accepts the materials, and then outputs a bottle of chemicals.")
			nut.item.spawn("j_scrap_chems", position)
			plastic:setData("Amount", amount - 10)
			organic:setData("Amount", amount2 - 10)
			if (plastic:getData("Amount") == 0) then
				plastic:remove()
			end
			if (organic:getData("Amount") == 0) then
				organic:remove()
			end
		else
			client:notifyLocalized("You need 10 plastic, and 10 organic material to refine chemicals!")
		end

		return false
	end
}

ITEM.functions.Refine2 = {
	name = "Use Rubber",
	icon = "icon16/cog.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local rubber = inventory:hasItem("j_scrap_rubber")	
		local organic = inventory:hasItem("j_scrap_organic")	
			
		if (!rubber or !organic) then
			client:notifyLocalized("You need 10 rubber, and 10 organic material to refine chemicals!") return false
		end
			
		local amount = rubber:getData("Amount")
		local amount2 = organic:getData("Amount")
		if (amount >= 10 and amount2 >= 10) then
			nut.chat.send(client, "itclose", "The machine accepts the materials, and then outputs a bottle of chemicals.")
			nut.item.spawn("j_scrap_chems", position)
			rubber:setData("Amount", amount - 10)
			organic:setData("Amount", amount2 - 10)
			if (rubber:getData("Amount") == 0) then
				rubber:remove()
			end
			if (organic:getData("Amount") == 0) then
				organic:remove()
			end
		else
			client:notifyLocalized("You need 10 rubber, and 10 organic material to refine chemicals!")
		end

		return false
	end
}