ITEM.name = "Hamburger Helper"
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

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}

ITEM.functions.Activate = {
	icon = "icon16/box.png",
	sound = "physics/metal/metal_solid_strain5.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()

		local meat
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
		
		for k, v in pairs (meats) do
			meat = inventory:getFirstItemOfType(v)
			if (meat) then
				meat:remove()
				break
			end
		end
		
		if (!meat) then
			client:notify("You don't have any usable meat!") return false
		end
		
		local kind = math.random(1,4)
		local result
		local num
		if(kind == 1) then
			result = "food_hamburger"
			num = 1
			client:notify("Hamburger Helping has begun.")
		elseif(kind == 2) then
			result = "food_hotdog"
			num = 1
			client:notify("Hot Dogging has begun.")
		elseif(kind == 3) then
			result = "food_bacon"
			num = 2
			client:notify("Baconating has begun.")
		else
			result = "food_nuggets"
			num = 3
			client:notify("Nuggeting has begun.")
		end
		
		item:setData("producing", CurTime())
		timer.Simple(300, function()
			if (item != nil) then
				item:setData("producing", nil)
				client:notify("Meat has been refined.")
				
				if(!IsValid(item.entity)) then--determines where to drop item
					local position = client:getItemDropPos()
					
					inventory:addSmart(result, math.random(1,num), position, {cooked = math.random(3,4)})
				else
					local position = item.entity:GetPos() + item.entity:GetUp()*50
					
					for i = 1, math.random(1, num) do --1 if hamburger, 2 if hot dog, 3 if bacon. (For upper range)
						nut.item.spawn(result, position,
							function(item2)
								item2:setData("cooked", math.random(3,4))
							end
						)
					end
				end
			end
		end)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local prodTime = 300
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

		inventory:addSmart("food_human_meat", 1, position)
		inventory:addSmart("j_battery_dead", 1, position)
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces some raw human meat.")

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
		desc = desc .. "\nA delicious smell emits from the device, something is cooking."
	end
	
	return Format(desc)
end
