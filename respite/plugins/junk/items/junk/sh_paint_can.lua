ITEM.name = "Paint Can"
ITEM.uniqueID = "j_paint_can"
ITEM.model = "models/props_junk/metal_paintcan001a.mdl"
ITEM.desc = "A can filled with paint."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.data = { scrapamount = 3, paint = nil }
ITEM.salvItem = "j_scrap_chems"

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("paint") != nil) then
		desc = desc .. "\nPaint Color: " .. self:getData("paint") .. "."
	end
	
	return Format(desc)
end

local emotions = {
	"White",
	"Orange",
	"Red",
	"Green",
	"Blue",
	"Teal",
	"Brown",
	"Black",
	"Gold",
	"Silver",
	"Pink",
}
	
--makes it so it randomizes the paint's color. Couldn't find a good function to hook this onto so it just happens when picked up or dropped.
local function onUse(item)
	if(!item:getData("paint")) then
		item:setData("paint", table.Random(emotions))
	end
end

ITEM:hook("drop", onUse)
ITEM:hook("take", onUse)
