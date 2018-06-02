ITEM.name = "Empty Frame"
ITEM.uniqueID = "frame"
ITEM.model = "models/props/de_inferno/picture3.mdl"
ITEM.material = "models/gibs/woodgibs/woodgibs03"
ITEM.desc = "An empty picture frame, it is quite large. Something about it makes you feel like it's more than just a piece of wood.\n\nThe cycle continues."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(128, 128, 128)
ITEM.data = { producing2 = 0, last = "blight" }

ITEM.iconCam = {
	pos = Vector(200, 0, 3),
	ang = Angle(180, -0, 180),
	fov = 15,
}

ITEM.functions.Ichor = {
	name = "Add Ichor",
	icon = "icon16/picture_empty.png",
	sound = "ambient/water/distant_drip4.wav",
	onRun = function(item)
			local client = item.player
			local inventory = client:getChar():getInv()
			
			local ichor = inventory:hasItem("ichor")
			
			if(!ichor) then
				client:notify("You require ichor for this.")
				return false
			end
			
			local amount = ichor:getData("Amount")
			ichor:setData("Amount", amount - 1) --costs 5
			if (ichor:getData("Amount") == 0) then
				ichor:remove()
			end
			
			nut.chat.send(client, "itclose", "The ichor seeps into the frame.")
			item:setData("producing2", CurTime())
			timer.Simple(22, 
				function()
					if (item != nil) then
						client:notifyLocalized("The frame has finished.")
						item:setData("producing2", 0)
						local position = client:getItemDropPos()

						local paintings = {
							"j_picture_1",
							"j_picture_2",
							"j_picture_3",
							"j_picture_4",
							"j_picture_5"
						}
						
						local reward = table.Random(paintings)
						if(!IsValid(item:getEntity())) then
							nut.chat.send(client, "itclose", "A picture has appeared in the frame.")
							if(!inventory:add(reward)) then --if the inventory has space, put it in the inventory
								nut.item.spawn(reward, position) --if not, drop it on the ground
							end
						else
							nut.item.spawn(reward, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the reward item above the entity
						end
						
						item:setData("last", "ichor")
					end
				end
			)
			
		return false
	end,
	onCanRun = function(item)
		local last = item:getData("last", "blight")
		
		--only let this action happen when the last used item was blight
		if(last != "blight") then
			return false
		end
	
		local endTime = item:getData("producing2") + 22
		if (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) then
			return true 
		else
			return false
		end
	end
}

ITEM.functions.Blight = {
	name = "Add Blight",
	icon = "icon16/picture_empty.png",
	sound = "ambient/water/distant_drip4.wav",
	onRun = function(item)
			local client = item.player
			local inventory = client:getChar():getInv()
			
			local blight = inventory:hasItem("blight")
			
			if(!blight) then
				client:notify("You require blight for this.")
				return false
			end
			
			blight:remove()
			
			nut.chat.send(client, "itclose", "The blight seeps into the frame.")
			item:setData("producing2", CurTime())
			timer.Simple(22, 
				function()
					if (item != nil) then
						client:notifyLocalized("The frame has finished.")
						item:setData("producing2", 0)
						local position = client:getItemDropPos()

						local reward = "j_paint_can"
						if(!IsValid(item:getEntity())) then
							nut.chat.send(client, "itclose", "Paint begins to leak from the frame.")
							if(!inventory:add(reward)) then --if the inventory has space, put it in the inventory
								nut.item.spawn(reward, position) --if not, drop it on the ground
							end
						else
							nut.item.spawn(reward, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the reward item above the entity
						end
						
						item:setData("last", "blight")
					end
				end
			)
			
		return false
	end,
	onCanRun = function(item)
		local last = item:getData("last", "ichor")
		
		--only let this action happen when the last used item was blight
		if(last != "ichor") then
			return false
		end
	
		local endTime = item:getData("producing2") + 22
		if (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) then
			return true 
		else
			return false
		end
	end
}

ITEM.functions.Battery = {
	name = "Charged Battery",
	icon = "icon16/asterisk_orange.png",
	sound = "ambient/energy/zap9.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local required = inventory:hasItem("ammo_battery")
			
		required:remove()

		nut.item.spawn("j_painting1")

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The frame flickers with light, and a smaller painting comes out of it.")

		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		
		if !player:getChar():getInv():hasItem("ammo_battery") then 
			return false
		end
	end
}