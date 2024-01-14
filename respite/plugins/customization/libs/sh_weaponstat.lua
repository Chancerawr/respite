local PLUGIN = PLUGIN

--used for TFA weapons
local TFAmodify = {
	["Primary.Damage"] = function(val, data)
		return data.wepDmg
	end,
	["Primary.RPM"] = function(val, data)
		return data.wepSpd
	end,
	["Primary.KickUp"] = function(val, data)
		return val * data.wepRec
	end,
	["Primary.KickDown"] = function(val, data)
		return val * data.wepRec
	end,
	["Primary.StaticRecoilFactor"] = function(val, data)
		return val * data.wepRec
	end,
	["Primary.Spread"] = function(val, data)
		return val * data.wepAcc
	end,
	["Primary.IronAccuracy"] = function(val, data)
		return val * data.wepAcc
	end,
	["Primary.ClipSize"] = function(val, data)
		return data.wepMag
	end,
}

function PLUGIN:TFA_GetStat(wep, stat, val)
	if(wep.nutCustomized) then
		if(TFAmodify[stat]) then
			local modFunc = TFAmodify[stat]
			
			local newVal = modFunc(val, wep.nutCustomized)

			return newVal
		end
	end
end

--different SWEP bases require modification of different variables
--this table exists to more easily set which ones to modify
--it's also hooked into the customization system automatically
PLUGIN.weaponStatTbl = {
	["tfa"] = {
		checkFunction = function(swep)
			if(swep.IsTFAWeapon) then
				return true
			end
		end,
		customVars = {
			["wepDmg"] = function(data, swep)
				local val = tonumber(data.wepDmg) or (swep.Primary.Damage)
				swep.Primary.Damage = val
			
				return val
			end,
			["wepSpd"] = function(data, swep)
				local val = tonumber(data.wepSpd) or (swep.Primary.RPM)
				swep.Primary.RPM = val
			
				return val
			end,
			["wepAcc"] = function(data, swep)
				local val = tonumber(data.wepAcc) or 1
				swep.Primary.Spread = (swep.Primary.Spread or 1) * val
				swep.Primary.IronAccuracy = (swep.Primary.IronAccuracy or 1) * val
			
				return val
			end,
			["wepRec"] = function(data, swep)
				local val = tonumber(data.wepRec) or 1
				swep.Primary.KickUp = (swep.Primary.KickUp or 1) * val
				swep.Primary.KickDown = (swep.Primary.KickDown or 1) * val
				swep.Primary.KickHorizontal = (swep.Primary.KickHorizontal or 1) * val
				swep.Primary.StaticRecoilFactor = (swep.Primary.StaticRecoilFactor or 1) * val
				
				return val
			end,
			["wepMag"] = function(data, swep)
				local val = tonumber(data.wepMag) or swep.Primary.ClipSize
				swep.Primary.ClipSize = val
				
				return val
			end,
		},
		niceNames = {
			["wepDmg"] = "Damage",
			["wepSpd"] = "RPM (Rounds/Minute)",
			["wepAcc"] = "Accuracy (Multiplier)",
			["wepRec"] = "Recoil (Multiplier)",
			["wepMag"] = "Magazine",
		},
	},
	["meleearts"] = {
		checkFunction = function(swep)
			if(swep.Base == "dangumeleebase") then
				return true
			end
		end,
		customVars = {
			["wepDmgMin"] = function(data, swep)
				local val = tonumber(data.wepDmgMin) or (swep.DmgMin)
				swep.DmgMin = val
			
				return val
			end,
			["wepDmgMax"] = function(data, swep)
				local val = tonumber(data.wepDmgMax) or (swep.DmgMax)
				swep.DmgMax = val
			
				return val
			end,
			["wepDelay"] = function(data, swep)
				local val = tonumber(data.wepDelay) or (swep.Delay)
				swep.Delay = val
				
				return val
			end,
			["wepRange"] = function(data, swep)
				local val = tonumber(data.wepRange) or (swep.Range)
				swep.Range = val
				
				return val
			end,
			["wepChrgSpd"] = function(data, swep)
				local val = tonumber(data.wepChrgSpd) or (swep.ChargeSpeed)
				swep.ChargeSpeed = val
				
				return val
			end,
		},
		niceNames = {
			["wepDmgMin"] = "Damage (Minimum)",
			["wepDmgMax"] = "Damage (Maximum)",
			["wepDelay"] = "Delay",
			["wepRange"] = "Range",
			["wepChrgSpd"] = "Charge Speed",
		},
	},
}

