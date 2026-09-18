ITEM.name = "Fuel"
ITEM.uniqueID = "j_fuel"
ITEM.model = "models/props_junk/gascan001a.mdl"
ITEM.desc = "A cannister filled with gasoline."
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 2

--health of the item entity when dropped
ITEM.entityHealth = 15

ITEM.salvItem = {
	["j_scrap_chems"] = 3,
	["j_scrap_plastics"] = 3
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Fuel"] = true,
		["Ammo"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 10,
}

ITEM.functions.Load = { -- sorry, for name order.
	name = "Load",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		item.player:GiveAmmo(100, "combinecannon")
		item.player:EmitSound("ambient/water/water_spray2.wav", 50)
		
		return true
		end,
	onCanRun = function(item)
		local client = item.player
	
		if (!client:getChar():getInv():getFirstItemOfType("tfa_chafe")) then
			return false
		end
		
		return true
	end
}

function ITEM:OnTakeDamage(dmginfo, entity)
	if(IsValid(entity)) then
		local health = entity:Health()
		
		local newHealth = health - dmginfo:GetDamage()
		
		entity:SetHealth(newHealth)
		
		if(newHealth <= 0) then
			entity:EmitSound("ambient/fire/gascan_ignite1.wav", 90)
		
			entity:Ignite(30)

			local nearby = ents.FindInSphere(entity:GetPos(), 125)
			for k, v in pairs(nearby) do
				if(!IsValid(v)) then continue end
				if(!v.Ignite) then continue end
				
				local physObject = v:GetPhysicsObject()
				
				--should filter out most things that don't need to be on fire
				if(IsValid(physObject)) then
					v:Ignite(25)
				end
			end
			
			for i = 1, 5 do
				local fire = ents.Create("env_fire")
				fire:SetPos(entity:GetPos() + Vector(math.random(-60, 60), math.random(-60, 60), 0))
				fire:SetKeyValue("health", math.random(30, 40))
				fire:SetKeyValue("firesize", 32)
				fire:SetKeyValue("fireattack", "4")
				fire:SetKeyValue("damagescale", "2.0")
				fire:SetKeyValue("StartDisabled", "0")
				fire:SetKeyValue("firetype", "0")
				fire:SetKeyValue("spawnflags", "132")
				fire:Spawn()
				fire:Fire("StartFire", "", 0.2)
			end

			SafeRemoveEntityDelayed(entity, 0.1)
		elseif(dmginfo:IsDamageType(DMG_BULLET + DMG_BURN + DMG_BUCKSHOT)) then
			entity:Ignite(1)
		end
	end
end