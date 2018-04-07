ITEM.name = "Device - Requisition"
ITEM.uniqueID = "requisition"
ITEM.model = "models/props_lab/citizenradio.mdl"
ITEM.material = "models/props_combine/stasisfield_beam"
ITEM.desc = ""
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(140, 20, 140)

ITEM.iconCam = {
	pos = Vector(200, 0, 8),
	ang = Angle(180, -0, 180),
	fov = 10,
}

--from ji defenses
local function findSky(pos)
	local CheckPos = pos + Vector(0,0,100)
	local Tries = 0
	while(Tries < 500)do
		local TrDat = {}
		TrDat.start = CheckPos
		TrDat.endpos = CheckPos + Vector(0,0,50000)
		TrDat.filter = {self}
		local Tr = util.TraceLine(TrDat)
		if(Tr.HitSky) then
			return Tr.HitPos - Vector(0,0,50)
		else
			Tries = Tries+1
			CheckPos = CheckPos+Vector(0,0,100)
		end
	end
	return nil
end

ITEM.functions.Ammo = {
	icon = "icon16/package.png",
	--sound = "music/radio1.mp3",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()

		local ammo = { --pretty much every existing ammo item
			"ammo_76254",
			"ammo_76251",
			"ammo_76239",
			"ammo_54539",
			"ammo_55645",
			"ammo_5728",
			"ammo_4570",
			"ammo_3006",
			"ammo_919",
			"ammo_939",
			"ammo_500",
			"ammo_408",
			"ammo_50bmg",
			"ammo_50ae",
			"ammo_45",
			"ammo_44",
			"ammo_40sw",
			"ammo_12g",
			"ammo_concrete",
			"ammo_sawblade",
			"ammo_xbow"
		}
		
		local chip = inventory:hasItem("cube_chip_enhanced")
	
		client:requestString("Purchase", "This costs 400 scrap coins. Are you sure? Type 'yes' to proceed.", 
		function(text)
			if(text == "yes") then
				char:takeMoney(400)
				chip:remove()
				nut.chat.send(client, "itclose", "The strange device begins to emit some sort of noise.")
				
				local entity = item:getEntity() or client
				entity:EmitSound("music/radio1.mp3")
				
				local dropPos --place to drop the box
				if(!IsValid(item:getEntity())) then --checks if item is not on the ground
					dropPos = findSky(client:GetPos())
				else --if the item it on the ground
					dropPos = findSky(item:getEntity():GetPos())
				end
				
				timer.Simple(40, 
					function()
						if (item != nil) then
							local drop = table.Random(ammo)
							
							if(!IsValid(item:getEntity())) then --checks if item is not on the ground
								client:EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 100, 80)
							else --if the item it on the ground
								item:getEntity():EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 100, 80)
							end
							
							if(dropPos) then
								local contents = {
									drop,
									drop,
									drop,
									drop,
									drop
								}
								
								local Pack=ents.Create("ent_chance_aidbox")
								Pack:SetPos(dropPos-Vector(0,0,100))
								Pack.InitialVel=Vector(0,0,-2000)
								Pack.Contents = contents
								Pack:Spawn()
								Pack:Activate()
								client:notify("Supply Drop inbound.")
							else
								client:notify("No sky found, enhanced chip refunded.")
								if(!IsValid(item:getEntity())) then --checks if item is not on the ground
									if(!inventory:add("cube_chip_enhanced")) then --if the inventory has space, put it in the inventory
										nut.item.spawn("cube_chip_enhanced", client:getItemDropPos()) --if not, drop it on the ground
									end
									char:giveMoney(400)	
								else --if the item it on the ground
									nut.item.spawn("cube_chip_enhanced", item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the created item above the item
									char:giveMoney(400)
								end
							end
						end
					end
				)
			else
				client:notify("Transaction cancelled.")
				return false
			end
		end)
	return false
	end,
	onCanRun = function(item)
		local player
		if(item:getOwner() == nil) then --so we can do this on the ground or in the inventory
			player = item.player
		else
			player = item:getOwner()
		end
		
		if (!player:getChar():getInv():hasItem("cube_chip_enhanced") or player:getChar():getMoney() < 400) then 
			return false
		end
	end
}

