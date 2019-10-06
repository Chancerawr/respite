ITEM.name = "Bloodberry"
ITEM.desc = "A blood red berry, it carries the smell of fresh blood."
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/XQM/WoodPlankTexture"
ITEM.uniqueID = "herb_bloodberry"

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 2.75,
}

ITEM.functions.Jam = {
	tip = "JAM this item",
	icon = "icon16/bullet_red.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inv = char:getInv()
		local position = client:getItemDropPos()

		inv:addSmart("food_blood", 1, position)
		
		client:EmitSound("physics/flesh/flesh_squishy_impact_hard" ..math.random(1,4).. ".wav", 65, math.random(80,110))
		
		local amount = item:getData("Amount", 1)
		if(amount > 5) then
			item:setData("Amount", amount - 5)
			return false
		else
			return true
		end
	end,
	onCanRun = function(item)
		local client = item.player
		local char = client:getChar()
		
		if(item:getData("Amount", 1) < 5) then
			return false
		end

		return char:hasFlags("q") or char:getInv():hasItem("converter_meat")
	end
}