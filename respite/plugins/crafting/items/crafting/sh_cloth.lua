ITEM.name = "Cloth"
ITEM.uniqueID = "j_scrap_cloth"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.desc = "Some cloth."
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