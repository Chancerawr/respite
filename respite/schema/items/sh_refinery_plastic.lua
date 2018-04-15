ITEM.name = "Refinery - Plastics"
ITEM.uniqueID = "refinery_plastics"
ITEM.model = "models/props_lab/reciever01b.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.desc = "A strange metal box, It has a large slot that is labelled 'WATERED DUST', and an output hatch labelled 'PLASTIC'."
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
	icon = "icon16/cog.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local dust = inventory:hasItem("medical_plastic")	
		local water = inventory:hasItem("food_water_misc") or inventory:hasItem("food_blood") or inventory:hasItem("food_water")
			
		if (!dust) then
			client:notifyLocalized("You need plastic dust to create plastic!") return false
		end
		
		if (!water) then
			client:notifyLocalized("You need water to create plastic!") return false
		end
			
		dust:remove()
		water:remove()
			
		nut.chat.send(client, "itclose", "The machine accepts the plastic dust and water, makes loud metallic noises, and then outputs plastic.")	
		inventory:add("j_scrap_plastics", 1, { Amount = 7 })

		return false
	end
}