PLUGIN.name = "Prop Descriptions"
PLUGIN.author = "Blazing"
PLUGIN.desc = "Set descriptions for props."

local langkey = "english"

do
	local langTable = {
	    descSet = "Description set.",
		descRemoved = "Description removed."
	}
	table.Merge(nut.lang.stored[langkey], langTable)
end

nut.command.add("propsetdesc", {
	syntax = "<string desc>",
	onRun = function(client, arguments)
		local objdesc = arguments[1];
		local ent = client:GetEyeTrace().Entity

		if (!arguments[1]) then
			ent:setNetVar("exDesc", "")
			return L("descRemoved", client)
			
		end
		
		if (IsValid(ent)) then
		   ent:setNetVar("exDesc", objdesc)
		   return L("descSet", client)
        end
		
	end
})


function PLUGIN:ShouldDrawEntityInfo(entity)

if (IsValid(entity) and (entity:GetClass("prop_*")) and entity:getNetVar("exDesc", exdesc)) then

return true

end

end

function PLUGIN:DrawEntityInfo(entity, alpha)
	local exdesc = entity:getNetVar("exDesc")
	local stringFind = string.find
	if stringFind(entity:GetClass(), "prop_") then
	
	if (IsValid(entity) and exdesc ) then
	
	    local position = entity:LocalToWorld(entity:OBBCenter()):ToScreen()
		local x, y = position.x, position.y
		nut.util.drawText(exdesc, x, y, Color(255,255,255,255), 1, 1, "nutObjDescFont")
		
		end
	end
end

local entityMeta = FindMetaTable("Entity")

function entityMeta:getExDesc()
	return self:getNetVar("exDesc") 
end