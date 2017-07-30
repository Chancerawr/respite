ITEM.name = "Batteries"
ITEM.uniqueID = "j_scrap_battery"
ITEM.model = "models/Items/battery.mdl"
ITEM.desc = "A small container with batteries in it."
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