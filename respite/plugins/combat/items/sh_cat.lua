ITEM.name = "Plastic Cat"
ITEM.desc = "This is a cat, it is made of plastic."
ITEM.uniqueID = "cat"
ITEM.model = "models/props_junk/cardboard_box003a.mdl"
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

--for people to name their shit
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