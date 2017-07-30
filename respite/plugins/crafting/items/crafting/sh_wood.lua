ITEM.name = "Scrap Wood"
ITEM.uniqueID = "j_scrap_wood"
ITEM.model = "models/gibs/wood_gib01a.mdl"
ITEM.desc = "Some scrap wood."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 35

ITEM.data = {
	Amount = 1
}
--[[
function ITEM:getDesc()
	return Format(self.desc, self:getData("Amount"))
end--]]