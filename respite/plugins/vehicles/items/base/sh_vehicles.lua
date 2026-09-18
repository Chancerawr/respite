ITEM.name = "Vehicle Base"
ITEM.desc = ""
ITEM.model = "models/props_junk/gnome.mdl"
ITEM.category = "Vehicles"
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "V"

ITEM.worldModel = "models/props_lab/box01a.mdl"

ITEM.customizable = {
	["name"] = true,
	["desc"] = true,
	["model"] = true,
	["modelScale"] = true,
	["modelColor"] = true,
	["material"] = true,
	["color"] = true,
	["img"] = true,
}

ITEM.functions.Deploy = {
	name = "Deploy",
	tip = "useTip",
	icon = "icon16/arrow_out.png",
	onRun = function(item)
		local client = item.player

		local deployed = item:getData("deployed")
		if(IsValid(deployed)) then
			local cur_hp = deployed:GetCurHealth()
			local max_hp = deployed:GetMaxHealth()
		
			item:setData("health", cur_hp)
			item:setData("healthMax", max_hp)
		
			SafeRemoveEntity(deployed)
		end

		local weapon = client:GetWeapon("nut_vehiclespawner")
		if(!IsValid(weapon)) then
			weapon = client:Give("nut_vehiclespawner")
		end
		
		client:SelectWeapon("nut_vehiclespawner")
		
		if(IsValid(weapon)) then
			weapon.item = item
			weapon:SetNW2String("vehicleModel", item.model)
		end

		return false
	end,
	onCanRun = function(item)
		if(IsValid(item.entity)) then
			return false
		end
		
		local deployed = item:getData("deployed")
		if(IsValid(deployed)) then
			return false
		end
	
		return true
	end
}

ITEM.functions.Repair = {
	name = "Repair",
	tip = "useTip",
	icon = "icon16/wrench.png",
	sound = "physics/metal/metal_box_impact_soft2.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()
		
		local metal = inventory:getFirstItemOfType("j_scrap_metals")
		if(metal) then
			local amount = metal:getData("Amount", 1)
			
			if(amount > 1) then
				metal:setData("Amount", amount - 1)
			else
				metal:remove()
			end
			
			local health = item:getData("health")
			local healthMax = item:getData("healthMax")
			
			local deployed = item:getData("deployed")
			if(IsValid(deployed)) then
				health = deployed:GetCurHealth()
				healthMax = deployed:GetMaxHealth()
			end
			
			local repairAmt = healthMax * 0.15
			local newHealth = math.Round(health+repairAmt)
			newHealth = math.min(newHealth, healthMax)
			
			item:setData("health", newHealth)

			if(IsValid(deployed)) then
				deployed:SetCurHealth(newHealth)
				deployed:SetOnFire(false)
				deployed:SetOnSmoke(false)
			end
		end

		return false
	end,
	onCanRun = function(item)
		local health = item:getData("health")
		local healthMax = item:getData("healthMax")
		if(health and healthMax) then
			if(healthMax != health) then 
				return true
			else
				return false
			end
		end
		
		return false
	end
}

ITEM.functions.Recall = {
	name = "Recall",
	tip = "useTip",
	icon = "icon16/arrow_in.png",
	onRun = function(item)
		local client = item.player
		
		local deployed = item:getData("deployed")
		
		if(IsValid(deployed)) then
			local cur_hp = deployed:GetCurHealth()
			local max_hp = deployed:GetMaxHealth()
		
			item:setData("health", cur_hp)
			item:setData("healthMax", max_hp)
		
			SafeRemoveEntity(deployed)
		end
		
		item:setData("deployed", nil)

		return false
	end,
	onCanRun = function(item)
		local deployed = item:getData("deployed")
		if(deployed) then
			return true
		end
		
		return false
	end
}

ITEM.functions.Custom = {
	name = "Customize",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)		
		nut.plugin.list["customization"]:startCustom(item.player, item)
		
		return false
	end,
	
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

--for people to name their crafted items
ITEM.functions.CustomColor = {
	name = "Customize Color",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		local color = item:getData("color")

		local skin
		if(item.skinCustom) then
			skin = item:getData("skin", 0)
		end
		
		local model = item.model

		netstream.Start(client, "nut_vehicle_color", item.id, color, skin, model)

		return false
	end,
	onCanRun = function(item)
		return !IsValid(item.entity)
	end
}

if(SERVER) then
	netstream.Hook("nut_vehicle_colorF", function(client, itemID, color, skin)
		if(itemID) then
			local item = nut.item.instances[itemID]
			
			if(item) then
				item:setData("color", color)
				
				if(skin) then
					item:setData("skin", skin)
				end
			end
		end
	end)
