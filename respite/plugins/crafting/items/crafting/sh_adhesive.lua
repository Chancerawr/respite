ITEM.name = "Adhesive"
ITEM.uniqueID = "j_scrap_adhesive"
ITEM.model = "models/props_lab/jar01a.mdl"
ITEM.desc = "Some adhesive."
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
end
--]]