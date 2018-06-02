ITEM.name = "Refinery - Adhesive"
ITEM.uniqueID = "refinery_adhesive"
ITEM.model = "models/props_lab/reciever01b.mdl"
ITEM.material = "models/props_wasteland/metal_tram001a"
ITEM.desc = "A strange metal box, It has a large slot that is labelled 'ORGANIC MATERIAL', and an output hatch labelled 'ADHESIVE'."
ITEM.width = 2
ITEM.height = 1
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(128, 128, 128)

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 10,
}

ITEM.functions.Refine = {
	name = "Refine Adhesive",
	icon = "icon16/cog.png",
	sound = "ambient/machines/machine6.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		
		local organic = inventory:hasItem("j_scrap_organic")	
				
		if (!organic) then
			client:notifyLocalized("You need 10 organic material to create adhesive!") return false
		end
		
		local amount = organic:getData("Amount", 0)
		
		if(amount < 10) then
			client:notifyLocalized("You need 10 organic material to create adhesive!") return false
		end
		
		organic:setData("Amount", amount - 10)
		if (organic:getData("Amount") == 0) then
			organic:remove()
		end
		
		nut.chat.send(client, "itclose", "The machine accepts the organic material, makes loud metallic noises, and then outputs adhesive.")	
		inventory:add("j_scrap_adhesive")
		dust:remove()
		water:remove()

		return false
	end
}