ITEM.name = "The Bell"
ITEM.uniqueID = "bell"
ITEM.model = "models/props/de_inferno/bell_largeb.mdl"
ITEM.material = "models/effects/portalrift_sheet"
ITEM.desc = "The blinding darkness, the dark light.\nThe bell rings out for no one."
ITEM.width = 3
ITEM.height = 3
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "???"
ITEM.color = Color(150, 150, 150)

ITEM.iconCam = {
	pos = Vector(0, 200, 18),
	ang = Angle(0, 270, 0),
	fov = 12,
}

ITEM.functions.Ring = {
	icon = "icon16/bell.png",
	--sound = "ambient/gas/steam2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
	
		nut.chat.send(client, "itclose", "The bell is rung, but it makes no sound.")	
	
		return false
	end
}