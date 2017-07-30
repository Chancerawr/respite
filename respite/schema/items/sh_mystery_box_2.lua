ITEM.name = "Mystery Box II"
ITEM.desc = "An even stranger box, I wonder what's inside?"
ITEM.model = Model("models/Items/item_item_crate.mdl")
ITEM.material = "models/props_lab/security_screens"
ITEM.uniqueID = "mystery_box_2"
ITEM.price = 500
ITEM.flag = "v"
ITEM.width = 1
ITEM.height = 1
ITEM.data = { customCol = Color(140, 20, 140) }
ITEM.color = Color(140, 20, 140)

if (CLIENT) then
	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		entity:SetModelScale(.5)
	end
end

ITEM.functions.Open = {
	icon = "icon16/box.png",
	sound = "items/ammocrate_open.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local char = client:getChar()
		local inventory = char:getInv()
		local luck = char:getAttrib("luck")
		--designed so that people with large amounts of luck can always roll low, but are less likely to.
		local luckRoll = math.random(math.random(luck,100), 100) 
		
		local RContent = math.random(0,100)
		local contents = "j_porn_gay" --used to drop item at the end. Defaulted to gay porn?
		
		--sorry for the big complicated mess.
		if(RContent <= 20) then --luck up
			contents = "food_carrot"
			client:notifyLocalized("You feel somewhat unlucky.")
			--char:updateAttrib("luck", 0.5)
		elseif(RContent < 30) then --shard
			contents = "farm_monster"
			if(luckRoll > 50) then 
				nut.item.spawn("food_monster_meat", position)
				nut.item.spawn("food_monster_meat", position)
				nut.item.spawn("food_monster_meat", position)
				nut.item.spawn("food_monster_meat", position)
			end
		elseif(RContent < 40) then --shard
			contents = "shard"
			if(luckRoll > 70) then --potential bonus
				nut.item.spawn("shard", position)
			end
		elseif(RContent < 50) then --water device
			contents = "bakery"
			if(luckRoll > 50) then 
				nut.item.spawn("food_donut", position)
				nut.item.spawn("food_donut", position)
				nut.item.spawn("food_donut", position)
				nut.item.spawn("food_donut_giant", position)
			end
		elseif(RContent < 60) then --water device
			contents = "cube_water"
			if(luckRoll > 50) then 
				nut.item.spawn("food_water_misc", position)
				nut.item.spawn("food_water_misc", position)
				nut.item.spawn("food_water_misc", position)
				nut.item.spawn("food_water_misc", position)
			end
		elseif(RContent < 70) then --purifier device
			contents = "nac"
			if(luckRoll > 50) then 
				nut.item.spawn("food_laugh", position)
				nut.item.spawn("food_laugh", position)
				nut.item.spawn("food_laugh", position)
				nut.item.spawn("food_laugh", position)
			end
		elseif(RContent < 80) then --purifier device
			contents = "purifier_water"
			if(luckRoll > 50) then 
				nut.item.spawn("purifier_water_tablet", position)
				nut.item.spawn("purifier_water_tablet", position)
				nut.item.spawn("purifier_water_tablet", position)
			end
		elseif(RContent < 90) then --currency refinery
			contents = "museum"
				if(luckRoll > 50) then 
					nut.item.spawn("j_picture1", position)
					nut.item.spawn("j_picture2", position)
					nut.item.spawn("j_picture3", position)
					nut.item.spawn("j_picture4", position)
					nut.item.spawn("j_picture5", position)
				end
		elseif(RContent < 100) then --currency refinery
			contents = "refinery_currency"
			if(luckRoll > 30) then 
				nut.currency.spawn(position, 50, Angle(0,0,0))	
				nut.currency.spawn(position, 50, Angle(0,0,0))	
				nut.currency.spawn(position, 50, Angle(0,0,0))	
			end
		elseif(RContent == 100) then --the northern lion
			client:notify("Jackpot?")
			nut.item.spawn("food_egg", position)
			nut.item.spawn("food_egg", position)
			nut.item.spawn("food_egg", position)
			nut.item.spawn("food_egg", position)
			nut.item.spawn("food_egg", position)
			nut.item.spawn("food_egg", position)
			nut.item.spawn("food_egg", position)
			nut.item.spawn("food_egg", position)
			nut.item.spawn("food_egg", position)
			nut.item.spawn("food_egg", position)
		end
		
		nut.item.spawn(contents, position)
	end
}