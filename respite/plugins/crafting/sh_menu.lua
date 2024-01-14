local PLUGIN = PLUGIN

if(SERVER) then
	local function tableMerger(finished, tab)
		for k, v in pairs(tab) do
			if(istable(v)) then
				if(!finished[k]) then
					finished[k] = {}
				end
				
				tableMerger(finished[k], v)
			else
				if(!isbool(finished[k])) then
					finished[k] = (finished[k] or 0) + v
				end
			end
		end
	end
	
	local function tableRounder(finished, tab, total, noAverage)
		for k, v in pairs(tab) do
			if(istable(v)) then
				if(!finished[k]) then
					finished[k] = {}
				end
				
				tableRounder(finished[k], v, total, noAverage)
			else
				if(noAverage) then
					finished[k] = math.Round(finished[k], 3)
				else
					finished[k] = math.Round((finished[k] / total), 3)
				end
			end
		end
	end

	netstream.Hook("nut_craftSpecial", function(client, entity, recipe)
		local inventory = entity:getInv()
		
		if (inventory and (client.nutNextOpen or 0) < CurTime()) then
			client.nutNextOpen = CurTime() + 1.5
		
			entity.receivers[client] = true
			inventory:sync(client)
			
			client.nutStorageEntity = entity
			
			netstream.Start(client, "nut_openSpecialCraft", entity, inventory:getID(), recipe)
		end
	end)
	
	netstream.Hook("nut_processSpecial", function(client, entity, recipe)
		local itemTable = RECIPES.recipes[recipe] --recipe info
		local success = true --succeeds until proven otherwise
		
		--gets items for every item id
		local items = {}
		for id, _ in pairs(entity:getInv():getItems()) do
			items[id] = nut.item.instances[id]
		end
		
		local nameCount = {} --counts all the materials used so it can determine a name
		local craftInfo = {} --table that holds all of the stats from materials used
		local total = 0 --total items used
		
		--this counts up the total ingredients we have in the inventory so we can sort based on amount
		local temp = {}
		for id, item in pairs(items, false) do 
			local tags
			
			if(item.uniqueID == "quest_ingredient") then
				tags = item:getData("tags", {})
			else
				tags = item.loot
			end

			if(tags) then --an item's individual tags
				for k, v in pairs(tags) do
					if(!itemTable.items[k]) then continue end
					temp[k] = (temp[k] or 0) + 1
				end
			end
		end
		
		--constructs a table with the information of how much of which ingredient is in the inventory
		local requiredItems = {}
		
		for k, v in pairs(itemTable.items) do
			requiredItems[k] = {0, v}
		end
		
		for k, v in SortedPairsByValue(temp, false) do
			requiredItems[k] = {v, itemTable.items[k]}
		end
		
		--checks that the player has all the items
		local count
		for k, v in SortedPairsByMemberValue(requiredItems, 1, false) do --basically goes for the least common ingredient first
			local required = v[2]
			count = 0
			
			for id, item in pairs(items, false) do	
				local tags = item:getData("tags", item.loot)
				if(tags and tags[k]) then --an item's individual tags
					local craft
					if(item.uniqueID == "quest_ingredient") then
						craft = {
							attrib = item:getData("attrib"),
							res = item:getData("res"),
							amp = item:getData("amp"),
							
							dmg = item:getData("dmg"),
							armor = item:getData("armor"),
							weight = item:getData("weight"),
							
							hp = item:getData("hp"),
							hpMax = item:getData("hpMax"),
							mp = item:getData("mp"),
							mpMax = item:getData("mpMax"),
							
							evasion = item:getData("evasion"),
							accuracy = item:getData("accuracy"),
							
							critM = item:getData("critM"),
							critC = item:getData("critC"),
							
							magic = item:getData("magic"),
						}
					else
						craft = item.craft
					end
				
					if(count >= required) then
						break
					end
					
					--nothing left of this one
					if(item.mark and item.mark == 0) then
						continue
					end
					
					local quan = item.mark or item:getData("Amount", 1)
					
					count = count + quan
					
					local name = item:getData("prefix", item.prefix) or item:getName()
					if(count > required) then
						item.mark = count - required --marks the item with how much is left

						if(craft) then --ignore filler
							nameCount[name] = (nameCount[name] or 0) + quan - item.mark

							total = total + quan - item.mark
						end
					else
						item.mark = 0 --marks the item with 0 for later deletion
						
						if(craft) then --ignore filler
							nameCount[name] = (nameCount[name] or 0) + quan
						
							total = total + quan
						end
					end

					--gathers up all of the crafting info (stats, resistances, etc)
					if(craft) then
						for i = 1, (quan - (item.mark or 0)) do
							tableMerger(craftInfo, craft)
						end
					end
				end
			end
			
			--not enough of some item, so it fails
			if(count < required) then
				success = false
			end
		end
		
		--rounds and averages all the stuff in there
		tableRounder(craftInfo, craftInfo, total, itemTable.noAverage)
	
		--gets rid of things our item shouldn't have (swords with armor, armor with dmg, etc)
		if(itemTable.noarmor) then
			craftInfo.armor = nil
			craftInfo.res = nil
		end
		
		if(itemTable.nodmg) then
			craftInfo.dmg = nil
		end

		--constructs a name based on the two most used materials
		local first
		local second
		
		local counter = 1
		for k, v in SortedPairsByValue(nameCount, true) do --i hate this but was too lazy to find a better way
			if(counter == 1) then
				first = k
			elseif(counter == 2) then
				second = k
				break
			end
			
			counter = counter + 1
		end
		
		--crafting level, disabled for now
		local level = 0
		--local level = (client:getChar():getData("craft", {})[itemTable.profession] or 0) * 2
		
		--constructs the final name
		local itemName = (first or "").. (second and ("-" ..second.. " ") or " ") ..itemTable.name
		
		if(success) then
			--adds xp based on amount of things
			--client:addXP(total * 0.2, true)
		
			client:notify(itemName.. " crafted successfully.")
			for k, v in pairs(items) do
				if(v.mark == 0) then
					v:remove()
				elseif(v.mark) then
					v:setData("Amount", v.mark)
					v.mark = nil
				end
			end
			
			if(!itemTable.normResult) then
				for k, v in pairs(itemTable.result) do
					PLUGIN:specCraftItem(client, k, itemName, table.Copy(craftInfo), level, itemTable) --generates the actual resulting item
				end
			else --normal crafting
				for k, v in pairs(itemTable.result) do
					local inventory = client:getChar():getInv()
					
					if(itemTable.stackedResults) then
						inventory:addSmart(k, 1, client:getItemDropPos(), {Amount = v, ammo = v})
					else
						inventory:addSmart(k, v, client:getItemDropPos())
					end
				end
			end
			
			--[[
			if(itemTable.xp) then
				PLUGIN:giveCraftXP(client:getChar(), itemTable.profession, itemTable.xp)
			end
			--]]
		else
			client:notify("You do not have the required items.")
			
			for k, v in pairs(items) do
				v.mark = nil
			end
		end
	end)
	
	function PLUGIN:specCraftItem(client, uniqueID, name, craftInfo, level, recipe)
		--[[
		local baseWeightMult = 1
		local baseDmgMult = 1
		local baseArmorMult = 1
		
		if(LOOTGEN.loot[uniqueID]) then
			baseWeightMult = (LOOTGEN.loot[uniqueID].weight or 0) * 0.15
			baseDmgMult = (LOOTGEN.loot[uniqueID].dmg or 0) * 0.2
			baseArmorMult = (LOOTGEN.loot[uniqueID].armor or 0) * 0.1
		end
		
		--helps preserve ratios and stuff based on weight
		if(craftInfo) then
			if(craftInfo.weight) then
				craftInfo.weight = math.Round(craftInfo.weight * baseWeightMult, 1)
			end
			
			if(craftInfo.dmg) then
				craftInfo.dmg = math.Round(craftInfo.dmg * baseDmgMult, 1)
			end
			
			if(craftInfo.armor) then
				craftInfo.armor = math.Round(craftInfo.armor * baseArmorMult, 1)
			end
		end
		--]]
	
		--uses loot generation system to grab some extra values
		local generatedData = nut.plugin.list["equipment"]:generateLoot(level, uniqueID, true) or {}
		if(generatedData) then
			if(generatedData.custom) then
				generatedData.custom.name = name --name based on the ingredients
				generatedData.realName = name --realname is used for buffs usually
			else --make absolutely sure the name goes through
				generatedData.custom = {}
				generatedData.custom.name = name
			end
		end
		
		--merges the two tables hell yeah computer science
		tableMerger(generatedData, craftInfo)
		
		--used for special stuff, like noting that something is a potion or not
		if(recipe.data) then
			for k, v in pairs(recipe.data) do
				generatedData[k] = v
			end
		end
		
		if(uniqueID and !nut.item.list[uniqueID]) then 
			if(LOOTGEN.loot[uniqueID]) then
				uniqueID = LOOTGEN.loot[uniqueID].item
			else
				uniqueID = "quest_equip_11"
			end
		end
		
		--the creator of the item
		local charID = client:getChar():getID()
		if(charID) then
			generatedData.creator = charID
		end
		
		local inventory = client:getChar():getInv()
		nut.item.instance(0, uniqueID, generatedData, 1, 1, function(item) --creates the item
			local position = client:getItemDropPos()
			
			--adds it to the inventory or drops it if inventory full
			x, y = inventory:findFreePosition(item) 
			if(x and y) then
				item:setData("x", x)
				item:setData("y", y)

				inventory:addItem(item)
			else
				item:spawn(position)
			end
		end)
	end
