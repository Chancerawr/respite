ITEM.name = "Map"
ITEM.uniqueID = "j_map"
ITEM.model = "models/props_c17/paper01.mdl"
ITEM.desc = "An old paper map."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.material = "models/props_canal/canalmap_sheet"
ITEM.buffCategory = "Accessory"

ITEM.salvItem = {
	["misc_paper"] = 1
}

ITEM.attribBoosts = {
	["perception"] = 2,
	["medical"] = 2
}

ITEM.iconCam = {
	pos = Vector(0, -3.5, 200),
	ang = Angle(90, 0, 0),
	fov = 7,
}

ITEM.functions.View = {
	tip = "View the map",
	icon = "icon16/map.png",
	onRun = function(item)
		item.player:SendLua([[gui.OpenURL("http://spite.boards.net/thread/1547/map")]])
		return false
	end
}