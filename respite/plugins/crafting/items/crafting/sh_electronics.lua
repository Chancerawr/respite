ITEM.name = "Scrap Electronics"
ITEM.uniqueID = "j_scrap_elecs"
ITEM.model = "models/gibs/scanner_gib04.mdl"
ITEM.desc = "Some scrap electronic parts."
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