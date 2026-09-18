local PLUGIN = PLUGIN
PLUGIN.name = "Prop Descriptions"
PLUGIN.author = "Blazing & Angelsaur"
PLUGIN.desc = "Set descriptions for props."

function PLUGIN:ShouldDrawEntityInfo(entity)
   if (IsValid(entity) and (entity:GetClass("prop_*")) and entity:getNetVar("exDesc", exdesc)) then
       return true
   end
end

local drawText = nut.util.drawText
local descInfo = {}

function PLUGIN:DrawEntityInfo(entity, alpha)
    
	descInfo = {}
	
	--if stringFind(entity:GetClass(), "prop_") then
	
	if (IsValid(entity)) then
		local exDesc = entity:getNetVar("exDesc")
		if(!exDesc) then return end

		if (exDesc != entity.nutDescCache) then
			entity.nutDescCache = exDesc
			entity.nutDescLines = nut.util.wrapText(exDesc, ScrW() * 0.7, "nutMediumFont")
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

function PLUGIN:SetPropDesc(ent, data)
	--this weird table thing is for duplicator support
	local desc = data.desc

	if(desc) then
		ent:setNetVar("exDesc", desc)
		duplicator.StoreEntityModifier(ent, "propDesc", {desc = desc}) 
	elseif(!desc or desc == "") then
		ent:setNetVar("exDesc", nil)
		duplicator.StoreEntityModifier(ent, "propDesc", {desc = desc}) 
	end
end

duplicator.RegisterEntityModifier("propDesc", PLUGIN.SetPropDesc)

nut.command.add("propdesc", {
	adminOnly = true,
	syntax = "<string desc>",
	onRun = function(client, arguments)
		local desc = table.concat(arguments, " ")
		local ent = client:GetEyeTrace().Entity

		if (IsValid(ent)) then
			PLUGIN:SetPropDesc(ent, {desc = desc})
		end
	end
})

nut.command.add("itemtoprop", {
	adminOnly = true,
	syntax = "<none>",
	onRun = function(client, arguments)
		local trace = client:GetEyeTrace()
		local item = trace.Entity
		if(IsValid(item) and item:GetClass() == "nut_item") then
			local itemPhys = item:GetPhysicsObject()
		
			local prop = ents.Create("prop_physics")
			prop:SetModel(item:GetModel())
			prop:SetMaterial(item:GetMaterial())
			prop:SetColor(item:GetColor())
			
			prop:SetPos(item:GetPos())
			prop:SetAngles(item:GetAngles())
			
			prop:Spawn()
			if(IsValid(prop)) then
				local physObj = prop:GetPhysicsObject()
				if(IsValid(physObj)) then
					if(itemPhys:IsMotionEnabled()) then
						physObj:EnableMotion(true)
					else
						physObj:EnableMotion(false)
					end
				end
			end
			
			if(nut.plugin.list["propdesc"]) then
				local itemTable = item:getItemTable()
				if(itemTable) then
					local custom = item:getData("custom", {})
				
					local name = custom.name or itemTable:getName()
					local desc = custom.desc or itemTable:getDesc(true)
					
					local data = {}
					data.desc = "[" ..name.. "] " ..desc

					nut.plugin.list["propdesc"]:SetPropDesc(prop, data)
				end
			end
			
			SafeRemoveEntity(item)
		end
	end
})