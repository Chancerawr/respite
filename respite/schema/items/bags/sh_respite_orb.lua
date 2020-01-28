ITEM.name = "Respite Orb"
ITEM.name = "Respite Orb"
ITEM.uniqueID = "respite_orb"
ITEM.desc = "A peculiar crystalline object, it emits a bright white light."
ITEM.model = "models/props_phx/misc/smallcannonball.mdl"
ITEM.material = "models/props_combine/portalball001_sheet"
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "1"
ITEM.category = "Shard"
ITEM.invWidth = 3
ITEM.invHeight = 3
ITEM.color = Color(64, 128, 128)
ITEM.openTime = 0.5

ITEM.isBag = true

local otherBags = {
	respite_orb = true
}

local function requiredItems(inventory, item, required)
	local found = {}
	
	for k, v in pairs(required) do
		local items = inventory:getItemsOfType(k)
		
		if(table.IsEmpty(items)) then
			return false
		end
		
		local count = 0
		for k, item in pairs(items) do
			local amt = item:getData("Amount", 1)
			
			count = count + amt
		
			if(count >= v) then
				local leftover = count - v
				table.insert(found, {item, leftover})
				
				break
			end

			table.insert(found, {item, 0})
		end
		
		if(count < v) then
			return false
		end
	end

	for k, v in pairs(found) do
		local item = found[k][1]
		local leftover = found[k][2]
		
		local amt = item:getData("Amount", 1)
		
		if(leftover != 0) then
			item:setData("Amount", leftover)
		else
			item:remove()
		end
	end
	
	return true
end

local function requiredTime(client, item, mult)
	local baseTime = 7200
	local units = (item.getData and item:getData("units", {})) or item.data["units"] or {}
	local unitCount = (units.w or 0) + (units.f or 0)
	
	if(unitCount == 0) then
		unitCount = 1
	end
	
	local timeRequired = ((baseTime / (unitCount or 1)) + 600) * mult
	
	return math.Round(timeRequired)
end

local function displayCosts(client, required)
	for k, v in pairs(required) do
		if(k == "units" or k == "workers" or k == "fighters") then
			client:notify(k.. ": " ..v.. ".")
		elseif(k == "resources") then
			for res, amt in pairs(v) do
				client:notify(res.. " " ..amt.. ".")
			end
		elseif(k == "items") then
			for res, amt in pairs(v) do
				local fancyName = (nut.item.list[res] and nut.item.list[res].name) or "Invalid Item"
				client:notify(fancyName.. " " ..amt.. ".")
			end
		end
	end
end

