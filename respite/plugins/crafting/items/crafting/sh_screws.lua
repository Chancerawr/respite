ITEM.name = "Assorted Screws"
ITEM.uniqueID = "j_scrap_screws"
ITEM.model = "models/props_junk/garbage_metalcan002a.mdl"
ITEM.desc = "Some assorted screws in a small tin."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 100

ITEM.data = {
	Amount = 1
}
--[[
function ITEM:getDesc()
	return Format(self.desc, self:getData("Amount"))
end--]]