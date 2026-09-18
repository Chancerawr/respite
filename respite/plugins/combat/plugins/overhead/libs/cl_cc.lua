local PLUGIN = PLUGIN

function PLUGIN:ccSelect(panel, entity, trace, old)
	local client = LocalPlayer()

	netstream.Start("ccSelect", entity, trace)
	
	if(entity.onSelected) then
		entity:onSelected(client)
	end
	
	if(old) then
		if(entity.onDeselected) then
			entity:onDeselected(client)
		end
	end
	
	--networking
end

function PLUGIN:ccMove(panel, entity, position)
	--local check = PLUGIN:checkCapable(entity, position)

	netstream.Start("ccMove", entity, position)
end

function PLUGIN:ccAction(panel, entity, target, position)
	--local check = PLUGIN:checkCapable(entity, position)

	netstream.Start("ccAction", entity, target, position)
end

function PLUGIN:ccActionSelect(panel, entity)
	--local check = PLUGIN:checkCapable(entity, position)
	
	if(CLIENT) then
		local actionList = vgui.Create("nutActionList")
		actionList.actions = entity.actions
		actionList.entity = entity
	end

	--handled by derma
	--netstream.Start("ccActionSelect", entity, action)
end

netstream.Hook("ccUpdate", function(entity, data)
	--local actions = util.JSONToTable(data)
	
	--entity.actions = actions
	
	entity.actions = entity:getActions()
end)