--table for creating things
local funcTableC = {
	["wood"] = {
		name = "Woodcutting",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		prodMult = 1, --time
		results = {
			items = {
				["j_scrap_wood"] = 1
			}
		},
		dev = {
			["f"] = true
		}
	},
	["concrete"] = {
		name = "Concrete Gathering",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		prodMult = 1,
		results = {
			items = {
				["j_scrap_concrete"] = 1
			}
		},
		dev = {
			["r"] = true
		}
	},
	["rock"] = {
		name = "Rock Gathering",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		prodMult = 1,
		results = {
			items = {
				["hl2_m_rock"] = 1
			}
		},
		dev = {
			["ca"] = true
		}
	},
	["herb"] = {
		name = "Herb Gathering",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		prodMult = 1,
		results = {
			func = function(item, client)
				local position = client:getItemDropPos()
				
				local index = item:getData("id")
				local inventory = nut.inventory.instances[index]

				local ranTable = {
					"herb_berry",
					"herb_bloodberry",
					"herb_mushroom",
					"herb_purple",
					"j_tealeaf",
				}

				local reward = table.Random(ranTable)
				
				inventory:addSmart(reward, 1, position)
			end,
		},
		dev = {
			["f"] = true
		}
	},
	["fishing"] = {
		name = "Fishing",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		prodMult = 1,
		results = {
			items = {
				["food_fish_plastic"] = 1
			}
		},
		dev = {
			["s"] = true
		}
	},
	["hunting"] = {
		name = "Hunting",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		prodMult = 1,
		results = {
			items = {
				["food_monster_meat"] = 1
			}
		},
		required = {
			fighters = 1,
		},
		dev = {
			["f"] = true,
		}
	},
	["water"] = {
		name = "Water (Corrupted)",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		prodMult = 1,
		results = {
			items = {
				["food_water_misc"] = 1
			}
		},
		dev = {
			["s"] = true
		}
	},
	["plas1"] = {
		name = "Create Plastic (Worker)",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		startString = "You begin to imagine a humanoid figure in your mind, he carries a tool.",
		endString = "You completely visualize a humanoid plastic.",
		prodMult = 1,
		required = {
			resources = {
				["plas"] = 100,
				["chip"] = 25,
				["mem"] = 1,
			},
		},
		results = {
			func = function(item)
				local units = item:getData("units", {})
				units.w = (units.w or 0) + 1
				item:setData("units", units)
			end,
		},
		dev = {
			["b1"] = true,
		}
	},
	["plas2"] = {
		name = "Create Plastic (Fighter)",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		startString = "You begin to imagine a humanoid figure in your mind, he carries a weapon.",
		endString = "You completely visualize a humanoid plastic.",
		prodMult = 1,
		required = {
			resources = {
				["plas"] = 100,
				["chip"] = 25,
				["mem"] = 3,
			},
		},
		results = {
			func = function(item)
				local units = item:getData("units", {})
				units.f = (units.f or 0) + 1
				item:setData("units", units)
			end,
		},
		dev = {
			["b2"] = true,
		}
	},
	["plas3"] = {
		name = "Create Plastic (Cat)",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		startString = "You begin to imagine a cat in your mind, it calms you somewhat.",
		endString = "You completely visualize a smooth plastic cat.",
		prodMult = 1,
		required = {
			resources = {
				["plas"] = 25,
				["chip"] = 5,
				["mem"] = 7,
			},
		},
		results = {
			func = function(item)
				local units = item:getData("units", {})
				units.c = (units.c or 0) + 1
				item:setData("units", units)
			end,
		},
		dev = {
			["b1"] = true,
		}
	},
	["weather"] = {
		name = "Weather",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		prodMult = 1,
		results = {
			func = function(item, client)
				local position = client:getItemDropPos()
				
				local index = item:getData("id")
				local inventory = nut.inventory.instances[index]

				local ranWeather = {
					"rain",
					"snow",
					"fog",
					"blue haze",
					"black haze",
					"pink haze",
				}

				local weather = table.Random(ranWeather)
				local reward = "food_water_misc"
				if (weather == "rain") then
					client:notify("It is raining in your Respite.")
					reward = "food_water_misc"
				elseif (weather == "snow") then
					client:notify("It is snowing in your Respite.")
					reward = "food_water_misc"
				elseif (weather == "fog") then
					client:notify("It is foggy in your Respite.")		
					reward = "food_monster_meat"
				elseif (weather == "blue haze") then
					client:notify("Blue Haze has arrived in your Respite.")		
					reward = "haze_bottled"
				elseif (weather == "black haze") then
					client:notify("Black Haze has arrived in your Respite.")
					reward = "blight"
				elseif (weather == "pink haze") then
					client:notify("Pink Haze has arrived in your Respite.")
					reward = "haze_bottled_pink"
				end
				
				inventory:addSmart(reward, 1, position)
			end,
		},
		dev = {
			["sk"] = true
		}
	},
}

