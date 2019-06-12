ITEM.name = "Broken Generator"
ITEM.uniqueID = "generator_broken"
ITEM.model = "models/props_combine/combine_mine01.mdl"
ITEM.material = "models/props_pipes/pipesystem01a_skin2"
ITEM.desc = "A strange contraption, it seems to have some kind of small opening in the middle. Its center is raised above the ground slightly, and underneath it there is another small opening."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(70, 120, 70)

ITEM.iconCam = {
	pos = Vector(-3, 2, 200),
	ang = Angle(90, 0, 25),
	fov = 12,
}

ITEM.functions.Repair = {
	name = "Repair",
	tip = "useTip",
	icon = "icon16/wrench_orange.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local position = client:getItemDropPos()
		local kit = inventory:getFirstItemOfType("generator_repair")
		
		if (kit) then
			kit:remove()
			inventory:addSmart("generator_chip", 1, position)
		else
			item.player:notify("You need a generator repair kit.") return false
		end
	end
}