ITEM.functions.Food = {
	icon = "icon16/package.png",
	--sound = "music/radio1.mp3",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()
		
		local chip = inventory:hasItem("cube_chip_enhanced")

		client:requestString("Purchase", "This costs 100 scrap coins. Are you sure? Type 'yes' to proceed.", 
		function(text)
			if(text == "yes") then
				char:takeMoney(100)
				chip:remove()
				nut.chat.send(client, "itclose", "The strange device begins to emit some sort of noise.")
				
				local entity = item:getEntity() or client
				entity:EmitSound("music/radio1.mp3")
				
				local dropPos --place to drop the box
				if(!IsValid(item:getEntity())) then --checks if item is not on the ground
					dropPos = findSky(client:GetPos())
				else --if the item it on the ground
					dropPos = findSky(item:getEntity():GetPos())
				end
				
				timer.Simple(40, 
					function()
						if (item != nil) then
							if(!IsValid(item:getEntity())) then --checks if item is not on the ground
								client:EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 100, 80)
							else --if the item it on the ground
								item:getEntity():EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 100, 80)
							end
							
							if(dropPos) then
								local contents = {
									"food_mre",
									"food_mre",
									"food_mre",
									"food_mre",
									"food_mre",
									"food_mre",
									"food_mre",
									"food_water",
									"food_water",
									"food_water",
									"food_water",
									"food_water",
									"food_water",
									"food_water"
								}
								
								local Pack=ents.Create("ent_chance_aidbox")
								Pack:SetPos(dropPos-Vector(0,0,100))
								Pack.InitialVel=Vector(0,0,-2000)
								Pack.Contents = contents
								Pack:Spawn()
								Pack:Activate()
								client:notify("Supply Drop inbound.")
							else
								client:notify("No sky found, enhanced chip refunded.")
								if(!IsValid(item:getEntity())) then --checks if item is not on the ground
									if(!inventory:add("cube_chip_enhanced")) then --if the inventory has space, put it in the inventory
										nut.item.spawn("cube_chip_enhanced", client:getItemDropPos()) --if not, drop it on the ground
									end
									char:giveMoney(100)
								else --if the item it on the ground
									nut.item.spawn("cube_chip_enhanced", item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the created item above the item
									char:giveMoney(100)
								end
							end
						end
					end
				)
			else
				client:notify("Transaction cancelled.")
				return false
			end
		end)
	return false
	end,
	onCanRun = function(item)
		local player
		if(item:getOwner() == nil) then --so we can do this on the ground or in the inventory
			player = item.player
		else
			player = item:getOwner()
		end
		
		if (!player:getChar():getInv():hasItem("cube_chip_enhanced") or player:getChar():getMoney() < 50) then 
			return false
		end
	end
}

ITEM.functions.Medical = {
	icon = "icon16/package.png",
	--sound = "music/radio1.mp3",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()
		
		local chip = inventory:hasItem("cube_chip_enhanced")
		client:requestString("Purchase", "This costs 500 scrap coins. Are you sure? Type 'yes' to proceed.", 
		function(text)
			if(text == "yes") then
				char:takeMoney(500)
				chip:remove()
				nut.chat.send(client, "itclose", "The strange device begins to emit some sort of noise.")
				
				local entity = item:getEntity() or client
				entity:EmitSound("music/radio1.mp3")
				
				local dropPos --place to drop the box
				if(!IsValid(item:getEntity())) then --checks if item is not on the ground
					dropPos = findSky(client:GetPos())
				else --if the item it on the ground
					dropPos = findSky(item:getEntity():GetPos())
				end
				
				timer.Simple(40, 
					function()
						if (item != nil) then
							if(!IsValid(item:getEntity())) then --checks if item is not on the ground
								client:EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 100, 80)
							else --if the item it on the ground
								item:getEntity():EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 100, 80)
							end
							
							if(dropPos) then
								local contents = {
									"medical_bandages",
									"medical_bandages",
									"medical_bandages",
									"medical_bandages",
									"medical_bandages",
									"medical_kit",
									"medical_kit",
									"medical_gauze",
									"medical_gauze",
									"medical_gauze",
									"medical_suture",
									"medical_splint",
									"medical_splint",
									"medical_iv",
									"drug_disinfectant",
									"drug_antibiotics",
									"drug_antibiotics",
									"drug_burnointment"
								}
								
								local Pack=ents.Create("ent_chance_aidbox")
								Pack:SetPos(dropPos-Vector(0,0,100))
								Pack.InitialVel=Vector(0,0,-2000)
								Pack.Contents = contents
								Pack:Spawn()
								Pack:Activate()
								client:notify("Supply Drop inbound.")
							else
								client:notify("No sky found, enhanced chip refunded.")
								if(!IsValid(item:getEntity())) then --checks if item is not on the ground
									if(!inventory:add("cube_chip_enhanced")) then --if the inventory has space, put it in the inventory
										nut.item.spawn("cube_chip_enhanced", client:getItemDropPos()) --if not, drop it on the ground
									end
									char:giveMoney(500)
								else --if the item it on the ground
									nut.item.spawn("cube_chip_enhanced", item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the created item above the item
									char:giveMoney(500)
								end
							end
						end
					end
				)
			else
				client:notify("Transaction cancelled.")
				return false
			end
		end)
	return false
	end,
	onCanRun = function(item)
		local player
		if(item:getOwner() == nil) then --so we can do this on the ground or in the inventory
			player = item.player
		else
			player = item:getOwner()
		end
		
		if (!player:getChar():getInv():hasItem("cube_chip_enhanced") or player:getChar():getMoney() < 500) then 
			return false
		end
	end
}

