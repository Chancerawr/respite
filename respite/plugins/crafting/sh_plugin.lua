local PLUGIN = PLUGIN
PLUGIN.name = "Crafting"
PLUGIN.author = "Black Tea (NS 1.0), Rusty Shackleford (NS 1.1), Chancer (NS 1.1 Beta)"
PLUGIN.desc = "Allows you craft some items. And it fucking works."


nut.util.include("sh_menu.lua")
nut.util.include("sh_commands.lua")
nut.util.include("sh_vars.lua")

local entityMeta = FindMetaTable("Entity")
function entityMeta:IsCraftingTable()
	return self:GetClass() == "nut_craftingtable"	
end

local benches = {
	["nut_craftingtable_alchemy"] = true,
	["nut_craftingtable_arcana"] = true,
	["nut_craftingtable_smith"] = true,
	["nut_craftingtable_cooking"] = true,
	["nut_craftingtable_handicraft"] = true,
	["nut_craftingtable_process"] = true,
	["nut_craftingtable_tailor"] = true,
}

function PLUGIN:SaveData()
	local data = {}
	for k, _ in pairs(benches) do
		for _, v in pairs(ents.FindByClass(k)) do
			data[#data + 1] = {
				ent = v:GetClass(),
				pos = v:GetPos(),
				angles = v:GetAngles(),
			}
		end
	end
	
	self:setData(data)
end

function PLUGIN:LoadData()
	local data = self:getData() or {}
	for k, v in pairs(data) do
		if(v.ent) then
			local position = v.pos
			local angles = v.angles
			local entity = ents.Create(v.ent)
			entity:SetPos(position)
			entity:SetAngles(angles)
			entity:Spawn()
			entity:Activate()
			local phys = entity:GetPhysicsObject()
			if phys and phys:IsValid() then
				phys:EnableMotion(false)
			end
		end
	end
end

function PLUGIN:getProfessionFromString(search)
	local professions = {
		["cook"] = true,
		["alchemy"] = true,
		["handicraft"] = true,
		["process"] = true,
		["smith"] = true,
		["arcana"] = true,
		["tailor"] = true,
	}
	
	if(professions[string.lower(search)]) then
		return search
	else
		for profString, _ in pairs(professions) do
			if(string.find(profString, string.lower(search))) then
				return search
			end
		end
	end
	
	return false -- was not found
end

if(SERVER) then
	function PLUGIN:giveCraftXP(char, profession, xp)
		local craftTbl = char:getData("craft", {})

		if(istable(profession)) then
			for k, v in pairs(profession) do
				local craftLevel = (craftTbl[k] or 0)
			
				local newXP = xp
				if(craftLevel > 1) then
					newXP = newXP / (craftLevel ^ (1/3))
				end
			
				craftTbl[k] = math.Round(craftLevel + (newXP / table.Count(profession)), 2)
			end
		else
			local craftLevel = (craftTbl[profession] or 0)
		
			local newXP = xp
			if(craftLevel > 1) then
				newXP = newXP / (craftLevel ^ (1/3))
			end
		
			craftTbl[profession] = math.Round(craftLevel + newXP, 2)
		end
		
		char:setData("craft", craftTbl)
	end
end

nut.command.add("charsetcraftlevel", {
	adminOnly = true,
	syntax = "<string target> <string profession> <number amount>",
	onRun = function(client, arguments)
		local prof = arguments[2] and PLUGIN:getProfessionFromString(arguments[2]) or false
		if(!prof) then
			client:notify("Invalid profession specified.")
			return false
		end
		
		if(!tonumber(arguments[3])) then
			client:notify("No amount specified.")
			return false
		end
		
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			local char = target:getChar()
		
			local profTbl = char:getData("craft", {})
			profTbl[prof] = tonumber(arguments[3])
			
			char:setData("craft", profTbl)
			
			client:notify("Successfully set " ..target:Name().. "'s " ..prof.. " to " ..tonumber(arguments[3]).. ".")
		end
	end
})

nut.command.add("chargetcraftlevel", {
	adminOnly = true,
	syntax = "<string target> <string profession>",
	onRun = function(client, arguments)
		local prof = arguments[2] and PLUGIN:getProfessionFromString(arguments[2])
		if(!prof) then
			client:notify("Invalid profession specified.")
			return false
		end

		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			local char = target:getChar()
			local profTbl = char:getData("craft", {})
			
			client:notify(target:Name().. "'s " ..prof.. " is level " ..(profTbl[prof] or 0).. ".")
		end
	end
})

if CLIENT then
	surface.CreateFont("nut_NotiFont", {
		font = "Myriad Pro",
		size = 16,
		weight = 500,
		antialias = true
	})
end