ITEM.name = "Stack of Newspapers"
ITEM.uniqueID = "j_newspaper_stack"
ITEM.model = "models/props/cs_militia/newspaperstack01.mdl"
ITEM.desc = "A large stack of old newspapers."
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 2

ITEM.salvItem = {
	["j_newspaper"] = 4
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Garbage"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 12),
	ang = Angle(0, -0, 0),
	fov = 8,
}