else
	local paper = Material("icon16/book.png")
	local size = 16
	local border = 4
	local distance = size + border

	--checks to see if the profession of the recipe matches the profession of the table
	local function checkProfession(panelProf, recipProf)
		if(!panelProf or !recipProf) then
			return true
		end
		
		if(istable(recipProf)) then
			if(recipProf[panelProf]) then
				return true
			end
		elseif(!istable(recipProf)) then
			if(recipProf == panelProf) then
				return true
			end
		end
		
		return false
	end

	local PANEL = {}
		function PANEL:Init()
			self:SetPos(ScrW() * 0.375, ScrH() * 0.125)
			self:SetSize(ScrW() * nut.config.menuWidth, ScrH() * nut.config.menuHeight)
			self:MakePopup()
			self:SetTitle("Crafting")

			self.list = self:Add("DScrollPanel")
			self.list:Dock(FILL)
			self.list:SetDrawBackground(true)

			self.categories = {}
			self.nextBuy = 0

			hook.Call("CraftingPrePopulateItems", self)

			timer.Simple(0, function()
				for class, itemTable in SortedPairsByMemberValue(RECIPES:GetAll(), "category") do
					if(itemTable.level and level < itemTable.level) then continue end
				
					--if (checkProfession(self.profession, itemTable.profession) and trait) then
						local category = itemTable.category
						local category2 = string.lower(category)

						if (!self.categories[category2]) then
							local category3 = self.list:Add("DCollapsibleCategory")
							category3:Dock(TOP)
							category3:SetLabel(category)
							category3:DockMargin(5, 5, 5, 5)
							category3:SetPadding(5)

							local list = vgui.Create("DIconLayout")
								list.Paint = function(list, w, h)
									surface.SetDrawColor(0, 0, 0, 25)
									surface.DrawRect(0, 0, w, h)
								end
							category3:SetContents(list)

								local icon = list:Add("SpawnIcon")
								icon:SetModel(itemTable.model or "models/props_lab/box01a.mdl")		
								icon.PaintOver = function(icon, w, h)
									surface.SetDrawColor(0, 0, 0, 45)
									surface.DrawOutlinedRect(1, 1, w - 2, h - 2)

									if(itemTable.level) then
										draw.SimpleText(itemTable.level, "DermaDefault", w - 12, h - 14, Color(64,128,64), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
									end
								end

								local text = string.format("Crafting %s\n%s\n\nRequirements:\n", itemTable.name, itemTable.desc)
								local cnt = 0
								local brk = "\n"
								
								if(itemTable.special) then								
									for itc, qua in pairs(itemTable.items) do
										cnt = cnt + 1
										if (cnt == table.Count(itemTable.items)) then brk = "" end
		
										text = text ..itc.. " x " ..qua..brk
									end
								else
									for itc, qua in pairs(itemTable.items) do
										cnt = cnt + 1
										if (cnt == table.Count(itemTable.items)) then brk = "" end
										local tblItem = nut.item.list[itc]
										if tblItem then
											text = text .. tblItem.name .. " x ".. qua .. brk
										end
									end
								end
								icon:SetToolTip(text)
								
								function icon:OnCursorEntered()
									if(IsValid(icon.recipeDesc)) then
										icon.recipeDesc:Remove()
									end
								
									icon.recipeDesc = self:Add("DTextEntry")
									icon.recipeDesc:SetSize(320, 100)
									icon.recipeDesc:SetText("")
									
									local recipeDescPosX = icon:GetX() + icon:GetWide()
									--[[
									if(skillDescPosX > frame:GetWide()*0.55) then
										skillDescPosX = button:GetX() - button.recipeDesc:GetWide()
									end
									--]]
									
									icon.recipeDesc:SetPos(recipeDescPosX, icon:GetY())
									
									function icon.recipeDesc:Paint(w, h)
										--inner box of tooltip
										surface.SetDrawColor(0, 0, 0, 255)
										surface.DrawRect(0, 0, w, h)
									
										--outline of skill desc
										surface.SetDrawColor(255, 255, 255, 255)
										surface.DrawOutlinedRect(0, 0, w, h, 1)
										
										--[[
										if(ability.name) then
											local learned
											if(treeLevel >= k) then
												learned = "Learned"
											else
												learned = "Unlearned"
											end
										
											local abilityName = ability.name.. " (" ..learned.. ")"
										
											draw.DrawText(abilityName, "DermaDefault", w/2, 0, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
										end
										--]]
										
										if(text) then
											local descLines = nut.util.wrapText(text, 250, "DermaDefault")
										
											for lineIt, line in pairs(descLines) do
												draw.DrawText(line, "DermaDefault", 5, 4 + 12 * lineIt, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)
											end
										end
										--]]
									end
									
									icon.recipeDesc:MoveToFront()
								end
								
								function icon:OnCursorExited()
									if(IsValid(icon.skillDesc)) then
										icon.recipeDesc:Remove()
									end
								end
								
								icon.DoClick = function(panel)
									if(itemTable.special) then
										netstream.Start("nut_craftSpecial", self.ent, itemTable.uid)
										self:Close()
									else
										if (icon.disabled) then
											return
										end
										net.Start("nut_CraftItem")
											net.WriteString( class )
										net.SendToServer()
										icon.disabled = true
										icon:SetAlpha(70)
										timer.Simple(nut.config.buyDelay, function()
											if (IsValid(icon)) then
												icon.disabled = false
												icon:SetAlpha(255)
											end
										end)
									end
								end
							category3:InvalidateLayout(true)
							hook.Call("CraftingCategoryCreated", category3)
							self.categories[category2] = {list = list, category = category3, panel = panel}
						else
							local list = self.categories[category2].list
							local icon = list:Add("SpawnIcon")
							icon:SetModel(itemTable.model or "models/props_lab/box01a.mdl")
							
							local text = string.format("Crafting %s\n%s\n\nRequirements:\n", itemTable.name, itemTable.desc)
							local cnt = 0
							local brk = "\n"
							
							if(itemTable.special) then
								for itc, qua in pairs(itemTable.items) do
									cnt = cnt + 1
									if (cnt == table.Count(itemTable.items)) then brk = "" end
	
									text = text ..itc.. " x ".. qua .. brk
								end
							else
								for itc, qua in pairs(itemTable.items) do
									cnt = cnt + 1
									if (cnt == table.Count(itemTable.items)) then brk = "" end
									local tblItem = nut.item.list[itc]
									if tblItem then
										text = text .. tblItem.name .. " x ".. qua .. brk
									end
								end
							end
							icon:SetToolTip(text)
							
							--[[
							icon.OnCursorEntered = function(panel)
								if(IsValid(self.recipeDesc)) then
									self.recipeDesc:Remove()
								end
							
								self.recipeDesc = self:Add("DTextEntry")
								local recipeDesc = self.recipeDesc
								
								recipeDesc:SetSize(320, 100)
								recipeDesc:SetText("")
								
								local recipeDescPosX = icon:GetX() + icon:GetWide()
								recipeDesc:SetPos(recipeDescPosX, icon:GetY())
								
								function recipeDesc:Paint(w, h)
									--inner box of tooltip
									surface.SetDrawColor(0, 0, 0, 255)
									surface.DrawRect(0, 0, w, h)
								
									--outline of skill desc
									surface.SetDrawColor(255, 255, 255, 255)
									surface.DrawOutlinedRect(0, 0, w, h, 1)
									
									if(text) then
										local descLines = nut.util.wrapText(text, 250, "DermaDefault")
									
										for lineIt, line in pairs(descLines) do
											draw.DrawText(line, "DermaDefault", 5, 4 + 12 * lineIt, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)
										end
									end
								end
								
								recipeDesc:MoveToFront()
							end
							
							icon.OnCursorExited = function(panel)
								if(IsValid(self.recipeDesc)) then
									self.recipeDesc:Remove()
								end
							end
							--]]
							
							icon.DoClick = function(panel)
								if(itemTable.special) then
									netstream.Start("nut_craftSpecial", self.ent, itemTable.uid)
									self:Close()
								else	
									if (icon.disabled) then
										return
									end
									net.Start("nut_CraftItem")
										net.WriteString(class)
									net.SendToServer()
									icon.disabled = true
									icon:SetAlpha(70)
									timer.Simple(1, function()
										if (IsValid(icon)) then
											icon.disabled = false
											icon:SetAlpha(255)
										end
									end)
								end
							end

							hook.Call("CraftingItemCreated", itemTable, icon)			
						end
					--end
				end
			end)
			
			hook.Call("CraftingPostPopulateItems", self)
		end
		function PANEL:Think()
			if (!self:IsActive()) then
				self:MakePopup()
			end
		end
	vgui.Register("nut_Crafting", PANEL, "DFrame")

	--[[
	function PLUGIN:CreateMenuButtons(menu, addButton)
		if self.menuEnabled then
			addButton("crafting", nut.lang.Get("crafting"), function()
				nut.gui.crafting = vgui.Create("nut_Crafting", menu)
				menu:SetCurrentMenu(nut.gui.crafting)
			end)
		end
	end
	--]]

	netstream.Hook("nut_openSpecialCraft", function(storage, index, recipe)
		timer.Simple(0, function()
			local inventory = nut.inventory.instances[index]
			if (IsValid(storage) and inventory) then
				-- Number of pixels between the local inventory and storage inventory.
				local PADDING = 4

				-- Get the inventory for the player and storage.
				local localInv =
					LocalPlayer():getChar() and LocalPlayer():getChar():getInv()
				local storageInv = inventory
				if (not localInv or not storageInv) then
					return nutStorageBase:exitStorage()
				end

				-- Show both the storage and inventory.
				local localInvPanel = localInv:show()
				local storageInvPanel = storageInv:show()
				storageInvPanel:SetTitle(storage.PrintName)

				-- Allow the inventory panels to close.
				localInvPanel:ShowCloseButton(true)
				storageInvPanel:ShowCloseButton(true)

				-- Put the two panels, side by side, in the middle.
				local extraWidth = (storageInvPanel:GetWide() + PADDING) / 2
				localInvPanel:Center()
				storageInvPanel:Center()
				localInvPanel.x = localInvPanel.x + extraWidth
				storageInvPanel:MoveLeftOf(localInvPanel, PADDING)

				-- Signal that the user left the inventory if either closes.
				local firstToRemove = true
				localInvPanel.oldOnRemove = localInvPanel.OnRemove
				storageInvPanel.oldOnRemove = storageInvPanel.OnRemove

				local function exitStorageOnRemove(panel)
					if (firstToRemove) then
						firstToRemove = false
						nutStorageBase:exitStorage()
						local otherPanel =
							panel == localInvPanel and storageInvPanel or localInvPanel
						if (IsValid(otherPanel)) then otherPanel:Remove() end
					end
					panel:oldOnRemove()
				end

				hook.Run("OnCreateStoragePanel", localInvPanel, storageInvPanel, storage)

				localInvPanel.OnRemove = exitStorageOnRemove
				storageInvPanel.OnRemove = exitStorageOnRemove
				
				local actPanel = vgui.Create("DPanel")
				actPanel:SetDrawOnTop(true)
				actPanel:SetSize(storageInvPanel:GetWide(), 45)
				actPanel.Think = function(this)
					if (!storageInvPanel or !storageInvPanel:IsValid() or !storageInvPanel:IsVisible()) then
						this:Remove()

						return
					end

					local x, y = storageInvPanel:GetPos()
					this:SetPos(x, y - this:GetTall() - 5)
				end			
				
				-- just a var we can use to check if the panel is open or not
				nut.gui.craftingDynamic = storageInvPanel
				
				local toolTip = "Requirements:\n"
				local itemTable = RECIPES.recipes[recipe]
				local cnt = 0
				local brk = "\n"
				
				for itc, qua in pairs(itemTable.items) do
					cnt = cnt + 1
					if (cnt == table.Count(itemTable.items)) then brk = "" end

					toolTip = toolTip ..itc.. " x " ..qua..brk
				end
			
				local btn = actPanel:Add("DButton")
				btn:Dock(TOP)
				btn:SetTextColor(Color(255,255,255,255))
				btn:SetSize(btn:GetWide(), actPanel:GetTall() - 10)
				btn:SetText("Craft " ..itemTable.name)
				btn:SetToolTip(toolTip)
				btn:DockMargin(5, 5, 5, 0)
				btn.Paint = function(panel, w, h)
					surface.SetDrawColor(Color(70, 80, 100, 220))
					surface.DrawRect(0, 0, w, h)
				end

				function btn.DoClick()
					netstream.Start("nut_processSpecial", storage, recipe)
				end
			end
		end)
	end)	
end