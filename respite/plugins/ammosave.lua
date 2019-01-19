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
--nut.ammo.register("smg1_grenade")
nut.ammo.register("grenade")
--nut.ammo.register("ar2altfire")
nut.ammo.register("slam")

-- Register Cut HL2 Ammunition.
nut.ammo.register("AlyxGun")
--nut.ammo.register("sniperround")
--nut.ammo.register("sniperpenetratedround")
--nut.ammo.register("thumper")
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

nut.command.add("ammocheck", {
	adminOnly = true,
	syntax = "<string name> <string type",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			local ammo = target:GetAmmoCount(arguments[2])
				
			client:notifyLocalized(target:Name() .." ".. arguments[2] .. " " .. ammo)
		end
	end
})