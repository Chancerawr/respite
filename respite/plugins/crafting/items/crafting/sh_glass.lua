ITEM.name = "Glass"
ITEM.uniqueID = "j_scrap_glass"
ITEM.model = "models/props_junk/garbage_glassbottle001a_chunk04.mdl"
ITEM.desc = "Some glass."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 40

ITEM.data = {
	Amount = 1
}
--[[
function ITEM:getDesc()
	return Format(self.desc, self:getData("Amount"))
end
--]]