ITEM.name = "Mushroom"
ITEM.desc = "A regular-looking mushroom."
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/XQM/WoodPlankTexture"
ITEM.uniqueID = "herb_mushroom"

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 2.75,
}

ITEM.functions.Can = {
	tip = "Can some mushrooms.",
	icon = "icon16/database.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()
		local position = client:getItemDropPos()

		
		local nac = inventory:getFirstItemOfType("nac")
		local can = inventory:getFirstItemOfType("j_tinc")
		
		if(can or nac) then
			inventory:addSmart("food_mushrooms", item:getData("Amount", 1), position)
			
			if(can and !nac) then
				can:remove()
			end
		end

		client:EmitSound("physics/metal/metal_barrel_impact_soft1.wav")
	end,
	onCanRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()

		local can = inventory:hasItem("j_tinc")
		local nac = inventory:hasItem("nac")
		
		return (can or nac)
	end
}