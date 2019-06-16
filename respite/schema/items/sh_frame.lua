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
ITEM.color = Color(70, 120, 70)

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
		
		local ichor = inventory:getFirstItemOfType("ichor")
		
		if(!ichor) then
			client:notify("You require ichor for this.")
			return false
		end
		
		local amount = ichor:getData("Amount", 1)
		ichor:setData("Amount", amount - 1) --costs 5
		if (ichor:getData("Amount", 1) == 0) then
			ichor:remove()
		end
		
		nut.chat.send(client, "itclose", "The ichor seeps into the frame.")
		item:setData("producing", CurTime())
		timer.Simple(22, function()
			if (item != nil) then
				client:notifyLocalized("The frame has finished.")
				item:setData("producing", 0)
				
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
					inventory:addSmart(reward, 1, position)
					
					nut.chat.send(client, "itclose", "A picture has appeared in the frame.")
				else
					nut.item.spawn(reward, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the reward item above the entity
				end
				
				item:setData("last", "ichor")
			end
		end)
		
		return false
	end,
	onCanRun = function(item)
		local last = item:getData("last", "blight")
		
		--only let this action happen when the last used item was blight
		if(last != "blight") then
			return false
		end
	
		local prodTime = 22
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

ITEM.functions.Blight = {
	name = "Add Blight",
	icon = "icon16/picture_empty.png",
	sound = "ambient/water/distant_drip4.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local blight = inventory:getFirstItemOfType("blight")
		
		if(!blight) then
			client:notify("You require blight for this.")
			return false
		end
		
		blight:remove()
		
		nut.chat.send(client, "itclose", "The blight seeps into the frame.")
		
		item:setData("producing", CurTime())
		timer.Simple(22, function()
			if (item != nil) then
				item:setData("producing", nil)
			
				client:notify("The frame has finished.")

				local position = client:getItemDropPos()

				local reward = "j_paint_can"
				if(!IsValid(item:getEntity())) then
					inventory:addSmart(reward, 1, position)
					
					nut.chat.send(client, "itclose", "Paint begins to leak from the frame.")
				else
					nut.item.spawn(reward, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the reward item above the entity
				end
				
				item:setData("last", "blight")
			end
		end)
			
		return false
	end,
	onCanRun = function(item)
		local last = item:getData("last", "ichor")
		
		--only let this action happen when the last used item was blight
		if(last != "ichor") then
			return false
		end
	
		local prodTime = 22
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
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
		local required = inventory:getFirstItemOfType("ammo_battery")
			
		required:remove()

		nut.item.spawn("j_painting1", position)

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The frame flickers with light, and a painting comes out of it.")

		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("ammo_battery") then 
			return false
		end
		
		return true
	end
}

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("producing", false)) then
		if(self:getData("last", "blight") == "blight") then
			desc = desc .. "\nThe frame is black."
		else
			desc = desc .. "\nThe frame is white."
		end
	end
	
	return Format(desc)
end