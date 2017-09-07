ITEM.name = "Component"
ITEM.desc = "A Weapon."
ITEM.category = "Components"
ITEM.model = "models/weapons/w_pistol.mdl"
ITEM.width = 1
ITEM.height = 1

local quality = {}
quality[0] = "Terrible"
quality[1] = "Awful"
quality[2] = "Bad"
quality[3] = "Poor"
quality[4] = "Normal"
quality[5] = "Decent"
quality[6] = "Good"
quality[7] = "Great"
quality[8] = "Excellent"
quality[9] = "Master"
quality[10] = "Perfect"

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("quality") != nil) then
		desc = desc .. "\nQuality: " .. quality[math.Round(self:getData("quality"))]
	end
	
	return Format(desc)
end
