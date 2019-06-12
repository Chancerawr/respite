ITEM.name = "Peculiar Generator"
ITEM.uniqueID = "generator_chip"
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

ITEM.functions.Place = {
	name = "Deploy",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		local grd = ents.Create( "ent_generator" )
		grd:SetPos( client:EyePos() + client:GetAimVector() * 50 )
		grd:Spawn()

		local phys = grd:GetPhysicsObject()
		phys:SetVelocity( client:GetAimVector() * 1 * math.Rand( .8, 1 ) )
		phys:AddAngleVelocity( client:GetAimVector() * 1  )
	end
}