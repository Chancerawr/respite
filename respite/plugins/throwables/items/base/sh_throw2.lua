ITEM.name = "Throwable Objects 2"
ITEM.model = "models/Items/grenadeAmmo.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.class = "nut_beac"
ITEM.desc = "A throwable object."

ITEM.functions = ITEM.functions or {}
ITEM.functions.Equip = {
	name = "Equip",
	tip = "equipTip",
	icon = "icon16/tick.png",
	onRun = function(item)
		local client = item.player
		
		if (client:HasWeapon(item.class)) then
			client:notifyLocalized("You're already holding this grenade!") return false
		end

		local weapon = client:Give(item.class)

		if (IsValid(weapon)) then
			client:SelectWeapon(weapon:GetClass())
			client:SetActiveWeapon(weapon)
			client:EmitSound("items/ammo_pickup.wav", 80)
		else
			print(Format("[Nutscript] Weapon %s does not exist!", item.class))
		end
		return true
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}