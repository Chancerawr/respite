ITEM.name = "Tome of Knowledge"
ITEM.uniqueID = "experience"
ITEM.model = "models/props_lab/binderredlabel.mdl"
ITEM.desc = "This is an OOC item used to give a stat upgrade after combat. It will increase the chosen stat by 1."
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.price = 999999
ITEM.category = "OOC"
ITEM.data = { customCol = Color(255, 253, 0) }
ITEM.color = Color(255, 253, 0)

ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 4.5,
}

for k, v in pairs(nut.attribs.list) do
	ITEM.functions[v.name] = {
		icon = "icon16/box.png",
		sound = "buttons/lightswitch2.wav",
		onRun = function(item)
			local client = item.player
			local char = client:getChar()
			char:updateAttrib(k, 1)
		end
	}
end