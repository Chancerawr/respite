ITEM.name = "Component"
ITEM.desc = "A Weapon."
ITEM.category = "Components"
ITEM.model = "models/weapons/w_pistol.mdl"
ITEM.width = 1
ITEM.height = 1

function ITEM:getDesc(partial)
	local desc = self.desc

	local customData = self:getData("custom", {})
	if(customData.quality) then
		desc = desc .. "\nQuality: " ..customData.quality
	end
	
	return Format(desc)
end