else
	netstream.Hook("nut_vehicle_color", function(itemID, color, skin, modelPath)
		if(IsValid(nut.gui.menu)) then
			nut.gui.menu:Remove()
		end
	
		-- Background panel
		local frame = vgui.Create("DFrame")
		--frame:SetSize(400, 340)
		frame:SetSize(400, 400)
		frame:SetPos(ScrW()*0.5-600, ScrH()*0.5-200)
		frame:MakePopup()
		frame:ShowCloseButton(true)
		frame.OnRemove = function()
			if(IsValid(frame.modelPanel)) then
				frame.modelPanel:Remove()
			end
		end
		
		local modelPanel = vgui.Create("DPanel")
		modelPanel:SetSize(700,500)
		modelPanel:SetPos(frame:GetPos())
		modelPanel:MoveRightOf(frame, 8)
		modelPanel.Paint = function(panel, w, h)
		end
		frame.modelPanel = modelPanel
		
		local model = vgui.Create("nutModelPanel", modelPanel)
		model:Dock(FILL)
		model:SetFOV(30)
		model:SetCamPos(Vector(300,300,300))
		model:SetModel(modelPath)
		
		local yaw = 0
		model.LayoutEntity = function(panel, ent)
			-- Point camera toward the look pos
			--local lookAng = (panel.vLookatPos-panel.vCamPos):Angle()
			
			-- Rotate the look angles based on incrementing yaw value
			--lookAng:RotateAroundAxis(Vector(1, 0, 0), yaw)
			
			-- Set camera look angles
			--panel:SetLookAng(lookAng)
			
			-- Make entity rotate like normal
			ent:SetAngles(Angle(0, RealTime()*30,  0))
			
			yaw = yaw + 1
		end

		local entity = model:GetEntity()
		
		if(color) then
			model:SetColor(color)
		end

		local skinC
		if(skin) then
			entity:SetSkin(skin)
		
			local skinL = vgui.Create("DLabel", frame)
			skinL:Dock(TOP)
			skinL:SetText("Skin")
			skinL:DockMargin(0, 0, 0, 8)
			
			skinC = vgui.Create("DNumSlider", frame)
			skinC:Dock(TOP)
			skinC:SetDecimals(0)
			skinC:SetMin(0)
			skinC:DockMargin(0, 0, 0, 8)
			skinC:SetValue(skin)
			
			skinC:SetMax(entity:SkinCount()-1)
			skinC.OnValueChanged = function(panel, new)
				if(isnumber(new)) then
					entity:SetSkin(new)
				end
			end
		end
		
		local colorC = vgui.Create("DColorMixer", frame)
		colorC:Dock(TOP)
		colorC:DockMargin(0, 0, 0, 8)
		
		if(color) then
			colorC:SetColor(color)
		end
		
		colorC.ValueChanged = function(panel, colTbl)
			local newColor = Color(colTbl.r, colTbl.g, colTbl.b)
			
			model:SetColor(newColor)
		end
		
		local finishB = vgui.Create("DButton", frame)
		finishB:SetSize(60,20)
		finishB:SetText("Complete")
		finishB:Dock(TOP)
		finishB.DoClick = function()
			local customColor = colorC:GetColor()
			
			local customSkin
			if(skin) then
				customSkin = skinC:GetValue()
			end
		
			netstream.Start("nut_vehicle_colorF", itemID, customColor, customSkin)
			
			frame:Remove()
		end
		finishB.Paint = function(panel, w, h)
			surface.SetDrawColor(Color(0,0,0,255))
			surface.DrawRect(0,0,w,h)
		end
	end)
	
	--[[
	netstream.Hook("nut_vehicle_skin", function(itemID, color)
		-- Background panel
		local frame = vgui.Create("DFrame")
		frame:SetSize(400, 340)
		frame:Center()
		frame:MakePopup()
		frame:ShowCloseButton(true)

		local colorC = vgui.Create("DColorMixer", frame)
		colorC:Dock(TOP)
		colorC:DockMargin(0, 0, 0, 8)
		
		if(color) then
			colorC:SetColor(color)
		end
		
		local finishB = vgui.Create("DButton", frame)
		finishB:SetSize(60,20)
		finishB:SetText("Complete")
		finishB:Dock(TOP)
		finishB.DoClick = function()
			local customColor = colorC:GetColor()
		
			netstream.Start("nut_vehicle_skinF", itemID, customColor)
			
			frame:Remove()
		end
	end)
	--]]
end

function ITEM:getName()
	local name = self.name
	
	local customData = self:getData("custom", {})
	if(customData.name) then
		name = customData.name
	end

	return name
end

function ITEM:getDesc(partial)
	local desc = self.desc
	
	local customData = self:getData("custom", {})
	if(customData.desc) then
		desc = customData.desc
	end
	
	if(!partial) then
		local health = self:getData("health", 100)
		local healthMax = self:getData("healthMax", 100)
		
		local deployed = self:getData("deployed")
		if(IsValid(deployed)) then
			local health = deployed:GetCurHealth()
			local healthMax = deployed:GetMaxHealth()
		end
		
		if(health and healthMax) then
			desc = desc.. "\n"
			
			desc = desc.. "Health: " ..health.. "."
		end
	end
	
	return desc
end

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		local deployed = item:getData("deployed")
		
		local percentage
		if(IsValid(deployed)) then
			percentage = deployed:GetMaxHealth()/deployed:GetCurHealth()
		else
			percentage = item:getData("health", 100)/item:getData("healthMax", 100)
		end

		if (percentage) then
			draw.SimpleText((math.Round(percentage, 2)*100).. "%", "DermaDefault", 6, h - 16, Color(50,200,50), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
		end
	end
end