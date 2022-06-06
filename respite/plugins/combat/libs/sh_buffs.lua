local PLUGIN = PLUGIN

local playerMeta = FindMetaTable("Player")

--gets all buffs
function playerMeta:getBuffs()
	local char = self:getChar()
	
	if(char) then
		return (char.buffs or {})
	else
		return {}
	end
end

--goes through all buffs and returns the modifications to a specific thing
function playerMeta:getBuffAttribute(buffAttribute)
	local modify = 0
	for k, buff in pairs(self:getBuffs()) do
		if(buff[buffAttribute]) then
			modify = modify + buff[buffAttribute]
		end
	end
	
	return modify
end

--goes through all buffs and returns the modifications to a specific thing, but this one's for tables
function playerMeta:getBuffAttributeTbl(buffAttribute)
	local modify = {}
	for _, buff in pairs(self:getBuffs()) do
		if(buff[buffAttribute]) then
			for k, v in pairs(buff[buffAttribute]) do
				modify[k] = (modify[k] or 0) + v
			end
		end
	end
	
	return modify
end

--adds a buff to a player
function playerMeta:addBuff(buff, id)
	local buffs = self:getBuffs()
	buffs[id or buff.uid] = buff
	
	local char = self:getChar()
	char.buffs = buffs

	if(buff.attrib) then
		for k, v in pairs(buff.attrib) do
			char:addBoost(buff.name or buff.uid, k, v)
		end
	end

	for k, recipient in pairs(player.GetAll()) do
		PLUGIN:buffNetworkAll(recipient, self, util.TableToJSON(buff), id)
	end
end

--removes a buff from a player
function playerMeta:removeBuff(buff, id)
	local buffs = self:getBuffs()
	
	local char = self:getChar()
	char.buffs = buffs
	
	local buff = buff or buffs[id or buff.uid] or {}
	
	if(buff.attrib) then
		for k, v in pairs(buff.attrib) do
			char:removeBoost(buff.name or buff.uid, k)
		end
	end
	
	-- if this buff is from food, clear stomach when it ends
	local stomachTbl = char:getVar("stomach", {})
	
	if(stomachTbl[id or buff.uid]) then
		stomachTbl[id or buff.uid] = nil
	end
	
	buffs[id or buff.uid] = nil
	
	for k, recipient in pairs(player.GetAll()) do
		PLUGIN:buffNetworkAll(recipient, self, 0, id or buff.uid)
		--netstream.Start(v, "buffNetworkAll", self, 0, id or buff.uid)
	end
end

--when the buff holder is hit
function playerMeta:buffGetHit()
	local buffs = self:getBuffs()
	for buffID, buffTbl in pairs(buffs) do
		if(buffTbl.hitsDef) then
			buffTbl.hitsDef = buffTbl.hitsDef - 1
			
			if(buffTbl.hitsDef == 0) then
				self:removeBuff(buffTbl)
			end
		end
	end
end

--when the buff holder hits
function playerMeta:buffOnHit()
	local buffs = self:getBuffs()
	for buffID, buffTbl in pairs(buffs) do
		if(buffTbl.hitsAttack) then
			buffTbl.hitsAttack = buffTbl.hitsAttack - 1
			
			if(buffTbl.hitsAttack == 0) then
				self:removeBuff(buffTbl)
			end
		end
	end
end

--clears all of a player's buffs
function playerMeta:clearBuffs()
	local char = self:getChar()
	char.buffs = nil
end

if(SERVER) then
	PLUGIN.networkQueueBuff = {}

	function PLUGIN:buffNetworkAll(recipient, entity, buffTbl, buffID)
		PLUGIN.networkQueueBuff[recipient] = PLUGIN.networkQueueBuff[recipient] or {}
		
		local tempTbl = {
			entity = entity,
			buffTbl = buffTbl,
			buffID = buffID,
		}
		
		table.insert(PLUGIN.networkQueueBuff[recipient], tempTbl)
	end
	
	function PLUGIN:buffThink()
		if((self.nextNetworkBuff or 0) > CurTime()) then return end
		self.nextNetworkBuff = CurTime() + 1
	
		for k, client in pairs(player.GetAll()) do
			local clientNet = PLUGIN.networkQueueBuff[client]
		
			if(clientNet and !table.IsEmpty(clientNet)) then
				local firstEntry = PLUGIN.networkQueueBuff[client][1]
				
				netstream.Start(client, "buffNetworkAll", firstEntry.entity, firstEntry.buffTbl, firstEntry.buffID)
				
				table.remove(PLUGIN.networkQueueBuff[client], 1)
			end
		end
	end
	
	--finish hook
	netstream.Hook("nut_buffF", function(client, target, data)
		data.uid = "customBuffTest"
	
		if(!data.duration) then
			data.duration = 10
		end
		
		target:addBuff(data)
	end)
