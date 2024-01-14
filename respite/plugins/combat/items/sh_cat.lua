ITEM.name = "Plastic Cat"
ITEM.desc = "This is a cat, it is made of plastic."
ITEM.uniqueID = "cat"
ITEM.model = "models/jeezy/animals/siamese_cat/siamese_cat.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.worldModel = "models/props_junk/cardboard_box003a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Animal"
ITEM.color = Color(255, 253, 0)

ITEM.price = 200

ITEM.functions.Deploy = {
	name = "Deploy",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		
		local deploy = item:getData("deploy")
		if(IsValid(deploy)) then
			SafeRemoveEntity(deploy)
		end
		
		local name = item:getData("name")
		local skin = item:getData("skin")
		
		local ent = ents.Create("nut_combat_plastic_cat")
		ent:SetPos(client:EyePos() + client:GetAimVector() * 50)
		ent:Spawn()
		
		local colorTbl = item:getData("color", {})
		local color = Color(colorTbl.r or 255, colorTbl.g or 255, colorTbl.b or 255)
		
		ent:SetColor(color)
		
		ent:DropToFloor()

		ent.follow = client
		ent.desiredPos = nil
		ent.noSave = true -- don't save this when /centsave is run
		
		if(name) then
			ent:setNetVar("name", name)
		end
		
		if(skin) then
			timer.Simple(1, function()
				ent:SetSkin(skin)
			end)
		else
			timer.Simple(1, function()
				local skin = ent:GetSkin()
				item:setData("skin", skin)
			end)
		end
		
		ent:SetMaterial("phoenix_storms/mrref2")
		
		item:setData("deploy", ent)

		return false
	end,
}

ITEM.functions.Recall = {
	name = "Recall",
	tip = "useTip",
	icon = "icon16/arrow_down.png",
	onRun = function(item)
		local client = item.player
		
		local deploy = item:getData("deploy")
		if(IsValid(deploy)) then
			SafeRemoveEntity(deploy)
		end
		
		item:setData("deploy", nil)
		
		return false
	end,
	onCanRun = function(item)
		local deploy = item:getData("deploy")
		if(deploy) then
			return true
		end
		
		return false
	end
}

--for people to name their thing
ITEM.functions.CustomName = {
	name = "Change Name",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		client:requestString("Change Name", "", function(text)
			item:setData("name", tostring(text))
		end, item:getData("name", "Cat"))

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

		--uses deployable base code, need it or this wont do anything at all
		netstream.Start(client, "nut_deploy_color", item.id, color)

		return false
	end,
	onCanRun = function(item)
		return !IsValid(item.entity)
	end
}