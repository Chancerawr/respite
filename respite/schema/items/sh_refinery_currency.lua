ITEM.name = "Refinery - Currency"
ITEM.uniqueID = "refinery_currency"
ITEM.model = "models/props_lab/reciever01b.mdl"
ITEM.desc = "A strange metal box, It has a large slot that is labelled 'METAL', and an output hatch labelled 'CURRENCY'."
ITEM.width = 2
ITEM.height = 1
ITEM.flag = "v"
ITEM.price = 500
ITEM.material = "models/props_canal/metalwall005b"
ITEM.category = "Machines"
ITEM.color = Color(128, 128, 128)

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 10,
}

ITEM.functions.Refine = {
	name = "Refine Currency",
	icon = "icon16/coins.png",
	sound = "ambient/machines/machine6.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local metal = inventory:hasItem("j_scrap_metals")	
			
		if (!metal) then
			client:notifyLocalized("You need 10 scrap metal to create currency!") return false
		end
			
		local amount = metal:getData("Amount")
		if (amount >= 10) then		
			nut.chat.send(client, "itclose", "The machine accepts the metal scraps, makes loud metallic noises, and then outputs scrap currency.")	
			nut.currency.spawn(position, 20, Angle(0,0,0))	
			metal:setData("Amount", amount - 10)
			if (metal:getData("Amount") == 0) then
				metal:remove()
			end
		else
			client:notifyLocalized("You need 10 scrap metal to refine currency!")
		end

		return false
	end
}