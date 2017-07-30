ITEM.name = "Some Plastic"
ITEM.uniqueID = "j_scrap_plastics"
ITEM.model = "models/props_wasteland/prison_toiletchunk01a.mdl"
ITEM.desc = "A small container of some plastic."
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