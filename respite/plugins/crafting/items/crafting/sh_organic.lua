ITEM.name = "Organic Material"
ITEM.uniqueID = "j_scrap_organic"
ITEM.model = "models/props_lab/jar01a.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01b"
ITEM.desc = "Some organic material."
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