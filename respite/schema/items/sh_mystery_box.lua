ITEM.name = "Mystery Box"
ITEM.desc = "A strange box, I wonder what's inside?"
ITEM.model = Model("models/Items/item_item_crate.mdl")
ITEM.material = "models/props_lab/security_screens"
ITEM.uniqueID = "mystery_box"
ITEM.price = 500
ITEM.flag = "v"
ITEM.width = 2
ITEM.height = 2
ITEM.color = Color(140, 20, 140)

ITEM.functions.Open = {
	icon = "icon16/box.png",
	sound = "items/ammocrate_open.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local char = client:getChar()
		local inventory = char:getInv()
		local luck = math.Clamp(char:getAttrib("luck"), 0, 100)
		--designed so that people with large amounts of luck can always roll low, but are less likely to.
		local luckRoll = math.random(math.random(luck,100), 100) 
		
		local RContent = math.random(0,100)
		local contents = "shard" --used to drop item at the end. Defaulted to shard.
		--sorry for the big complicated mess.
		if(RContent == 0) then
			client:notifyLocalized("You feel very unlucky.")
			--char:updateAttrib("luck", 1)
		elseif(RContent < 10) then --shard
			if(luckRoll > 70) then --potential bonus
				nut.item.spawn("shard", position)
				nut.item.spawn("shard", position)
			end
		elseif(RContent < 20) then --battery refinery
			contents = "refinery_battery"
			if(luckRoll > 50) then 
				nut.item.spawn("j_scrap_battery", position)
				nut.item.spawn("j_scrap_battery", position)
				nut.item.spawn("j_scrap_battery", position)
			end
		elseif(RContent < 30) then --chemical refinery
			contents = "refinery_chems"
			if(luckRoll > 50) then 
				nut.item.spawn("j_scrap_chems", position)
				nut.item.spawn("j_scrap_chems", position)
				nut.item.spawn("j_scrap_chems", position)
			end
		elseif(RContent < 40) then --chemical refinery 2
			contents = "refinery_chems2"
			if(luckRoll > 50) then 
				nut.item.spawn("j_scrap_chems", position)
				nut.item.spawn("j_scrap_chems", position)
				nut.item.spawn("j_scrap_chems", position)
			end
		elseif(RContent < 50) then --food cube
			contents = "cube_b"
			if(luckRoll > 50) then 
				nut.item.spawn("farm_potato", position)
			end
		elseif(RContent < 60) then --cure device
			contents = "ev_device"
			if(luckRoll < 50) then 
				nut.item.spawn("cure", position)
				nut.item.spawn("cure", position)
				nut.item.spawn("cure", position)
				nut.item.spawn("cure", position)
			end
		elseif(RContent < 70) then --chip generator
			contents = "generator_chip"
			if(luckRoll < 50) then --4 chips if we roll less than 50
				nut.item.spawn("cube_chip", position)
				nut.item.spawn("cube_chip", position)
				nut.item.spawn("cube_chip", position)
				nut.item.spawn("cube_chip", position)
			elseif(luckRoll > 80) then --chip pouch if we roll more than 80
				nut.item.spawn("cube_chip_pouch", position)
			end
		elseif(RContent < 80) then --screw refinery
			contents = "refinery_screws"
			if(luckRoll > 60) then 
				nut.item.spawn("j_scrap_screws", position)
				nut.item.spawn("j_scrap_screws", position)
				nut.item.spawn("j_scrap_screws", position)
				nut.item.spawn("j_scrap_screws", position)
			end
		elseif(RContent < 90) then --converter
			contents = "converter"
			if(luckRoll > 50) then 
				nut.item.spawn("food_apple_plastic", position)
				nut.item.spawn("food_orange_plastic", position)
				nut.item.spawn("food_lemon_plastic", position)
				nut.item.spawn("food_banana_plastic", position)
			end
		elseif(RContent <= 100) then --peculiar statue
			contents = "statue"
			if(luckRoll > 50) then 
				nut.item.spawn("food_blood", position)
				nut.item.spawn("food_blood", position)
				nut.item.spawn("food_blood", position)
			end	
		end
		if(math.random(1,10) == 10) then --random chance to drop a smaller mystery box
			client:notify("Another box?")
			nut.item.spawn("mystery_box_2", position)
		end
		nut.item.spawn(contents, position)
	end
}