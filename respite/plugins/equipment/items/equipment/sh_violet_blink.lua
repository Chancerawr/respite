ITEM.name = "Violet Mk. II Cyborg Tools"
ITEM.desc = "VIOLET Mk. II Cyborg Functionality - Wholesome and practical"
ITEM.model = "models/props_junk/sawblade001a.mdl"
ITEM.class = "weapon_violet_cyborg_tools"
ITEM.uniqueID = "weapon_violet_cyborg_tools"
ITEM.slot = "Chest"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Special"
ITEM.color = Color(69, 0, 127)
ITEM.modelColor = Color(69, 0, 127)

ITEM.actions = {
	"violet_flamethrower",
	"violet_lmg",
}

function ITEM:onEquipWeapon(client, weapon)
	client:Give("tfa_chafe")
	client:Give("tfa_m249lmg")
	client:Give("weapon_violet_freezie_ray")
	client:Give("weapon_violet_vio_vio_beam")
	client:Give("weapon_violet_voltaic_buster")
	client:Give("weapon_violet_chainsaw")
	client:Give("weapon_violet_power_wash")
	
	client:GiveAmmo(100, "combinecannon")
	client:GiveAmmo(200, "55645")
end