--table for developing things
local funcTableD = {
	["f"] = {
		name = "Forest",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		startString = "Images of a sprawling forest spread throughout your mind, they are blurry and incomplete.",
		endString = "You can clearly imagine a small forest with dozens of trees and shrubbery.",
		prodMult = 1,
		required = {
			units = 1,
		
			resources = {
				["mem"] = 10,
			}
		},
		dev = {
			["b1"] = true,
		}		
	},
	["s"] = {
		name = "Stream",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		startString = "Images of a calm stream flow through your mind, they are blurry and incomplete.",
		endString = "You can clearly imagine a small stream filled with clear water and plastic fish.",
		prodMult = 1,
		required = {
			units = 1,
		
			resources = {
				["mem"] = 20,
			}
		},
		dev = {
			["b1"] = true,
		}		
	},
	["r"] = {
		name = "Ruins",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		startString = "Images of a ancient ruined buildings solidify themselves in your mind, they are blurry and hard to focus on.",
		endString = "You can clearly imagine a set of ruined concrete buildings in your mind.",
		prodMult = 1,
		required = {
			units = 1,
		
			resources = {
				["mem"] = 20,
			}
		},
		dev = {
			["b1"] = true,
		}
	},
	["b1"] = {
		name = "Housing",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		startString = "Images of wooden homes fill your mind, they are blurry and hard to focus on.",
		endString = "You can clearly imagine a small village of wooden houses.",
		prodMult = 1.25,
		required = {
			resources = {
				["mem"] = 25,
			}
		},
	},
	["b2"] = {
		name = "Barracks",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		startString = "Images of a wooden barracks fill your mind, they are blurry and hard to focus on.",
		endString = "You can clearly imagine a large wooden barracks.",
		prodMult = 1.5,
		required = {
			resources = {
				["mem"] = 40,
			}
		},
		dev = {
			["b1"] = true,
		}		
	},
	["b3"] = {
		name = "Outposts",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		startString = "Images of numerous wooden towers fill your mind, they are blurry and hard to focus on.",
		endString = "You can clearly imagine a perimeter of wooden outposts.",
		prodMult = 1,
		required = {
			resources = {
				["mem"] = 40,
			}
		},
		dev = {
			["b2"] = true,
		}		
	},
	["ca"] = {
		name = "Caves",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		startString = "Images of a dark cave fill your mind, the inside is pitch black.",
		endString = "You can clearly picture a large cave network.",
		prodMult = 2,
		required = {
			resources = {
				["mem"] = 35,
			}
		},
		dev = {
			["f"] = true,
		}
	},
	["sk"] = {
		name = "Sky",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		startString = "Images of a beautiful blue sky fill your mind, it is blurry and hard to focus on.",
		endString = "You can clearly picture a beautiful sky.",
		prodMult = 2,
		required = {
			resources = {
				["mem"] = 50,
			}
		},
		dev = {
			["b1"] = true,
		}
	},
	["st"] = {
		name = "Stars",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		startString = "Images of a beautiful field of stars fill your mind, the stars are vague and hard to picture.",
		endString = "You can clearly picture a beautiful night sky, filled with stars.",
		prodMult = 2,
		required = {
			resources = {
				["mem"] = 60,
			}
		},
		dev = {
			["sk"] = true,
		}
	},
	["se"] = {
		name = "Sea",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		startString = "Images of a large body of water fill your mind, the water is blurry and hard to see clearly.",
		endString = "You can clearly picture an immense sea, with no end in sight.",
		prodMult = 2,
		required = {
			resources = {
				["mem"] = 50,
			}
		},
		dev = {
			["b1"] = true,
		}
	},
	["fut"] = {
		name = "Future",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		startString = "Your future is blurry, and inconsistent.",
		endString = "There is a future waiting for you now.",
		prodMult = 3,
		required = {
			units = 20,
			
			resources = {
				["mem"] = 100,
				["ich"] = 50,
			},
		},
		dev = {
			["st"] = true,
		}
	},
	["pas"] = {
		name = "Past",
		sound = function(client)
			client:EmitSound("ambient/levels/prison/radio_random9.wav", 65, 70)
		end,
		startString = "Your past is blurry, and hard to remember.",
		endString = "The past stands firmly behind you, guiding you along.",
		prodMult = 3,
		required = {
			units = 20,
			
			resources = {
				["mem"] = 100,
				["bli"] = 50,
			},
		},
		dev = {
			["st"] = true,
		}
	},
}

--table for absorbing things
ITEM.funcTableA = {
	["bli"] = {
		name = "Blight",
		sound = function(client)
			client:EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 65, 80)
		end,
		absorb = "blight",
	},
	["sha"] = {
		name = "Shards",
		sound = function(client)
			client:EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 65, 80)
		end,
		absorb = "shard",
	},
	["chip"] = {
		name = "Chips",
		sound = function(client)
			client:EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 65, 80)
		end,
		absorb = "cube_chip",
	},
	["plas"] = {
		name = "Plastic",
		sound = function(client)
			client:EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 65, 80)
		end,
		absorb = "j_scrap_plastics",
	},
	["chip_e"] = {
		name = "Enhanced Chips",
		sound = function(client)
			client:EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 65, 80)
		end,
		absorb = "cube_chip_enhanced",
	},
	["chip_i"] = {
		name = "Intrinsic Symbols",
		sound = function(client)
			client:EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 65, 80)
		end,
		absorb = "cube_chip_memory",
	},
	["ich"] = {
		name = "Ichor",
		sound = function(client)
			client:EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 65, 80)
		end,
		absorb = "ichor",
	},
	["mem"] = {
		name = "Memories",
		sound = function(client)
			client:EmitSound("ambient/levels/citadel/portal_beam_shoot"..math.random(1,6)..".wav", 65, 80)
		end,
		absorb = "j_scrap_memory",
	},
}

