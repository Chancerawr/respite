ITEM.name = "Concrete"
ITEM.uniqueID = "j_scrap_concrete"
ITEM.model = "models/props_debris/concrete_chunk03a.mdl"
ITEM.desc = "Some concrete."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 30

ITEM.data = {
	Amount = 1
}
--[[
function ITEM:getDesc()
	return Format(self.desc, self:getData("Amount"))
end
--]]