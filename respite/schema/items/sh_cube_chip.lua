ITEM.name = "Chip"
ITEM.uniqueID = "cube_chip"
ITEM.desc = "A thin metal chip, it is labelled 'Chip'."
ITEM.model = "models/gibs/metal_gib4.mdl"
ITEM.flag = "v"
ITEM.category = "Machines"
ITEM.color = Color(70, 120, 70)

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 2.5,
}

ITEM.onCombineTo = function(itemSelf, itemTarget)
	if(itemTarget.uniqueID == "cube_chip_pouch") then
		local chipcount = itemTarget:getData("chipcount", 0)

		if(chipcount < 25) then
			itemSelf.player:EmitSound("ambient/materials/dinnerplates1.wav", 65, 130)
			itemSelf:remove()
			itemTarget:setData("chipcount", chipcount + 1)
		end
	end
end