else
	function PLUGIN:DrawCharInfo(client, character, info)
		if(!LocalPlayer():IsAdmin()) then return end
		
		local buffs = character.buffs
		if(buffs and !table.IsEmpty(buffs)) then
			local buffText = ""
			
			for k, v in pairs(buffs) do
				if(v.name) then
					buffText = buffText.. " " ..v.name.. "."
				end
			end

			info[#info + 1] = {buffText, color_white}
		end		
	end

	netstream.Hook("buffNetwork", function(data)
		local client = LocalPlayer()
		client:getChar().buffs = util.JSONToTable(data)
	end)
	
	netstream.Hook("buffNetworkAll", function(entity, buff, buffID)
		if(IsValid(entity) and entity.getBuffs) then
			local buffTbl
			if(buff and buff != 0) then
				buffTbl = util.JSONToTable(buff)
			end

			local char = entity:getChar()
			if(char) then
				char.buffs = entity:getBuffs()
				char.buffs[buffID or buffTbl.uid] = buffTbl
			end
		end
	end)	
	
	local function dataTemp(data, req)
		return data[req]
	end	
	
	local function dataTempTbl(data, req, sub)
		if(data[req]) then
			return data[req][sub]
		end
	end
	
	timer.Simple(1, function()
		--local dmgType = PLUGIN.dmgTypes
		--local effect = EFFS.effects
	
		local menuGenerate = {
			["nut_customBuff"] = {
				["name"] = {weight = 1, name = "Name", value = dataTemp, panelT = "DTextEntry"},
				["armor"] = {weight = 3, name = "Armor", value = dataTemp, panelT = "DNumberWang"},
				["evasion"] = {weight = 4, name = "Evasion", value = dataTemp, panelT = "DNumberWang"},
				["accuracy"] = {weight = 5, name = "Accuracy", value = dataTemp, panelT = "DNumberWang"},
				["lifesteal"] = {weight = 5, name = "Lifesteal", value = dataTemp, panelT = "DNumberWang"},
				["dmg"] = {weight = 6, name = "Damage Value", value = dataTemp, panelT = "DNumberWang"},
				["dmgT"] = {weight = 7, name = "Damage Type", value = dataTemp, panelT = "DComboBox", extra = PLUGIN.dmgTypes},
				["hpMax"] = {weight = 8, name = "Max HP", value = dataTemp, panelT = "DNumberWang"},
				["mpMax"] = {weight = 9, name = "Max MP", value = dataTemp, panelT = "DNumberWang"},
				["apMax"] = {weight = 10, name = "Max AP", value = dataTemp, panelT = "DNumberWang"},
				["duration"] = {weight = 11, name = "Duration", value = dataTemp, panelT = "DNumberWang"},
				--["attribs"] = {weight = 9, name = "Attributes", value = dataTempTbl, panelT = "DNumberWang", extra = nut.attribs.list},
				--["res"] = {weight = 9, name = "Resistances", value = dataTempTbl, panelT = "DNumberWang", extra = PLUGIN.dmgTypes},
				--["amp"] = {weight = 10, name = "Amplifications", value = dataTempTbl, panelT = "DNumberWang", extra = PLUGIN.dmgTypes},
			},
		}

		for k, v in pairs(menuGenerate) do
			netstream.Hook(k, function(target, data)
				local frame = vgui.Create("DFrame")
				frame:SetSize(450, 600)
				frame:Center()
				frame:SetTitle("Buffs")
				frame:MakePopup()
				frame:ShowCloseButton(true)

				local scroll = vgui.Create("DScrollPanel", frame)
				scroll:Dock(FILL)
				
				local configF = {}
				for name, field in SortedPairsByMemberValue(v, "weight") do
					if(!field.test) then
						local label = vgui.Create("DLabel", scroll)
						label:SetText(field.name)
						label:Dock(TOP)

						local entry = vgui.Create(field.panelT, scroll)
						entry:SetText(field.value(data, name) or "")
						entry:Dock(TOP)
						
						if(field.panelT == "DComboBox") then
							for choice, _ in pairs(field.extra) do
								entry:AddChoice(choice)
							end
						end
						
						configF[name] = entry
					else
						local label = vgui.Create("DLabel", scroll)
						label:SetText(field.name)
						label:Dock(TOP)

						local subTbl = {}
						
						for subKey, subValue in pairs(field.extra) do
							local subLabel = vgui.Create("DLabel", scroll)
							subLabel:SetText(subValue.name)
							subLabel:Dock(TOP)

							local entry = vgui.Create(field.panelT, scroll)
							entry:SetText(field.value(data, name, subKey) or "")
							entry:Dock(TOP)
							
							subTbl[subKey] = entry
						end
						
						configF[name] = subTbl
					end
				end

				--attribute customization
				local attribs = {}
				
				local attribsL = vgui.Create("DLabel", scroll)
				attribsL:SetText("Attributes")
				attribsL:Dock(TOP)
				
				for k, v in pairs(nut.attribs.list) do
					local attribL = vgui.Create("DLabel", scroll)
					attribL:SetText(v.name)
					attribL:Dock(TOP)
					
					local attribC = vgui.Create("DNumberWang", scroll)
					attribC.attrib = k
					attribC:SetDecimals(2)
					attribC:Dock(TOP)
					attribC:SetMax(200)
					attribC:SetMin(-200)
					attribC:SetValue(0)
					
					attribs[k] = attribC
				end
				
				--resistance customization
				local res = {}
				
				local resistL = vgui.Create("DLabel", scroll)
				resistL:SetText("Resistances")
				resistL:Dock(TOP)
				
				for k, v in pairs(PLUGIN.dmgTypes) do
					local resL = vgui.Create("DLabel", scroll)
					resL:SetText(v.name)
					resL:Dock(TOP)
					
					local resC = vgui.Create("DNumberWang", scroll)
					resC.attrib = k
					resC:SetDecimals(2)
					resC:Dock(TOP)
					resC:SetMax(200)
					resC:SetMin(-200)
					resC:SetValue(0)
					
					res[k] = resC
				end
				
				--amplification customization
				local amp = {}
				
				local amplifL = vgui.Create("DLabel", scroll)
				amplifL:SetText("Amplifications")
				amplifL:Dock(TOP)
				
				for k, v in pairs(PLUGIN.dmgTypes) do
					local ampL = vgui.Create("DLabel", scroll)
					ampL:SetText(v.name)
					ampL:Dock(TOP)
					
					local ampC = vgui.Create("DNumberWang", scroll)
					ampC.attrib = k
					ampC:SetDecimals(2)
					ampC:Dock(TOP)
					ampC:SetMax(200)
					ampC:SetMin(-200)
					ampC:SetValue(0)
					
					amp[k] = ampC
				end

				local finishB = vgui.Create("DButton", scroll)
				finishB:SetSize(60,20)
				finishB:SetText("Complete")
				finishB:Dock(TOP)
				finishB.DoClick = function()
					local buffData = {}
					
					for configK, configV in pairs(configF) do
						if(istable(configV)) then
							local subTbl = {}
							for k2, v2 in pairs(configV) do
								local value = (v2.GetValue and v2:GetValue()) or (v2.GetText and v2:GetText())
								if(value and value != "" and tonumber(value) != 0) then
									subTbl[k2] = value
								else
									subTbl[k2] = nil
								end
							end
							
							if(!table.IsEmpty(subTbl)) then
								buffData[configK] = subTbl
							end
						else
							local value = (configV.GetValue and configV:GetValue()) or (configV.GetText and configV:GetText())
							if(value and value != "" and tonumber(value) != 0) then
								buffData[configK] = value
							else
								buffData[configK] = nil
							end
						end
					end
					
					buffData["attribs"] = {}
					for k, v in pairs(attribs) do
						local value = v:GetValue()
						if(value != 0) then
							buffData["attribs"][k] = value
						end
					end
					
					buffData["res"] = {}
					for k, v in pairs(res) do
						local value = v:GetValue()
						if(value != 0) then
							buffData["res"][k] = value
						end
					end
					
					buffData["amp"] = {}
					for k, v in pairs(amp) do
						local value = v:GetValue()
						if(value != 0) then
							buffData["amp"][k] = value
						end
					end
					
					netstream.Start("nut_buffF", target, buffData)
					
					frame:Remove()
				end
				
				local cancelB = vgui.Create("DButton", scroll)
				cancelB:SetSize(60,20)
				cancelB:SetText("Cancel")
				cancelB:Dock(TOP)
				cancelB.DoClick = function()
					frame:Remove()
				end
			end)
		end
	end)
end

nut.command.add("bufftarget", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			netstream.Start(client, "nut_customBuff", target, {})
		end
	end
})