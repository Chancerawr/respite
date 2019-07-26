PLUGIN.name = "Ammo Saver"
PLUGIN.author = "Black Tea"
PLUGIN.desc = "Saves the ammo of a character."
PLUGIN.ammoList = {}
nut.ammo = nut.ammo or {}


function nut.ammo.register(name)
	table.insert(PLUGIN.ammoList, name)
end

-- Register Default HL2 Ammunition.
--nut.ammo.register("ar2")
--nut.ammo.register("pistol")
--nut.ammo.register("357")
--nut.ammo.register("smg1")
nut.ammo.register("xbowbolt")
--nut.ammo.register("buckshot")
nut.ammo.register("rpg_round")
nut.ammo.register("smg1_grenade")
nut.ammo.register("grenade")
--nut.ammo.register("ar2altfire")
nut.ammo.register("slam")

-- Register Cut HL2 Ammunition.
nut.ammo.register("AlyxGun")
--nut.ammo.register("sniperround")
--nut.ammo.register("sniperpenetratedround")
nut.ammo.register("thumper")
--nut.ammo.register("gravity")
nut.ammo.register("battery")
--nut.ammo.register("gaussenergy")
nut.ammo.register("combinecannon")
--nut.ammo.register("airboatgun")
--nut.ammo.register("striderminigun")
--nut.ammo.register("helicoptergun")

-- Register Respite Ammunition.
nut.ammo.register("919")
nut.ammo.register("45")
nut.ammo.register("40")
nut.ammo.register("44")
nut.ammo.register("500")
nut.ammo.register("5728")
nut.ammo.register("357test")
nut.ammo.register("50ae")
nut.ammo.register("50bmg")
nut.ammo.register("4570")
nut.ammo.register("54539")
nut.ammo.register("55639")
nut.ammo.register("55645")
nut.ammo.register("76239")
nut.ammo.register("76251")
nut.ammo.register("76254")
nut.ammo.register("939")
nut.ammo.register("3006")
nut.ammo.register("338")
nut.ammo.register("12g")
nut.ammo.register("22lr")
nut.ammo.register("408")

nut.ammo.descs = {
	["combinecannon"] = "Fuel",
	["battery"] = "Charged Batteries",
	["thumper"] = "Nails",
	["AlyxGun"] = "Concrete Slugs",
--	["smg1_grenade"] = "Flares",
	["slam"] = "Sawblades",
--	["grenade"] = "9x19mm Rounds",
	["xbowbolt"] = "Crossbow Bolts",
	["rpg_round"] = "Rockets",
	
	["919"] = "9x19mm Rounds",
	["45"] = ".45 ACP Rounds",
	["40"] = ".40 S&W Rounds",
	["44"] = ".44 Rounds",
	["500"] = ".500 Rounds",
	["5728"] = "5.7x28mm Rounds",
	["357test"] = ".357 Rounds",
	["50ae"] = ".50 AE Rounds",
	["50bmg"] = ".50 BMG Rounds",
	["4570"] = ".45-70 Rounds",
	["54539"] = "5.45x39mm Rounds",
	["55639"] = "5.56x39mm Rounds",
	["55645"] = "5.56x45mm Rounds",
	["76239"] = "7.62x39mm Rounds",
	["76251"] = "7.62x51mm Rounds",
	["76254"] = "7.62x54mm Rounds",
	["939"] = "9x39mm Rounds",
	["3006"] = ".30-06mm Rounds",
	["338"] = ".338 LM Rounds",
	["12g"] = "12 gauge shells",
	["22lr"] = ".22 LR Rounds",
	["408"] = ".408 Cheytac Rounds",
}

-- Called right before the character has its information save.
function PLUGIN:CharacterPreSave(character)
	-- Get the player from the character.
	local client = character:getPlayer()

	-- Check to see if we can get the player's ammo.
	if (IsValid(client)) then
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

-- Called after the player's loadout has been set.
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

--this restores ammo after death
function PLUGIN:PlayerSpawn(client)
	if(!client:getChar()) then return end
	
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