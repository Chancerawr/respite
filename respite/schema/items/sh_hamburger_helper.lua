ITEM.name = "Device - Hamburger Helper"
ITEM.uniqueID = "hamburger_helper"
ITEM.model = "models/props_junk/metal_paintcan001a.mdl"
ITEM.desc = "A strange metallic cylinder, it has a large opening at the top and a door on the side."
ITEM.width = 1
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.material = "models/props_canal/canal_bridge_railing_01a"
ITEM.category = "Machines"
ITEM.color = Color(50, 150, 50)
ITEM.data = { producing2 = 0 }

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}

local meats = {
	"food_monster_meat",
	"food_human_meat",
	"food_human_torso3",
	"food_human_torso2",
	"food_human_torso1",
	"food_human_pelvis",
	"food_human_legs",
	"food_human_leg2",
	"food_human_leg1",
	"food_human_hand",
	"food_human_foot",
	"food_human_arms",
	"food_human_arm2",
	"food_human_arm1"
}

ITEM.functions.Activate = {
	icon = "icon16/box.png",
	sound = "physics/metal/metal_solid_strain5.wav",
	onRun = function(item)
			local client = item.player
			local inventory = client:getChar():getInv()

			local meat
			
			for k, v in pairs (meats) do
				meat = inventory:hasItem(v)
				if (meat) then
					meat:remove()
					break
				end
			end
			
			if (!meat) then
				client:notifyLocalized("You don't have any usable meat!") return false
			end
			
			local kind = math.random(1,3)
			local result
			if(kind == 1) then
				result = "food_hamburger"
				client:notifyLocalized("Hamburger Helping has begun.")
			elseif(kind == 2) then
				result = "food_hotdog"
				client:notifyLocalized("Hot Dogging has begun.")
			else
				result = "food_bacon"
				client:notifyLocalized("Baconating has begun.")
			end
			item:setData("producing2", CurTime())
			timer.Simple(300, 
				function()
					if (item != nil) then
						item:setData("producing2", 0)
						client:notifyLocalized("Meat has been refined.")
						
						local position
						if(!IsValid(item:getEntity())) then--determines where to drop item
							position = client:getItemDropPos()
						else
							position = item:getEntity():GetPos() + item:getEntity():GetUp()*50
						end
						
						for i = 0, math.random(1,kind) do --1 if hamburger, 2 if hot dog, 3 if bacon. (For upper range)
							nut.item.spawn(result, position)
						end
					end
				end
			)
			
			return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local endTime = item:getData("producing2") + 300
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
		nut.item.spawn("food_human_meat", position)

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces some raw meat.")

		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		
		if !player:getChar():getInv():hasItem("ammo_battery") then 
			return false
		end
	end
}