--updates values of sweps
function PLUGIN:updateSWEP(client, item, weapon)
	local swep = weapon or weapons.Get(item.class)

	local customData = item:getData("customW", {})
	
	swep.PrintName = item:getName()

	if(swep and IsValid(swep)) then
		local itemInfo = {}
	
		for k, v in pairs(PLUGIN.weaponStatTbl) do
			if(v.checkFunction) then
				local check = v.checkFunction(swep)
				
				if(check) then
					if(v.customVars) then
						for stat, statFunc in pairs(v.customVars) do
							itemInfo[stat] = statFunc(customData, swep)
						end
					end
					
					--sync the data with the client
					if(SERVER) then
						netstream.Start(client, "nut_swepUpdate", item.id, swep)
					end
				end
			end
		end
		
		--used for SWEP hooks, just TFA for now
		swep.nutCustomized = itemInfo
	end
end	

if(SERVER) then
	function PLUGIN:WeaponEquip(weapon, client)
		--delay is to make sure the "item" value is actually there
		timer.Simple(0.5, function()
			local item = weapon.item
			
			if(item) then
				if(isnumber(item)) then
					item = nut.item.instances[item]
				end

				PLUGIN:updateSWEP(client, item, weapon)
			end
		end)
	end
	
	--customization start
	function PLUGIN:startCustomWeap(client, item, extra)
		if(item.class) then
			local customData = item:getData("customW", {})
		
			local itemInfo = {}
			itemInfo.id = item.id
	
			local swep = weapons.Get(item.class)
			
			local weaponData = {}
			for k, v in pairs(PLUGIN.weaponStatTbl) do
				if(v.checkFunction) then
					local check = v.checkFunction(swep)
					
					if(check) then
						if(v.customVars) then
							for stat, statFunc in pairs(v.customVars) do
								weaponData[stat] = statFunc(customData, swep)
							end
						end
						
						--used to identify the swep base easily on client
						itemInfo.swepBaseID = k
					end
				end
			end
			
			netstream.Start(client, "nut_customWeap", itemInfo, weaponData)
		end
	end
	
	--regular finish hook
	netstream.Hook("nut_customWeapF", function(client, data)
		if !client:IsAdmin() then
			return
		end

		local id = data[1]
		local item = nut.item.instances[id]
		local customData = data[2]
		
		if (item) then
			item:setData("customW", customData)
		end
	end)	
else
	--clientside hook for menus
	netstream.Hook("nut_customWeap", function(item, weaponData)
		local frame = vgui.Create("DFrame")
		frame:SetSize(450, 600)
		frame:Center()
		frame:SetTitle(name or "")
		frame:MakePopup()
		frame:ShowCloseButton(true)

		local scroll = vgui.Create("DScrollPanel", frame)
		scroll:Dock(FILL)

		frame.entries = {}
	
		for dataID, dataVal in pairs(weaponData) do
			local niceNames = {}
			
			if(item.swepBaseID) then
				niceNames = PLUGIN.weaponStatTbl[item.swepBaseID].niceNames
			end
		
			local label = vgui.Create("DLabel", scroll)
			label:SetText(niceNames[dataID] or dataID)
			label:Dock(TOP)
			
			local valueEntry = vgui.Create("DTextEntry", scroll)
			valueEntry:SetText(dataVal)
			valueEntry:Dock(TOP)
			
			frame.entries[dataID] = valueEntry
		end

		local finishB = vgui.Create("DButton", scroll)
		finishB:SetSize(60,20)
		finishB:SetText("Complete")
		finishB:Dock(TOP)
		finishB.DoClick = function()
			local customData = {}
			customData[1] = item.id
			customData[2] = {}
			
			for dataID, dataEntry in pairs(frame.entries) do
				customData[2][dataID] = dataEntry:GetValue()
			end

			netstream.Start("nut_customWeapF", customData)
			
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
	
	--networks the SWEP changes to the client
	netstream.Hook("nut_swepUpdate", function(itemID, swep)
		local client = LocalPlayer()
		local item = nut.item.instances[itemID]
	
		local weapon = swep or LocalPlayer():GetWeapon(item.class)
		if(weapon and IsValid(weapon)) then
			PLUGIN:updateSWEP(client, item, weapon)
		end
	end)	
end