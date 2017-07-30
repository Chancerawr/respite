ITEM.name = "Some Rubber"
ITEM.uniqueID = "j_scrap_rubber"
ITEM.model = "models/gibs/antlion_gib_small_3.mdl"
ITEM.desc = "A small container of some rubber."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.data = {
	Amount = 1
}
--[[
function ITEM:getDesc()
	return Format(self.desc, self:getData("Amount"))
end
--]]