ITEM.name = "Deployable Object"
ITEM.desc = ""
ITEM.model = "models/Items/grenadeAmmo.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.throwent = ""
ITEM.throwforce = 2500

ITEM.throwFunc = function(item, client, entity)
	local charge = item:getData("battery", 50)
	
	entity.RoundsInMag = charge
	entity.item = item
	entity.Owner = client
end

ITEM.functions.Deploy = {
	name = "Deploy",
	tip = "useTip",
	icon = "icon16/arrow_out.png",
	onRun = function(item)
		local client = item.player
		
		local deployed = item:getData("deployed")
		if(IsValid(deployed)) then
			SafeRemoveEntity(deployed)
		end
		
		local thrown = ents.Create(item.throwent)
		thrown:SetPos(client:EyePos() + client:GetAimVector() * 50)
		thrown:Spawn()
		
		local colorTbl = item:getData("color", {})
		local color = Color(colorTbl.r or 255, colorTbl.g or 255, colorTbl.b or 255)
		
		thrown:SetColor(color)
		
		item:setData("deployed", thrown)

		local phys = thrown:GetPhysicsObject()
		phys:SetVelocity(client:GetAimVector() * item.throwforce * math.Rand(.8, 1))
		phys:AddAngleVelocity(client:GetAimVector() * item.throwforce)
		
		if(item.throwFunc) then
			item:throwFunc(client, thrown)
		end

		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
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

--for people to name their crafted items
ITEM.functions.CustomColor = {
	name = "Customize Color",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		local color = item:getData("color")

		netstream.Start(client, "nut_deploy_color", item.id, color)

		return false
	end,
	onCanRun = function(item)
		return !IsValid(item.entity)
	end
}

--for people to name their crafted items
ITEM.functions.CustomName = {
	name = "Change Name",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		local customData = item:getData("custom", {})

		client:requestString("Change Name", "", function(text)
			customData.name = text or " "
			item:setData("custom", customData)
		end, customData.name)

		return false
	end,
	onCanRun = function(item)
		return !IsValid(item.entity)
	end
}

function ITEM:getName()
	local name = self.name
	
	local customData = self:getData("custom", {})
	if(customData.name) then
		name = customData.name
	end
	
	return name
end

if(SERVER) then
	netstream.Hook("nut_deploy_colorF", function(client, itemID, color)
		if(itemID) then
			local item = nut.item.instances[itemID]
			
			if(item) then
				item:setData("color", color)
			end
		end
	end)
else
	netstream.Hook("nut_deploy_color", function(itemID, color)
		-- Background panel
		frame = vgui.Create("DFrame")
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
		
			netstream.Start("nut_deploy_colorF", itemID, customColor)
			
			frame:Remove()
		end
	end)
end