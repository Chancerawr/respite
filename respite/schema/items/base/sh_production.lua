ITEM.name = "Machine"
ITEM.desc = ""
ITEM.category = "Machines"
ITEM.model = "models/weapons/w_pistol.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.color = Color(100,110,100)
ITEM.flag = "v"

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("producing", false)) then
		desc = desc .. "\nThe device is active."
	end
	
	return Format(desc)
end