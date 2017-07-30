ITEM.name = "Scrap"
ITEM.uniqueID = "c_scrap"
ITEM.model = "models/gibs/scanner_gib02.mdl"
ITEM.desc = "Scrap materials scavenged from some object."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.data = {
	Amount = 1
}
--[[
function ITEM:getDesc()
	return Format(self.desc, self:getData("Amount"))
end--]]