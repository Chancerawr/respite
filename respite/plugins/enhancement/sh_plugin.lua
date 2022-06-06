PLUGIN.name = "Item Modification"
PLUGIN.author = ""
PLUGIN.desc = "Functions that modify items."

--this thing kind of sucks but it's better than adding the same 4 functions to a bunch of different bases manually

--the item bases that the functions are added to
local bases = {
	"base_consumable",
	"base_junk",
	"base_weapons",
	"base_equipment",
}

local functionInfo = {
	["shard"] = {
		name = "Shard Dust", --name of item function
		required = "shard_dust", --item required to put this on
		removal = "blight", --item required to remove it
		itemName = "Shard ", --item name append
		itemDesc = "\nIt glows lightly.", --item description append
		itemColor = Color(255, 255, 255), --color of item text and icon
		confirm = "Are you sure you want to infuse Shard Dust into this item?", --confirmation prompt
		dmg = {
			ratio = 0.5,
			dmgT = "Shard",
		},
	},
	["shard"] = {
		name = "Shard", --name of item function
		required = "shard", --item required to put this on
		removal = "blight", --item required to remove it
		itemName = "Shard ", --item name append
		itemDesc = "\nIt glows brightly.", --item description append
		itemColor = Color(255, 255, 255), --color of item text and icon
		confirm = "Are you sure you want to infuse a Shard into this item?", --confirmation prompt
		dmg = {
			ratio = 1,
			dmgT = "Shard",
		},
	},
	["blight"] = {
		name = "Blight",
		required = "blight",
		removal = "shard_dust",
		itemName = "Blighted ",
		itemDesc = "\nIt is coated in a pitch black material, touching it makes you feel nostalgic somehow.",
		itemColor = Color(0, 0, 0),
		confirm = "Are you sure you want to Blight this item?",
		dmg = {
			ratio = 0.5,
			dmgT = "Blight",
		},
	},
	["blight_chip"] = {
		name = "Blacken",
		required = "cube_chip_blight",
		removal = "shard_dust",
		itemName = "Blackened ",
		itemDesc = "\nIt is coated in a pitch black material, touching it makes you feel numb.",
		itemColor = Color(0, 0, 0),
		confirm = "Are you sure you want to Blacken this item?",
		dmg = {
			ratio = 1,
			dmgT = "Blight",
		},
	},
	["distort"] = {
		name = "Distort", 
		required = "distortion",
		removal = "shard_dust",
		itemName = "Distorted ",
		itemDesc = "\nIts appearance distorts randomly and sometimes becomes translucent.",
		itemColor = Color(140, 20, 140),
		confirm = "Are you sure you want to Distort this item?",
		dmg = {
			ratio = 0.5,
			dmgT = "Distort",
		},
	},
	["distort_chip"] = {
		name = "Distort (Chip)", 
		required = "cube_chip_enhanced",
		removal = "shard_dust",
		itemName = "Extremely Distorted ",
		itemDesc = "\nIts appearance distorts constantly and sometimes becomes translucent.",
		itemColor = Color(140, 20, 140),
		confirm = "Are you sure you want to Distort this item?",
		dmg = {
			ratio = 1,
			dmgT = "Distort",
		},
	},
	["ichor"] = {
		name = "Ichor", 
		required = "ichor",
		removal = "shard_dust",
		itemName = "Ichor Coated ",
		itemDesc = "\nIt's coated in a wriggling, seemingly alive substance.",
		itemColor = Color(0, 128, 128),
		confirm = "Are you sure you want to Ichor this item?",
		dmg = {
			ratio = 0.5,
			dmgT = "Ichor",
		},
	},
	["ichor_chip"] = {
		name = "Soul Mark", 
		required = "ichor",
		removal = "shard_dust",
		itemName = "Wriggling ",
		itemDesc = "\nIt's form wriggles and moves by itself, as if it were alive.",
		itemColor = Color(0, 128, 128),
		confirm = "Are you sure you want to Ichor this item?",
		dmg = {
			ratio = 1,
			dmgT = "Ichor",
		},
	},
}

