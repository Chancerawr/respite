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

--table for creating things
ITEM.funcTableC = {
	["wood"] = {
		name = "Woodcutting",
		sound = function(client)
			client:EmitSound("ambient/machines/machine6.wav", 65, 70)
		end,
		--startString = "The machine accepts the materials and outputs adhesive."
		--endString = "The machine accepts the materials and outputs adhesive."
		prodTime = 1,
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
			client:EmitSound("ambient/machines/machine6.wav", 65, 70)
		end,
		--startString = "The machine accepts the materials and outputs adhesive."
		--endString = "The machine accepts the materials and outputs adhesive."
		prodTime = 1,
		results = {
			items = {
				["j_scrap_wood"] = 1
			}
		},
		dev = {
			["r"] = true
		}
	},
	["fishing"] = {
		name = "Fishing",
		sound = function(client)
			client:EmitSound("ambient/machines/machine6.wav", 65, 70)
		end,
		--startString = "The machine accepts the materials and outputs adhesive."
		--endString = "The machine accepts the materials and outputs adhesive."
		prodTime = 1,
		results = {
			items = {
				["food_fish_plastic"] = 1
			}
		},
		dev = {
			["s"] = true
		}
	},
	["water"] = {
		name = "Water (Corrupted)",
		sound = function(client)
			client:EmitSound("ambient/machines/machine6.wav", 65, 70)
		end,
		--startString = "The machine accepts the materials and outputs adhesive."
		--endString = "The machine accepts the materials and outputs adhesive."
		prodTime = 1,
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
			client:EmitSound("ambient/machines/machine6.wav", 65, 70)
		end,
		startString = "You begin to imagine a humanoid figure in your mind.",
		endString = "You completely visualize a humanoid plastic.",
		prodTime = 1,
		required = {
			resources = {
				["plas"] = 100,
				["chip"] = 25,
			},
		},
		results = {
			func = function(item)
				local units = item:getData("units", 0)
				item:setData("units", units + 1)
			end,
		},
		dev = {
			["b1"] = true,
		}
	},
}

--table for developing things
ITEM.funcTableD = {
	["f"] = {
		name = "Forest",
		sound = function(client)
			client:EmitSound("ambient/machines/machine6.wav", 65, 70)
		end,
		startString = "Images of a sprawling forest spread throughout your mind, they are blurry and incomplete.",
		endString = "You can clearly imagine a small forest with dozens of trees and shrubbery.",
		prodTime = 1,
		required = {
			units = 1,
		
			resources = {
				["mem"] = 10,
			}
		},
	},
	["s"] = {
		name = "Stream",
		sound = function(client)
			client:EmitSound("ambient/machines/machine6.wav", 65, 70)
		end,
		startString = "Images of a calm stream flow through your mind, they are blurry and incomplete.",
		endString = "You can clearly imagine a small stream filled with clear water and plastic fish.",
		prodTime = 1,
		required = {
			units = 1,
		
			resources = {
				["mem"] = 20,
			}
		},
	},
	["r"] = {
		name = "Ruins",
		sound = function(client)
			client:EmitSound("ambient/machines/machine6.wav", 65, 70)
		end,
		startString = "Images of a ancient ruined buildings solidify themselves in your mind, they are blurry and hard to focus on.",
		endString = "You can clearly imagine a set of ruined concrete buildings in your mind.",
		prodTime = 1,
		required = {
			units = 1,
		
			resources = {
				["mem"] = 20,
			}
		},
	},
	["b1"] = {
		name = "Housing",
		sound = function(client)
			client:EmitSound("ambient/machines/machine6.wav", 65, 70)
		end,
		startString = "Images of wooden homes fill your mind, they are blurry and hard to focus on.",
		endString = "You can clearly imagine a small village of wooden houses.",
		prodTime = 1,
		required = {
			resources = {
				["mem"] = 25,
			}
		},
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

ITEM.functions.Gather = {
	name = "Gather",
	icon = "icon16/photos.png",
	isMulti = true,
	multiOptions = function(item, client)
		local targets = {}

		local dev = item:getData("dev", {})
		
		for k, v in pairs(item.funcTableC) do	
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
	end,		
	onRun = function(item, data)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local itemInv = item:getInv()
		
		local dataTbl = item.funcTableC[data]
		
		local reqTbl = dataTbl.required
		if(reqTbl) then
			if(reqTbl.units) then
				local units = item:getData("units", 0)
				if(units < reqTbl.units) then
					client:notify("You do not have the required man-power")
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
					if(dataTbl.prodTime) then
						timer.Simple(dataTbl.prodTime, function()
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
	
		if(dataTbl.prodTime) then
			item:setData("producing", CurTime())
			item:setData("prodTime", dataTbl.prodTime)
			
			timer.Simple(dataTbl.prodTime, function()
				item:setData("producing", nil)
			
				local results = dataTbl.results
				if(results) then
					if(results.items) then
						for newItem, amt in pairs(results.items) do
							itemInv:addSmart(newItem, amt, position)
						end
					end
					
					if(results.func) then
						results.func(item)
					end
				end
				
				if(dataTbl.sound) then
					dataTbl.sound(client)
				end
				
				if(dataTbl.endString) then
					nut.chat.send(client, "itclose", "[RESPITE]: " ..dataTbl.endString)
				end
			end)
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
		
		return true
	end
}

--handles all of the Development functions
ITEM.functions.Dev = {
	name = "Development",
	icon = "icon16/house.png",
	isMulti = true,
	multiOptions = function(item, client)
		local targets = {}
		
		local dev = item:getData("dev", {})
		
		for k, v in pairs(item.funcTableD) do
			if(dev[k]) then --can't develop the same thing twice
				continue
			end
		
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
		
		local dataTbl = item.funcTableD[data]
		
		local reqTbl = dataTbl.required
		if(reqTbl) then
			if(reqTbl.units) then
				local units = item:getData("units", 0)
				if(units < reqTbl.units) then
					client:notify("You do not have the required man-power")
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
					if(dataTbl.prodTime) then
						timer.Simple(dataTbl.prodTime, function()
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
		
		if(dataTbl.prodTime) then
			item:setData("producing", CurTime())
			item:setData("prodTime", dataTbl.prodTime)

			timer.Simple(dataTbl.prodTime, function()
				item:setData("producing", nil)
				
				if(dataTbl.sound) then
					dataTbl.sound(client)
				end
				
				if(dataTbl.endString) then
					nut.chat.send(client, "itclose", "[RESPITE]: " ..dataTbl.endString)
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
		
		return true
	end
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
	
		--[[
		local player = item.player
		local inventory = player:getChar():getInv()
		local items = inventory:getItems()
		local packs = 0
		
		for k, v in pairs(items) do
			if(otherBags[v.uniqueID]) then
				packs = packs + 1
			end
		end
		
		if(packs > 1) then
			return false
		end
		
		if(item:getData("char") != player:getChar():getID()) then
			return false
		end
		
		return !IsValid(item.entity) and item:getData("id")
		--]]
		
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
	
	if(units) then
		str = str.. "\n\n Units:" ..units
	end
	
	return Format(str)
end

function ITEM:getInv()
	return nut.inventory.instances[self:getData("id")]
end

ITEM.iconCam = {
	pos = Vector(142.9214630127, 125.8981628418, 91.33309173584),
	ang = Angle(25, 220, 0),
	fov = 4.5763000053135,
}