ITEM.functions.Firearm = {
	icon = "icon16/package.png",
	--sound = "music/radio1.mp3", --only plays the sound for the user, want everyone nearby to hear it.
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()
		
		local ammo = { --firearms
			"tfa_ch3ck",
			"tfa_ch34t",
			"tfa_chafe",
			"tfa_chalk",
			"tfa_cpr09",
			"tfa_cr33k",
			"1887winchester",
			"1897winchester",
			"acr",
			"ak47",
			"ak74",
			"amd65",
			"an94",
			"ares_shrike",
			"auga3",
			"tfa_aw50",
			"barret_m82",
			"bizonp19",
			"browningauto5",
			"tfa_colt1911",
			"coltpython",
			"contender",
			"dbarrel",
			"deagle",
			"tfa_deagle44",
			"tfa_deagle357",
			"dragunov",
			"f2000",
			"fal",
			"famas",
			"fg42",
			"g3a3",
			"g36",
			"glock",
			"tfa_hk45",
			"honeybadger",
			"intervention",
			"ithacam37",
			"jackhammer",
			"kac_pdw",
			"l85",
			"luger",
			"m3",
			"tfa_m4a1",
			"m14sp",
			"m16a4_acog",
			"m24",
			"m29satan",
			"m60",
			"m92beretta",
			"m98b",
			"m249lmg",
			"m416",
			"m1918bar",
			"magpulpdr",
			"model3russian",
			"model500",
			"model627",
			"mossberg590",
			"mp5",
			"mp5sd",
			"mp7",
			"mp9",
			"pkm",
			"psg1",
			"ragingbull",
			"remington870",
			"remington1858",
			"remington7615p",
			"scar",
			"scoped_taurus",
			"tfa_sig_p229r",
			"sl8",
			"smgp90",
			"spas12",
			"sten",
			"striker12",
			"svt40",
			"svu",
			"tar21",
			"tec9",
			"thompson",
			"ump45",
			"usas",
			"usc",
			"usp",	
			"usp45",
			"uzi",
			"val",
			"vector",
			"vikhr",
			"winchester73"
		}
		
		local chip = inventory:hasItem("cube_chip_enhanced")
		client:requestString("Purchase", "This costs 20,000 scrap coins. Are you sure? Type 'yes' to proceed.", 
			function(text)
				if(text == "yes") then
					char:takeMoney(20000)
					chip:remove()
					nut.chat.send(client, "itclose", "The strange device begins to emit some sort of noise.")
					
					local entity = item:getEntity() or client
					
					local dropPos --place to drop the box
					if(!IsValid(item:getEntity())) then --checks if item is not on the ground
						dropPos = findSky(client:GetPos())
					else --if the item it on the ground
						dropPos = findSky(item:getEntity():GetPos())
					end
					
					entity:EmitSound("music/radio1.mp3")
					timer.Simple(40, 
						function()
							if (item != nil) then
								local drop = table.Random(ammo)
								
								if(!IsValid(item:getEntity())) then --we have to do this twice just in case they pick it up or drop it or something
									client:EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 100, 80)
								else --if the item it on the ground
									item:getEntity():EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 100, 80)
								end
								
								if(dropPos) then
									local contents = {
										drop,
									}
									
									local Pack=ents.Create("ent_chance_aidbox")
									Pack:SetPos(dropPos-Vector(0,0,100))
									Pack.InitialVel=Vector(0,0,-2000)
									Pack.Contents = contents
									Pack:Spawn()
									Pack:Activate()
									client:notify("Supply Drop inbound.")
								else
									client:notify("No sky found, enhanced chip refunded.")
									if(!IsValid(item:getEntity())) then --checks if item is not on the ground
										if(!inventory:add("cube_chip_enhanced")) then --if the inventory has space, put it in the inventory
											nut.item.spawn("cube_chip_enhanced", client:getItemDropPos()) --if not, drop it on the ground
										end
										char:giveMoney(20000)
									else --if the item it on the ground
										char:giveMoney(20000)
										nut.item.spawn("cube_chip_enhanced", item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the created item above the item
									end
								end
							end
						end
					)
				else
					client:notify("Transaction cancelled.")
					return false
				end
			end
		)
	return false
	end,
	onCanRun = function(item)
		local player
		if(item:getOwner() == nil) then --so we can do this on the ground or in the inventory
			player = item.player
		else
			player = item:getOwner()
		end
		
		if (!player:getChar():getInv():hasItem("cube_chip_enhanced") or player:getChar():getMoney() < 20000) then 
			return false
		end
	end
}