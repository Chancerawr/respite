ITEM.name = "Refinery - Enhanced Chips"
ITEM.uniqueID = "refinery_enhanced"
ITEM.model = "models/props_lab/reciever01b.mdl"
ITEM.material = "models/props_lab/security_screens"
ITEM.desc = "A strange metal box, It has a large slot that is labelled 'MEMORIES', another slot labelled 'SHARD DUST', and a small output slot labelled 'ENHANCED CHIPS'."
ITEM.width = 2
ITEM.height = 1
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(140, 20, 140)

ITEM.functions.Refine = {
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local memory = inventory:hasItem("j_scrap_memory")	
		local dust = inventory:hasItem("shard_dust")	
			
		if (!memory or !dust) then
			client:notifyLocalized("You need 10 memories and 2 shard dust to refine an enhanced chip!") return false
		end
			
		local amount = memory:getData("Amount")
		local amount2 = dust:getData("Amount")
		if (amount >= 10 and amount2 >= 2) then
			nut.chat.send(client, "itclose", "The machine accepts the strange materials, vibrates intensely, and outputs an enhanced chip after a short period of time.")
			nut.item.spawn("cube_chip_enhanced", position)
			memory:setData("Amount", amount - 10)
			dust:setData("Amount", amount2 - 2)
			if (memory:getData("Amount") == 0) then
				memory:remove()
			end		
			if (dust:getData("Amount") == 0) then
				dust:remove()
			end
		else
			client:notifyLocalized("You need 10 memories and 2 shard dust to refine an enhanced chip!")
		end

		return false
	end
}