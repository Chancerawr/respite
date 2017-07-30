ITEM.name = "Various Chemicals"
ITEM.uniqueID = "j_scrap_chems"
ITEM.model = "models/props_junk/garbage_plasticbottle002a.mdl"
ITEM.desc = "Some various chemicals."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 50

ITEM.data = {
	Amount = 1
}
--[[
function ITEM:getDesc()
	return Format(self.desc, self:getData("Amount"))
end
--]]