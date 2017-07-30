ITEM.name = "Refinery - Screws"
ITEM.uniqueID = "refinery_screws"
ITEM.model = "models/props_lab/reciever01b.mdl"
ITEM.desc = "A strange metal box, It has a large slot that is labelled 'METAL', and an output hatch labelled 'SCREW'."
ITEM.width = 2
ITEM.height = 1
ITEM.flag = "v"
ITEM.price = 500
ITEM.material = "models/xqm/boxfull_diffuse"
ITEM.category = "Machines"
ITEM.color = Color(128, 128, 128)

ITEM.functions.Refine = {
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local metal = inventory:hasItem("j_scrap_metals")	
			
		if (!metal) then
			client:notifyLocalized("You need 10 scrap metal to refine a screw!") return false
		end
			
		local amount = metal:getData("Amount")
		if (amount >= 10) then
			nut.chat.send(client, "itclose", "The machine accepts the metal scraps, makes loud metallic noises, and outputs a screw after a short amount of time.")
			nut.item.spawn("j_scrap_screws", position)
			metal:setData("Amount", amount - 10)
			if (metal:getData("Amount") == 0) then
				metal:remove()
			end
		else
			client:notifyLocalized("You need 10 scrap metal to refine a screw!")
		end

		return false
	end
}