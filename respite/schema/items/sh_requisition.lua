ITEM.name = "Requisitioning Device"
ITEM.desc = "A rectangularly shaped object that distorts randomly. It appears to have a small slot on the front for something thin. There are several dials on the object that can be turned, but it's hard to tell what exactly they do."
ITEM.uniqueID = "requisition"
ITEM.model = "models/props_lab/citizenradio.mdl"
ITEM.material = "models/props_combine/stasisfield_beam"
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

local ammo = {
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
	"ammo_22lr",
	"ammo_concrete",
	"ammo_sawblade",
	"ammo_xbow"
}

local armor = {
	"armor_t1",
	"armor_t2",
	"armor_sapper",
	"armor_charged",
	"armor_football",
	"armor_pauldrons",
	"armor_wood",
	"armor_tread",
	"j_riotshield",
	"shield_metal",
	"helmet_riot",
	"helmet_metal"
}

local device = {
	"cube_b",
	"cube_water",
	"cube_blight",
	"converter",
	"converter_meat",
	"generator_chip",
	"gnome_father",
	"hamburger_helper",
	"ice_crammer",
	"medicator",
	"charger",
	"mirror",
	"museum",
	"purifier_water",
	"reminiscence",
	"farm_monster",
	"ribcage",
	"sacrificial_skull",
	"soda_stream",
	"breakfaster",
	"brewery",
	"bakery",
	"alchemist",
	"frame",
	"fountain",
	"curator",
	"nac",
	"broadcaster",
	"kit_sentry",
	"charged_cube",
	"statue"
}

local strange = {
	"nightmare",
	"bars",
	--"bell",
	"food_apple_cursed",
	"alc_cloud",
	"food_laugh",
	"food_madness",
	"food_yams_mysterious",
	"food_heart",
	"food_brain",
	"j_gnome",
	"reflective",
	"food_soda_cold",
	"potion_luck",
	"salve_healing",
	"drug_psychotics"
}

local guns = {
	"tfa_ch3ck",
	"tfa_ch34t",
	"tfa_chafe",
	"tfa_chalk",
	"tfa_cpr09",
	"tfa_cr33k",
	"tfa_wasteland_geiger",
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

local dropFunctions = {
	{
		name = "Ammo", 
		cost = 200,
		contents = function()
			local drops = {}
			local drop = table.Random(ammo)
			
			table.insert(drops, drop)
			table.insert(drops, drop)
			table.insert(drops, drop)
			table.insert(drops, drop)
			table.insert(drops, drop)
			
			return drops
		end
	},
	
	{
		name = "Armor", 
		cost = 200,
		contents = function()
			local drops = {}
			local drop1 = table.Random(armor)
			local drop2 = table.Random(armor)
			
			table.insert(drops, drop1)
			table.insert(drops, drop2)
			
			return drops
		end
	},
	
	{
		name = "Device", 
		cost = 500,
		contents = function()
			local drops = {}
			local drop1 = table.Random(device)
			local drop2 = table.Random(device)
			
			table.insert(drops, drop1)
			table.insert(drops, drop2)
			
			return drops
		end
	},
	
	{
		name = "Strange", 
		cost = 150,
		contents = function()
			local drops = {}
			local drop1 = table.Random(strange)
			local drop2 = table.Random(strange)
			local drop3 = table.Random(strange)
			
			table.insert(drops, drop1)
			table.insert(drops, drop2)
			table.insert(drops, drop3)
			
			return drops
		end
	},
	
	{
		name = "Medical", 
		cost = 50,
		contents = function()
			local drops = {
				"medical_bandages",
				"medical_bandages",
				"medical_bandages",
				"medical_bandages",
				"medical_bandages",
				"medical_kit",
				"medical_kit",
				"first_aid_plastic",
				"first_aid_plastic",
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
			
			return drops
		end
	},
	
	{
		name = "Firearms", 
		cost = 7500,
		contents = function()
			local drops = {}
			local drop = table.Random(guns)
			
			table.insert(drops, drop)
			
			return drops
		end
	},
	
	{
		name = "Food", 
		cost = 25,
		contents = function()
			local drops = {}
			
			local food = {
				"food_mre",
				"food_chinese",
			}			
			
			local drink = {
				"food_water_mountain",
				"food_soda_bottled"
			}
			
			local drop1 = table.Random(food)
			local drop2 = table.Random(drink)
			
			table.insert(drops, drop1)
			table.insert(drops, drop1)
			table.insert(drops, drop1)
			table.insert(drops, drop1)
			table.insert(drops, drop1)
			table.insert(drops, drop1)
			table.insert(drops, drop2)
			table.insert(drops, drop2)
			table.insert(drops, drop2)
			table.insert(drops, drop2)
			table.insert(drops, drop2)
			table.insert(drops, drop2)
			
			return drops
		end
	},
}

for k, v in pairs(dropFunctions) do
	ITEM.functions[v.name] = {
		icon = "icon16/package.png",
		onRun = function(item)
			local client = item.player
			local char = client:getChar()
			local inventory = char:getInv()
			
			local dropTbl = v.contents()
			local cost = v.cost
			
			if(char:getMoney() < cost) then
				client:notify("You do not have enough money, it requires " ..cost.. ".")
				return false
			end
			
			local chip = inventory:getFirstItemOfType("cube_chip_enhanced")
		
			client:requestQuery("This costs " ..cost.. " scrap coins and an enhanced chip. Are you sure?", "Order", function(text)
				if(!chip) then return false end
			
				chip:remove()
				char:takeMoney(cost)
				
				nut.chat.send(client, "it", "The requsition device begins to emit some sort of noise.")
				
				local entity = item:getEntity() or client
				entity:EmitSound("music/radio1.mp3")
					
				timer.Simple(40, function()
					if (item != nil) then
						local dropPos --place to drop the box
						if(!IsValid(item:getEntity())) then --checks if item is not on the ground
							dropPos = findSky(client:GetPos())
						else --if the item it on the ground
							dropPos = findSky(item:getEntity():GetPos())
						end
						
						if(!IsValid(item:getEntity())) then --checks if item is not on the ground
							client:EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 100, 80)
						else --if the item it on the ground
							item:getEntity():EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 100, 80)
						end
						
						if(dropPos) then
							local Pack=ents.Create("ent_chance_aidbox")
							Pack:SetPos(dropPos-Vector(0,0,100))
							Pack.InitialVel=Vector(0,0,-2000)
							Pack.Contents = dropTbl
							Pack:Spawn()
							Pack:Activate()
							
							client:notify("Supply Drop inbound.")
						else
							client:notify("Sky not found, enhanced chip refunded.")
							
							if(!IsValid(item:getEntity())) then --checks if item is not on the ground								
								inventory:addSmart("cube_chip_enhanced", 1, client:getItemDropPos())
								
								char:giveMoney(cost)	
							else --if the item it on the ground
								nut.item.spawn("cube_chip_enhanced", item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the created item above the item
								char:giveMoney(cost)
							end
						end
					end
				end)
			end)
			
			return false
		end,
		onCanRun = function(item)
			local client = item.player
			
			if (!client:getChar():getInv():getFirstItemOfType("cube_chip_enhanced")) then 
				return false
			end
			
			return true
		end
	}
end