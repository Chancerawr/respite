PLUGIN.name = "Ammo Definitions"
PLUGIN.author = "Black Tea"
PLUGIN.desc = "Defines ammo types, also saves character's ammo."
PLUGIN.ammoList = {}
nut.ammo = nut.ammo or {}

--registers an ammo type with nutscript
function nut.ammo.register(name)
	table.insert(PLUGIN.ammoList, name)
end

nut.ammo.types = {
	["combinecannon"] = {
		name = "Fuel",
		dmgtype = DMG_BURN,
		tracer = 4
	},
	["battery"] = {
		name = "Charged Batteries",
		dmgtype = DMG_SHOCK,
		tracer = 4
	},
	["thumper"] = {
		name = "Nails",
		dmgtype = DMG_SLASH,
		tracer = 4
	},
	["AlyxGun"] = {
		name = "Concrete Slugs",
		dmgtype = DMG_CRUSH,
		tracer = 4
	},
	["slam"] = {
		name = "Sawblades",
		dmgtype = DMG_SLASH,
		tracer = 4
	},
	["xbowbolt"] = {
		name = "Crossbow Bolts",
		dmgtype = DMG_CRUSH,
		tracer = 4
	},
	["rpg_round"] = {
		name = "Rockets",
		dmgtype = DMG_BLAST,
		tracer = 4
	},
	["flesh"] = {
		name = "Meat Chunks",
		dmgtype = DMG_BURN,
		tracer = 4
	},
	["bone"] = {
		name = "Bone Shards",
		dmgtype = DMG_SLASH,
		tracer = 4
	},
	
	["919"] = {
		name = "9x19mm Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["45"] = {
		name = ".45 ACP Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["40"] = {
		name = ".40 S&W Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["44"] = {
		name = ".44 Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["500"] = {
		name = ".500 Rounds",
	},
	["5728"] = {
		name = "5.7x28mm Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["357test"] = {
		name = ".357 Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["50ae"] = {
		name = ".50 AE Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["50bmg"] = {
		name = ".50 BMG Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["4570"] = {
		name = ".45-70 Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["54539"] = {
		name = "5.45x39mm Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["55639"] = {
		name = "5.56x39mm Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["55645"] = {
		name = "5.56x45mm Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["76239"] = {
		name = "7.62x39mm Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["76251"] = {
		name = "7.62x51mm Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["76254"] = {
		name = "7.62x54mm Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["939"] = {
		name = "9x39mm Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["3006"] = {
		name = ".30-06 Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["338"] = {
		name = ".338 LM Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["12g"] = {
		name = "12 Gauge Shells",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["22lr"] = {
		name = ".22 LR Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
	["408"] = {
		name = ".408 Cheytac Rounds",
		dmgtype = DMG_BULLET,
		tracer = 4
	},
}

--all the existing ammo types so we dont overwrite ones that already exist
local existingAmmoTypes = game.GetAmmoTypes()

for k, v in pairs(nut.ammo.types) do
	--skip over ones that already exist
	--if(!table.HasValue(existingAmmoTypes, k)) then
		game.AddAmmoType({
			name = k,
			dmgtype = v.dmgtype,
			tracer = v.tracer,
			plydmg = v.plydmg,
			npcdmg = v.npcdmg,
			force = v.force,
			minsplash = v.minsplash,
			maxsplash = v.maxsplash
		})
		
		if CLIENT then
			language.Add(k.. "_ammo", v.name)
		end
	--end
	
	nut.ammo.register(k)
end

-- Called right before the character has its information save.
function PLUGIN:CharacterPreSave(character)
	-- Get the player from the character.
	local client = character:getPlayer()

	-- Check to see if we can get the player's ammo.
	if (IsValid(client) and client:Alive()) then
		local ammoTable = {}

		for k, v in ipairs(self.ammoList) do
			local ammo = client:GetAmmoCount(v)

			if (ammo > 0) then
				ammoTable[v] = ammo
			end
		end

		character:setData("ammo", ammoTable)
	end
end

-- Called after the player's loadout has been set.
--[[
function PLUGIN:PlayerLoadedChar(client)
	timer.Simple(.25, function()
		if (!IsValid(client)) then
			return
		end
		
		--fix for people getting ammo from other characters.
		for k, v in ipairs(self.ammoList) do
			client:SetAmmo(0, tostring(v))
		end

		-- Get the saved ammo table from the character data.
		local character = client:getChar()
		if (!character) then
			return
		end
		
		local ammoTable = character:getData("ammo")
		
		-- Check if the ammotable is exists.
		if (ammoTable) then
			for k, v in pairs(ammoTable) do
				client:SetAmmo(v, tostring(k))
			end
		end
	end)
end
--]]

-- Called after the player's loadout has been set.
--[[
function PLUGIN:PlayerDeath(client)
	local char = client:getChar()
	
	if(char) then
		local savedAmmo = char:getData("ammo", {})
	
		for k, v in pairs(self.ammoList) do
			local ammo = client:GetAmmoCount(v)

			if(savedAmmo[v]) then
				if(ammo > 0) then
					savedAmmo[v] = ammo
				else
					savedAmmo[v] = nil
				end
			else
				savedAmmo[v] = nil
			end
		end
		
		for k, v in pairs(client:GetWeapons()) do
			local clip = v:Clip1()
			local ammoType = game.GetAmmoName(v:GetPrimaryAmmoType())
			
			if(clip > 0 and ammoType) then
				savedAmmo[ammoType] = (savedAmmo[ammoType] or 0) + clip
			end
		end
		
		char:setData("ammo", savedAmmo)
	end
end
--]]

--this restores ammo after death
function PLUGIN:PlayerSpawn(client)
	if(!client:getChar()) then return end

	if (!IsValid(client)) then
		return
	end
	
	--fix for people getting ammo from other characters.
	for k, v in ipairs(self.ammoList) do
		client:SetAmmo(0, tostring(v))
	end

	-- Get the saved ammo table from the character data.
	local character = client:getChar()

	if (!character) then
		return
	end
	
	local ammoTable = character:getData("ammo")
	
	-- Check if the ammotable is exists.
	if (ammoTable) then
		for k, v in pairs(ammoTable) do
			client:SetAmmo(v, tostring(k))
		end
	end
end

nut.command.add("ammocheck", {
	adminOnly = true,
	syntax = "<string name> <string type",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(!arguments[2]) then
			client:notify("Specify an ammo type")
			return false
		end
		
		if(IsValid(target) and target:getChar()) then
			local ammo = target:GetAmmoCount(arguments[2])
				
			client:notify(target:Name() .." ".. arguments[2] .. " " .. ammo)
		end
	end
})