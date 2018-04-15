PLUGIN.name = "Prop Descriptions"
PLUGIN.author = "Blazing & Angelsaur"
PLUGIN.desc = "Set descriptions for props."

nut.command.add("propdesc", {
	syntax = "<string description>",
	onRun = function(client, arguments)
		local objdesc = arguments[1];
		local ent = client:GetEyeTrace().Entity

		if (!arguments[1]) then
			ent:setNetVar("exDesc", "")		
		end
		
		if (IsValid(ent)) then
		   ent:setNetVar("exDesc", objdesc)
        end
		
	end
})

function PLUGIN:ShouldDrawEntityInfo(entity)

   if (IsValid(entity) and (entity:GetClass("prop_*")) and entity:getNetVar("exDesc", exdesc)) then

       return true
	
   end
end

local drawText = nut.util.drawText
local descInfo = {}

function PLUGIN:DrawEntityInfo(entity, alpha)

    local exdesc = entity:getNetVar("exDesc")
	local stringFind = string.find
	
	descInfo = {}
	
	if stringFind(entity:GetClass(), "prop_") then
	
	if (IsValid(entity) and exdesc ) then
	
		if (exdesc != entity.nutDescCache) then
				entity.nutDescCache = exdesc
				entity.nutDescLines = nut.util.wrapText(exdesc, ScrW() * 0.7, "nutMediumFont")
			end
			
			for i = 1, #entity.nutDescLines do
				descInfo[#descInfo + 1] = {entity.nutDescLines[i]}
			end
			
	    local position = entity:LocalToWorld(entity:OBBCenter()):ToScreen()
		local ty = 0
		local x, y = position.x, position.y
		
		-- hook.Run("DrawDescInfo", descInfo)
		
		for i = 1, #descInfo do
		   local info = descInfo[i]
		   _, ty = drawText(info[1], x, y, color_white, 1, 1, "nutMediumFont")
		   y = y + ty
		   end
		end
	end
end

local entityMeta = FindMetaTable("Entity")

function entityMeta:getExDesc()
	return self:getNetVar("exDesc") 
end