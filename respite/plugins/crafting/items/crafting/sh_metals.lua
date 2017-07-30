ITEM.name = "Scrap Metal"
ITEM.uniqueID = "j_scrap_metals"
ITEM.model = "models/gibs/manhack_gib01.mdl"
ITEM.desc = "Some assorted metals."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 25

ITEM.data = {
	Amount = 1
}
--[[
function ITEM:getDesc()
	return Format(self.desc, self:getData("Amount"))
end
--]]