timer.Simple(0, function()
	local enhanceFunction = {
		name = "Enhance",
		icon = "icon16/contrast.png",
		isMulti = true,
		multiOptions = function(item, client)
			local targets = {}
			
			local inventory = client:getChar():getInv()

			for k, v in pairs(functionInfo) do
				if(!inventory:hasItem(v.required)) then continue end
			
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
		
			local funcTable = functionInfo[data]
			if(!funcTable) then 
				client:notify("You do not have any enhancement items.")
				return false 
			end
			
			local required = client:getChar():getInv():getFirstItemOfType(funcTable.required)
			
			client:requestQuery(funcTable.confirm, funcTable.name, function(text)
				local amount = required:getData("Amount", 1)
				if(amount > 1) then
					required:setData("Amount", amount - 1)
				else
					required:remove()
				end

				item:setData("infused", data)
				
				local custom = item:getData("custom", {})
				custom.name = funcTable.itemName..item:getName()
				custom.desc = item:getDesc(true)..funcTable.itemDesc
				custom.color = funcTable.itemColor
				
				item:setData("custom", custom)
				
				if(funcTable.dmg) then
					local dmgTbl = item:getData("dmg", item.dmg or {})
					
					local newDmg = 0
					for dmgT, dmgV in pairs(dmgTbl) do
						if(dmgT == funcTable.dmg.dmgT) then continue end 

						dmgTbl[dmgT] = dmgV * (1 - funcTable.dmg.ratio)
						newDmg = newDmg + dmgV * funcTable.dmg.ratio
					end
					
					dmgTbl[funcTable.dmg.dmgT] = newDmg
					
					item:setData("dmg", dmgTbl)
				end
			end)
			return false
		end,
		onCanRun = function(item)
			local client = item.player
			
			if(item.noEnhance) then
				return false
			end
			
			if(item:getData("infused") or IsValid(item.entity)) then
				return false
			end
			
			return true
		end
	}
	
	local purifyFunction = {
		name = "Purify",
		icon = "icon16/wrench.png",
		onRun = function(item)
			local client = item.player
			
			local infused = item:getData("infused")
			
			if(infused) then
				local funcTable = functionInfo[infused]
			
				local custom = item:getData("custom", {})

				--removes name and desc appends caused by the enhancement
				local newName = string.Replace(custom.name, funcTable.itemName, "")
				local newDesc = string.Replace(custom.desc, funcTable.itemDesc, "")
			
				custom.name = newName
				custom.desc = newDesc
			
				if(custom.color == funcTable.itemColor) then
					custom.color = nil
				end
				
				item:setData("custom", custom)
				item:setData("infused", nil) --can be enhanced again
				
				--undo damage things
				if(funcTable.dmg) then
					local dmgTbl = item:getData("dmg", item.dmg or {})
					
					
					local newDmg = 0
					for dmgT, dmgV in pairs(dmgTbl) do
						if(dmgT == funcTable.dmg.dmgT) then continue end 
					
						dmgTbl[dmgT] = dmgV / (1 * funcTable.dmg.ratio) --undo other damage things
						newDmg = newDmg - dmgTbl[dmgT] * funcTable.dmg.ratio --remove that damage and stuff
					end
					
					dmgTbl[funcTable.dmg.dmgT] = dmgTbl[funcTable.dmg.dmgT] + newDmg
					
					--if it's 0 just get rid of it
					if(dmgTbl[funcTable.dmg.dmgT] == 0) then
						dmgTbl[funcTable.dmg.dmgT] = nil
					end

					--save it please
					item:setData("dmg", dmgTbl)
				end
			end

			return false
		end,
		onCanRun = function(item)
			local client = item.player
			
			--return (!item:getData("infused") and client:getChar():getInv():getFirstItemOfType(funcTable.required) and !IsValid(item.entity))
			
			if(item.noEnhance) then
				return false
			end
			
			return client:IsAdmin()
		end
	}
	
	--adds the functions to the bases
	for k, base in pairs(bases) do
		local itemBase = nut.item.base[base]
		
		if(itemBase) then
			itemBase.functions["enhance"] = enhanceFunction
			itemBase.functions["purify"] = purifyFunction
		end
	end
end)