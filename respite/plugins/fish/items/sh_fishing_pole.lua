local PLUGIN = PLUGIN or nut.plugin.list["fish"]
ITEM.name = "Fishing Pole"
ITEM.desc = "A pole with a line and a reel attached to it. It glows in the dark and feels different than an ordinary fishing rod.\nCan use chips or organic material as bait."
ITEM.model = "models/props_junk/harpoon002a.mdl"
ITEM.uniqueID = "fishing_pole"
ITEM.price = 20
ITEM.flag = "v"
ITEM.color = Color(80, 80, 180)

function ITEM:CastHook(client)
	local hook = ents.Create("prop_physics")
	hook:SetPos(client:GetPos() + Vector(0,0,50))
	hook:SetModel("models/props_junk/meathook001a.mdl")
	hook:Spawn()
	
	local phys = hook:GetPhysicsObject()
	if IsValid(phys) then
		local ang = client:EyeAngles()
		phys:SetVelocityInstantaneous(ang:Forward() * math.random(300, 350))
		phys:SetMass(1)
		phys:SetBuoyancyRatio(0.1)
	end
	
	return hook
end

function ITEM:AttachRope(client, hook)
	local dummy = ents.Create("prop_physics")
	dummy:SetModel("models/props_junk/harpoon002a.mdl")
	dummy:SetPos(client:GetPos()+client:GetUp()*50)
	dummy:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	dummy:SetAngles(client:GetAngles())
	
	dummy:Spawn()
	
	constraint.Rope(dummy, hook, 0, 0, Vector(0,0,10), Vector(0,0,0), 400, 75, 0, 1, "cable/cable_lit", false, color_white)
	
	dummy:SetParent(client, 1)

	return dummy
end

function ITEM:StartFishing(bait, itemTable, hook, dummy)
	if(IsValid(hook) and IsValid(dummy)) then
		local item = self
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()
		
		local baitItem = inventory:getFirstItemOfType(bait)
		
		item:setData("producing", CurTime())
		
		local oldPos = client:GetPos()
		
		nut.chat.send(client, "itclose", "The hook is cast into the water.")
		
		client:setAction("Fishing...", 5, function()
			local luck = char:getAttrib("luck", 0)

			local position = client:getItemDropPos()
			
			item:setData("producing", nil)
			
			if(item and baitItem and IsValid(hook) and hook:WaterLevel() > 0) then
				local notif = PLUGIN:GetFishLoot(client, item, itemTable)
				
				local luckRoll = math.Clamp(math.random(0, math.floor(luck)), 0, 99)
				if(math.random(luckRoll, 150) < 90) then
					client:notify("Your bait was lost.")
					baitItem:remove()
				end
				
				local physObj = hook:GetPhysicsObject()
				if(IsValid(physObj)) then
					local up = Vector(math.random(-100,100),math.random(-100,100),math.random(5000,6000))

					physObj:AddVelocity(up)
				end
				
				client:notify(notif)
			else
				client:notify("Fishing failed.")
			end

			timer.Simple(math.Rand(1.25,2), function()
				SafeRemoveEntity(hook)
				SafeRemoveEntity(dummy)
			end)
		end)
	else
		SafeRemoveEntity(hook)
		SafeRemoveEntity(dummy)
		client:notify("How did you lose your hook?")
	end
end

ITEM.functions.FishBait = {
	name = "Fishing (Chip)",
	icon = "icon16/anchor.png",
	sound = "ambient/machines/spinup.wav",
	onRun = function(item)
		local client = item.player
		
		local bait = "cube_chip"
		
		--create the hook entity
		local hook = item:CastHook(client)
		
		--attach a rope to it
		local dummy = item:AttachRope(client, hook)

		local ammoDrop = function()
			local ammo = {
				"ammo_919",
				"ammo_45",
				"ammo_12g"
			}
			
			return table.Random(ammo)
		end
			
		local itemTable = {
			[PLUGIN.CatchFish] = 50,
			["cube_chip_enhanced"] = 1,
			["cube_chip_memory"] = 1,
			[ammoDrop] = 1,
			["food_banana"] = 2,
			["coin_10"] = 5,
			["purifier_water_tablet"] = 5,
			["food_monster_meat"] = 10,
			["j_scrap_memory"] = 10,
			["j_dark_wood"] = 10,
			["j_scrap_nails"] = 10,
			["ichor"] = 10,
			["blight"] = 10,
			["food_apple_cursed"] = 10,
			["j_scrap_chems"] = 10,
		}
		
		item:StartFishing(bait, itemTable, hook, dummy)
		
		return false
	end,
	onCanRun = function(item) --only one farm action should be happening at once with one item.
		local player = item.player
		
		if(!player:getChar():getInv():getFirstItemOfType("cube_chip")) then
			return false
		end
		
		local prodTime = 5
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true		
	end
}

ITEM.functions.FishNoBait = {
	name = "Fishing (Organic Material)",
	icon = "icon16/anchor.png",
	sound = "ambient/machines/spinup.wav",
	onRun = function(item)
		local client = item.player
		
		local bait = "j_scrap_organic"
		
		--create the hook entity
		local hook = item:CastHook(client)
		
		--attach a rope to it
		local dummy = item:AttachRope(client, hook)
		
		local itemTable = {
			[PLUGIN.CatchFishPlastic] = 50,
			["j_tinc"] = 10,
			["j_old_shoe"] = 10,
			["j_baby_doll"] = 10,
			["food_yams"] = 10,
			["coin_10"] = 10,
			["j_rib"] = 10,
			["drug_depress"] = 10,
			["food_laugh"] = 5,
			["food_banana"] = 5,
			["cube_chip"] = 5,
			["j_scrap_memory"] = 5,
			["j_cactus_plant"] = 1,
		}
		
		item:StartFishing(bait, itemTable, hook, dummy)

		return false
	end,
	onCanRun = function(item) --only one farm action should be happening at once with one item.
		local player = item.player
		
		local organic = player:getChar():getInv():getFirstItemOfType("j_scrap_organic")
		if(!organic) then
			return false
		end
	
		local prodTime = 10
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

ITEM.functions.FishHotDog = {
	name = "Fishing (Hot Dog)",
	icon = "icon16/anchor.png",
	sound = "ambient/machines/spinup.wav",
	onRun = function(item)
		local client = item.player
		
		local bait = "food_hotdog"
		
		--create the hook entity
		local hook = item:CastHook(client)
		
		--attach a rope to it
		local dummy = item:AttachRope(client, hook)
		
		local itemTable = {
			[PLUGIN.CatchFishHotDog] = 50,
		}
		
		item:StartFishing(bait, itemTable, hook, dummy)
		
		return false
	end,
	onCanRun = function(item) --only one farm action should be happening at once with one item.
		local player = item.player
		
		local bait = player:getChar():getInv():getFirstItemOfType("food_hotdog")
		if(!bait) then
			return false
		end
	
		local prodTime = 10
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
		
		local roll = math.random(1,2)
		if(roll == 1) then
			nut.chat.send(client, "itclose", "The device is charged momentarily, and produces a bottle of blue haze.")
			nut.item.spawn("haze_bottled", position)
		else
			nut.chat.send(client, "itclose", "The device is charged momentarily, and produces a bottle of pink haze.")		
			nut.item.spawn("haze_bottled_pink", position)
		end

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces- That can't be normal.")

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

function ITEM:onEntityCreated(entity)
	local physObj = entity:GetPhysicsObject()
	if(IsValid(physObj)) then
		physObj:SetMass(100)
	end
end

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 35,
}