ITEM.name = "Refinery"
ITEM.desc = ""
ITEM.category = "Machines"
ITEM.model = "models/props_lab/reciever01b.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.color = Color(100,110,100)
ITEM.flag = "v"

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 10,
}

--put this in individual items since it doesnt work as just a base thing
--[[
for k, v in pairs(ITEM.funcTable) do
	ITEM.functions[v.id] = {
		name = v.name,
		icon = v.icon,
		onRun = function(item)
			local client = item.player
			local position = client:getItemDropPos()
			local inventory = client:getChar():getInv()
			
			if(v.required) then
				local required = requiredItems(inventory, item, v.required)
				if (!required) then
					client:notify("You do not have the required materials.") 
					return false
				end
			end
		
			if(v.results) then
				for newItem, amt in pairs(v.results) do
					inventory:addSmart(newItem, amt, position, v.data)
				end
			end
			
			if(v.sound) then
				client:EmitSound(v.sound)
			end
			
			if(v.endString) then
				nut.chat.send(client, "itclose", v.endString)
			end

			return false
		end
	}
end
--]]

function ITEM:getDesc(partial)
	local desc = self.desc
	
	if(self:getData("producing", false)) then
		desc = desc.. "\nThe refinery is vibrating and making some kind of whirring noise."
	end
	
	if(!partial) then
		desc = desc.. "\n\nFunctions"
		
		if(self.funcTable) then
			for k, v in pairs(self.funcTable) do
				desc = desc.. "\n " ..v.name.. ":"
				for item, amt in pairs(v.required or {}) do
					local name = nut.item.list[item].name or "Something"
					if(name) then
						desc = desc.. "\n    " ..name.. ": " ..amt.. "x"
					end
				end
				desc = desc.. "\n"
			end
		end
	end
	
	return Format(desc)
end