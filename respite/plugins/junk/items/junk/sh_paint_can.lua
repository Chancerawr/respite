ITEM.name = "Paint Can"
ITEM.uniqueID = "j_paint_can"
ITEM.model = "models/props_junk/metal_paintcan001a.mdl"
ITEM.desc = "A can filled with paint."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.salvItem = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 2
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("paint")) then
		desc = desc .. "\nPaint Color: " .. self:getData("paint") .. "."
	end
	
	return Format(desc)
end

local colors = {
	"White",
	"Orange",
	"Copper",
	"Red",
	"Green",
	"Dark Green",
	"Blue",
	"Dark Blue",
	"Teal",
	"Brown",
	"Black",
	"Gold",
	"Silver",
	"Purple",
	"Pink",
}
	
--makes it so it randomizes the paint's color. Couldn't find a good function to hook this onto so it just happens when picked up or dropped.
local function onUse(item)
	if(!item:getData("paint")) then
		item:setData("paint", table.Random(colors))
	end
end

ITEM:hook("drop", onUse)
ITEM:hook("take", onUse)