--handles all of the absorb functions
ITEM.functions.Absorb = {
	name = "Absorb",
	icon = "icon16/contrast.png",
	isMulti = true,
	multiOptions = function(item, client)
		local targets = {}

		for k, v in pairs(item.funcTableA) do		
			local newAbs = {
				name = v.name,
				data = k
			}
			table.insert(targets, newAbs)
		end
		
		return targets
	end,
	onRun = function(item, data)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		
		local new = 0
		
		local dataTbl = item.funcTableA[data]
		if(!dataTbl) then return false end
		
		if(dataTbl.absorb) then
			local absorb = inventory:getFirstItemOfType(dataTbl.absorb)
			while(absorb) do
				new = new + absorb:getData("Amount", 1)
				absorb:remove()
				absorb = inventory:getFirstItemOfType(dataTbl.absorb)
			end
		end
		
		if(new > 0) then
			if(dataTbl.sound) then
				dataTbl.sound(client)
			end
			
			local absorbed = item:getData("abs", {})
			absorbed[data] = (absorbed[data] or 0) + new
			item:setData("abs", absorbed)
		end
		
		return false
	end,
	onCanRun = function(item)
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + item:getData("prodTime", 0) >= CurTime()) then
				return false
			end
		end
	
		if(IsValid(item.entity)) then
			return false
		end
		
		if(item:getData("char") != item.player:getChar():getID()) then
			return false
		end
		
		return true
	end
}

if (CLIENT) then
	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		entity:DrawShadow(false)
		
		local pos = entity:GetPos() + entity:GetUp()
		local dlight = DynamicLight(entity:EntIndex())
		dlight.Pos = pos
		dlight.r = 64
		dlight.g = 128
		dlight.b = 128
		dlight.Brightness = 3
		dlight.Size = 128
		dlight.Decay = 1024
		dlight.style = 5
		dlight.DieTime = CurTime() + .1	
	end
end

ITEM.functions.View = {
	icon = "icon16/briefcase.png",
	onClick = function(item)
		nut.bar.actionStart = CurTime()
		nut.bar.actionEnd = CurTime() + (item.openTime or 1)
		nut.bar.actionText = "Opening.."
		surface.PlaySound("items/ammocrate_open.wav")
		
		timer.Simple((item.openTime or 1), function()
			local inventory = item:getInv()
			if (not inventory) then return false end

			local panel = nut.gui["inv"..inventory:getID()]
			local parent = item.invID and nut.gui["inv"..item.invID] or nil

			if (IsValid(panel)) then
				panel:Remove()
			end

			if (inventory) then
				local panel = nut.inventory.show(inventory, parent)
				if (IsValid(panel)) then
					panel:ShowCloseButton(true)
					panel:SetTitle(item:getName())
					panel:MoveRightOf(parent, 4)
				end
			else
				local itemID = item:getID()
				local index = item:getData("id", "nil")
				ErrorNoHalt(
					"Invalid inventory "..index.." for bag item "..itemID.."\n"
				)
			end
		end)

		return false
	end,
	onCanRun = function(item)
		if(IsValid(item.entity)) then
			return false
		end
	
		if(item:getData("char") != item.player:getChar():getID()) then
			return false
		end
		
		return true
	end
}

ITEM.functions.Claim = {
	name = "Claim Orb",
	tip = "Claim this orb as yours.",
	icon = "icon16/house.png",
	onRun = function(item)
		item:setData("char", item.player:getChar():getID())
		return false
	end,
	onCanRun = function(item)
		if(IsValid(item.entity)) then
			return false
		end
		
		if(item:getData("char") == nil or item:getData("char") == 0) then
			return true
		else
			return false
		end
	end
}

