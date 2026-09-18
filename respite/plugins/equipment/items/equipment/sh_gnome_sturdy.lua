ITEM.name = "Sturdy Gnome"
ITEM.model = "models/props_junk/gnome.mdl"
ITEM.desc = "A sturdy looking gnome."
ITEM.uniqueID = "gnome_sturdy"
ITEM.slot = "Gnome"

ITEM.gnome = true

ITEM.attrib = {
	["end"] = 2,
	["fortitude"] = 2,
}

ITEM.upgradeSlots = { 
	["Dream"] = 1,
}

ITEM.salvage = {
	["c_scrap_gnome"] = 2
}

--makes it so it randomizes the emotion. Couldn't find a good function to hook this onto so it just happens when picked up or dropped.
local function onScrap(item)
	local client = item.player

	if(client) then
		client:EmitSound("ambient/voices/m_scream1.wav", 70, math.random(120,160))
	end
end
ITEM:hook("Scrap", onScrap)

ITEM.iconCam = {
	pos = Vector(280.4, 236.86, 184.78),
	ang = Angle(25, 220, 0),
	fov = 5.08,
}