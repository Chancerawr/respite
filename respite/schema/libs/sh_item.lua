nut.item = nut.item or {}
nut.item.list = nut.item.list or {}
nut.item.base = nut.item.base or {}
nut.item.instances = nut.item.instances or {}
nut.item.inventories = nut.item.inventories or {
	[0] = {}
}
nut.item.inventoryTypes = nut.item.inventoryTypes or {}

nut.util.include("nutscript/gamemode/core/meta/sh_item.lua")

do
	nut.util.include("nutscript/gamemode/core/meta/sh_inventory.lua")

	if (CLIENT) then
		netstream.Hook("invData", function(id, key, value)
			local item = nut.item.instances[id]

			if (item) then
				item.data = item.data or {}
				item.data[key] = value

				local panel = item.invID and nut.gui["inv"..item.invID] or nut.gui.inv1

				if (panel and panel.panels) then
					local icon = panel.panels[id]

					if (icon) then
						local color
						if(item:getData("customCol")) then
							color = item:getData("customCol")
						elseif(item.color) then
							color = item.color
						else
							color = nut.config.get("color")
						end
							
						icon:SetToolTip(
							"Item ID: #" .. item.id .. "\n\n" ..
							Format(nut.config.itemFormat,
							"<color="..color.r..","..color.g..","..color.b..">"..item:getName().."</color>", item:getDesc() or "")
						)
					end
				end
			end
		end)

		netstream.Hook("invSet", function(invID, x, y, uniqueID, id, owner, data, a)
			local character = LocalPlayer():getChar()

			if (owner) then
				character = nut.char.loaded[owner]
			end

			if (character) then
				local inventory = nut.item.inventories[invID]

				if (inventory) then
					local item = uniqueID and id and nut.item.new(uniqueID, id) or nil
					item.invID = invID

					item.data = {}
					-- Let's just be sure about it kk?
					if (data) then
						item.data = data
					end

					inventory.slots[x] = inventory.slots[x] or {}
					inventory.slots[x][y] = item

					local panel = nut.gui["inv"..invID] or nut.gui.inv1

					if (IsValid(panel)) then
						local icon = panel:addIcon(item.model or "models/props_junk/popcan01a.mdl", x, y, item.width, item.height)

						if (IsValid(icon)) then
							local color
							if(item:getData("customCol")) then
								color = item:getData("customCol")
							elseif(item.color) then
								color = item.color
							else
								color = nut.config.get("color")
							end
							
							icon:SetToolTip(
								"Item ID: #" .. item.id .. "\n\n" ..
								Format(nut.config.itemFormat,
								"<color="..color.r..","..color.g..","..color.b..">"..item:getName().."</color>", item:getDesc() or "")
							)
							icon.itemID = item.id
							
							panel.panels[item.id] = icon
						end
					end
				end
			end
		end)
	end
end