ITEM.functions.Menu = {
	name = "Menu",
	icon = "icon16/house.png",
	onRun = function(item)
		local actions = item:getActions()
		netstream.Start(item.player, "respMenu", item, actions)
		return false
	end,
	onCanRun = function(item)
		if(IsValid(item.entity)) then
			return false
		end
		
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + item:getData("prodTime", 0) >= CurTime()) then
				return false
			end
		end		
		
		return true
	end
}

function ITEM:getDesc()
	local str = self.desc
	local absorbed = self:getData("abs")
	local units = self:getData("units")

	local absTbl = self.funcTableA
	if(absorbed) then
		local shards = (absorbed["sha"] or 0)
		local size = (shards * shards) + 10
		
		str = str.. "\nSize: " ..size.. " square meters."	
	
		str = str.. "\n\n Resources:"
		for k, v in pairs(absorbed) do
			if(absTbl[k]) then
				str = str.. "\n   "..absTbl[k].name.. ": " ..v
			end
		end
	end
	
	if(units and istable(units)) then
		str = str.."\n\n"
		if(units.w) then
			str = str.. " Workers:" ..units.w
		end
		
		if(units.f) then
			str = str.."\n"
			str = str.. " Fighters:" ..units.f
		end
		
		if(units.c) then
			str = str.."\n"
			str = str.. " Cats:" ..units.c
		end
	end
	
	return Format(str)
end

function ITEM:getActions()
	local targets = {}
		
	local dev = self:getData("dev", {})
	
	for k, v in pairs(funcTableD) do
		if(dev[k]) then --can't develop the same thing twice
			continue
		end

		if(v.dev) then
			for reqDev, _ in pairs(v.dev) do
				if(dev[reqDev]) then --only adds to the list if the appropriate development exists.
					local newAbs = {
						name = v.name,
						data = k
					}
					table.insert(targets, newAbs)
				end
			end
		else --if we don't need developments we just put it in
			local newAbs = {
				name = v.name,
				data = k
			}
			table.insert(targets, newAbs)
		end
	end

	for k, v in pairs(funcTableC) do	
		if(v.dev) then
			for reqDev, _ in pairs(v.dev) do
				if(dev[reqDev]) then --only adds to the list if the appropriate development exists.
					local newAbs = {
						name = v.name,
						data = k
					}
					
					table.insert(targets, newAbs)
				end
			end
		else --if we don't need developments we just put it in
			local newAbs = {
				name = v.name,
				data = k
			}
			table.insert(targets, newAbs)
		end
	end	
	
	return targets
end

ITEM.iconCam = {
	pos = Vector(143, 126, 91),
	ang = Angle(25, 220, 0),
	fov = 4.6,
}

