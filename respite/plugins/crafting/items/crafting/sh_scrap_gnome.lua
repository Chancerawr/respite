ITEM.name = "Gnome Chunks"
ITEM.uniqueID = "c_scrap_gnome"
ITEM.model = "models/gibs/scanner_gib02.mdl"
ITEM.material = "phoenix_storms/concrete0"
ITEM.desc = "Chunks of a garden gnome.\nYou are a horrible person."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 4

ITEM.data = {
	Amount = 1
}
--[[
function ITEM:getDesc()
	return Format(self.desc, self:getData("Amount"))
end--]]