if(CLIENT) then
	local convert = {
		["mem"] = "Memories",
		["ich"] = "Ichor",
		["bli"] = "Blight",
	}

	netstream.Hook("respMenu", function(item, actions)
		local actionList = vgui.Create("nutRespiteOrb")
		actionList.item = item
		actionList.actions = actions
	end)

	local PANEL = {}
		function PANEL:Init()
			if (IsValid(nut.gui.rOrb)) then
				nut.gui.rOrb:Remove()
			end
			
			nut.gui.rOrb = self
			
			self:SetSize(ScrW() * 0.15, ScrH() * 0.3)
			self:Center()
			self:SetTitle("Respite Orb")
			self:MakePopup()
			
			local inner = vgui.Create("DScrollPanel", self)
			inner:Dock(FILL)
			
			self.buttons = {}
			
			timer.Simple(0.2, function()
				local actions = self:getActions()
				for k, v in pairs(actions) do
					local action = inner:Add("DButton")
					action:Dock(TOP)
					
					action.data = v.data
					
					local prefix = ""
					local dataTbl
					if(funcTableD[v.data]) then
						dataTbl = funcTableD[v.data]
						prefix = "Create: "
					elseif(funcTableC[v.data]) then
						dataTbl = funcTableC[v.data]
						prefix = "Activate: "
					end
					
					local desc = ""
					if(dataTbl.required) then
						for k, v in pairs(dataTbl.required) do
							if(!istable(v)) then
								desc = desc..k.. ":" ..v.."\n"
							else
								for k2, v2 in pairs(v) do
									desc = desc..(convert[k2] and convert[k2] or k2).. ":" ..v2.."\n"
								end
							end
						end
					end
					
					if(dataTbl.prodMult) then
						local timeDisp = (requiredTime(LocalPlayer(), self.item, dataTbl.prodMult) / 60).. " minutes."
						desc = desc..timeDisp
					end
					
					action:DockMargin(2,2,2,2)
					action:SetSize(ScrW() * 0.2, ScrH() * 0.025)
					action:SetFont("nutSmallFont")
					action:SetText(prefix..v.name)
					action:SetTextColor(Color(255,255,255,255))
					action:SetToolTip(desc or "")
					action.DoClick = function()
						self:actionPress(action)
					end
					action.Paint = function(panel, w, h)
						local posX, posY = action:GetPos()
							
						surface.SetDrawColor(Color(70, 80, 100, 220))
						surface.DrawRect(0, 0, w, h)
					end
					
					self.buttons[#self.buttons + 1] = action
				end
			end)
		end
		
		function PANEL:actionPress(button)
			netstream.Start("orb_function", button.data, self.item.id)
			self:Close()
		end
		
		function PANEL:getActions()
			return self.actions
		end
	vgui.Register("nutRespiteOrb", PANEL, "DFrame")
else
	netstream.Hook("orb_function", function(client, data, id)
		local item = nut.item.instances[id]
	
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local itemInv = item:getInv()
		
		local dataTbl = funcTableD[data] or funcTableC[data]
		if(!dataTbl) then return false end
		
		local reqTbl = dataTbl.required
		if(reqTbl) then
			if(reqTbl.units) then
				local units = item:getData("units", {})
				
				local unitCount = 0
				for k, v in pairs(units) do
					unitCount = unitCount + (v or 0)
				end
				
				if(unitCount < reqTbl.units) then
					client:notify("You do not have the required man-power.")
					return false
				end
			end
			
			if(reqTbl.workers) then
				local units = item:getData("units", {})
				
				local unitCount = units.w
				
				if(unitCount < reqTbl.workers) then
					client:notify("You do not have the required workers.")
					return false
				end
			end
			
			if(reqTbl.fighters) then
				local units = item:getData("units", {})
				
				local unitCount = units.f
				
				if(unitCount < reqTbl.fighters) then
					client:notify("You do not have the required fighters.")
					return false
				end
			end

			if(reqTbl.items) then
				local required = requiredItems(inventory, item, reqTbl.items)
				if (!required) then
					client:notify("You do not have the required materials.") 
					return false
				end
			end
			
			if(reqTbl.resources) then
				local absorbed = item:getData("abs", {})
				
				local success = true
				for k, v in pairs(reqTbl.resources) do
					local resource = (absorbed[k] or 0)
					
					if(resource >= v) then
						absorbed[k] = resource - v
					else
						client:notify("You do not have the required resources absorbed.")
						return false
					end
				end
				
				if(success) then
					if(dataTbl.prodMult) then
						local prodTime = requiredTime(client, item, dataTbl.prodMult)
					
						timer.Simple(prodTime, function()
							item:setData("abs", absorbed)
						end)
					else
						item:setData("abs", absorbed)
					end
				end
			end			
		end
		
		if(dataTbl.startString) then
			nut.chat.send(client, "itclose", "[RESPITE]: " ..dataTbl.startString)
		end
		
		if(dataTbl.prodMult) then
			local prodTime = requiredTime(client, item, dataTbl.prodMult)
		
			item:setData("producing", CurTime())
			item:setData("prodTime", prodTime)

			timer.Simple(prodTime, function()
				item:setData("producing", nil)
				item:setData("prodTime", nil)
				
				if(dataTbl.sound) then
					if(IsValid(client)) then
						dataTbl.sound(client)
					end
				end
				
				if(dataTbl.endString) then
					nut.chat.send(client, "itclose", "[RESPITE]: " ..dataTbl.endString)
				end
				
				local results = dataTbl.results
				if(results) then
					if(results.items) then
						for newItem, amt in pairs(results.items) do
							itemInv:addSmart(newItem, amt, position)
						end
					end
					
					if(results.func) then
						if(IsValid(client)) then
							results.func(item, client)
						end
					end
				end
				
				local dev = item:getData("dev", {})
				dev[data] = true
				
				item:setData("dev", dev)
			end)
		else
			local dev = item:getData("dev", {})
			dev[data] = true
			item:setData("dev", dev)
		end		

		return false
	end)
end